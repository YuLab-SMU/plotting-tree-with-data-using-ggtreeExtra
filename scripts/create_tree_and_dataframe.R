## This script was designed to extract the tree and associated data of tip labels of tree.
## And it should be run in the dir with > R(4.0)
library(tidyverse)
library(openxlsx)

convert1 = "python -c 'from Bio import Phylo;Phylo.convert(\"../rawdata/HMP_tree/hmptree.xml\", \"phyloxml\", \"../data/HMP_tree/hmptree.nwk\", \"newick\")'"
convert2 = "python -c 'from Bio import Phylo;Phylo.convert(\"../rawdata/PhyloPhlAn/ppa_tol.xml\", \"phyloxml\", \"../data/PhyloPhlAn/ppal_tol.nwk\", \"newick\")'"
convert3 = "python -c 'from Bio import Phylo;Phylo.convert(\"../rawdata/kegg/kegg.xml\", \"phyloxml\", \"../data/kegg/kegg.nwk\", \"newick\")'"
system(convert1)
system(convert2)
system(convert3)

###################################################
##### HMP_tree tip datasets and ring datasets #####
df <- read.table("../rawdata/HMP_tree/annot.txt", sep="\t", comment.char="", fill=TRUE,
                                  col.names=paste0("V", seq_len(4)), header=FALSE)

data <- df %>% filter(V2=="ring_height" & V3==8)
dat <- df %>% filter(V2=="ring_color" & V3==8)
dt <- df %>% filter(V1=="ring_label_color")
dd <- df %>% filter(V1=="ring_label" & V3!="Abundance when present")
ddt <- merge(dt, dd, by.x="V2", by.y="V2")
datt <- merge(dat, ddt, by.x="V4", by.y="V3.x") %>% select(c("V1", "V3.y"))
dat1 <- merge(datt, data, by.x="V1", by.y="V1")
dat1 <- merge(datt, data, by.x="V1", by.y="V1")
dat1 <- dat1 %>% select(c("V1", "V3.y", "V4")) %>% rename(ID="V1", Sites="V3.y", HigherAbundance="V4")

data <- df %>% filter(V2=="ring_alpha" & V3!=8) %>% select(c("V1", "V3", "V4"))
dat2 <- merge(data, dd, by.x="V3", by.y="V2") %>% select(c("V1.x", "V3.y", "V4.x")) %>%
        rename(ID="V1.x", Abundance="V4.x", Sites="V3.y")
dat2$Abundance <- as.numeric(dat2$Abundance)

dd1 <- df %>% filter(V2=="clade_marker_color")
dd2 <- dd1[grep("t6", dd1$V1),]
dd3 <- dd1[!grepl("t6", dd1$V1),]
dd1 <- merge(dd2, dd3, by.x="V3", by.y="V3") %>% select(c("V1.x", "V1.y")) %>% rename(ID="V1.x", Phylum="V1.y")
ddtt <- df %>% filter(V2=="clade_marker_shape") %>% select(c("V1")) %>% rename(ID="V1") %>%
        mutate(Type="Potential pathogens")
ddtt1 <- data.frame(ID=as.vector(dd1[!dd1$ID %in% ddtt$ID,"ID"])) %>% mutate(Type="Commensal microbes")
ddtt2 <- df %>% filter(V2=="clade_marker_size") %>% select(c("V1", "V3")) %>% rename(ID="V1", Size="V3")
ddtt2 <- ddtt2[grep("t6", ddtt2$ID),]
ddtt <- rbind(ddtt1, ddtt)
dat3 <- merge(dd1, ddtt, by.x="ID", by.y="ID")
dat3 <- merge(dat3, ddtt2, by.x="ID", by.y="ID")
dat3$Size <- as.numeric(dat3$Size)
dat1$Sites <- factor(dat1$Sites, levels=c("Stool (prevalence)", "Cheek (prevalence)",
                                          "Plaque (prevalence)", "Tongue (prevalence)",
                                          "Nose (prevalence)", "Vagina (prevalence)",
                                          "Skin (prevalence)"))
