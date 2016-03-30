
#' A convenience function to prepare democracy data before replicating the UDS
#' model
#'
#' This function is designed to take the democracy data included in this package
#' and put it in a form suitable for use with the \code{\link{mirt}} package to
#' replicate the UDS model. It takes a data frame and tries to determine which
#' columns contain democracy scores (from the column names).
#'
#' If the column names contain the strings \code{arat}, \code{blm}, \code{bmr},
#' \code{bollen}, \code{doorenspleet}, \code{eiu}, \code{e_v2x}, \code{gwf},
#' \code{hadenius}, \code{kailitz}, \code{lied}, \code{munck}, \code{pacl},
#' \code{peps}, \code{poliarchy}, \code{polity}, \code{prc}, \code{svolik},
#' \code{ulfelder}, \code{v2x}, \code{vanhanen_pmm}, \code{vanhanen_democratization}, or
#' \code{wahman_teorell_hadenius}, the function performs the following
#' transformations:
#'
#' \code{arat}: Following Pemstein, Meserve, and Melton's replication code
#' (Pemstein, Meserve, and Melton 2013), the function cuts Arat (1991)'s 0-109
#' democracy score into 7 intervals with the following cutoffs: 50, 60, 70, 80,
#' 90, and 100. The resulting score is ordinal from 1 to 8.
#'
#' \code{bollen}: Following Pemstein, Meserve, and Melton's replication code
#' (Pemstein, Meserve, and Melton 2013), the function cuts Bollen's (2001)'s
#' 0-100 democracy score into 10 intervals with the following cutoffs:
#' 10,20,30,40,50,60,70,80, and 90. The resulting score is ordinal from 1 to 10.
#'
#' \code{eiu}: If the Economist Intelligence Unit's index of democracy is
#' included in the file, the function rounds the 0-1 value to the first decimal
#' place and cuts the result into 10 categories. The resulting score is ordinal
#' from 1 to 11.
#'
#' \code{hadenius}: Following Pemstein, Meserve, and Melton's replication code
#' (Pemstein, Meserve, and Melton 2013), the function cuts Hadenius (1992)'s
#' 0-10 democracy score into 8 intervals with the following cutoffs: 1, 2,3,4,
#' 7, 8, and 9. The resulting score is ordinal from 1 to 8.
#'
#' \code{munck}: Following Pemstein, Meserve, and Melton's replication code
#' (Pemstein, Meserve, and Melton 2013), the function cuts Munck's (2009)'s 0-1
#' democracy score into 4 intervals with the following cutoffs: 0.5,0.5,0.75,
#' and 0.99. The resulting score is ordinal from 1 to 4.
#'
#' \code{peps}: If any of the variants of the Participation-Enhanced Polity
#' Score (Moon et al 2006) is included in the file, the function rounds its
#' value (eliminates the decimal) and then transforms it into an ordinal measure
#' from 1 to 21.
#'
#' \code{polity}: Following Pemstein, Meserve, and Melton's replication code
#' (Pemstein, Meserve, and Melton 2013), the function takes the polity scores
#' and puts NA for any values below -10, and then transforms it into an ordinal
#' measure from 1 to 21.
#'
#' \code{v2x}: If any of the v2x_ continuous indexes of democracy from the V-Dem
#' dataset (Coppedge et al 2015) are included in the file, the function cuts
#' them into 20 categories. The resulting score is ordinal from 1 to 20.
#'
#' \code{vanhanen_democratization}: Following Pemstein, Meserve, and Melton's replication code
#' (Pemstein, Meserve, and Melton 2013), the function cuts Vanhanen's (2012)'s
#' index of democratization into 8 intervals with the following cutoffs:
#' 5,10,15,20,25,30, and 35. The resulting score is ordinal from 1 to 8.
#'
#' The function also recognizes the following column names (or partial column
#' names - it also recognizes, e.g., blm_pmm) as measures of democracy:
#' \code{blm} (from Bowman, Lehoucq, and Mahoney 2005), \code{bmr} (from Boix,
#' Miller, and Rosato 2012), \code{doorenspleet} (from Doorenspleet 2000),
#' \code{e_v2x} (the "ordinal" indexes from the V-dem project, Coppedge at al
#' 2015), \code{freedomhouse} (from Freedom House - freedom scale must be
#' reversed so that "more freedom" is higher), \code{gwf} (from Geddes, Wright,
#' and Frantz 2014 - the dichotomous democracy indicator only), \code{kailitz}
#' (from Kailitz 2013 - democracy/non-democracy indicator), \code{lied} (from
#' Skaaning, Gerring, and Bartusevicius 2015), \code{mainwaring} (from
#' Mainwaring and Perez Linan 2008), \code{magaloni} (from Magaloni, Min, Chu
#' 2013 - democracy/non-democracy indicator), \code{pacl} (from Cheibub, Gandhi,
#' and Vreeland 2010), \code{pitf} (from Goldstone et al 2010 or Taylor and
#' Ulfelder 2015), \code{poliarchy} (from Coppedge and Reinicke 1991),
#' \code{prc} (from Gasiorowski 1996 or Reich 2002), \code{przeworski} (from
#' Przeworski 2010), \code{svolik} (from Svolik 2012, democracy/dictatorship
#' indicator only), \code{ulfelder} (from Ulfelder 2012), \code{utip} (from Hsu
#' 2008), and \code{wahman_teorell_hadenius} (from Wahman, Teorell, and Hadenius
#' 2013). In each of these cases the function transforms the values of these
#' scores by running \code{as.numeric(unclass(factor(x)))}, which transforms
#' them into ordinal variables from 1 to the number of categories.
#'
#' For details of these scores, see the documentation for
#' \code{\link{democracy}}.
#'
#' @section Note: Warning! The function does not perform any sanity checks. It
#'   will try to transform anything that has the right name. You should always
#'   check the results make sense.
#'
#' @param data A dataset of democracy scores. For the function to do anything,
#'   the column names must contain at least one of the following strings:
#'   \code{arat}, \code{blm}, \code{bmr}, \code{bollen}, \code{doorenspleet},
#'   \code{eiu}, \code{e_v2x}, \code{gwf}, \code{hadenius}, \code{kailitz},
#'   \code{lied}, \code{munck}, \code{pacl}, \code{peps}, \code{poliarchy},
#'   \code{polity}, \code{prc}, \code{przeworski}, \code{svolik},
#'   \code{ulfelder}, \code{utip}, \code{v2x}, \code{vanhanen_democratization},
#'   or \code{wahman_teorell_hadenius}. For details of these variables, see the
#'   documentation for \code{\link{democracy}}.
#'
#' @return A data frame with the transformed scores, if any.
#' @export
#'
#' @examples
#' # Not run:
#' # data  <- prepare_data(QuickUDS::democracy)
#' @references
#'
#' Arat, Zehra F. 1991. Democracy and human rights in developing countries.
#' Boulder: Lynne Rienner Publishers.
#'
#' Boix, Carles, Michael Miller, and Sebastian Rosato. 2012. A Complete Data Set
#' of Political Regimes, 1800-2007. Comparative Political Studies 46 (12):
#' 1523-1554. Original data available at
#' \url{https://sites.google.com/site/mkmtwo/democracy-v2.0.dta?attredirects=0}
#'
#' Bollen, Kenneth A. 2001. "Cross-National Indicators of Liberal Democracy,
#' 1950-1990." 2nd ICPSR version. Chapel Hill, NC: University of North Carolina,
#' 1998. Ann Arbor, MI: Inter-university Consortium for Political and Social
#' Research, 2001. Original data available at
#' \url{http://webapp.icpsr.umich.edu/cocoon/ICPSR-STUDY/02532.xml}.
#'
#' Bowman, Kirk, Fabrice Lehoucq, and James Mahoney. 2005. Measuring Political
#' Democracy: Case Expertise, Data Adequacy, and Central America. Comparative
#' Political Studies 38 (8): 939-970.
#' \url{http://cps.sagepub.com/content/38/8/939}. Data available at
#' \url{http://www.blmdemocracy.gatech.edu/}.
#'
#' Cheibub, Jose Antonio, Jennifer Gandhi, and James Raymond Vreeland. 2010.
#' "Democracy and Dictatorship Revisited." Public Choice. 143(1):67-101.
#' Original data available at
#' \url{https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited}.
#'
#' Coppedge, Michael, John Gerring, Staffan I. Lindberg, Svend-Erik Skaaning,
#' and Jan Teorell, with David Altman, Michael Bernhard, M. Steven Fish, Adam
#' Glynn, Allen Hicken, Carl Henrik Knutsen, Kelly McMann, Pamela Paxton, Daniel
#' Pemstein, Jeffrey Staton, Brigitte Zimmerman, Frida Andersson, Valeriya
#' Mechkova, Farhad Miri. 2015. V-Dem Codebook v5. Varieties of Democracy
#' (V-Dem) Project. Original data available at \url{https://v-dem.net/en/data/}.
#'
#' Coppedge, Michael and Wolfgang H. Reinicke. 1991. Measuring Polyarchy. In On
#' Measuring Democracy: Its Consequences and Concomitants, ed. Alex Inkeles. New
#' Brunswuck, NJ: Transaction pp. 47-68.
#'
#' Doorenspleet, Renske. 2000. Reassessing the Three Waves of Democratization.
#' World Politics 52 (03): 384-406. DOI: 10.1017/S0043887100016580.
#' \url{http://dx.doi.org/10.1017/S0043887100016580}.
#'
#' Economist Intelligence Unit. 2012. Democracy Index 2012: Democracy at a
#' Standstill.
#'
#' Freedom House. 2015. "Freedom in the World." Original data available at
#' \url{http://www.freedomhouse.org}.
#'
#' Gasiorowski, Mark J. 1996. "An Overview of the Political Regime Change
#' Dataset." Comparative Political Studies 29(4):469-483.
#'
#' Geddes, Barbara, Joseph Wright, and Erica Frantz. 2014. Autocratic Breakdown
#' and Regime Transitions: A New Data Set. Perspectives on Politics 12 (1):
#' 313-331. Original data available at \url{http://dictators.la.psu.edu/}.
#'
#' Goldstone, Jack, Robert Bates, David Epstein, Ted Gurr, Michael Lustik, Monty
#' Marshall, Jay Ulfelder, and Mark Woodward. 2010. A Global Model for
#' Forecasting Political Instability. American Journal of Political Science 54
#' (1): 190-208. DOI:10.1111/j.1540-5907.2009.00426.x
#'
#' Hadenius, Axel. 1992. Democracy and Development. Cambridge: Cambridge
#' University Press.
#'
#' Hadenius, Axel & Jan Teorell. 2007. "Pathways from Authoritarianism", Journal
#' of Democracy 18(1): 143-156.
#'
#' Hsu, Sara "The Effect of Political Regimes on Inequality, 1963-2002," UTIP
#' Working Paper No. 53 (2008), http://utip.gov.utexas.edu/papers/utip_53.pdf.
#' Data available for download at http://utip.gov.utexas.edu/data/.
#'
#' Kailitz, Steffen. 2013. Classifying political regimes revisited: legitimation
#' and durability. Democratization 20 (1): 39-60. Original data available at
#' \url{http://dx.doi.org/10.1080/13510347.2013.738861}.
#'
#' Mainwaring, Scott, Daniel Brinks, and Anibal Perez Linan. 2008. "Political
#' Regimes in Latin America, 1900-2007." Original data available from
#' \url{http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf}.
#'
#' Magaloni, Beatriz, Jonathan Chu, and Eric Min. 2013. Autocracies of the
#' World, 1950-2012 (Version 1.0). Dataset, Stanford University. Original data
#' and codebook available at
#' \url{http://cddrl.fsi.stanford.edu/research/autocracies_of_the_world_dataset/}
#'
#' Marshall, Monty G., Ted Robert Gurr, and Keith Jaggers. 2012. "Polity IV:
#' Political Regime Characteristics and Transitions, 1800-2012." Updated to
#' 2015. Original data available from
#' \url{http://www.systemicpeace.org/polity/polity4.htm}.
#'
#' Moon, Bruce E., Jennifer Harvey Birdsall, Sylvia Ceisluk, Lauren M. Garlett,
#' Joshua J. Hermias, Elizabeth Mendenhall, Patrick D. Schmid, and Wai Hong Wong
#' (2006) "Voting Counts: Participation in the Measurement of Democracy" Studies
#' in Comparative International Development 42, 2 (Summer, 2006). The complete
#' dataset is available here:
#' \url{http://www.lehigh.edu/~bm05/democracy/Obtain_data.htm}.
#'
#' Munck, Gerardo L. 2009. Measuring Democracy: A Bridge Between Scholarship and
#' Politics. Baltimore: Johns Hopkins University Press.
#'
#' Pemstein, Daniel, Stephen Meserve, and James Melton. 2010. Democratic
#' Compromise: A Latent Variable Analysis of Ten Measures of Regime Type.
#' Political Analysis 18 (4): 426-449.
#'
#' Pemstein, Daniel, Stephen A. Meserve, and James Melton. 2013. "Replication
#' data for: Democratic Compromise: A Latent Variable Analysis of Ten Measures
#' of Regime Type." In: Harvard Dataverse.
#' \url{http://hdl.handle.net/1902.1/PMM}
#'
#' Przeworski, Adam et al. 2013. Political Institutions and Political Events
#' (PIPE) Data Set. Department of Politics, New York University.
#' \url{https://sites.google.com/a/nyu.edu/adam-przeworski/home/data}
#'
#' Reich, G. 2002. Categorizing Political Regimes: New Data for Old Problems.
#' Democratization 9 (4): 1-24.
#' \url{http://www.tandfonline.com/doi/pdf/10.1080/714000289}.
#'
#' Skaaning, Svend-Erik, John Gerring, and Henrikas Bartusevicius. 2015. A
#' Lexical Index of Electoral Democracy. Comparative Political Studies 48 (12):
#' 1491-1525. Original data available from
#' \url{http://thedata.harvard.edu/dvn/dv/skaaning}.
#'
#' Svolik, Milan. 2012. The Politics of Authoritarian Rule. Cambridge and New
#' York: Cambridge University Press. Original data available from
#' \url{http://campuspress.yale.edu/svolik/the-politics-of-authoritarian-rule/}.
#'
#' Taylor, Sean J. and Ulfelder, Jay, A Measurement Error Model of Dichotomous
#' Democracy Status (May 20, 2015). Available at SSRN:
#' \url{http://ssrn.com/abstract=2726962} or
#' \url{http://dx.doi.org/10.2139/ssrn.2726962}
#'
#' Ulfelder, Jay. 2012. "Democracy/Autocracy Data Set." In: Harvard Dataverse.
#' \url{http://hdl.handle.net/1902.1/18836}.
#'
#' Vanhanen, Tatu. 2012. "FSD1289 Measures of Democracy 1810-2012." Original
#' data available from
#' \url{http://www.fsd.uta.fi/english/data/catalogue/FSD1289/meF1289e.html}
#'
#' Wahman, Michael, Jan Teorell, and Axel Hadenius. 2013. Authoritarian regime
#' types revisited: updated data in comparative perspective. Contemporary
#' Politics 19 (1): 19-34.
prepare_data <- function(data) {
    arat <- function(x) {
        x <- cut(x, breaks = c(0, 50, 60, 70, 80, 90, 100, max(x, na.rm = TRUE)), labels = 1:7, include.lowest = TRUE, right = FALSE)
        as.numeric(unclass(factor(x)))
    }
    hadenius <- function(x) {
        x <- cut(x, breaks = c(0, 1, 2, 3, 4, 7, 8, 9, max(x, na.rm = TRUE)), labels = 1:8, include.lowest = TRUE, right = FALSE)
        x <- as.numeric(unclass(factor(x)))
    }
    bollen <- function(x) {
        x <- cut(x, breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, max(x, na.rm = TRUE)), labels = 1:10, include.lowest = TRUE, right = FALSE)
        x <- as.numeric(unclass(factor(x)))
    }
    vanhanen <- function(x) {
        x <- cut(x, breaks = c(0, 5, 10, 15, 20, 25, 30, 35, max(x, na.rm = TRUE)), labels = 1:8, include.lowest = TRUE, right = FALSE)
        x <- as.numeric(unclass(factor(x)))
    }
    munck <- function(x) {
        x <- cut(x, breaks = c(0, 0.5, 0.75, 0.99, max(x, na.rm = TRUE)), labels = 1:4, include.lowest = TRUE, right = FALSE)
        x <- as.numeric(unclass(factor(x)))
    }
    polity <- function(x) {
        x <- ifelse(x < -10, NA, x)
        other(x)
    }
    v2x <- function(x) {
        x <- cut(x, breaks = 20, include.lowest = TRUE, right = FALSE, ordered_result = TRUE)
        other(x)
    }
    eiu <- function(x) {
        x <- round(x, 1)
        x <- as.numeric(unclass(factor(x)))
    }
    peps <- function(x) {
      x <- round(x)
      x <- as.numeric(unclass(factor(x)))
    }
    other <- function(x) {
        as.numeric(unclass(factor(x)))
    }

    data[, grep("arat", names(data), ignore.case=TRUE)] <- (plyr::colwise(arat, .cols = grep("arat", names(data), ignore.case=TRUE)))(data)
    data[, grep("bollen", names(data), ignore.case=TRUE)] <- (plyr::colwise(bollen, .cols = grep("bollen", names(data), ignore.case=TRUE)))(data)
    data[, grep("eiu", names(data), ignore.case=TRUE)] <- (plyr::colwise(eiu, .cols = grep("eiu", names(data), ignore.case=TRUE)))(data)
    data[, grep("^hadenius", names(data), ignore.case=TRUE)] <- (plyr::colwise(hadenius, .cols = grep("^hadenius", names(data), ignore.case=TRUE)))(data)
    data[, grep("munck", names(data), ignore.case=TRUE)] <- (plyr::colwise(munck, .cols = grep("munck", names(data), ignore.case=TRUE)))(data)
    data[, grep("polity", names(data), ignore.case=TRUE)] <- (plyr::colwise(polity, .cols = grep("polity", names(data), ignore.case=TRUE)))(data)
    data[, grep("vanhanen_democratization|vanhanen_pmm", names(data), ignore.case=TRUE)] <- (plyr::colwise(vanhanen, .cols = grep("vanhanen_democratization|vanhanen_pmm", names(data), ignore.case=TRUE)))(data)
    data[, grep("^v2x", names(data), ignore.case=TRUE)] <- (plyr::colwise(v2x, .cols = grep("^v2x", names(data), ignore.case=TRUE)))(data)
    data[, grep("^PEPS", names(data), ignore.case=TRUE)] <- (plyr::colwise(peps, .cols = grep("^PEPS", names(data), ignore.case=TRUE)))(data)
    data[, grep("blm|bmr|doorenspleet|freedomhouse|gwf|lied|mainwaring|magaloni|pacl|pitf|polyarchy|prc|przeworski|svolik|ulfelder|utip|kailitz|e_v2x_polyarchy_5C|wahman_teorell_hadenius", names(data), ignore.case=TRUE)] <- (plyr::colwise(other, .cols = grep("blm|bmr|doorenspleet|freedomhouse|gwf|lied|mainwaring|magaloni|pacl|pitf|polyarchy|prc|przeworski|svolik|ulfelder|utip|kailitz|e_v2x_polyarchy_5C|wahman_teorell_hadenius",
        names(data), ignore.case=TRUE)))(data)

    data

}

