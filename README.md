<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggtreeExtra: Compact visualization of richly annotated phylogenetic data

If you use this work in published research, please cite:

S Xu, Z Dai, P Guo, X Fu, S Liu, L Zhou, W Tang, T Feng, M Chen, L Zhan,
T Wu, E Hu and **G Yu**<sup>\*</sup>. ggtreeExtra: Compact visualization
of richly annotated phylogenetic data. __*Research Square*__
 doi: [10.21203/rs.3.rs-155672/v1](https://doi.org/10.21203/rs.3.rs-155672/v1) (preprint).

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
      - `ggtreeExtra`
      - `ggtree`
      - `treeio`
      - `tidytree`
      - `ggplot2`
      - `kableExtra`
      - `bookdown`
      - `MicrobiotaProcess`
      - `ggstar`
      - `Cairo`
      - `aplot`
      - `patchwork`
      - `ggnewscale`
      - `knitr`
      - `ggpmisc`
      - [`ggpattern`](https://github.com/coolbutuseless/ggpattern)
      - `tibble`
      - `tidyr`
      - `dplyr`
      - `ggimage`
      - `ggridges`

To compile the <!-- Rmarkdown/manuscript.docx and -->
Rmarkdown/[supplemental\_file.pdf](Rmarkdown/supplemental_file.pdf),
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
    ##  [1] ggimage_0.2.8           tibble_3.0.4            dplyr_1.0.2            
    ##  [4] tidyr_1.1.2             ggridges_0.5.2          ggpmisc_0.3.7          
    ##  [7] ggpattern_0.1.3         knitr_1.30              patchwork_1.0.1        
    ## [10] Cairo_1.5-12.2          kableExtra_1.3.1        aplot_0.0.6            
    ## [13] MicrobiotaProcess_1.3.5 ggnewscale_0.4.3        tidytree_0.3.4         
    ## [16] treeio_1.15.2           ggtree_2.5.1            ggplot2_3.3.2          
    ## [19] ggstar_0.0.9            ggtreeExtra_1.1.3.991  
    ## 
    ## loaded via a namespace (and not attached):
    ##   [1] TH.data_1.0-10      colorspace_1.4-1    ggsignif_0.6.0     
    ##   [4] class_7.3-17        ellipsis_0.3.1      modeltools_0.2-23  
    ##   [7] XVector_0.30.0      rstudioapi_0.11     ggrepel_0.8.2      
    ##  [10] bit64_4.0.5         mvtnorm_1.1-1       coin_1.3-1         
    ##  [13] xml2_1.3.2          codetools_0.2-16    splines_4.0.3      
    ##  [16] libcoin_1.0-6       polyclip_1.10-0     ade4_1.7-16        
    ##  [19] jsonlite_1.7.1      phyloseq_1.34.0     cluster_2.1.0      
    ##  [22] png_0.1-7           BiocManager_1.30.10 compiler_4.0.3     
    ##  [25] httr_1.4.2          rvcheck_0.1.8       Matrix_1.2-18      
    ##  [28] lazyeval_0.2.2      htmltools_0.5.0     prettyunits_1.1.1  
    ##  [31] tools_4.0.3         igraph_1.2.6        gtable_0.3.0       
    ##  [34] glue_1.4.2          reshape2_1.4.4      fastmatch_1.1-0    
    ##  [37] Rcpp_1.0.5          Biobase_2.50.0      vctrs_0.3.4        
    ##  [40] Biostrings_2.58.0   rhdf5filters_1.2.0  multtest_2.46.0    
    ##  [43] ape_5.4-1           nlme_3.1-150        DECIPHER_2.18.1    
    ##  [46] iterators_1.0.13    xfun_0.19           stringr_1.4.0      
    ##  [49] Rmisc_1.5           rvest_0.3.6         lifecycle_0.2.0    
    ##  [52] phangorn_2.5.5      gtools_3.8.2        zlibbioc_1.36.0    
    ##  [55] MASS_7.3-53         zoo_1.8-8           scales_1.1.1       
    ##  [58] hms_0.5.3           parallel_4.0.3      biomformat_1.18.0  
    ##  [61] sandwich_3.0-0      rhdf5_2.34.0        yaml_2.2.1         
    ##  [64] gridGeometry_0.2-0  memoise_1.1.0       gridExtra_2.3      
    ##  [67] reshape_0.8.8       stringi_1.5.3       RSQLite_2.2.1      
    ##  [70] S4Vectors_0.28.0    foreach_1.5.1       randomForest_4.6-14
    ##  [73] e1071_1.7-4         permute_0.9-5       BiocGenerics_0.36.0
    ##  [76] rlang_0.4.8         pkgconfig_2.0.3     matrixStats_0.57.0 
    ##  [79] evaluate_0.14       lattice_0.20-41     sf_0.9-6           
    ##  [82] purrr_0.3.4         Rhdf5lib_1.12.0     bit_4.0.4          
    ##  [85] tidyselect_1.1.0    plyr_1.8.6          magrittr_1.5       
    ##  [88] R6_2.5.0            magick_2.5.2        IRanges_2.24.0     
    ##  [91] generics_0.0.2      multcomp_1.4-14     DBI_1.1.0          
    ##  [94] pillar_1.4.6        withr_2.3.0         mgcv_1.8-33        
    ##  [97] units_0.6-7         survival_3.2-7      crayon_1.3.4       
    ## [100] KernSmooth_2.23-18  rmarkdown_2.5       progress_1.2.2     
    ## [103] grid_4.0.3          data.table_1.13.2   blob_1.2.1         
    ## [106] vegan_2.5-6         classInt_0.4-3      webshot_0.5.2      
    ## [109] digest_0.6.27       gridGraphics_0.5-0  stats4_4.0.3       
    ## [112] munsell_0.5.0       ggplotify_0.0.5     viridisLite_0.3.0  
    ## [115] quadprog_1.5-8
