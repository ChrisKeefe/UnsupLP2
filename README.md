
<!-- README.md is generated from README.Rmd. Please edit that file -->

# UnsupLP2

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/ChrisKeefe/UnsupLP2.svg?branch=master)](https://travis-ci.com/ChrisKeefe/UnsupLP2)
<!-- badges: end -->

UnsupLP2 is a sample package written for CS599 - Unsupervised Learning,
which demonstrates my ability to:

  - build an R package
  - implement, run, and test functions in R related to Unsupervised
    Learning
  - set up Travis for CI checks on each commit
  - Adequately document a package to allow reasonable ease of use

## Installation

You can install a development version of this package from
[GitHub](https://github.com/ChrisKeefe/UnsupLP2) with:

``` r
# install.packages("devtools")
devtools::install_github("ChrisKeefe/UnsupLP2")
```

## Usage

Here are some basic examples of how to use the functions in this
package. For more complete usage information, please see the function
documentation.

``` r
library(UnsupLP2)
# Perform principle coordinates analysis on the iris data set
iris.fit <- PCA(iris[1:4])
head(iris.fit$x)
#>         PC1        PC2         PC3          PC4
#> 1 -2.684126 -0.3193972  0.02791483  0.002262437
#> 2 -2.714142  0.1770012  0.21046427  0.099026550
#> 3 -2.888991  0.1449494 -0.01790026  0.019968390
#> 4 -2.745343  0.3182990 -0.03155937 -0.075575817
#> 5 -2.728717 -0.3267545 -0.09007924 -0.061258593
#> 6 -2.280860 -0.7413304 -0.16867766 -0.024200858
```