#' Prepares the selected indexes in the \code{\link{democracy}} dataset
#'
#' @param indexes a set of measures of democracy in the \code{\link{democracy}}
#'   dataset. They must be names of the columns of the \code{\link{democracy}}
#'   dataset - otherwise the function throws an error.
#'
#' @return A dataset ready for use with \code{\link{democracy_model}}
#' @export
#'
#' @import dplyr
#'
#' @examples
#' prepare_democracy(names(democracy)[grep("pmm",names(democracy))])
prepare_democracy <- function(indexes) {
  data <- democracy[ ,c("country_name","GWn","cown","year","region","continent","microstate","lat","lon","in_system",indexes)]
  data <- reshape2::melt(data, measure.vars = indexes, na.rm = TRUE)
  data <- reshape2::dcast(data, ... ~ variable)
  data <- data %>% arrange(country_name,year)
  data <- prepare_data(data)
}


#' Calculates the probability that \code{country1} at \code{year[1]} is more
#' democratic than \code{country2} at \code{year[2]}
#'
#' @param data A UD dataset with a country_name, year, latent variable mean and
#'   latent variable standard deviation columns at least. Little sanity checking
#'   is performed - careful!
#' @param country1 The first country to compare.
#' @param country2 The second country to compare. Can be the same as
#'   \code{country1}
#' @param years Either a single year, or a length 2 vector of years.
#' @param mean_col The name of the column that contains the mean of the latent
#'   variable (defaults to \code{z1})
#' @param sd_col The name of the column that contains the standard error of the
#'   latent variable (defaults to \code{se.z1})
#' @param country_col The name of the column that contains the country name
#'   (defaults to \code{country_name})
#' @param year_col The name of the column that contains the years (defaults to
#'   \code{year})
#'
#' @return The probability that the first country-year in the comparison is more
#'   democratic than the second.
#' @export
#'
#' @examples
#' # Probability that the USA in 2000 was more democratic than Brazil in 2000,
#' # according to 2010 release of UDS
#' prob_more(uds_2010, "United States of America","Brazil",
#'           2000, mean_col="mean", sd_col="sd")
#' # Probability that Brazil in 1980 was more democratic than the USA in 1980,
#' # according to 2010 release of UDS
#' prob_more(uds_2010, "Brazil","United States of America",
#'           1980, mean_col="mean", sd_col="sd")
#' # Probability that the USA in 2000 was more democratic than the USA in 1950,
#' # according to 2010 release of UDS
#' prob_more(uds_2010, "United States of America","United States of America",
#'            years = c(2000,1950), mean_col="mean", sd_col="sd")
prob_more <- function(data, country1, country2, years, mean_col = "z1", sd_col = "se.z1", country_col = "country_name", year_col = "year") {
  if(length(years) == 1) {
    years <- c(years,years)
  }
  mu <- data[[mean_col]][ data[[country_col]] == country1 & data[[year_col]] == years[1]] - data[[mean_col]][data[[country_col]] == country2  & data[[year_col]] == years[2] ]
  sigma <- sqrt((data[[sd_col]][data[[country_col]] == country1   & data[[year_col]] == years[1]])^2 + (data[[sd_col]][data[[country_col]] == country2   & data[[year_col]] == years[2] ])^2)
  prob <- 1-pnorm(-mu/sigma)
  prob
}