dat2$Sites <- factor(dat2$Sites, levels=c("Stool (prevalence)", "Cheek (prevalence)",
                                          "Plaque (prevalence)", "Tongue (prevalence)",
                                          "Nose (prevalence)", "Vagina (prevalence)",
                                          "Skin (prevalence)"))

write.table(dat3, "../data/HMP_tree/tippoint_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
write.table(dat2, "../data/HMP_tree/ringheatmap_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
write.table(dat1, "../data/HMP_tree/barplot_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
###################################################
###################################################

###################################################
#### PhyloPhlAn tip datasets and ring datasets ####
df <- read.table("../rawdata/PhyloPhlAn/annot.txt", sep="\t", comment.char="", fill=TRUE,
                  col.names=paste0("V", seq_len(4)), header=FALSE)
data <- df %>% filter(V2=="clade_marker_color")
data1 <- data[grepl("^t", data$V1),] %>% select(c("V1", "V3"))
#head(data1)
data2 <- data[!grepl("^t", data$V1),] %>%
         filter(V3 !="k") %>% select(c("V1", "V3"))
#data2 <- rbind(data2, data.frame(V1="Others", V3="Black"))
dt <- merge(data1, data2, by.x="V3", by.y="V3") %>%select("V1.x", "V1.y") %>%
            rename(ID="V1.x", Phylum="V1.y")
dt2 <- dt %>% rename(Phyla="Phylum")

# data for the tip points.
dat <- df %>% filter(V2=="ring_height" & V3==1) %>% select(c("V1", "V4")) %>%
           rename(ID="V1", Abundance="V4")
dat <- merge(dat, dt2, by.x="ID", by.y="ID",all.x=TRUE)
dat[is.na(dat$Phyla),"Phyla"] <- "Other"
dat$Abundance <- as.numeric(dat$Abundance)
# data for the bar plot of first ring.
# data for the point plot of second ring.
dag <- data.frame(color=c("b", "k", "r", "g"),
Type=c("Mislabelled", "Insertions", "Refinements", "Corrections"))
da1 <- df %>% filter(V2=="ring_color" & V3==2) %>% select(c("V1", "V4")) %>%
       rename(ID="V1", color="V4") %>% distinct()
da2 <- df %>% filter(V2=="ring_height" & V3==2) %>% select(c("V1", "V4")) %>%
       rename(ID="V1", Pos="V4") %>% distinct()
da <- merge(da1, da2, by="ID")
da <- merge(da, dag, by="color") %>% select(c("ID","Pos","Type")) %>%
       distinct()

da$Pos <- as.numeric(da$Pos)
da$Type <- factor(da$Type, levels=c("Mislabelled", "Insertions", "Corrections", "Refinements"))

write.table(dt, "../data/PhyloPhlAn/tippoint_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
write.table(dat, "../data/PhyloPhlAn/barplot_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
write.table(da, "../data/PhyloPhlAn/ringpoint_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
###################################################
###################################################

###################################################
####     kegg tip datasets and ring datasets   ####
df <- read.table("../rawdata/kegg/annot.txt", sep="\t", check.names=FALSE, comment.char="", fill=TRUE,
                 col.names=paste0("V", seq_len(4)), stringsAsFactors=FALSE)
#head(dat)
data <- df %>% filter(V2=="clade_marker_color")
data1 <- data[nchar(as.vector(data$V1))<4,] %>% select(c("V1", "V3"))
data1[as.vector(data1$V3)=="k", "V3"] <- "Black"
data2 <- data[nchar(as.vector(data$V1))>4,] %>% select(c("V1", "V3"))
data2 <- data2[order(as.vector(data2$V1)),,drop=FALSE]
tmp <- data2$V1
data2 <- rbind(data2, data.frame(V1="Other", V3="Black"))
data2$V1 <- factor(data2$V1, levels=c(tmp,"Other"))

dt <- merge(data1, data2, by.x="V3", by.y="V3") %>% select("V1.x", "V1.y") %>%
        rename(ID="V1.x", Phyla="V1.y")


dat1 <- df %>% filter(V2=="ring_color" & V3 %in% as.character(seq_len(8))) %>%
         select(c("V1", "V3")) %>% rename(ID="V1", ring="V3") %>% mutate(Type1="V/A-type ATPase")
dat2 <- df %>% filter(V2=="ring_color" & V3 %in% as.character(c(9:16))) %>%
         select(c("V1", "V3")) %>%  rename(ID="V1", ring="V3") %>% mutate(Type1="F-type ATPase")
dat <- rbind(dat1, dat2)
#dat$Type1 <- factor(dat$Type1, levels=c("V/A-type ATPase", "F-type ATPase"))
dat$ring <- as.numeric(dat$ring)

dda1 <- df %>% filter(V2=="ring_color" & V3 %in% as.character(17:21)) %>%
         select(c("V1", "V4")) %>% rename(ID="V1", color="V4")
dda2 <- df %>% filter(V2=="ring_alpha") %>% select(c("V1", "V4")) %>%
         rename(ID="V1", Abundance="V4")
dda3 <- data.frame(Type2=c("FA synth init", "FA synth elong", "acyl-CoA synth", "beta-Oxidation", "Ketone biosynth"),
                   color=c("#b22222", "#005500", "#0000be", "#9f1f9f", "#793a07"))
dda3$Type2 <- factor(dda3$Type2, levels=c("FA synth init", "FA synth elong", "acyl-CoA synth", "beta-Oxidation", "Ketone biosynth"))

dda <- merge(dda1, dda2, by.x="ID", by.y="ID")
dda <- merge(dda, dda3, by="color")
dda$Abundance <- as.numeric(dda$Abundance)
dda$color <- NULL

dd1 <- df %>% filter(V2=="ring_height" & V3 == "22") %>% select(c("V1", "V4")) %>%
       rename(ID="V1", Length="V4")
dd <- merge(dd1, data1, by.x="ID", by.y="V1")
dd <- merge(dd, data2, by.x="V3", by.y="V3") %>% 
      select(c("ID", "Length"#, "V1"
               )) #%>%
      #rename(Phyla="V1")
dd$Length <- as.numeric(dd$Length)

write.table(dt, "../data/kegg/tippoint_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
write.table(dat, "../data/kegg/firstring_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
write.table(dda, "../data/kegg/secondring_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
write.table(dd, "../data/kegg/barplot_attr.csv", sep=",", row.names=FALSE, col.names=TRUE, quote=FALSE)
###################################################
## The methanotroph metadata
###################################################
metada <- read.csv("../rawdata/Methanotroph/Methanotroph_rpS3_Metadata.csv")
metada <- metada[is.na(metada$Outgroup),]

metada$Specific.Ecosystem[metada$Specific.Ecosystem %in% c("Contaminated", "Wastewater")] <- "Contaminated/Wastewater"
metada$Specific.Ecosystem[metada$Specific.Ecosystem == c("Bathymodiolus Endosymbiont")] <- "Endosymbiont"
metada$Specific.Ecosystem[metada$Specific.Ecosystem %in% c("Ground Water", "Drinking Water", "River Sediment", "Lake Water", "Lake Sediment")] <- "Freshwater"
metada$Specific.Ecosystem[metada$Specific.Ecosystem %in% c("Marine Water", "Marine Sediment")] <- "Marine"
metada$MetaType[metada$MetaType%in%c("MetaG", "MAG")] <- "Metagenome"
metada$MetaType[metada$MetaType=="SAG"] <- "Single-amplified genome"
metada$MetaType[metada$MetaType=="MetaT"] <- "Metatranscriptome"

metada <- metada[,colnames(metada) %in% c("Name.in.Fastas", "Specific.Ecosystem", "MetaType", "Treatment")]
write.table(metada, file="../data/Methanotroph/metadata.csv", row.names=FALSE, quote=FALSE, sep=",")

##################################################
##################################################

##################################################
#####  Arabidopsis leaf microbiome datasets   ####
da <- read.xlsx("../rawdata/Arabidopsis_leaf_microbiome/EMS87355-supplement-Supplementary_Tables.xlsx", startRow=2)
dat <- read.xlsx("../rawdata/Arabidopsis_leaf_microbiome/EMS87355-supplement-Supplementary_Tables.xlsx", sheet=2, startRow=4) 
df <- read.xlsx("../rawdata/Arabidopsis_leaf_microbiome/EMS87355-supplement-Supplementary_Tables.xlsx", sheet=9, startRow=3)

df <- df[-c(208:210),c(1, 3:11)] 
df1 <- df[,c(1:9)]
df2 <- df[,c(1,10)]
df1 <- df1 %>% gather(key="BGCs", value="Count", -Strain)
df1$Strain <- paste0("s__", df1$Strain)

colnames(dat) <- c("Strain", "Genus", "Strong.I", "Weak.I", "Total.I", 
                   "Strong.S", "Weak.S", "Total.S", "Total_interactions")

dat <- dat %>% distinct() %>% 
       select(c("Strain", "Strong.I", "Weak.I", "Strong.S", "Weak.S"))
dat <- dat %>% gather(key="key", value="value", -Strain) %>% 
       separate(key, c("Weight", "Type")) %>%
       mutate(Type=gsub("I", "Inhibitor", Type)) %>%
       mutate(Type=gsub("S", "Sensitive", Type)) %>%
       unite("Number", Type:Weight, remove=TRUE, sep=" ")
dat$Strain <- paste0("s__", dat$Strain)

da1 <- da[,grepl("Inhibitor", colnames(da))] %>% 
       distinct() %>% 
       rename(Leaf = Inhibitor)

colnames(da1) <- gsub("\\.Inhibitor", "", colnames(da1))

da2 <- da[,grepl("Sensitive", colnames(da))] %>% 
       distinct() %>%
       rename(Leaf=Sensitive)
colnames(da2) <- gsub("\\.Sensitive", "", colnames(da2))

da1_2 <- rbind(da1, da2) %>% distinct()
da1_2$Isolation <- da1_2$Leaf
da1_2$Leaf <- NULL
da1_2$Kindom <- "Bacteria"
da1_2 <- da1_2[,c(7, seq_len(6))]

da1_tmp <- data.frame(Kindom="Bacteria",Phylum="Firmicutes",Class="Bacilli",
                      Order="Bacillales",Family="Bacillaceae",Genus="Bacillus",Isolation="Leaf406")
da1_2 <- rbind(da1_2, da1_tmp)
da3 <- da[,c(1, 2, 3)]
da3$Inhibitor <- paste0("s__", da3$Inhibitor)
da3$Sensitive <- paste0("s__", da3$Sensitive)
#da3$Interaction <- unlist(lapply(da3$Interaction,function(x) unlist(strsplit(x,split=";"))[1]))

daphycla1 <- da1_2 %>% 
             filter(Phylum %in% c("Actinobacteria", "Bacteroidetes", "Firmicutes", "Deinococcus-Thermus")) %>%
             select(c("Isolation", "Phylum")) %>% 
             rename(Taxa="Phylum") %>% 
             mutate(Level="Phylum") #%>%
#             mutate(Taxa=gsub("Deinococcus-Thermus", "Firmicutes", Taxa))

daphycla2 <- da1_2 %>% 
             filter(Phylum=="Proteobacteria") %>% 
             select("Isolation", "Class") %>% 
             rename(Taxa="Class") %>%
             mutate(Level="Class")

daphycla <- rbind(daphycla1, daphycla2)
daphycla$Isolation <- paste0("s__", daphycla$Isolation)

write.csv(da1_2, "../data/Arabidopsis_leaf_microbiome/all_stain_taxonomy.csv", row.names=FALSE, quote=FALSE)
write.csv(da3, "../data/Arabidopsis_leaf_microbiome/Interaction_link_tab.csv", row.names=FALSE, quote=FALSE)
write.csv(dat, "../data/Arabidopsis_leaf_microbiome/Interaction_weight.csv", row.names=FALSE, quote=FALSE)
write.csv(daphycla, "../data/Arabidopsis_leaf_microbiome/stain_tippoint.csv", row.names=FALSE, quote=FALSE)
write.csv(df1, "../data/Arabidopsis_leaf_microbiome/BGCs_heatmap.csv", row.names=FALSE, quote=FALSE)
