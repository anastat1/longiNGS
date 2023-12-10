
<!-- README.md is generated from README.Rmd. Please edit that file -->

# longiNGS

<!-- badges: start -->
<!-- badges: end -->

The package is intended to provide functionalities to work with
longitudinal next generation sequencing data (e.g. RNAseq, 16S
sequencing, microbial metagenome)

## Installation

You can install the development version of longiNGS from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("anastat1/longiNGS")
```

## Example

Example functionality: description of longitudinal dataset

``` r
library(longiNGS)
example.dat <- data.frame(ID = c("subj1", "subj1", "subj1", "subj2", "subj2", "subj3", "subj4"), 
                          visit = c(1, 2, 3, 1, 2, 1, 1))
example.dat
#>      ID visit
#> 1 subj1     1
#> 2 subj1     2
#> 3 subj1     3
#> 4 subj2     1
#> 5 subj2     2
#> 6 subj3     1
#> 7 subj4     1
count_rec_subj(example.dat, "ID", "visit")
#> dataset has 7 subject/visit records 
#> dataset has 4 subjects with max 3 records per subject
```