#' A convenience function for extracting cutpoints from a UD model in a tidy
#' data frame format.
#'
#' This function takes a model of the democracy scores and extracts the
#' cutpoints and their standard errors. It does no sanity checking; it will work
#' equally well (or badly) for any \code{\link{mirt}} model.
#'
#' @param model A \code{\link{mirt}} \code{\link{SingleGroupClass-class}} model
#'   of the democracy scores.
#'
#' @return A data frame with cutpoints for each democracy index in terms of the
#'   latent variable. It will return both discrimination parameters (type
#'   "\code{a*}") and score cutpoints (type \code{d*}), plus confidence
#'   intervals if these have been calculated by the model. For the score
#'   cutpoints (type \code{d*}), the columns \code{estimate}, \code{pct975}, and
#'   \code{pct025} report the IRT parametrization (a normalized measure in the
#'   same scale as the latent variable); the \code{par}, \code{CI_2.5}, and
#'   \code{CI_97.5} columns report the slope intercept parameter and confidence
#'   intervals of the ```mirt``` model (used to calculate \code{estimate}).
#' @export
#'
#' @import dplyr
#' @import mirt
#'
#' @examples
#' # Not run:
#' # library(QuickUDS)
#' # data <- prepare_data(democracy)
#' # data <- melt(data, measure.vars = names(data)[grep("pmm",names(data))], na.rm = TRUE)
#' # data <- data %>% group_by(country_name,year) %>% mutate(num_measures = n())
#' # data <- dcast(data, ... ~ variable)
#' # data <- data %>% arrange(country_name,year)
#' # replication_2011_model <- mirt(data[ , names(data)[grep("pmm",names(data))],
#' #                                   model = 1, itemtype = "graded", SE = TRUE)
#' # cutpoints_2011 <- cutpoints(replication_2011_model)
cutpoints <- function(model) {
    coefs <- as.data.frame(coef(model, as.data.frame = TRUE))
    coefs <- coefs %>% mutate(variable = rownames(coefs),
                              type = stringr::str_extract(variable,"a1$|d[0-9]+$"),
                              variable = unlist(stringr::str_extract(variable,"[a-zA-Z_0-9]+")))
    coefs <- coefs %>% group_by(variable) %>% mutate_each(funs(irtconvert = -(.)/(.[1])), vars = 1:3)
    coefs <- coefs %>% rename(estimate = vars1, pct025 = vars3, pct975 = vars2)
    coefs %>% filter(!is.na(type))
}

