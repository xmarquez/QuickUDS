<!-- README.md is generated from README.Rmd. Please edit that file -->
This `R` package contains convenience functions to extend the [Unified Democracy Scores of Pemstein, Meserve, and Melton](http://www.unified-democracy-scores.org/). These are basically wrappers for a couple of functions in the package [mirt](https://cran.r-project.org/web/packages/mirt/mirt.pdf), which contains powerful facilities for factor analysis, and which you will probably want to use directly to do anything beyond replicating and extending the UD scores with the data provided by this package.

This package also includes an "extended UDS" dataset with latent democracy scores going back to the 19th century and a replication dataset with 61 different democracy measurements from 29 different projects to measure democracy. Both datasets are fully documented. The extended scores (and their generation) are described in more detail in Marquez, Xavier, "A Quick Method for Extending the Unified Democracy Scores" (March 23, 2016). Available at SSRN: <http://ssrn.com/abstract=2753830>.

To install, use:

``` r
devtools::install_github(repo = "xmarquez/QuickUDS")
```

To view the documentation for the datasets, use:

``` r
?democracy
?extended_uds
```

For non-R users, there are csv versions of these datasets in the folder <https://github.com/xmarquez/QuickUDS/tree/master/csvs-and-pdfs>. This folder also contains a pdf version of the documentation.

The `extended_uds` dataset can be generated with the following code:

``` r
# Generate Extended UDS
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(QuickUDS)
#> Loading required package: mirt
#> Loading required package: stats4
#> Loading required package: lattice

indexes <- c("arat_pmm","blm","bmr_democracy","bnr","bollen_pmm","doorenspleet","eiu","freedomhouse",
             "freedomhouse_electoral","gwf","hadenius_pmm","kailitz_tri","lied","mainwaring","magaloni_regime_tri",
             "munck_pmm","pacl","PEPS1v","pitf",
             "polity2","polyarchy_contestation","prc_notrans","svolik","ulfelder","utip_dichotomous_strict",
             "v2x_polyarchy","vanhanen_democratization","wahman_teorell_hadenius")

data <- QuickUDS::democracy[ ,c("country_name","GWn","cown","year","region","continent","microstate","lat","lon","in_system",indexes)]
data <- reshape2::melt(data, measure.vars = indexes, na.rm = TRUE)
data <- data %>% group_by(country_name,year) %>% mutate(measures_per_cy = n()) %>% ungroup()
data <- reshape2::dcast(data, ... ~ variable)
data <- data %>% arrange(country_name,year)

data2 <- prepare_democracy(indexes)

# The model converges after 2027 iterations
extended_model <- democracy_model(data2,indexes, verbose=FALSE, technical = list(NCYCLES = 2500)) 
extended_scores <- democracy_scores(extended_model)
extended_uds <- bind_cols(data,extended_scores)
rm(data2,data,indexes,extended_scores)
```

(For the latest code used, always see <https://github.com/xmarquez/QuickUDS/blob/master/data-raw/Generate%20extended%20UDS%20data.R>)

To generate a 0-1 index from these scores where 0.5 represents the average latent variable cutpoint for dichotomous democracy measures, the following code can be used:

``` r
cutpoints_extended <- cutpoints(extended_model)

cutpoints_extended <- cutpoints_extended %>% filter(type != "a1")

cutpoints_extended <- left_join(cutpoints_extended,democracy_long %>% select(variable,index_type)  %>% distinct())
#> Joining by: "variable"
#> Warning in left_join_impl(x, y, by$x, by$y): joining factor and character
#> vector, coercing into character vector

dichotomous_cutpoints <- cutpoints_extended %>% filter(index_type == "Dichotomous")

dichotomous_cutpoints <- mean(dichotomous_cutpoints$estimate)

extended_uds <- extended_uds %>% mutate(adj.z1 = z1 - dichotomous_cutpoints, 
                                        adj.pct025 = pct025 - dichotomous_cutpoints, 
                                        adj.pct975 = pct975 - dichotomous_cutpoints,
                                        index = pnorm(adj.z1),
                                        index.pct025 = pnorm(adj.pct025),
                                        index.pct975 = pnorm(adj.pct975))
```

For a more extended introduction to the available functions, see the package vignette.

The existing UDS scores are available for `24111` country-years (`224` unique countries and non-sovereign territories):

![](README-unnamed-chunk-6-1.png)<!-- -->

![](README-unnamed-chunk-7-1.png)<!-- -->

(Grey shaded areas represent 95% confidence intervals; blue shaded areas are periods where the country is either deemed to be a member of the system of states in the [Gleditsch and Ward list of statte system membership since 1816](http://privatewww.essex.ac.uk/~ksg/statelist.html), i.e., independent, or is a [microstate in Gleditsch's tentative list](http://privatewww.essex.ac.uk/~ksg/statelist.html)).

If you find this package useful in your work, please cite:

Pemstein, Daniel, Stephen Meserve, and James Melton. 2010. Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime Type. Political Analysis 18 (4): 426-449.

As well as:

Marquez, Xavier, "A Quick Method for Extending the Unified Democracy Scores" (March 23, 2016). Available at SSRN: <http://ssrn.com/abstract=2753830>
