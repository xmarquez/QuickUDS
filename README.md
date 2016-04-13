<!-- README.md is generated from README.Rmd. Please edit that file -->
This `R` package contains convenience functions to extend the [Unified Democracy Scores of Pemstein, Meserve, and Melton](http://www.unified-democracy-scores.org/). These are basically wrappers for a couple of functions in the package [mirt](https://cran.r-project.org/web/packages/mirt/mirt.pdf), which contains powerful facilities for factor analysis, and which you will probably want to use directly to do anything beyond replicating and extending the UD scores with the data provided by this package.

This package also includes an "[extended UDS](https://github.com/xmarquez/QuickUDS/blob/master/csvs-and-pdfs/extended_uds.csv?raw=true)" dataset with latent democracy scores going back to the 19th century and a replication dataset with 61 different democracy measurements from 29 different projects to measure democracy. Both datasets are fully documented. The extended scores (and their generation) are described in more detail in Marquez, Xavier, "A Quick Method for Extending the Unified Democracy Scores" (March 23, 2016). Available at SSRN: <http://ssrn.com/abstract=2753830>. A more informal description of the extended UD scores is also found in [this blogpost](http://abandonedfootnotes.blogspot.co.nz/2016/03/artisanal-democracy-data-quick-and-easy.html).

To install, use:

``` r
devtools::install_github(repo = "xmarquez/QuickUDS")
```

To view the documentation for the datasets, use:

``` r
?democracy
?extended_uds
```

For non-R users, there are csv versions of these datasets [here](https://github.com/xmarquez/QuickUDS/tree/master/csvs-and-pdfs). This folder also contains a pdf version of the documentation.

The `extended_uds` dataset can be generated with the following code:

``` r
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
#> Warning: package 'mirt' was built under R version 3.2.4
#> Loading required package: stats4
#> Loading required package: lattice

indexes <- c("arat_pmm","blm","bmr_democracy","bnr","bollen_pmm","doorenspleet","eiu","freedomhouse",
             "freedomhouse_electoral","gwf","hadenius_pmm","kailitz_tri","lied","mainwaring",
             "magaloni_regime_tri","munck_pmm","pacl","PEPS1v","pitf", "polity2",
             "polyarchy_contestation","prc_notrans","svolik","ulfelder","utip_dichotomous_strict",
             "v2x_polyarchy","vanhanen_democratization","wahman_teorell_hadenius")

# Generate Extended UDS
data <- QuickUDS::democracy[ ,c("country_name","GWn","cown","year","region",
                                "continent","microstate","lat","lon","in_system",indexes)]
data <- reshape2::melt(data, measure.vars = indexes, na.rm = TRUE)
data <- data %>% group_by(country_name,year) %>% mutate(measures_per_cy = n()) %>% ungroup()
data <- reshape2::dcast(data, ... ~ variable)
data <- data %>% arrange(country_name,year)

data2 <- prepare_democracy(indexes)

# The model converges after 1936 iterations, about 2.5 mins (156 secs) in my not-special desktop machine
extended_model <- democracy_model(data2,indexes, verbose=FALSE, technical = list(NCYCLES = 2500))
extended_scores <- democracy_scores(extended_model)
extended_uds <- bind_cols(data,extended_scores)

extended_model@time
#>    TOTAL     DATA ESTIMATE    Estep    Mstep       SE     POST 
#>   160.16     1.41   147.97    92.53    55.38    10.63     0.05
extended_model
#> 
#> Call:
#> mirt::mirt(data = data[, columns], model = model, itemtype = itemtype, 
#>     SE = SE, verbose = FALSE, technical = ..2)
#> 
#> Full-information item factor analysis with 1 factor(s).
#> Converged within 1e-04 tolerance after 1936 EM iterations.
#> mirt version: 1.16 
#> M-step optimizer: BFGS 
#> EM acceleration: Ramsay
#> Number of rectangular quadrature: 61
#> 
#> Information matrix estimated with method: crossprod
#> Condition number of information matrix = 11961.02
#> Second-order test: model is a possible local maximum
#> 
#> Log-likelihood = -201095
#> AIC = 402548; AICc = 402550.7
#> BIC = 403996.3; SABIC = 403427.4
summary(extended_model)
#>                             F1    h2
#> arat_pmm                 0.896 0.802
#> blm                      0.979 0.959
#> bmr_democracy            0.980 0.961
#> bnr                      0.966 0.934
#> bollen_pmm               0.921 0.849
#> doorenspleet             0.966 0.933
#> eiu                      0.889 0.791
#> freedomhouse             0.930 0.865
#> freedomhouse_electoral   0.986 0.972
#> gwf                      0.963 0.927
#> hadenius_pmm             0.950 0.902
#> kailitz_tri              0.936 0.875
#> lied                     0.915 0.838
#> mainwaring               0.970 0.942
#> magaloni_regime_tri      0.957 0.916
#> munck_pmm                0.940 0.883
#> pacl                     0.956 0.914
#> PEPS1v                   0.992 0.984
#> pitf                     0.976 0.952
#> polity2                  0.989 0.978
#> polyarchy_contestation   0.944 0.891
#> prc_notrans              0.953 0.907
#> svolik                   0.957 0.917
#> ulfelder                 0.969 0.940
#> utip_dichotomous_strict  0.951 0.905
#> v2x_polyarchy            0.935 0.875
#> vanhanen_democratization 0.934 0.872
#> wahman_teorell_hadenius  0.991 0.983
#> 
#> SS loadings:  25.466 
#> Proportion Var:  0.91 
#> 
#> Factor correlations: 
#> 
#>    F1
#> F1  1
```

(For the latest code used, always see <https://github.com/xmarquez/QuickUDS/blob/master/data-raw/Generate%20extended%20UDS%20data.R>)

To generate a 0-1 index from these scores where 0.5 represents the average latent variable cutpoint for dichotomous democracy measures, the following code can be used:

``` r
cutpoints_extended <- cutpoints(extended_model)

cutpoints_extended <- cutpoints_extended %>% filter(type != "a1")

cutpoints_extended <- left_join(cutpoints_extended,
                                democracy_long %>% select(variable,index_type) %>% distinct())
#> Joining by: "variable"

dichotomous_cutpoints <- cutpoints_extended %>% filter(index_type == "Dichotomous")

dichotomous_cutpoints <- mean(dichotomous_cutpoints$estimate)

extended_uds <- extended_uds %>% mutate(adj.z1 = z1 - dichotomous_cutpoints, 
                                        adj.pct025 = pct025 - dichotomous_cutpoints, 
                                        adj.pct975 = pct975 - dichotomous_cutpoints,
                                        index = pnorm(adj.z1),
                                        index.pct025 = pnorm(adj.pct025),
                                        index.pct975 = pnorm(adj.pct975))
```

For a more extended introduction to the available functions in the package, see the [package vignette](https://github.com/xmarquez/QuickUDS/tree/master/vignettes).

The extended UD scores are available for `24120` country-years (`224` unique countries and non-sovereign territories):

![](README-unnamed-chunk-6-1.png)

![](README-unnamed-chunk-7-1.png)

(Grey shaded areas represent 95% confidence intervals; blue shaded areas are periods where the country is either deemed to be a member of the system of states in the [Gleditsch and Ward list of statte system membership since 1816](http://privatewww.essex.ac.uk/~ksg/statelist.html), i.e., independent, or is a [microstate in Gleditsch's tentative list](http://privatewww.essex.ac.uk/~ksg/statelist.html)).

If you find this package useful in your work, please cite:

Pemstein, Daniel, Stephen Meserve, and James Melton. 2010. Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime Type. Political Analysis 18 (4): 426-449.

As well as:

Marquez, Xavier, "A Quick Method for Extending the Unified Democracy Scores" (March 23, 2016). Available at SSRN: <http://ssrn.com/abstract=2753830>