#' A convenience function for extracting rater info from a UD model in a tidy
#' data frame format.
#'
#' @param model A \code{\link{mirt}} \code{\link{SingleGroupClass-class}} model
#'   of the democracy scores.
#'
#' @return A data frame with rater information for each democracy index over the
#'   range of the latent variable \code{theta}.
#' @export
#'
#' @import dplyr
#'
#' @examples
#' # Not run:
#' # library(QuickUDS)
#' # data <- prepare_data(democracy)
#' # data <- melt(data, measure.vars = names(data)[grep("pmm",names(data))], na.rm = TRUE)
#' # data <- data %>% group_by(country_name,year) %>% mutate(num_measures = n())
#' # data <- dcast(data, ... ~ variable)
#' # data <- data %>% arrange(country_name,year)
#' # replication_2011_model <- mirt(data[ , names(data)[grep("pmm",names(data))],
#' #                                model = 1, itemtype = "graded", SE = TRUE)
#' # raterinfo_2011 <- raterinfo(replication_2011_model)
#' # head(raterinfo)
raterinfo <- function(model) {
    raters <- dimnames(model@Data$data)[[2]]
    Theta <- model@Model$Theta
    rater.info <- data.frame()

    for (i in raters) {
        rater.info <- bind_rows(rater.info, data.frame(rater = i, theta = as.numeric(Theta), info = iteminfo(extract.item(model, i), Theta = Theta)))
    }
    rater.info
}

