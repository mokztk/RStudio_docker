``` r
library(tidyverse)

.packages(all.available = TRUE) %>%
    sessioninfo::package_info(pkgs = ., include_base = FALSE) %>%
    as_tibble() %>%
    select(package, ondiskversion, date, source) %>%
    knitr::kable()
```

| package           | ondiskversion | date       | source         |
|:------------------|:--------------|:-----------|:---------------|
| abind             | 1.4-8         | 2024-09-12 | RSPM           |
| askpass           | 1.2.1         | 2024-10-04 | RSPM (R 4.5.0) |
| backports         | 1.5.0         | 2024-05-23 | RSPM (R 4.5.0) |
| base64enc         | 0.1-3         | 2015-07-28 | RSPM (R 4.5.0) |
| basepenguins      | 0.1.0         | 2025-04-08 | RSPM           |
| beeswarm          | 0.4.0         | 2021-06-01 | RSPM           |
| bigD              | 0.3.1         | 2025-04-03 | RSPM           |
| BiocManager       | 1.30.26       | 2025-06-05 | RSPM (R 4.5.0) |
| bit               | 4.6.0         | 2025-03-06 | RSPM (R 4.5.0) |
| bit64             | 4.6.0-1       | 2025-01-16 | RSPM (R 4.5.0) |
| bitops            | 1.0-9         | 2024-10-03 | RSPM           |
| blob              | 1.2.4         | 2023-03-17 | RSPM (R 4.5.0) |
| boot              | 1.3-31        | 2024-08-28 | CRAN (R 4.5.0) |
| brew              | 1.0-10        | 2023-12-16 | RSPM (R 4.5.0) |
| brio              | 1.1.5         | 2024-04-24 | RSPM (R 4.5.0) |
| broom             | 1.0.8         | 2025-03-28 | RSPM (R 4.5.0) |
| bslib             | 0.9.0         | 2025-01-30 | RSPM (R 4.5.0) |
| cachem            | 1.1.0         | 2024-05-16 | RSPM (R 4.5.0) |
| Cairo             | 1.6-2         | 2023-11-28 | RSPM           |
| callr             | 3.7.6         | 2024-03-25 | RSPM (R 4.5.0) |
| car               | 3.1-3         | 2024-09-27 | RSPM           |
| carData           | 3.0-5         | 2022-01-06 | RSPM           |
| cards             | 0.6.0         | 2025-04-11 | RSPM           |
| cellranger        | 1.1.0         | 2016-07-27 | RSPM (R 4.5.0) |
| checkmate         | 2.3.2         | 2024-07-29 | RSPM           |
| class             | 7.3-23        | 2025-01-01 | CRAN (R 4.5.0) |
| cli               | 3.6.5         | 2025-04-23 | RSPM (R 4.5.0) |
| clipr             | 0.8.0         | 2022-02-22 | RSPM (R 4.5.0) |
| clisymbols        | 1.2.0         | 2017-05-21 | RSPM           |
| cluster           | 2.1.8.1       | 2025-03-12 | CRAN (R 4.5.0) |
| cmprsk            | 2.2-12        | 2024-05-19 | RSPM           |
| codetools         | 0.2-20        | 2024-03-31 | CRAN (R 4.5.0) |
| colorspace        | 2.1-1         | 2024-07-26 | RSPM           |
| commonmark        | 1.9.5         | 2025-03-17 | RSPM (R 4.5.0) |
| conflicted        | 1.2.0         | 2023-02-01 | RSPM (R 4.5.0) |
| corrplot          | 0.95          | 2024-10-14 | RSPM           |
| cowplot           | 1.1.3         | 2024-01-22 | RSPM           |
| cpp11             | 0.5.2         | 2025-03-03 | RSPM (R 4.5.0) |
| crayon            | 1.5.3         | 2024-06-20 | RSPM (R 4.5.0) |
| credentials       | 2.0.2         | 2024-10-04 | RSPM (R 4.5.0) |
| curl              | 6.3.0         | 2025-06-06 | RSPM (R 4.5.0) |
| data.table        | 1.17.4        | 2025-05-26 | RSPM (R 4.5.0) |
| datawizard        | 1.1.0         | 2025-05-09 | RSPM           |
| DBI               | 1.2.3         | 2024-06-02 | RSPM (R 4.5.0) |
| dbplyr            | 2.5.0         | 2024-03-19 | RSPM (R 4.5.0) |
| Deriv             | 4.1.6         | 2024-09-13 | RSPM           |
| desc              | 1.4.3         | 2023-12-10 | RSPM (R 4.5.0) |
| devEMF            | 4.5-1         | 2025-03-24 | RSPM           |
| devtools          | 2.4.5         | 2022-10-11 | RSPM (R 4.5.0) |
| DiagrammeR        | 1.0.11        | 2024-02-02 | RSPM           |
| diffobj           | 0.3.6         | 2025-04-21 | RSPM (R 4.5.0) |
| digest            | 0.6.37        | 2024-08-19 | RSPM (R 4.5.0) |
| doBy              | 4.6.27        | 2025-05-16 | RSPM           |
| docopt            | 0.7.2         | 2025-03-25 | RSPM (R 4.5.0) |
| downlit           | 0.4.4         | 2024-06-10 | RSPM (R 4.5.0) |
| dplyr             | 1.1.4         | 2023-11-17 | RSPM (R 4.5.0) |
| dtplyr            | 1.3.1         | 2023-03-22 | RSPM (R 4.5.0) |
| ellipsis          | 0.3.2         | 2021-04-29 | RSPM (R 4.5.0) |
| evaluate          | 1.0.3         | 2025-01-10 | RSPM (R 4.5.0) |
| exactRankTests    | 0.8-35        | 2022-04-26 | RSPM           |
| export            | 0.3.0         | 2022-12-07 | RSPM           |
| fansi             | 1.0.6         | 2023-12-08 | RSPM (R 4.5.0) |
| farver            | 2.1.2         | 2024-05-13 | RSPM (R 4.5.0) |
| fastmap           | 1.2.0         | 2024-05-15 | RSPM (R 4.5.0) |
| flextable         | 0.9.9         | 2025-05-31 | RSPM           |
| fontawesome       | 0.5.3         | 2024-11-16 | RSPM (R 4.5.0) |
| fontBitstreamVera | 0.1.1         | 2017-02-01 | RSPM           |
| fontLiberation    | 0.1.0         | 2016-10-15 | RSPM           |
| fontquiver        | 0.2.1         | 2017-02-01 | RSPM           |
| forcats           | 1.0.0         | 2023-01-29 | RSPM (R 4.5.0) |
| foreach           | 1.5.2         | 2022-02-02 | RSPM           |
| foreign           | 0.8-90        | 2025-03-31 | CRAN (R 4.5.0) |
| formattable       | 0.2.1         | 2021-01-07 | RSPM           |
| Formula           | 1.2-5         | 2023-02-24 | RSPM           |
| fs                | 1.6.6         | 2025-04-12 | RSPM (R 4.5.0) |
| fst               | 0.9.8         | 2022-02-08 | RSPM (R 4.5.0) |
| fstcore           | 0.10.0        | 2025-02-10 | RSPM (R 4.5.0) |
| ftExtra           | 0.6.4         | 2024-05-10 | RSPM           |
| furrr             | 0.3.1         | 2022-08-15 | RSPM           |
| future            | 1.58.0        | 2025-06-05 | RSPM           |
| gargle            | 1.5.2         | 2023-07-20 | RSPM (R 4.5.0) |
| gdtools           | 0.4.2         | 2025-03-27 | RSPM           |
| generics          | 0.1.4         | 2025-05-09 | RSPM (R 4.5.0) |
| gert              | 2.1.5         | 2025-03-25 | RSPM (R 4.5.0) |
| GGally            | 2.2.1         | 2024-02-14 | RSPM           |
| ggbeeswarm        | 0.7.2         | 2023-04-29 | RSPM           |
| ggeffects         | 2.2.1         | 2025-03-11 | RSPM           |
| ggfortify         | 0.4.17        | 2024-04-17 | RSPM           |
| gghighlight       | 0.4.1         | 2023-12-16 | RSPM           |
| ggmice            | 0.1.0         | 2023-08-07 | RSPM           |
| ggplot2           | 3.5.2         | 2025-04-09 | RSPM (R 4.5.0) |
| ggpubr            | 0.6.0         | 2023-02-10 | RSPM           |
| ggrastr           | 1.0.2         | 2023-06-01 | RSPM           |
| ggrepel           | 0.9.6         | 2024-09-07 | RSPM           |
| ggsci             | 3.2.0         | 2024-06-18 | RSPM           |
| ggsignif          | 0.6.4         | 2022-10-13 | RSPM           |
| ggstats           | 0.9.0         | 2025-03-10 | RSPM           |
| ggsurvfit         | 1.1.0         | 2024-05-08 | RSPM           |
| ggtext            | 0.1.2         | 2022-09-16 | RSPM           |
| gh                | 1.5.0         | 2025-05-26 | RSPM (R 4.5.0) |
| gitcreds          | 0.1.2         | 2022-09-08 | RSPM (R 4.5.0) |
| glmmTMB           | 1.1.11        | 2025-04-02 | RSPM           |
| glmnet            | 4.1-9         | 2025-06-02 | RSPM           |
| glmnetUtils       | 1.1.9         | 2023-09-10 | RSPM           |
| globals           | 0.18.0        | 2025-05-08 | RSPM           |
| glue              | 1.8.0         | 2024-09-30 | RSPM (R 4.5.0) |
| googledrive       | 2.1.1         | 2023-06-11 | RSPM (R 4.5.0) |
| googlesheets4     | 1.1.1         | 2023-06-11 | RSPM (R 4.5.0) |
| gridExtra         | 2.3           | 2017-09-09 | RSPM           |
| gridtext          | 0.1.5         | 2022-09-16 | RSPM           |
| gt                | 1.0.0         | 2025-04-05 | RSPM           |
| gtable            | 0.3.6         | 2024-10-25 | RSPM (R 4.5.0) |
| gtsummary         | 2.2.0         | 2025-04-14 | RSPM           |
| haven             | 2.5.5         | 2025-05-30 | RSPM (R 4.5.0) |
| here              | 1.0.1         | 2020-12-13 | RSPM           |
| highr             | 0.11          | 2024-05-26 | RSPM (R 4.5.0) |
| Hmisc             | 5.2-3         | 2025-03-16 | RSPM           |
| hms               | 1.1.3         | 2023-03-21 | RSPM (R 4.5.0) |
| htmlTable         | 2.4.3         | 2024-07-21 | RSPM           |
| htmltools         | 0.5.8.1       | 2024-04-04 | RSPM (R 4.5.0) |
| htmlwidgets       | 1.6.4         | 2023-12-06 | RSPM (R 4.5.0) |
| httpuv            | 1.6.16        | 2025-04-16 | RSPM (R 4.5.0) |
| httr              | 1.4.7         | 2023-08-15 | RSPM (R 4.5.0) |
| httr2             | 1.1.2         | 2025-03-26 | RSPM (R 4.5.0) |
| ids               | 1.0.1         | 2017-05-31 | RSPM (R 4.5.0) |
| igraph            | 2.1.4         | 2025-01-23 | RSPM           |
| ini               | 0.3.1         | 2018-05-20 | RSPM (R 4.5.0) |
| insight           | 1.3.0         | 2025-05-20 | RSPM           |
| isoband           | 0.2.7         | 2022-12-20 | RSPM (R 4.5.0) |
| iterators         | 1.0.14        | 2022-02-05 | RSPM           |
| jomo              | 2.7-6         | 2023-04-15 | RSPM           |
| jpeg              | 0.1-11        | 2025-03-21 | RSPM           |
| jquerylib         | 0.1.4         | 2021-04-26 | RSPM (R 4.5.0) |
| jsonlite          | 2.0.0         | 2025-03-27 | RSPM (R 4.5.0) |
| juicyjuice        | 0.1.0         | 2022-11-10 | RSPM           |
| katex             | 1.5.0         | 2024-09-29 | RSPM           |
| KernSmooth        | 2.23-26       | 2025-01-01 | CRAN (R 4.5.0) |
| km.ci             | 0.5-6         | 2022-04-06 | RSPM           |
| KMsurv            | 0.1-6         | 2025-05-20 | RSPM           |
| knitr             | 1.50          | 2025-03-16 | RSPM           |
| labeling          | 0.4.3         | 2023-08-29 | RSPM (R 4.5.0) |
| later             | 1.4.2         | 2025-04-08 | RSPM (R 4.5.0) |
| lattice           | 0.22-7        | 2025-04-02 | RSPM (R 4.5.0) |
| lifecycle         | 1.0.4         | 2023-11-07 | RSPM (R 4.5.0) |
| listenv           | 0.9.1         | 2024-01-29 | RSPM           |
| litedown          | 0.7           | 2025-04-08 | RSPM           |
| littler           | 0.3.21        | 2025-03-25 | RSPM (R 4.5.0) |
| lme4              | 1.1-37        | 2025-03-26 | RSPM           |
| lubridate         | 1.9.4         | 2024-12-08 | RSPM (R 4.5.0) |
| magrittr          | 2.0.3         | 2022-03-30 | RSPM (R 4.5.0) |
| markdown          | 2.0           | 2025-03-23 | RSPM           |
| MASS              | 7.3-65        | 2025-02-28 | CRAN (R 4.5.0) |
| Matrix            | 1.7-3         | 2025-03-11 | CRAN (R 4.5.0) |
| MatrixModels      | 0.5-4         | 2025-03-26 | RSPM           |
| maxstat           | 0.7-26        | 2025-05-02 | RSPM           |
| memoise           | 2.0.1         | 2021-11-26 | RSPM (R 4.5.0) |
| mgcv              | 1.9-3         | 2025-04-04 | RSPM (R 4.5.0) |
| mice              | 3.18.0        | 2025-05-27 | RSPM           |
| microbenchmark    | 1.5.0         | 2024-09-04 | RSPM           |
| mime              | 0.13          | 2025-03-17 | RSPM (R 4.5.0) |
| minidown          | 0.4.0         | 2022-02-08 | RSPM           |
| miniUI            | 0.1.2         | 2025-04-17 | RSPM (R 4.5.0) |
| minqa             | 1.2.8         | 2024-08-17 | RSPM           |
| mitml             | 0.4-5         | 2023-03-08 | RSPM           |
| modelr            | 0.1.11        | 2023-03-22 | RSPM (R 4.5.0) |
| mvtnorm           | 1.3-3         | 2025-01-10 | RSPM           |
| nlme              | 3.1-168       | 2025-03-31 | CRAN (R 4.5.0) |
| nloptr            | 2.2.1         | 2025-03-17 | RSPM           |
| nnet              | 7.3-20        | 2025-01-01 | CRAN (R 4.5.0) |
| numDeriv          | 2016.8-1.1    | 2019-06-06 | RSPM           |
| officer           | 0.6.10        | 2025-05-30 | RSPM           |
| openssl           | 2.3.3         | 2025-05-26 | RSPM (R 4.5.0) |
| openxlsx          | 4.2.8         | 2025-01-25 | RSPM           |
| ordinal           | 2023.12-4.1   | 2024-08-19 | RSPM           |
| pacman            | 0.5.1         | 2019-03-11 | RSPM           |
| pak               | 0.9.0         | 2025-05-27 | RSPM (R 4.5.0) |
| palmerpenguins    | 0.1.1         | 2022-08-15 | RSPM           |
| pan               | 1.9           | 2023-12-07 | RSPM           |
| parallelly        | 1.45.0        | 2025-06-02 | RSPM           |
| patchwork         | 1.3.0         | 2024-09-16 | RSPM           |
| pbkrtest          | 0.5.4         | 2025-04-28 | RSPM           |
| pillar            | 1.10.2        | 2025-04-05 | RSPM (R 4.5.0) |
| pkgbuild          | 1.4.8         | 2025-05-26 | RSPM (R 4.5.0) |
| pkgconfig         | 2.0.3         | 2019-09-22 | RSPM (R 4.5.0) |
| pkgdown           | 2.1.3         | 2025-05-25 | RSPM (R 4.5.0) |
| pkgload           | 1.4.0         | 2024-06-28 | RSPM (R 4.5.0) |
| plogr             | 0.2.0         | 2018-03-25 | RSPM (R 4.5.0) |
| plyr              | 1.8.9         | 2023-10-02 | RSPM           |
| png               | 0.1-8         | 2022-11-29 | RSPM           |
| polynom           | 1.4-1         | 2022-04-11 | RSPM           |
| praise            | 1.0.0         | 2015-08-11 | RSPM (R 4.5.0) |
| prettyunits       | 1.2.0         | 2023-09-24 | RSPM (R 4.5.0) |
| pROC              | 1.18.5        | 2023-11-01 | RSPM           |
| processx          | 3.8.6         | 2025-02-21 | RSPM (R 4.5.0) |
| profvis           | 0.4.0         | 2024-09-20 | RSPM (R 4.5.0) |
| progress          | 1.2.3         | 2023-12-06 | RSPM (R 4.5.0) |
| promises          | 1.3.3         | 2025-05-29 | RSPM (R 4.5.0) |
| ps                | 1.9.1         | 2025-04-12 | RSPM (R 4.5.0) |
| purrr             | 1.0.4         | 2025-02-05 | RSPM (R 4.5.0) |
| quantreg          | 6.1           | 2025-03-10 | RSPM           |
| quarto            | 1.4.4         | 2024-07-20 | RSPM           |
| R.cache           | 0.17.0        | 2025-05-02 | RSPM           |
| R.methodsS3       | 1.8.2         | 2022-06-13 | RSPM           |
| R.oo              | 1.27.1        | 2025-05-02 | RSPM           |
| R.utils           | 2.13.0        | 2025-02-24 | RSPM           |
| R6                | 2.6.1         | 2025-02-15 | RSPM (R 4.5.0) |
| ragg              | 1.4.0         | 2025-04-10 | RSPM (R 4.5.0) |
| rappdirs          | 0.3.3         | 2021-01-31 | RSPM (R 4.5.0) |
| rbibutils         | 2.3           | 2024-10-04 | RSPM           |
| rcmdcheck         | 1.4.0         | 2021-09-27 | RSPM (R 4.5.0) |
| RColorBrewer      | 1.1-3         | 2022-04-03 | RSPM (R 4.5.0) |
| Rcpp              | 1.0.14        | 2025-01-12 | RSPM (R 4.5.0) |
| RcppEigen         | 0.3.4.0.2     | 2024-08-24 | RSPM (R 4.5.0) |
| RcppTOML          | 0.2.3         | 2025-03-08 | RSPM (R 4.5.0) |
| Rdpack            | 2.6.4         | 2025-04-09 | RSPM           |
| reactable         | 0.4.4         | 2023-03-12 | RSPM           |
| reactR            | 0.6.1         | 2024-09-14 | RSPM           |
| readr             | 2.1.5         | 2024-01-10 | RSPM (R 4.5.0) |
| readxl            | 1.4.5         | 2025-03-07 | RSPM (R 4.5.0) |
| reformulas        | 0.4.1         | 2025-04-30 | RSPM           |
| rematch           | 2.0.0         | 2023-08-30 | RSPM (R 4.5.0) |
| rematch2          | 2.1.2         | 2020-05-01 | RSPM (R 4.5.0) |
| remotes           | 2.5.0         | 2024-03-17 | RSPM (R 4.5.0) |
| reprex            | 2.1.1         | 2024-07-06 | RSPM (R 4.5.0) |
| reticulate        | 1.42.0        | 2025-03-25 | RSPM (R 4.5.0) |
| rgl               | 1.3.18        | 2025-03-28 | RSPM           |
| rlang             | 1.1.6         | 2025-04-11 | RSPM (R 4.5.0) |
| rmarkdown         | 2.29          | 2024-11-04 | RSPM (R 4.5.0) |
| roxygen2          | 7.3.2         | 2024-06-28 | RSPM (R 4.5.0) |
| rpart             | 4.1.24        | 2025-01-07 | CRAN (R 4.5.0) |
| rprojroot         | 2.0.4         | 2023-11-05 | RSPM (R 4.5.0) |
| RSQLite           | 2.4.1         | 2025-06-08 | RSPM (R 4.5.0) |
| rstatix           | 0.7.2         | 2023-02-01 | RSPM           |
| rstudioapi        | 0.17.1        | 2024-10-22 | RSPM (R 4.5.0) |
| rversions         | 2.1.2         | 2022-08-31 | RSPM (R 4.5.0) |
| rvest             | 1.0.4         | 2024-02-12 | RSPM (R 4.5.0) |
| rvg               | 0.3.5         | 2025-03-27 | RSPM           |
| sass              | 0.4.10        | 2025-04-11 | RSPM (R 4.5.0) |
| scales            | 1.4.0         | 2025-04-24 | RSPM (R 4.5.0) |
| selectr           | 0.4-2         | 2019-11-20 | RSPM (R 4.5.0) |
| sessioninfo       | 1.2.3         | 2025-02-05 | RSPM (R 4.5.0) |
| shape             | 1.4.6.1       | 2024-02-23 | RSPM           |
| shiny             | 1.10.0        | 2024-12-14 | RSPM (R 4.5.0) |
| sourcetools       | 0.1.7-1       | 2023-02-01 | RSPM (R 4.5.0) |
| SparseM           | 1.84-2        | 2024-07-17 | RSPM           |
| spatial           | 7.3-18        | 2025-01-01 | CRAN (R 4.5.0) |
| stargazer         | 5.2.3         | 2022-03-04 | RSPM           |
| stringi           | 1.8.7         | 2025-03-27 | RSPM (R 4.5.0) |
| stringr           | 1.5.1         | 2023-11-14 | RSPM (R 4.5.0) |
| styler            | 1.10.3        | 2024-04-07 | RSPM           |
| survival          | 3.8-3         | 2024-12-17 | CRAN (R 4.5.0) |
| survminer         | 0.5.0         | 2024-10-30 | RSPM           |
| survMisc          | 0.5.6         | 2022-04-07 | RSPM           |
| svglite           | 2.2.1         | 2025-05-12 | RSPM           |
| sys               | 3.4.3         | 2024-10-04 | RSPM (R 4.5.0) |
| systemfonts       | 1.2.3         | 2025-04-30 | RSPM (R 4.5.0) |
| testthat          | 3.2.3         | 2025-01-13 | RSPM (R 4.5.0) |
| textshaping       | 1.0.1         | 2025-05-01 | RSPM (R 4.5.0) |
| tibble            | 3.3.0         | 2025-06-08 | RSPM (R 4.5.0) |
| tidylog           | 1.1.0         | 2024-05-08 | RSPM           |
| tidyplots         | 0.2.2         | 2025-03-07 | RSPM           |
| tidyr             | 1.3.1         | 2024-01-24 | RSPM (R 4.5.0) |
| tidyselect        | 1.2.1         | 2024-03-11 | RSPM (R 4.5.0) |
| tidyverse         | 2.0.0         | 2023-02-22 | RSPM (R 4.5.0) |
| timechange        | 0.3.0         | 2024-01-18 | RSPM (R 4.5.0) |
| tinytable         | 0.9.0         | 2025-05-04 | RSPM           |
| tinytex           | 0.57          | 2025-04-15 | RSPM (R 4.5.0) |
| TMB               | 1.9.17        | 2025-03-10 | RSPM           |
| tzdb              | 0.5.0         | 2025-03-15 | RSPM (R 4.5.0) |
| ucminf            | 1.2.2         | 2024-06-24 | RSPM           |
| urlchecker        | 1.0.1         | 2021-11-30 | RSPM (R 4.5.0) |
| usethis           | 3.1.0         | 2024-11-26 | RSPM (R 4.5.0) |
| utf8              | 1.2.6         | 2025-06-08 | RSPM (R 4.5.0) |
| uuid              | 1.2-1         | 2024-07-29 | RSPM (R 4.5.0) |
| V8                | 6.0.4         | 2025-06-04 | RSPM           |
| vctrs             | 0.6.5         | 2023-12-01 | RSPM (R 4.5.0) |
| vipor             | 0.4.7         | 2023-12-18 | RSPM           |
| viridis           | 0.6.5         | 2024-01-29 | RSPM           |
| viridisLite       | 0.4.2         | 2023-05-02 | RSPM (R 4.5.0) |
| visNetwork        | 2.1.2         | 2022-09-29 | RSPM           |
| vroom             | 1.6.5         | 2023-12-05 | RSPM (R 4.5.0) |
| waldo             | 0.6.1         | 2024-11-07 | RSPM (R 4.5.0) |
| whisker           | 0.4.1         | 2022-12-05 | RSPM (R 4.5.0) |
| withr             | 3.0.2         | 2024-10-28 | RSPM (R 4.5.0) |
| xfun              | 0.52          | 2025-04-02 | RSPM (R 4.5.0) |
| xml2              | 1.3.8         | 2025-03-14 | RSPM (R 4.5.0) |
| xopen             | 1.0.1         | 2024-04-25 | RSPM (R 4.5.0) |
| xtable            | 1.8-4         | 2019-04-21 | RSPM (R 4.5.0) |
| yaml              | 2.3.10        | 2024-07-26 | RSPM (R 4.5.0) |
| zip               | 2.3.3         | 2025-05-13 | RSPM (R 4.5.0) |
| zoo               | 1.8-14        | 2025-04-10 | RSPM           |
