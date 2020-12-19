library(ggtree)
library(treeio)
library(ggplot2)
library(ggtreeExtra)
library(tidytree)
library(ggnewscale)
library(ggimage)

tr <- read.tree("./annotated_host_tree.tre")
corda <- read.csv("./mantel.jaccard.pearson.csv")
corda$r <- abs(corda$r)
barda <- read.csv("./data_diet_bar.csv", check.names=F)
barda <- reshape2::melt(barda, id.vars="ID", variable.name="Diet", value.name="mete")
barda$Diet <- factor(barda$Diet, levels=c("Fruit","Invertebrates",
                                          "Nectar","Plants","Scavenging",
                                          "Seeds","Meat (Ectotherms)",
                                          "Meat (Endotherms)",
                                          "Meat (Fish)","Meat (Unknown)"))

cladeda <- read.csv("./data_clade_class.csv", check.names=F)
cladeda$id <- nodeid(tr, cladeda$id)
cladeda$class <- factor(cladeda$class, levels=c("Amphibia","Chelonia","Lepidosauria",
                                                "Crocodylomorpha","Aves","Mammalia"))

flightda <- read.csv("./data_flight_bar.csv")

phylopicda <- read.csv("./data_phylopic_uid.csv")
phylopicda$class <- factor(phylopicda$class, levels=c("Amphibia","Chelonia","Lepidosauria",
                                                      "Aves","Mammalia"))

p <- ggtree(tr, layout="fan", open.angle=15)

p <- p %<+% corda
p$data$width <- ifelse(is.na(p$data$r), 0.1, 0.6)
r <- NULL
p <- p + aes(color=r, size=I(width)) +
     scale_colour_viridis_c(name="Mantel Correlation",
                            option="C",
                            guide=guide_colorbar(barheight=0.6, 
                                                 order=4,
                                                 title.position="top", 
                                                 label.position="bottom",
                                                 direction="horizontal"))

p1 <- p +
      geom_fruit(
          data=barda,
          geom=geom_bar,
          mapping=aes(x=mete, y=ID, fill=Diet),
          orientation="y",
          stat="identity",
          colour=NA,
          pwidth=0.25,
          offset=0.008
      ) +
      scale_fill_manual(
          values=c("#a6cee3","#cab2d6",
                  "#1f78b4","#33a02c",
                  "#6a3d9a","#b2df8a",
                  "#fb9a99","#e31a1c",
                  "#ff7f00","#fdbf6f"),
          guide=guide_legend(keywidth=0.5, keyheight=0.5, order=1)
      ) 

p2 <- p1 + 
      new_scale_colour() +
      geom_cladelab(
          data=cladeda,
          mapping=aes(node=id, label=class, colour=class),
          textcolour=NA,
          barsize=4,
          extend=0.2,
          offset=100) +
      scale_colour_manual(
          name="Host Class",
          values=c("#b2df8a","#33a02c","#fb9a99",
                   "#e31a1c","#EACB47","#6a3d9a"),
          guide=guide_legend(keywidth=0.5, keyheight=0.5, order=2, 
                             override.aes=list(size=3,alpha=1))
      )

p3 <- p2 +
      new_scale_fill() +
      geom_fruit(
          data=flightda,
          geom=geom_tile,
          mapping=aes(y=ID, fill=flight),
          size=0,
          width=14,
          offset=0.11,
          pwidth=0.4,
      ) +
      scale_fill_manual(
          name="Flight Status",
          values=c("black", "white"),
          guide=guide_legend(keywidth=0.5, keyheight=0.5, order=3,
                             override.aes=list(color="black", size=0.3))) 
p4 <- p3 +
      new_scale_colour() +
      geom_fruit(
          data=phylopicda,
          geom=geom_phylopic,
          mapping=aes(y=taxa, image=uid, color=class),
          size=0.035,
          offset=0.16,
          alpha=0.8,
          position=position_identityx()
      ) +
      scale_colour_manual(
          values=c("#b2df8a","#33a02c","#fb9a99",
                   "#EACB47","#6a3d9a"),
          guide="none"
      )+
      theme(
          legend.background=element_rect(fill=NA),
          legend.title=element_text(size=9),
          legend.text=element_text(size=6.6),
          legend.spacing.y = unit(0.02, "cm")
      )

svg("tree_plot.svg")
p4
dev.off()