#' A convenience function for producing a UD model from democracy data.
#'
#' This function is a simple wrapper for \code{mirt(data[, columns], model = 1,
#' itemtype = "graded", SE = TRUE, ...)}. More fine-grained control can be
#' achieved by using \code{\link{mirt}} directly.
#'
#' @param data The prepared democracy data. Run \code{\link{prepare_data}} first
#'   on your democracy data. Note that \code{\link{mirt}} will throw an error if
#'   some country-years are not measured by any dataset; it is thus necessary to ensure
#'   that your data has at least one measurement of democracy for every
#'   country-year (though NAs are fine in many of the variables). See the
#'   examples for details.
#' @param columns The columns to use to estimate the model.
#' @param model The model type for \code{\link{mirt}}. The default, 1,
#'   calculates a one-factor model (a single latent variable).
#' @param itemtype The type of item to estimate. See \code{\link{mirt}} for
#'   details. The default fits a "graded" model like the one Pemstein, Meserve,
#'   and Melton use in their 2010 paper.
#' @param SE Boolean. Whether to calculate the standard errors of the model
#'   parameters. The default is \code{TRUE}.
#' @param ... Other parameters passed on to \code{\link{mirt}}
#'
#' @return a \code{\link{SingleGroupClass-class}} model of latent democracy
#'   scores suitable for use by \code{\link{democracy_scores}}.
#' @export
#'
#' @examples
#' # Not run:
#' # data <- prepare_data(democracy)
#' # data <- melt(data, measure.vars = names(data)[grep("pmm",names(data))], na.rm = TRUE)
#' # data <- data %>% group_by(country_name,year) %>% mutate(num_measures = n())
#' # data <- dcast(data, ... ~ variable)
#' # data <- data %>% arrange(country_name,year)
#' # replication_2011_model <- democracy_model(data, columns = names(data)[grep("pmm",names(data))])
democracy_model <- function(data, columns, model = 1, itemtype = "graded", SE = TRUE, ...) {
  model <- mirt::mirt(data[, columns], model = model, itemtype = itemtype, SE = SE, ...)
  model
}

