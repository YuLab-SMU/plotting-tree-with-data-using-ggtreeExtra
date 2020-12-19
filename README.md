<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggtreeExtra: An R package to visualize compact circular layers of phylogenetic tree

<!--If you use this work in published research, please cite:
    Shuangbin Xu, , Zehan Dai, Pingfan Guo, Xiaocong Fu, Shanshan Liu, Lang Zhou, Wenli Tang, Tingze Feng, Meijun Chen, Li Zhan and GuangChuang Yu*. ggtreeExtra: An R package to visualize compact circular layers of phylogenetic tree, XXX, XXX, XXX -->

-----

This repo contains source code and data to produce Manuscript and
Supplementary Material of the above paper.

  - rawdata: contains `HMP_tree`, `kegg` and `PhyloPhlAn`, downloaded
    from the examples of
    [GraPhlAn](https://github.com/biobakery/graphlan/tree/master/examples),
    and the `Methanotroph`, downloaded from the
    [repo](https://github.com/TheWrightonLab/Methanotroph_rpS3Analyses_SmithWrighton2018).
  - data: contains the data has been processed, it can be displayed
    directly in the paper.
  - Rmarkdown: contains the source code to produce Manuscript and
    Supplementary Material.
  - scripts: contains the script to produce the dataset of `data` using
    the data set of `rawdata`.

## Dependencies and locations

  - GNU Make should be located in the user’s PATH
  - Python (2 or 3) should be installed and located in the user’s PATH
    and `Biopython` also should be installed.
  - R (\>=4.0.3) should be installed and located in the user’s PATH
      - the following packages also should be installed. `ggtreeExtra`,
        `ggtree`, `tidytree`, `treeio`, `MicrobiotaProcess`,
        `kableExtra`, `ggplot2`, `bookdown`, `ggstar`, `tidyverse`,
        `Cairo`, `openxlsx`, `patchwork`, `ggnewscale` and `knitr`.

To compile the Rmarkdown/manuscript.docx and
Rmarkdown/supplemental\_file.pdf, please run the following command on
terminal of Linux or Mac.

<!-- ```r
make manuscript && make supple 
``` -->

``` r
make supple
```

Here is the output of `sessionInfo()` on the system on which [the
document](https://github.com/xiangpin/ggtreeExtra_article/blob/master/Rmarkdown/supplementary_file.pdf)
was compiled:

    ## R version 4.0.3 (2020-10-10)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 18.04.4 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /mnt/d/UbuntuApps/R/4.0.3/lib/R/lib/libRblas.so
    ## LAPACK: /mnt/d/UbuntuApps/R/4.0.3/lib/R/lib/libRlapack.so
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
    ##  [1] knitr_1.30              patchwork_1.0.1         Cairo_1.5-12.2         
    ##  [4] kableExtra_1.3.1        openxlsx_4.2.3          forcats_0.5.0          
    ##  [7] stringr_1.4.0           dplyr_1.0.2             purrr_0.3.4            
    ## [10] readr_1.4.0             tidyr_1.1.2             tibble_3.0.4           
    ## [13] tidyverse_1.3.0         MicrobiotaProcess_1.3.2 ggnewscale_0.4.3       
    ## [16] tidytree_0.3.4          treeio_1.14.0           ggtree_2.5.0.992       
    ## [19] ggplot2_3.3.2           ggstar_0.0.9            ggtreeExtra_1.1.2      
    ## 
    ## loaded via a namespace (and not attached):
    ##   [1] TH.data_1.0-10      colorspace_1.4-1    ggsignif_0.6.0     
    ##   [4] ellipsis_0.3.1      modeltools_0.2-23   XVector_0.30.0     
    ##   [7] fs_1.5.0            aplot_0.0.6         rstudioapi_0.11    
    ##  [10] ggrepel_0.8.2       bit64_4.0.5         fansi_0.4.1        
    ##  [13] lubridate_1.7.9.2   mvtnorm_1.1-1       xml2_1.3.2         
    ##  [16] coin_1.3-1          codetools_0.2-16    splines_4.0.3      
    ##  [19] libcoin_1.0-6       ade4_1.7-16         jsonlite_1.7.1     
    ##  [22] phyloseq_1.34.0     broom_0.7.2         cluster_2.1.0      
    ##  [25] dbplyr_2.0.0        httr_1.4.2          BiocManager_1.30.10
    ##  [28] compiler_4.0.3      rvcheck_0.1.8       backports_1.1.10   
    ##  [31] assertthat_0.2.1    Matrix_1.2-18       lazyeval_0.2.2     
    ##  [34] cli_2.1.0           htmltools_0.5.0     prettyunits_1.1.1  
    ##  [37] tools_4.0.3         igraph_1.2.6        gtable_0.3.0       
    ##  [40] glue_1.4.2          reshape2_1.4.4      fastmatch_1.1-0    
    ##  [43] Rcpp_1.0.5          Biobase_2.50.0      cellranger_1.1.0   
    ##  [46] vctrs_0.3.4         Biostrings_2.58.0   rhdf5filters_1.2.0 
    ##  [49] multtest_2.46.0     ape_5.4-1           nlme_3.1-150       
    ##  [52] DECIPHER_2.18.1     iterators_1.0.13    xfun_0.19          
    ##  [55] ps_1.4.0            Rmisc_1.5           rvest_0.3.6        
    ##  [58] lifecycle_0.2.0     phangorn_2.5.5      gtools_3.8.2       
    ##  [61] zlibbioc_1.36.0     MASS_7.3-53         zoo_1.8-8          
    ##  [64] scales_1.1.1        hms_0.5.3           parallel_4.0.3     
    ##  [67] biomformat_1.18.0   sandwich_3.0-0      rhdf5_2.34.0       
    ##  [70] yaml_2.2.1          memoise_1.1.0       gridExtra_2.3      
    ##  [73] reshape_0.8.8       stringi_1.5.3       RSQLite_2.2.1      
    ##  [76] S4Vectors_0.28.0    foreach_1.5.1       randomForest_4.6-14
    ##  [79] permute_0.9-5       BiocGenerics_0.36.0 zip_2.1.1          
    ##  [82] rlang_0.4.8         pkgconfig_2.0.3     matrixStats_0.57.0 
    ##  [85] evaluate_0.14       lattice_0.20-41     Rhdf5lib_1.12.0    
    ##  [88] bit_4.0.4           tidyselect_1.1.0    plyr_1.8.6         
    ##  [91] magrittr_1.5        R6_2.5.0            IRanges_2.24.0     
    ##  [94] generics_0.0.2      multcomp_1.4-14     DBI_1.1.0          
    ##  [97] haven_2.3.1         pillar_1.4.6        withr_2.3.0        
    ## [100] mgcv_1.8-33         survival_3.2-7      modelr_0.1.8       
    ## [103] crayon_1.3.4        rmarkdown_2.5       progress_1.2.2     
    ## [106] readxl_1.3.1        grid_4.0.3          data.table_1.13.2  
    ## [109] blob_1.2.1          vegan_2.5-6         webshot_0.5.2      
    ## [112] reprex_0.3.0        digest_0.6.27       stats4_4.0.3       
    ## [115] munsell_0.5.0       viridisLite_0.3.0   quadprog_1.5-8
