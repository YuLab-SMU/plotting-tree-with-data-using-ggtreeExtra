<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggtreeExtra: A universal package to visualize compact circular layers of phylogenetic tree

<!--If you use this work in published research, please cite:
    Shuangbin Xu, Zehan Dai, Pingfan Guo, Xiaocong Fu, Shanshan Liu, Lang Zhou, Wenli Tang, Tingze Feng, Meijun Chen, Li Zhan and GuangChuang Yu*. ggtreeExtra: An R package to visualize compact circular layers of phylogenetic tree, XXX, XXX, XXX -->

-----

This repo contains source code and data to produce
<!--Manuscript and-->Supplementary Material of the above paper.

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

<!-- - GNU Make should be located in the user’s PATH -->
<!-- - Python (2 or 3) should be installed and located in the user’s PATH -->
<!--and `Biopython` also should be installed. --> + R (\>=4.0.3) should
be installed and located in the user’s PATH + the following packages
also should be installed.

``` 
  `ggtreeExtra`, `ggtree`, `tidytree`, `treeio`, `MicrobiotaProcess`, `kableExtra`, `ggplot2`, 
  `bookdown`, `ggstar`, `tidyverse`, `Cairo`, `openxlsx`, `patchwork`, `ggnewscale` and `knitr`.
```

To compile the <!-- Rmarkdown/manuscript.docx and -->
Rmarkdown/supplemental\_file.pdf, please run the following command on
terminal of Linux or Mac.

<!-- ```r
make manuscript && make supple 
``` -->

``` bash
Rscript -e 'rmarkdown::render("./Rmarkdown/supplementary_file.Rmd")'
```

Or run the following command on the interactive environment of R.

``` r
rmarkdown::render("./Rmarkdown/supplementary_file.Rmd")
```

Here is the output of `sessionInfo()` on the system on which [the
document](https://github.com/YuLab-SMU/plotting-tree-with-data-using-ggtreeExtra/blob/master/Rmarkdown/supplementary_file.pdf)
was compiled:

    ## R version 4.0.2 (2020-06-22)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 18.04.4 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /mnt/d/UbuntuApps/R/4.0.2/lib/R/lib/libRblas.so
    ## LAPACK: /mnt/d/UbuntuApps/R/4.0.2/lib/R/lib/libRlapack.so
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
    ##  [1] knitr_1.29              patchwork_1.0.1         Cairo_1.5-12.2         
    ##  [4] kableExtra_1.1.0        openxlsx_4.1.5          forcats_0.5.0          
    ##  [7] stringr_1.4.0           dplyr_1.0.2             purrr_0.3.4            
    ## [10] readr_1.3.1             tidyr_1.1.2             tibble_3.0.3           
    ## [13] tidyverse_1.3.0         MicrobiotaProcess_1.3.4 ggnewscale_0.4.1       
    ## [16] tidytree_0.3.4          treeio_1.12.0           ggtree_2.5.0.992       
    ## [19] ggplot2_3.3.2           ggstar_0.0.9            ggtreeExtra_0.99.19    
    ## 
    ## loaded via a namespace (and not attached):
    ##   [1] TH.data_1.0-10      colorspace_1.4-1    ggsignif_0.6.0     
    ##   [4] ellipsis_0.3.1      modeltools_0.2-23   XVector_0.28.0     
    ##   [7] fs_1.5.0            aplot_0.0.6         rstudioapi_0.11    
    ##  [10] ggrepel_0.8.2       bit64_0.9-7         fansi_0.4.1        
    ##  [13] lubridate_1.7.9     mvtnorm_1.1-1       xml2_1.3.2         
    ##  [16] coin_1.3-1          codetools_0.2-16    splines_4.0.2      
    ##  [19] libcoin_1.0-5       ade4_1.7-15         jsonlite_1.7.1     
    ##  [22] phyloseq_1.32.0     broom_0.7.0         cluster_2.1.0      
    ##  [25] dbplyr_1.4.4        BiocManager_1.30.10 compiler_4.0.2     
    ##  [28] httr_1.4.2          rvcheck_0.1.8       backports_1.1.10   
    ##  [31] assertthat_0.2.1    Matrix_1.2-18       lazyeval_0.2.2     
    ##  [34] cli_2.0.2           htmltools_0.5.0     tools_4.0.2        
    ##  [37] igraph_1.2.5        gtable_0.3.0        glue_1.4.2         
    ##  [40] reshape2_1.4.4      fastmatch_1.1-0     Rcpp_1.0.5         
    ##  [43] Biobase_2.48.0      cellranger_1.1.0    vctrs_0.3.4        
    ##  [46] Biostrings_2.56.0   multtest_2.44.0     ape_5.4-1          
    ##  [49] nlme_3.1-148        DECIPHER_2.16.1     iterators_1.0.12   
    ##  [52] xfun_0.17           Rmisc_1.5           rvest_0.3.6        
    ##  [55] lifecycle_0.2.0     phangorn_2.5.5      gtools_3.8.2       
    ##  [58] zlibbioc_1.34.0     MASS_7.3-51.6       zoo_1.8-8          
    ##  [61] scales_1.1.1        hms_0.5.3           parallel_4.0.2     
    ##  [64] biomformat_1.16.0   sandwich_2.5-1      rhdf5_2.32.2       
    ##  [67] yaml_2.2.1          memoise_1.1.0       gridExtra_2.3      
    ##  [70] reshape_0.8.8       stringi_1.5.3       RSQLite_2.2.0      
    ##  [73] S4Vectors_0.26.1    foreach_1.5.0       randomForest_4.6-14
    ##  [76] permute_0.9-5       BiocGenerics_0.34.0 zip_2.1.1          
    ##  [79] rlang_0.4.7         pkgconfig_2.0.3     matrixStats_0.56.0 
    ##  [82] evaluate_0.14       lattice_0.20-41     Rhdf5lib_1.10.0    
    ##  [85] bit_1.1-15.2        tidyselect_1.1.0    plyr_1.8.6         
    ##  [88] magrittr_1.5        R6_2.4.1            IRanges_2.22.2     
    ##  [91] generics_0.0.2      multcomp_1.4-13     DBI_1.1.0          
    ##  [94] pillar_1.4.6        haven_2.3.1         withr_2.2.0        
    ##  [97] mgcv_1.8-31         survival_3.2-3      modelr_0.1.8       
    ## [100] crayon_1.3.4        rmarkdown_2.3       readxl_1.3.1       
    ## [103] grid_4.0.2          data.table_1.12.8   blob_1.2.1         
    ## [106] vegan_2.5-6         webshot_0.5.2       reprex_0.3.0       
    ## [109] digest_0.6.25       stats4_4.0.2        munsell_0.5.0      
    ## [112] viridisLite_0.3.0   quadprog_1.5-8