#' A convenience function for producing UD scores from a UD model.
#'
#' This function is a simple wrapper for \code{fscores(model, full.scores =
#' TRUE, full.scores.SE = TRUE, ...)} that returns scores in a tidy data frame
#' instead of a matrix. More fine-grained control can be achieved by using
#' \code{\link{fscores}} directly.
#'
#' @param model a \code{\link{SingleGroupClass-class}} model produced by
#'   \code{\link{democracy_data}}.
#' @param ... Other parameters passed on to \code{\link{fscores}}.
#'
#' @return A data frame with latent variable democracy scores (posterior means)
#'   for all country-years in the data, with standard errors and 95% confidence
#'   intervals.
#' @export
#'
#' @import dplyr
#'
#' @examples
#' # Not run:
#' # Requires reshape2
#' # data <- prepare_data(democracy)
#' # data <- reshape2::melt(data, measure.vars = names(data)[grep("pmm",names(data))], na.rm = TRUE)
#' # data <- data %>% group_by(country_name,year) %>% mutate(num_measures = n())
#' # data <- reshape2::dcast(data, ... ~ variable)
#' # data <- data %>% arrange(country_name,year)
#' # replication_2011_model <- democracy_model(data, columns = names(data)[grep("pmm",names(data))])
#' # replication_2011_scores <- democracy_scores(replication_2011_model)
#' # Requires dplyr
#' # replication_2011 <- bind_cols(data %>% dplyr::select(country_name, GWn, year, region, continent,
#'                                in_system,num_measures),replication_2011)
democracy_scores <- function(model, ...) {
  stopifnot(class(model) == "SingleGroupClass")
  scores <- mirt::fscores(model, full.scores = TRUE, full.scores.SE = TRUE, ...)
  data <- as.data.frame(scores) %>% dplyr::rename(z1 = F1, se.z1 = SE_F1) %>% mutate(pct975 = z1 + 1.96 * se.z1, pct025 = z1 - 1.96 * se.z1)
  data
}

