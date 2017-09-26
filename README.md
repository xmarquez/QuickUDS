
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/xmarquez/QuickUDS.svg?branch=master)](https://travis-ci.org/xmarquez/QuickUDS)

QuickUDS
========

This `R` package contains convenience functions to extend the [Unified Democracy Scores of Pemstein, Meserve, and Melton](http://www.unified-democracy-scores.org/). These are basically wrappers for a couple of functions in the package [mirt](https://cran.r-project.org/web/packages/mirt/), which contains powerful facilities for factor analysis, and which you will probably want to use directly to do anything beyond replicating and extending the UD scores with the data provided by this package.

This package also includes an "[extended UDS](reference/extended_uds.html)" dataset with latent democracy scores going back to the 19th century (and before, in some cases) and a replication dataset with 74 different democracy measurements from 30 different projects to measure democracy. Both datasets are fully documented. The extended scores (and their generation) are described in more detail in Marquez, Xavier, "A Quick Method for Extending the Unified Democracy Scores" (March 23, 2016). Available at SSRN: <http://ssrn.com/abstract=2753830>. A more informal description of the extended UD scores is also found in [this blogpost](http://abandonedfootnotes.blogspot.co.nz/2016/03/artisanal-democracy-data-quick-and-easy.html).

Installation
------------

You can install QuickUDS from github with:

``` r
# install.packages("devtools")
devtools::install_github("xmarquez/QuickUDS/")
```

The main datasets in the package are `extended_uds` and `democracy`. Access their documentation in `R` by typing `?extended_uds` or `?democracy`.

Documentation for all functions and datasets in this package is always available [at this website](reference/index.html). Click the [reference](reference/index.html) link for more information.

For non-R users, there are csv versions of all datasets available [here](https://github.com/xmarquez/QuickUDS/tree/master/csvs-and-pdfs).

Usage
-----

See the [package vignettes](articles/index.html) for detailed examples of how to generate the Extended Unified Democracy Scores dataset or similar measures. The vignette [Generating the Extended Unified Democracy Scores](articles/Generating_the_extended_UDS.html) also plots the calculated scores for every country.

Citation
--------

If you find this package useful in your work, please cite:

Pemstein, Daniel, Stephen Meserve, and James Melton. 2010. Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime Type. Political Analysis 18 (4): 426-449.

As well as:

Marquez, Xavier, "A Quick Method for Extending the Unified Democracy Scores" (March 23, 2016). Available at SSRN: <http://ssrn.com/abstract=2753830>
