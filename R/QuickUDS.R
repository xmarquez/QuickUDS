
#' Prepare democracy data before replicating the UDS model
#'
#' This function is designed to take the democracy data included in this package
#' and put it in a form suitable for use with the \code{\link{mirt}} package to
#' replicate the UDS model. It takes a data frame and tries to determine, from
#' the colum names, which variables contain democracy scores.
#'
#' If the column names contain the strings \code{arat}, \code{blm},
#' \code{bollen},\code{wgi}, \code{hadenius}, \code{munck}, \code{pacl},
#' \code{peps}, \code{polyarchy_inclusion_dimension},
#' \code{polyarchy_contestation_dimension}, \code{polity}, \code{prc},
#' \code{v2x}, \code{vanhanen_pmm}, or \code{vanhanen_democratization}, the
#' function performs the following transformations by default:
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
#' \code{wgi}: If the World Governance Indicator's index of voice and
#' acocuntability is included in the file, the function cuts it into 20
#' categories. The resulting score is ordinal from 1 to 20.
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
#' \code{polyarchy_inclusion_dimension},
#' \code{polyarchy_contestation_dimension}: If any of the polyarchy inclusion or
#' contestation dimensions from Coppedge, Alvarez and Maldonado (2008)  are
#' included, it cuts them into into 20 categories. The resulting score is
#' ordinal from 1 to 20.
#'
#' \code{v2x}: If any of the v2x_ continuous indexes of democracy from the V-Dem
#' dataset (Coppedge et al 2015) are included in the file, the function cuts
#' them into 20 categories. The resulting score is ordinal from 1 to 20.
#'
#' \code{vanhanen_democratization} or \code{vanhanen_pmm}: Following Pemstein,
#' Meserve, and Melton's replication code (Pemstein, Meserve, and Melton 2013),
#' the function cuts Vanhanen's (2012)'s index of democratization into 8
#' intervals with the following cutoffs: 5,10,15,20,25,30, and 35. The resulting
#' score is ordinal from 1 to 8.
#'
#' The function also recognizes the following column names (or partial column
#' names - it also recognizes, e.g., pmm_blm) as measures of democracy:
#' \code{blm} (from Bowman, Lehoucq, and Mahoney 2005), \code{bmr} (from Boix,
#' Miller, and Rosato 2012), \code{doorenspleet} (from Doorenspleet 2000),
#' \code{e_v2x} (the "ordinal" indexes from the V-dem project, Coppedge at al
#' 2015), \code{freedomhouse} or \code{fh} (from Freedom House - freedom scale
#' must be reversed so that "more freedom" is higher), \code{gwf} (from Geddes,
#' Wright, and Frantz 2014 - the dichotomous democracy indicator only),
#' \code{kailitz} (from Kailitz 2013 - democracy/non-democracy indicator),
#' \code{lied} or \code{lexical_index} (from Skaaning, Gerring, and
#' Bartusevicius 2015), \code{mainwaring} (from Mainwaring and Perez Linan
#' 2008), \code{magaloni} (from Magaloni, Min, Chu 2013 -
#' democracy/non-democracy indicator), \code{pacl} (from Cheibub, Gandhi, and
#' Vreeland 2010), \code{pitf} (from Goldstone et al 2010 or Taylor and Ulfelder
#' 2015), \code{polyarchy} (from Coppedge and Reinicke 1991), \code{prc} (from
#' Gasiorowski 1996 or Reich 2002), \code{PIPE} (from Przeworski 2010),
#' \code{reign} (from Bell 2016), \code{svolik} (from Svolik 2012,
#' democracy/dictatorship indicator only), \code{ulfelder} (from Ulfelder 2012),
#' \code{utip} (from Hsu 2008), and \code{wth} or \code{wahman_teorell_hadenius}
#' (from Wahman, Teorell, and Hadenius 2013). In each of these cases the
#' function transforms the values of these scores by running
#' \code{as.numeric(unclass(factor(x)))}, which transforms them into ordinal
#' variables from 1 to the number of categories.
#'
#' For details of these scores, see the documentation for
#' \code{\link{democracy}}.
#'
#' It is also possible to change these defaults.
#'
#' @section Note: Warning! The function does not perform any sanity checks. It
#'   will try to transform anything that has the right name. You should always
#'   check the results make sense.
#'
#' @param data A dataset of democracy scores. For the function to do anything,
#'   the column names must contain at least one of the following strings:
#'   \code{arat}, \code{blm}, \code{bmr}, \code{bollen}, \code{doorenspleet},
#'   \code{wgi}, \code{gwf}, \code{hadenius}, \code{kailitz}, \code{lied},
#'   \code{munck}, \code{pacl}, \code{peps}, \code{polyarchy}, \code{polity},
#'   \code{prc}, \code{PIPE}, \code{svolik}, \code{ulfelder}, \code{utip},
#'   \code{v2x}, \code{vanhanen_democratization}, \code{vanhanen_pmm}, or
#'   \code{wth}. For details of these variables, see the documentation for
#'   \code{\link{democracy}}.
#' @param .funs A names list of functions to modify the columns. It defaults to
#'   the following:
#'
#'   \code{funs(arat = cut(., breaks = c(0, 50, 60, 70, 80, 90, 100, 109),
#'   labels = 1:7, include.lowest = TRUE, right = FALSE),
#'
#'   hadenius = cut(., breaks =  c(0, 1, 2, 3, 4, 7, 8, 9, 10), labels = 1:8,
#'   include.lowest = TRUE, right = FALSE),
#'
#'   bollen = cut(., breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
#'   labels = 1:10, include.lowest = TRUE, right = FALSE),
#'
#'
#'   vanhanen = cut(., breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 50), labels =
#'   1:8, include.lowest = TRUE, right = FALSE),
#'
#'   munck = cut(., breaks = c(0, 0.5, 0.75, 0.99, 1), labels = 1:4,
#'   include.lowest = TRUE, right = FALSE),
#'
#'
#'   polyarchy_dimensions = cut(., breaks = 20, include.lowest = TRUE, right =
#'   FALSE, ordered_result = TRUE),
#'
#'   polity = ifelse(. < -10, NA, .), v2x = cut(., breaks = 20, include.lowest =
#'   TRUE, right = FALSE, ordered_result = TRUE),
#'
#'   wgi = cut(., breaks = 20, include.lowest = TRUE, right = FALSE,
#'   ordered_result = TRUE),
#'
#'   peps = round(.),
#'
#'   other = as.numeric(unclass(factor(.))))}
#'
#' @return A data frame with the transformed scores, if any.
#' @import dplyr
#' @export
#'
#' @examples
#' summary(democracy)
#' summary(prepare_data(democracy))
#' @references
#'
#' Arat, Zehra F. 1991. Democracy and human rights in developing countries.
#' Boulder: Lynne Rienner Publishers.
#'
#' Bell, Curtis. 2016. The Rulers, Elections, and Irregular Governance Dataset
#' (REIGN).\url{http://oefresearch.org/datasets/reign}
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
#' Coppedge, A. Alvarez and C. Maldonado. 2008. "Two Persistent Dimensions of
#' Democracy: Contestation and Inclusiveness". The Journal of Politics 70.03,
#' pp. 632-647. DOI: 10.1017/S0022381608080663.
#'
#' Doorenspleet, Renske. 2000. Reassessing the Three Waves of Democratization.
#' World Politics 52 (03): 384-406. DOI: 10.1017/S0043887100016580.
#' \url{http://dx.doi.org/10.1017/S0043887100016580}.
#'
#' Kaufmann, D. and A. Kraay. 2016. Worldwide Governance Indicators. 2016.
#' \url{http://www.govindicators.org}.
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
prepare_data <- function(data,
                         .funs) {

  other_vars <- c("blm", "bmr", "doorenspleet", "fh|freedomhouse", "gwf",
                  "lied|lexical_index", "mainwaring",
                  "magaloni", "pacl", "pitf", "polyarchy",
                  "prc", "PIPE|przeworski", "svolik",
                  "ulfelder", "utip", "kailitz", "e_v2x",
                  "wth|wahman_teorell", "reign")

  . <- NULL

  if(missing(.funs)) {
    .funs <- funs(
      arat = cut(., breaks = c(0, 50, 60, 70, 80, 90, 100, 109),
            labels = 1:7, include.lowest = TRUE, right = FALSE),
      hadenius = cut(., breaks =  c(0, 1, 2, 3, 4, 7, 8, 9, 10),
            labels = 1:8, include.lowest = TRUE, right = FALSE),
      bollen = cut(., breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
            labels = 1:10, include.lowest = TRUE, right = FALSE),
      vanhanen = cut(., breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 50),
            labels = 1:8, include.lowest = TRUE, right = FALSE),
      munck = cut(., breaks = c(0, 0.5, 0.75, 0.99, 1),
            labels = 1:4, include.lowest = TRUE, right = FALSE),
      polyarchy_dimensions = cut(., breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      polity = ifelse(. < -10, NA, .),
      v2x = cut(., breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      wgi = cut(., breaks = 20, include.lowest = TRUE,
                right = FALSE, ordered_result = TRUE),
      peps = round(.),
      other = as.numeric(unclass(factor(.))))
  }

  other_pattern <- paste(c(other_vars,
                           "arat",
                           "hadenius",
                           "bollen",
                           "vanhanen",
                           "munck",
                           "polity",
                           "v2x",
                           "wgi",
                           "peps"),collapse="|")

  data <- data %>%
    mutate_at(vars(matches("arat")), .funs[['arat']]) %>%
    mutate_at(vars(matches("hadenius")), .funs[['hadenius']]) %>%
    mutate_at(vars(matches("bollen")), .funs[['bollen']]) %>%
    mutate_at(vars(matches("pmm_vanhanen|vanhanen_democratization")),
              .funs[['vanhanen']]) %>%
    mutate_at(vars(matches("munck")), .funs[['munck']]) %>%
    mutate_at(vars(matches("polyarchy_(inclusion|contestation)_dimension")),
              .funs[['polyarchy_dimensions']]) %>%
    mutate_at(vars(matches("polity")), .funs[['polity']]) %>%
    mutate_at(vars(starts_with("v2x")), .funs[['v2x']]) %>%
    mutate_at(vars(matches("wgi")), .funs[['wgi']]) %>%
    mutate_at(vars(matches("peps")), .funs[['peps']]) %>%
    mutate_at(vars(matches(other_pattern)), .funs[['other']])

  data

}

#' Prepares selected indexes in the democracy dataset for use in a UD model
#'
#' @param ... a set of measures of democracy in the \code{\link{democracy}}
#'   dataset (either bare column names, or strings). Can be a [dplyr::select]
#'   expression (but [dplyr] must be loaded for this to work).
#' @param identifiers A set of identifiers to return with the data. Defaults to
#'   \code{c("extended_country_name", "year", "GWn", "cown", "in_GW_system")}.
#'   Must exist in the [democracy] dataset.
#'
#' @return A dataset ready for use with \code{\link{democracy_model}}
#' @export
#'
#' @import dplyr
#'
#' @examples
#' prepare_democracy(dplyr::matches("pmm"))
prepare_democracy <- function(...,
                              identifiers = c("extended_country_name", "year",
                                              "GWn", "cown", "in_GW_system")) {

  cols <- check_vars(..., identifiers = identifiers)

  . <- NULL

  df <- QuickUDS::democracy %>%
    select(cols$identifiers, cols$measures) %>%
    mutate("id" = 1:nrow(QuickUDS::democracy)) %>%
    prepare_data() %>%
    tidyr::gather("variable", "value", !!!cols$measures) %>%
    filter_at("value", any_vars(!is.na(.))) %>%
    tidyr::spread("variable", "value") %>%
    arrange_at("id") %>%
    select(-matches("^id$"))


  class(df) <- c("democracydata", class(df))

  df
}

check_vars <- function(..., identifiers) {
  vars <- quos(...)

  non_selectable <- c("extended_country_name", "year",
                      "GWn", "cown", "in_GW_system",
                      "uds_2010_mean","uds_2010_median",
                      "uds_2011_mean", "uds_2011_median",
                      "uds_2014_mean", "uds_2014_median")


  if(any(names(QuickUDS::democracy %>%
               select(!!!vars)) %in%
         non_selectable)) {
    non_selectable <- names(QuickUDS::democracy %>%
                              select(!!!vars))[ names(QuickUDS::democracy %>%
                                                        select(!!!vars)) %in%
                                                  non_selectable]
    warning(sprintf("Cannot select variables %s as model variables, only as identifiers.
                    Automatically adding them as identifiers and excluding them from model variables.",
                    paste(non_selectable, collapse = ", ")))

    identifiers <- unique(c(identifiers, non_selectable))
    measures <-  names(QuickUDS::democracy %>%
                         select(!!!vars))
    measures <- measures[ !measures %in% identifiers ]
  } else {
    measures <- names(QuickUDS::democracy %>%
                        select(!!!vars))
  }

  list(identifiers = identifiers,
       measures = measures)

}

#' Probability that a country-year is more democratic than another
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
#'   latent variable (defaults to \code{se_z1})
#' @param country_col The name of the column that contains the country name
#'   (defaults to \code{extended_country_name})
#' @param year_col The name of the column that contains the years (defaults to
#'   \code{year})
#'
#' @return The probability that the first country-year in the comparison is more
#'   democratic than the second.
#'
#' @export
#'
#' @importFrom stats pnorm
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
prob_more <- function(data, country1, country2, years, mean_col = "z1",
                      sd_col = "se_z1",
                      country_col = "extended_country_name",
                      year_col = "year") {

  if(length(years) == 1) {
    years <- c(years, years)
  }
  mu <- data[[mean_col]][ data[[country_col]] == country1 &
                            data[[year_col]] == years[1]] -
    data[[mean_col]][data[[country_col]] == country2  &
                       data[[year_col]] == years[2] ]

  sigma <- sqrt((data[[sd_col]][data[[country_col]] == country1
                                & data[[year_col]] == years[1]])^2 +
                  (data[[sd_col]][data[[country_col]] == country2 &
                                    data[[year_col]] == years[2] ])^2)

  prob <- 1-pnorm(-mu/sigma)
  prob
}

#' Extract cutpoints from a UD model in a tidy format.
#'
#' This function takes a model of the democracy scores and extracts the
#' discrimination parameters, score cutpoints, and standard errors for all the
#' variables involved, putting these into a tidy data frame.
#'
#' @param model A \code{\link{mirt}} \code{\link{SingleGroupClass-class}} model
#'   of the democracy scores.
#' @param type A string specifying the cutpoint type. Can be (an abbreviation
#'   of) "score" (for score cutpoints) or "discrimination" (for discrimination
#'   parameters). Default is "score."
#'
#' @return A [tibble] with either score cutpoints for each variable used to
#'   construct the latent scores in terms of the latent variable (the default), or
#'   discrimination parameters for each variable used to construct the index.
#'   For the score cutpoints (\code{type = 'score'}), the columns
#'   \code{estimate}, \code{pct975}, and \code{pct025} report the IRT
#'   parametrization of the model estimates, a normalized measure in the same
#'   scale as the latent variable.
#' @export
#'
#' @import dplyr
#' @import mirt
#'
#' @examples
#' \donttest{
#' # Replicate the official UDS 2011 release and calculate its cutpoints
#' replication_2011_model <- democracy_model(dplyr::matches("pmm"), verbose = FALSE)
#' cutpoints(replication_2011_model)}
cutpoints <- function(model, type = "score") {
  stopifnot(class(model) == "SingleGroupClass")

  type <- match.arg(type, c("score", "discrimination"))

  # A hack to get around the "no visible binding for global variable" note

  par <- CI_2.5 <- CI_97.5 <- variable <- se <- NULL

  estimate <- pct025 <- pct975 <- coef_type <- coef <- NULL

  coefs <- as.data.frame(coef(model, as.data.frame = TRUE))

  coefs <- coefs %>%
    mutate(variable = rownames(coefs),
           coef_type = stringr::str_extract(variable,"a[0-9]+$|d[0-9]+$"),
           variable = stringr::str_replace(variable,"\\.a[0-9]+$|\\.d[0-9]+$",""))

  coefs <- coefs %>%
    group_by(variable) %>%
    mutate(estimate = -(par)/(par[1]),
           pct025 = -(CI_2.5)/(CI_2.5[1]),
           pct975 = -(CI_97.5)/(CI_97.5[1]),
           se = abs(pct975 - estimate)/1.96) %>%
    filter(!is.na(coef_type))

  num_obs <- model@Data$data %>%
    as_tibble() %>%
    summarise_all(~sum(!is.na(.))) %>%
    tidyr::gather("variable", "num_obs")

  coefs <- coefs %>%
    left_join(num_obs,
              by = "variable")

  if(type == "score") {
    coefs <- coefs %>%
      filter(!grepl("^a",coef_type)) %>%
      select(variable,
             estimate,
             pct025,
             pct975,
             se,
             num_obs)
  } else {
    coefs <- coefs %>%
      filter(grepl("^a",coef_type)) %>%
      mutate(estimate = par,
             pct025 = CI_2.5,
             pct975 = CI_97.5) %>%
      select(variable,
             estimate,
             pct025,
             pct975,
             num_obs)
  }

  coefs %>% ungroup()


}

#' Extract rater info from a UD model in a tidy format.
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
#' \donttest{
#' replication_2011_model <- democracy_model(dplyr::matches("pmm"), verbose = FALSE)
#' raterinfo(replication_2011_model)}
raterinfo <- function(model) {
    raters <- dimnames(model@Data$data)[[2]]
    Theta <- model@Model$Theta
    rater.info <- data.frame()

    for (i in raters) {
        rater.info <- suppressWarnings(bind_rows(rater.info,
                                data.frame(rater = i,
                                           theta = as.numeric(Theta),
                                           info = iteminfo(extract.item(model, i),
                                                           Theta = Theta))))
    }
    rater.info %>%
      as_tibble()
}

#' Produce a UD model from democracy data
#'
#' This function is a simple wrapper for [mirt::mirt] that automates the process
#' of selecting the relevant columns in the [democracy] dataset, preparing the
#' data for use with [mirt::mirt], and packaging the result in a form useful for
#' [democracy_scores]. More fine-grained control can be achieved by using
#' \code{\link{mirt}} directly; see the Vignette on replicating and extending
#' the UD scores.
#'
#' @param ... [democracy] variables to use for the model. Can be bare column names
#'   or strings, or a [dplyr::select] expression.
#' @param identifiers Identifier columns. Can be any combination of columns in
#'   the [democracy] dataset. Defaults to \code{c("extended_country_name",
#'   "year", "GWn", "cown", "uds_2010_mean", "uds_2011_mean", "uds_2014_mean")}.
#' @param verbose Passed to [mirt::mirt]; whether to print a running commentary.
#'   Default is `TRUE`.
#' @param technical Passed to [mirt::mirt]. Defaults to \code{list(NCYCLES =
#'   2500)} to ensure that extende models converge.
#'
#' @return a \code{\link{SingleGroupClass-class}} model of latent democracy
#'   scores suitable for use by \code{\link{democracy_scores}}.
#' @import dplyr
#' @import mirt
#' @export
#'
#' @examples
#' \donttest{
#' replication_2011_model <- democracy_model(dplyr::matches("pmm"), verbose = FALSE)
#' replication_2011_model
#' summary(replication_2011_model)
#' }
democracy_model <- function(..., identifiers = c("extended_country_name",
                                            "year",
                                            "GWn",
                                            "cown",
                                            "uds_2010_mean",
                                            "uds_2011_mean",
                                            "uds_2014_mean",
                                            "in_GW_system"),
                            verbose = TRUE,
                            technical = list(NCYCLES = 2500)) {

  cols <- check_vars(...,
                     identifiers = identifiers)

  data <- prepare_democracy(cols$measures,
                            identifiers = cols$identifiers)


  model <- mirt::mirt(data %>% select(cols$measures),
                      model = 1,
                      itemtype = "graded",
                      SE = TRUE,
                      verbose = verbose,
                      technical = technical)

  model@Data$identifiers <- data %>%
    select(cols$identifiers)

  model

}

#' Extract UD scores from a UD model
#'
#' This function is a simple wrapper for \code{fscores(model, full.scores =
#' TRUE, full.scores.SE = TRUE, ...)} that returns scores in a tidy data frame
#' instead of a matrix. More fine-grained control can be achieved by using
#' \code{\link{fscores}} directly.
#'
#' @param ... [democracy] variables to use for the model. Can be bare column
#'   names or strings, or a [dplyr::select] expression.
#' @param model a \code{\link{SingleGroupClass-class}} model produced by
#'   \code{\link{democracy_model}}. If missing, calculates a model using the
#'   selected columns.
#' @param adjust_to_dichotomous Whether to calculate an adjusted score where the
#'   midpoint represents the average cutpoint for dichotomous scores. See the
#'   vignette for more details. Default is `TRUE`.
#' @param as_prob Whether to output scores as 0-1 probability scales. See the
#'   vignette for more details. Default is `TRUE`.
#'
#' @return A data frame with latent variable democracy scores (the equivalent of
#'   the UDS posterior means) for all country-years in the data, with standard
#'   errors and 95% confidence intervals. The following quantities are output by
#'   default:
#'
#' @template standard-variables
#' @section UDS measures for comparison purposes: \describe{
#'
#'   \item{uds_2010_mean, uds_2011_mean, uds_2014_mean}{The UDS means for the
#'   2010, 2011, and 2014 releases, for comparison purposes}.
#'
#'   }
#'
#' @template latent-variables
#' @export
#'
#' @import dplyr
#' @import mirt
#' @importFrom rlang .data
#' @importFrom stats pnorm
#'
#' @examples
#' \donttest{
#' # Replicate the official UDS scores (2011 release)
#' democracy_scores(dplyr::matches("pmm"), verbose = FALSE)}
democracy_scores <- function(..., model,
                             adjust_to_dichotomous = TRUE,
                             as_prob = TRUE) {

  identifiers <- c("extended_country_name",
                  "year",
                  "GWn",
                  "cown",
                  "uds_2010_mean",
                  "uds_2011_mean",
                  "uds_2014_mean")

  . <- NULL

  if(missing(model)) {
    model <- democracy_model(..., identifiers = identifiers)
  }

  stopifnot("SingleGroupClass" %in% class(model))

  scores <- mirt::fscores(model, full.scores = TRUE, full.scores.SE = TRUE) %>%
    as_tibble() %>%
    rename_at(c("F1", "SE_F1"), quos(c("z1", "se_z1"))) %>%
    mutate_at("z1",
              funs(z1_pct975 = . + 1.96 * .data$se_z1,
                   z1_pct025 = . - 1.96 * .data$se_z1))

  scores <- model@Data$identifiers %>%
    bind_cols(scores)

  if(adjust_to_dichotomous) {
    avg_dichotomous <- cutpoints(model) %>%
      group_by_at("variable") %>%
      filter(n() == 1) %>%
      pull("estimate") %>%
      mean()

    scores <- scores %>%
      mutate_at(vars(starts_with("z1")),
                funs(adj = . - avg_dichotomous))
  }

  if(as_prob) {
    scores <- scores %>%
      mutate_at(vars(starts_with("z1")),
                funs(as_prob = pnorm(.)))
  }

  scores %>% ungroup()
}