#' A convenience function to match extensions of the UD scores to the level of a
#' particular release of the UD scores
#'
#' @param data A dataset containing an extension of the UD scores. It must
#'   contain a \code{country_name} column, a \code{year} column, \code{z1}
#'   column, a \code{pct025} column, and a \code{pct975} column; the output of
#'   \code{\link{democracy_scores}} is appropriate here.
#' @param release The year of a Unified Democracy Scores official release (see
#'   the available releases in their data page at
#'   \url{http://www.unified-democracy-scores.org/uds.html} and
#'   \url{http://www.unified-democracy-scores.org/archive.html}). Default is
#'   2014.
#'
#' @return The dataset with three columns appended: \code{adj.z1} (the mean
#'   democracy score, adjusted to match the UD release), \code{adj.pct025} and
#'   \code{adj.pct975} (the adjusted confidence bounds).
#' @export
#'
#' @import dplyr
#'
#' @examples
#' # Not run:
#' # library(dplyr)
#' # data <- prepare_democracy(c("arat_pmm","blm","bmr_democracy","bollen_pmm",
#' #                              "doorenspleet","eiu","freedomhouse",
#' #                              "gwf","hadenius_pmm","kailitz","lied","mainwaring",
#' #                              "munck_pmm","pacl","polity2","polyarchy_pmm","prc",
#' #                              "svolik","ulfelder","v2x_polyarchy","vanhanen_full",
#' #                              "wahman_teorell_hadenius"))
#' # extended_model <- democracy_model(data,indexes, verbose=FALSE)
#' # extended_scores <- democracy_scores(extended_model)
#' # extended_scores <- bind_cols(data,extended_scores)
#' # extended_scores <- match_to_uds(extended_scores)
match_to_uds <- function(data, release = 2014) {
  if(release == 2014) {
    mean_ud_period <- mean(data$z1[ paste(data$country_name,data$year) %in% paste(uds_2014$country_name,uds_2014$year) ], na.rm=TRUE)
  } else if(release == 2011) {
    mean_ud_period <- mean(data$z1[ paste(data$country_name,data$year) %in% paste(uds_2011$country_name,uds_2011$year) ], na.rm=TRUE)
  } else if(release == 2010) {
    mean_ud_period <- mean(data$z1[ paste(data$country_name,data$year) %in% paste(uds_2010$country_name,uds_2010$year) ], na.rm=TRUE)
  } else {
    message("UDS release unknown. Using the 2014 UDS release for adjustment.")
    mean_ud_period <- mean(data$z1[ paste(data$country_name,data$year) %in% paste(uds_2014$country_name,uds_2014$year) ], na.rm=TRUE)
  }
  data <- data %>%
    mutate(adj.z1 = z1 - mean_ud_period, adj.pct025 = pct025 - mean_ud_period, adj.pct975 = pct975 - mean_ud_period)
  data
}

