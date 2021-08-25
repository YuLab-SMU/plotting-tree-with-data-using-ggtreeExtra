<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggtreeExtra: Compact visualization of richly annotated phylogenetic data

If you use this work in published research, please cite:

**S Xu**, Z Dai, P Guo, X Fu, S Liu, L Zhou, W Tang, T Feng, M Chen, L
Zhan, T Wu, E Hu, Y Jiang<sup>\*</sup>, X Bo<sup>\*</sup> and **G
Yu**<sup>\*</sup>. ggtreeExtra: Compact visualization of richly
annotated phylogenetic data. ***Molecular Biology and Evolution***.
2021, 38(9):4039-4042. doi:
[10.1093/molbev/msab166](https://doi.org/10.1093/molbev/msab166).

This repo contains source code and data to produce
<!--Manuscript and-->Supplementary Material of the above paper.

  - rawdata: contains `HMP_tree`, `kegg` and `PhyloPhlAn`, downloaded
    from the examples of
    [GraPhlAn](https://github.com/biobakery/graphlan/tree/master/examples),
    and the `Methanotroph`, downloaded from the
    [repo](https://github.com/TheWrightonLab/Methanotroph_rpS3Analyses_SmithWrighton2018).
  - scripts: contains the script to produce the dataset of `data` using
    the data set of `rawdata`.
  - data: contains all the data sets that used to generate figures in
    Supplemental file.
  - Rmarkdown: contains the source code to produce Supplementary File.

## Dependencies and locations

<!-- - GNU Make should be located in the user’s PATH -->
<!-- - Python (2 or 3) should be installed and located in the user’s PATH -->
<!--and `Biopython` also should be installed. -->

  - R (\>= 4.0.3) should be installed and located in the user’s PATH,
    and the following packages should be installed.
      - `ggtreeExtra` : `BiocManager::install("ggtreeExtra")`
      - `ggtree` : `BiocManager::install("ggtree")`
      - `treeio` : `BiocManager::install("treeio")`
      - `tidytree` : `install.packages("tidytree")`
      - `ggplot2` : `install.packages("ggplot2")`
      - `kableExtra` : `install.packages("kableExtra")`
      - `bookdown` : `install.package("bookdown")`
      - `MicrobiotaProcess` :
        `BiocManager::install("MicrobiotaProcess")`
      - `ggstar` : `install.packages("ggstar")`
      - `Cairo` : `install.packages("Cairo")`
      - `aplot` : `install.packages("aplot")`
      - `patchwork` : `install.packages("patchwork")`
      - `ggnewscale` : `install.packages("ggnewscale")`
      - `knitr` : `install.packages("knitr")`
      - `ggpp` : `install.packages("ggpp")`
      - [`ggpattern`](https://github.com/coolbutuseless/ggpattern) :
        `remotes::install_github("coolbutuseless/ggpattern")`
      - `tibble` : `install.packages("tibble")`
      - `tidyr` : `install.packages("tidyr")`
      - `dplyr` : `install.packages("dplyr")`
      - `ggimage` : `install.packages("ggimage")`
      - `ggridges` : `install.packages("ggridges")`

To compile the <!-- Rmarkdown/manuscript.docx and -->
Rmarkdown/[supplemental\_file.pdf](Rmarkdown/supplementary_file.pdf),
please run the following command on terminal.

<!-- ```r
make manuscript && make supple 
``` -->

``` bash
Rscript -e 'rmarkdown::render("./Rmarkdown/supplementary_file.Rmd")'
```

Or run the following command in R.

``` r
rmarkdown::render("./Rmarkdown/supplementary_file.Rmd")
```

Here is the output of `sessionInfo()` of the system on which [the
Supplemental file](Rmarkdown/supplementary_file.pdf) was compiled:

    ## R version 4.1.0 (2021-05-18)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 18.04.4 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /mnt/d/UbuntuApps/R/4.1.0/lib/R/lib/libRblas.so
    ## LAPACK: /mnt/d/UbuntuApps/R/4.1.0/lib/R/lib/libRlapack.so
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    ##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ##  [1] ggimage_0.2.9               tibble_3.1.2               
    ##  [3] dplyr_1.0.7                 tidyr_1.1.3                
    ##  [5] ggridges_0.5.3              ggpp_0.4.0                 
    ##  [7] ggpattern_0.1.3             knitr_1.33                 
    ##  [9] patchwork_1.1.1             Cairo_1.5-12.2             
    ## [11] kableExtra_1.3.4            aplot_0.0.6                
    ## [13] MicrobiotaProcess_1.5.3.992 ggnewscale_0.4.5           
    ## [15] tidytree_0.3.4.991          treeio_1.17.2              
    ## [17] ggtree_3.1.3.991            ggplot2_3.3.5              
    ## [19] ggstar_1.0.2.991            ggtreeExtra_1.3.3          
    ## 
    ## loaded via a namespace (and not attached):
    ##   [1] TH.data_1.0-10              colorspace_2.0-2           
    ##   [3] ggsignif_0.6.3              class_7.3-19               
    ##   [5] ellipsis_0.3.2              modeltools_0.2-23          
    ##   [7] XVector_0.32.0              GenomicRanges_1.44.0       
    ##   [9] proxy_0.4-26                rstudioapi_0.13            
    ##  [11] ggrepel_0.9.1               fansi_0.5.0                
    ##  [13] mvtnorm_1.1-2               coin_1.4-1                 
    ##  [15] xml2_1.3.2                  codetools_0.2-18           
    ##  [17] splines_4.1.0               libcoin_1.0-8              
    ##  [19] polyclip_1.10-0             ade4_1.7-17                
    ##  [21] jsonlite_1.7.2              phyloseq_1.36.0            
    ##  [23] cluster_2.1.2               png_0.1-7                  
    ##  [25] compiler_4.1.0              httr_1.4.2                 
    ##  [27] assertthat_0.2.1            Matrix_1.3-4               
    ##  [29] lazyeval_0.2.2              htmltools_0.5.1.1          
    ##  [31] tools_4.1.0                 igraph_1.2.6               
    ##  [33] gtable_0.3.0                glue_1.4.2                 
    ##  [35] GenomeInfoDbData_1.2.6      reshape2_1.4.4             
    ##  [37] Rcpp_1.0.6                  Biobase_2.52.0             
    ##  [39] vctrs_0.3.8                 Biostrings_2.60.1          
    ##  [41] rhdf5filters_1.4.0          multtest_2.48.0            
    ##  [43] ape_5.5                     svglite_2.0.0              
    ##  [45] nlme_3.1-152                iterators_1.0.13           
    ##  [47] xfun_0.24                   stringr_1.4.0              
    ##  [49] rvest_1.0.0                 lifecycle_1.0.0            
    ##  [51] zlibbioc_1.38.0             MASS_7.3-54                
    ##  [53] zoo_1.8-9                   scales_1.1.1               
    ##  [55] MatrixGenerics_1.4.0        parallel_4.1.0             
    ##  [57] SummarizedExperiment_1.22.0 biomformat_1.20.0          
    ##  [59] sandwich_3.0-1              rhdf5_2.36.0               
    ##  [61] yaml_2.2.1                  gridGeometry_0.2-0         
    ##  [63] gridExtra_2.3               ggfun_0.0.3                
    ##  [65] yulab.utils_0.0.3           stringi_1.6.2              
    ##  [67] S4Vectors_0.30.0            foreach_1.5.1              
    ##  [69] e1071_1.7-7                 permute_0.9-5              
    ##  [71] BiocGenerics_0.38.0         GenomeInfoDb_1.28.0        
    ##  [73] rlang_0.4.11                pkgconfig_2.0.3            
    ##  [75] systemfonts_1.0.2           matrixStats_0.59.0         
    ##  [77] bitops_1.0-7                evaluate_0.14              
    ##  [79] lattice_0.20-44             sf_1.0-0                   
    ##  [81] purrr_0.3.4                 Rhdf5lib_1.14.1            
    ##  [83] tidyselect_1.1.1            plyr_1.8.6                 
    ##  [85] magrittr_2.0.1              R6_2.5.0                   
    ##  [87] IRanges_2.26.0              magick_2.7.2               
    ##  [89] generics_0.1.0              multcomp_1.4-17            
    ##  [91] DelayedArray_0.18.0         DBI_1.1.1                  
    ##  [93] pillar_1.6.1                withr_2.4.2                
    ##  [95] mgcv_1.8-36                 units_0.7-2                
    ##  [97] survival_3.2-11             RCurl_1.98-1.3             
    ##  [99] crayon_1.4.1                KernSmooth_2.23-20         
    ## [101] utf8_1.2.1                  rmarkdown_2.9.7            
    ## [103] grid_4.1.0                  data.table_1.14.0          
    ## [105] vegan_2.5-7                 classInt_0.4-3             
    ## [107] digest_0.6.27               webshot_0.5.2              
    ## [109] gridGraphics_0.5-1          stats4_4.1.0               
    ## [111] munsell_0.5.0               ggplotify_0.0.9            
    ## [113] viridisLite_0.4.0

## Docker image

We also provided a [docker
image](https://hub.docker.com/r/xushuangbin/ggtreeextraarticleenv) to
help users to build the computing environment. You can pull and run it
according to the following commands.

  - Install Docker (<https://www.docker.com/>)
      - `sudo apt-get install docker.io` (Ubuntu)
  - Pull the Docker image from Docker Hub:
      - `docker pull xushuangbin/ggtreeextraarticleenv:latest`
      - or
      - `sudo pull xushuangbin/ggtreeextraarticleenv:latest`
  - Run the image:
      - `docker run -e PASSWORD=yourpassword -p 8787:8787
        xushuangbin/ggtreeextraarticleenv`
      - or
      - `sudo docker run -e PASSWORD=yourpassword -p 8787:8787
        xushuangbin/ggtreeextraarticleenv`
  - Log in to RStudio at <http://localhost:8787> using username
    `rstudio` and password `yourpassword`. For Windows users, you also
    need to provide your IP address, you can find it using
    `docker-machine ip default`.
  - Inside the RStudio, run: `browseVignettes(package =
    "ggtreeExtraArticleEnv")`
  - You can click one of the links: “PDF”, “source”, “R code”
  - In case of `The requested page was not found` error, try add ‘help/’
    in front of the hostname in the URL (this is a known bug):
    <http://localhost:8787/help/library/ggtreeExtraArticleEnv/doc/supplementary_file.pdf>
