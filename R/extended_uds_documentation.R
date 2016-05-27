#' Extended UDS
#'
#' A dataset extending the Unified Democracy Scores of Pemstein, Meserve, and
#' Melton (2010) to the 19th century (and sometimes before), updating it with
#' 2013-2015 data, and calculating scores for countries not in the official UD
#' release. Cite both Pemstein, Meserve, and Melton 2010 as well as Marquez
#' 2016.
#'
#' @section Overview:
#'
#'   This dataset contains an extension of the Unified Democracy Scores of
#'   Pemstein, Meserve, and Melton (2010). PMM 2010 use a latent variable
#'   approach to combine diverse measurements of democracy for a broad panel of
#'   countries from 1946 to 2012; this dataset extends the scores by using more
#'   democracy measures with broader temporal and spatial coverage, generating
#'   democracy scores for 24111 country-years (224 distinct countries and
#'   territories), including 18329 country-years for independent, sovereign
#'   countries from 1816 to 2015.
#'
#'   The measurement of democracy is complicated and controversial. The extended
#'   UDS makes few judgments about what measures of democracy should be used to
#'   generate latent democracy scores, as long as they have been used in
#'   scholarly work. It uses dichotomous, trichotomous, ordinal, and continuous
#'   indices; indices that focus primarily on the "competition" and indices that
#'   focus on the "participation" dimension of democracy; "thick" indices that
#'   attempt to measure a wide variety of characteristics plausibly attributed
#'   to democracy; and "minimalist" indexes that restrict themselves to the bare
#'   minimum of competition. Nevertheless, most of these indexes agree that
#'   democracy has something to do with competition and participation, even if
#'   they weight these dimensions somewhat differently, and even if they include
#'   other things, such as civil rights.
#'
#'   The latent variable score is calculated using four broad families of
#'   democracy measures, all of which are available in the
#'   \code{\link{democracy}} file (variable names in this section refer to
#'   columns in that file):
#'
#' @section Dichotomous indexes of democracy:
#'
#'   These are indexes designed to distinguish between democracy and
#'   non-democracy. Most of them follow a fairly minimalist conception of
#'   democracy, focused on political competition while giving little weight to
#'   the extent of the suffrage or thicker civil or economic rights. These
#'   include the Boix, Miller, and Rosato (2012) indicator of democracy
#'   (\code{bmr_democracy}); the Bernhard, Nordstrom and Reenock index of
#'   democracy (\code{bnr}), originally developed for event history analysis
#'   (Bernhard, Nordstrom, and Reenock 2001); Renske Doorenspleet's indicator of
#'   democracy (\code{doorenspleet}), based on the Polity III data and a measure
#'   of the extent of suffrage (Doorenspleet 2000); Freedom House's list of
#'   electoral democracies (\code{freedomhouse_electoral}); the Cheibub, Gandhi,
#'   and Vreeland (2013) extension of the PACL (Przeworski, Alvarez, Cheibub and
#'   Limongi) democracy/dictatorship dataset (\code{pacl}); Jay Ulfelder's
#'   indicator of democracy (\code{ulfelder}), based on a recoding of the Polity
#'   IV data (Ulfelder 2012); and a number of dichotomous
#'   democracy/non-democracy indicators (\code{gwf}, \code{svolik},
#'   \code{utip_dichotomous_strict}, and \code{wahman_teorell_hadenius}) from
#'   datasets concerned with the identification of authoritarian regime types
#'   (Geddes, Wright, and Frantz 2014; Svolik 2012, Wahman, Teorell, and
#'   Hadenius 2013). These are all highly but not perfectly correlated with one
#'   another, with correlation coefficients ranging from 0.41
#'   (\code{freedomhouse_electoral} and \code{bnr}) to 0.92 (\code{gwf} and
#'   \code{pacl})
#'
#'   Of these, only Doorenspleet's and Bernhard, Nordstrom, and Reenock's
#'   measures give special weight to the extent of suffrage in determining
#'   whether a country is democratic; not surprisingly, they display the lowest
#'   correlation with the other dichotomous indicators of democracy. All of
#'   these indexes have world-wide spatial scope, though they differ greatly in
#'   temporal coverage. \code{doorenspleet} and \code{bmr_democracy} have the
#'   widest temporal scope, going all the way back to the 19th century. Some of
#'   the countries in \code{gwf} are also coded far into the past.
#'
#' @section Trichotomous indexes of democracy:
#'
#'   Trichotomous indexes of democracy distinguish explicitly a "hybrid" or
#'   "semi-democratic" category. These include the measure of democracy in
#'   Central America developed by Bowman, Lehoucq, and Mahoney (\code{blm}, see
#'   Bowman, Lehoucq, and Mahoney 2005), the trichotomous measure of democracy
#'   in Latin America by Mainwaring, Brinks, and Perez Linan
#'   (\code{mainwaring}), the "Political Regime Change" dataset
#'   (\code{prc_notrans}, omitting the code for "transition" in the original
#'   dataset) described in Gasiorowski 1996 and extended in Reich 2002; and a
#'   couple of measures taken from datasets of autocratic regimes that
#'   explicitly distinguish between full democracies, electoral or multiparty
#'   autocracies, and other autocracies (\code{magaloni_regime_tri},
#'   \code{kailitz_tri}). Both \code{blm} and \code{mainwaring} are regional
#'   indexes developed by scholars with Latin-American expertise; the rest have
#'   world-wide scope. These correlate with each other at levels ranging from
#'   0.70 to 0.92.
#'
#' @section Ordinal indexes of democracy:
#'
#'   These indexes distinguish more than three "degrees" of democracy, but they
#'   are not explicitly continuous. They include Freedom House's 14 category
#'   freedom index (\code{freedomhouse}); the 7 category Lexical Index of
#'   Democracy (\code{lied}, from Skaaning, Gerring, Bartusevicius 2015); a 5
#'   category indicator of democracy used by the Political Instability Task
#'   Force based on the \code{parcomp} and \code{exrec} variables of the Polity
#'   dataset (\code{pitf}, described in Goldstone et al 2010); the Polity IV
#'   \code{polity2} variable; Coppedge and Reinicke's Poliarchy index
#'   (\code{polyarchy_contestation}, from Coppedge and Reinicke 1991). Of these,
#'   the Poliarchy measure is a specialist measure that only covers 357
#'   country-years, but the rest have worldwide scope, \code{polity} and
#'   \code{lied} go all the way back to the beginning of the 19th century.
#'
#'   Most of these indexes are meant to capture "thicker" conceptions of
#'   democracy. The Freedom House measure puts some emphasis on civil and
#'   political rights; Polity and PITF focus on differences in "authority
#'   patterns" (though they tend to downplay the scope of participation);
#'   Poliarchy tries to operationalize both the participation and contestation
#'   dimensions of Dahl's "Poliarchy" concept; and LIED tries to incorporate the
#'   degree of suffrage using measures originally collected for the PIPE dataset
#'   (Prezeworski et al 2010). They correlate with one another at levels ranging
#'   from 0.71 (\code{lied2} and \code{pitf}) to 0.94 (\code{polity2} and
#'   \code{pitf}).
#'
#' @section Continuous indexes of democracy:
#'
#'   These indexes conceptualize democracy as a continuous quantity, and usually
#'   in "thicker" ways. They include Arat's measure of democracy
#'   (\code{arat_pmm}, from Arat 1991); Bollen's index of democracy
#'   (\code{bollen_pmm}, from Bollen 2001); the Economist Intelligence Unit's
#'   Index of Democracy (\code{eiu}); Axel Hadenius' index of democracy, from
#'   Hadenius 1992 (\code{hadenius_pmm}); Munck's measure of democracy
#'   (\code{munck_pmm}); one variant of the Participation-Enhanced Polity Scores
#'   (\code{PEPS1v}, from Moon et al 2006); a continuous index of poliarchy from
#'   V-dem (\code{v2x_polyarchy}); and Vanahnen's index of democratization
#'   (\code{vanhanen_democratization}). Vanhanen and PEPS give special weight to
#'   participation in the measurement of democracy; the EIU index combines a
#'   very wide variety of indicators of democracy. Only Vanahanen, the V-dem
#'   measure, and PEPS have long temporal coverage; the EIU has broad spatial
#'   coverage but is only available for a short time series. Arat and Bollen go
#'   back only until the 1950s, though they do have reasonable spatial coverage.
#'
#'   Correlations vary from a low of -0.05 (Munck and the EIU, 126 country-year
#'   overlap, nonsignificant) to 0.91 for Bollen and Arat. The lowest
#'   correlations are typically with the EIU measure of democracy. These indexes
#'   are transformed into ordinal measures with at most 20 categories before
#'   using them to calculate the extended UDS, following the advice of PMM's
#'   original paper and the indications in their replication code. In
#'   particular, the following cutoffs are used before calculating the index:
#'
#'   Arat (1991)'s 0-109 democracy score is cut into 7 intervals with the
#'   following cutoffs: 50, 60, 70, 80, 90, and 100. The resulting score is
#'   ordinal from 1 to 8.
#'
#'   Bollen's (2001)'s 0-100 democracy score is cut into 10 intervals with the
#'   following cutoffs: 10,20,30,40,50,60,70,80, and 90. The resulting score is
#'   ordinal from 1 to 10.
#'
#'   The Economist Intelligence Unit's index of democracy 0-1 value is cut into
#'   10 categories by first rounding to the first decimal place. The resulting
#'   score is ordinal from 1 to 11.
#'
#'   Hadenius (1992)'s 0-10 democracy score is cut into 8 intervals with the
#'   following cutoffs: 1, 2,3,4, 7, 8, and 9. The resulting score is ordinal
#'   from 1 to 8.
#'
#'   Munck's (2009)'s 0-1 democracy score is cut into 4 intervals with the
#'   following cutoffs: 0.5,0.5,0.75, and 0.99. The resulting score is ordinal
#'   from 1 to 4.
#'
#'   PEPS is rounded to an integer, which transforms it into an ordinal measure
#'   from -10 to 10 (same categories as the Polity2 score).
#'
#'   The V-Dem polyarchy index (\code{v2x_polyarchy}) is cut into 20 intervals.
#'   The resulting score is ordinal from 1 to 20.
#'
#'   Vanhanen's (2012)'s 0-100 index of democratization is cut into 8 intervals
#'   with the following cutoffs: 5,10,15,20,25,30, and 35. The resulting score
#'   is ordinal from 1 to 8.
#'
#' @section Spatial and temporal organization:
#'
#'   The state system is complicated, and not always amenable to presentation in
#'   tabular form. Countries change name, split, get absorbed into larger units,
#'   and are not always obviously independent. This dataset basically follows
#'   the Gleditsch and Ward list of independent states (Gleditsch and Ward 1999,
#'   updated by Gleditsch to 2013), supplemented by Gleditsch's tentative list
#'   of microstates (available at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}), and a very small
#'   number of judgment calls of my own. The Gleditsch and Ward list is very
#'   similar, but not identical, to the Correlates of War list of independent
#'   states that is commonly used in Political Science and International
#'   Relations research; in particular, the treatment of Germany, Yemen,
#'   Vietnam, Ethiopia, Yugoslavia, Serbia, Montenegro, and a few other
#'   countries and their successor states differs between them. See
#'   \code{vignette("Spatial_and_temporal_coverage")} for details of these
#'   differences.
#'
#'   I have included three different codes for each country-year: the Gleditsch
#'   and Ward country code (\code{GWn}), the COW code (\code{cown}), and the
#'   Polity IV code (\code{polity_ccode}), as well as an indicator of whether
#'   the country year is considered to be "in the international system" by
#'   Gleditsch and Ward and whether it is considered to be a microstate
#'   (\code{in_system} and \code{microstate}; note that microstates are
#'   considered to be "in system" in this dataset). Since the Gleditsch and Ward
#'   "international system" begins with the Congress of Vienna in 1816,
#'   country-years before 1816 are by definition not "in system," even though
#'   this does not mean that these states were not independent then. Care should
#'   thus be taken with the "in system" indicator for years before 1816.
#'
#'   It is worth noting that while most measures of democracy are produced only
#'   for sovereign countries, a number of measures have also been produced,
#'   either explicitly (the V-dem project) or not (sometimes researchers do not
#'   agree on whether a country-year represents a "sovereign" state), for
#'   non-sovereign territories. In fact in this dataset about 5091 country-years
#'   in or after 1816 are not "in system" (most of them from the V-dem indexes
#'   of democracy); these are easily excluded by filtering the dataset using the
#'   boolean \code{in_system} indicator (or a logical expression that filters
#'   data points that are not in system after 1816 but includes those before
#'   1816).
#'
#'   All countries are measured as of 31 December of the given year, as is the
#'   conventional rule. Some datasets do not use this rule (e.g., Freedom House,
#'   Geddes, Wright, and Frantz 2014), and others sometimes contain more than
#'   one data point per year (e.g., the Political Regime Change dataset); I have
#'   tried my best to transform their coding so that all datapoints conform to
#'   convention, but some errors may remain.
#'
#' @section A note on sources:
#'
#'   Wherever possible, I have used the original sources for these measures of
#'   democracy and put them in the right panel format myself. There are three
#'   exceptions.
#'
#'   First, in a few cases I have relied on the replication data for Pemstein,
#'   Meserve, and Melton (2010), which contains data I have not been able to
#'   find elsewhere. These variables are marked \code{_pmm} in the
#'   \code{\link{democracy}} file.
#'
#'   Second, I have constructed the \code{pitf*} variable following the
#'   instructions in the source, but have not found the data ready-made. This is
#'   probably unproblematic in the case of \code{pitf} -- the instructions are
#'   very clear, but it is also worth noting that the Polity data is
#'   occasionally revised, so that the \code{pitf} variable described and used
#'   in Goldstone et al 2010 is probably different from the \code{pitf} variable
#'   here for a small number of country-years.
#'
#'   Third, I have calculated some indexes (e.g., \code{magaloni_tri},
#'   \code{utip_dichotmous_strict}) myself from the original datasets.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{country_name}{Standardized country name.}
#'
#'   \item{GWn}{Gleditsch and Ward's numeric country code, from the Gleditsch
#'   and Ward list of independent states. For details, see Gleditsch, Kristian
#'   S. & Michael D. Ward. 1999. "Interstate System Membership: A Revised List
#'   of the Independent States since 1816." International Interactions 25:
#'   393-413. The list can be found at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.}
#'
#'   \item{GWc}{Gleditsch and Ward's alphabetic country code, from the Gleditsch
#'   and Ward list of independent states. For details, see Gleditsch, Kristian
#'   S. & Michael D. Ward. 1999. "Interstate System Membership: A Revised List
#'   of the Independent States since 1816." International Interactions 25:
#'   393-413. The list can be found at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.}
#'
#'   \item{cown}{The Correlates of War numeric country code. This differs from
#'   Gleditsch and Ward's numeric country code in a few cases, due to the
#'   treatment of a couple of country terminations: West Germany becomes 255 in
#'   CoW after reunification, but stays as 260 in G & W; Serbia continues as 345
#'   in CoW after the break up of Yugoslavia, whereas it becomes 340 in GWn;
#'   Vietnam before 1948 is 816 in CoW, but 815 in G & W; and Yemen after
#'   unification is 679 in CoW, but it remains 678 on G & W, which considers it
#'   a continuation of the same state (absorbing South Yemen). Finally,
#'   Kiribati, Tonga, Tuvalu, and Nauru have different codes in G & W for
#'   reasons I cannot determine.  For a full discussion of these differences,
#'   see the vignette at \code{vignette("Spatial_and_temporal_coverage")}.}
#'
#'   \item{polity_ccode}{The numeric country code of the country in the Polity
#'   dataset, which is based on, but not identical to, the CoW codes in a few
#'   cases. For a full discussion of these differences, see the vignette at
#'   \code{vignette("Spatial_and_temporal_coverage")}.}
#'
#'   \item{year}{Year. See the section on spatial and temporal organization for
#'   details on coding.}
#'
#'   \item{region}{Region. Based on the UN region classifications. For historic
#'   states, the region is the same as the region of the successor states (or
#'   states that absorbed the territory, as for example in the case of the
#'   German principalities). In one case, Austria-Hungary, the successor states
#'   straddle two regions (Western Europe and Eastern Europe); I have opted to
#'   assign it the region "Central Europe."}
#'
#'   \item{continent}{Continent. Based on the UN continent classifications.}
#'
#'   \item{GW_startdate}{The entry date of the state into the international
#'   system (usually the date of independence, though there can be more than
#'   one), according to Gleditsch and Ward, or 1 January 1816, whichever is
#'   later.}
#'
#'   \item{GW_enddate}{The exit date of the state from the international system
#'   (usually the date the state lost its independence, though there can be more
#'   than one), according to Gleditsch and Ward, or \code{NA} for countries that
#'   are still in the international system.}
#'
#'   \item{microstate}{Whether the state is a microstate, according to
#'   Gleditsch. His tentative list of microstates is available at
#'   \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.}
#'
#'   \item{lat}{The rough latitude of the state.}
#'
#'   \item{lon}{The rough longitude of the state.}
#'
#'   \item{in_system}{Whether the state is "in system" (that is, is independent
#'   and sovereign), according to Gleditsch and Ward, for this particular date.}
#'
#'   \item{in_cow}{Whether the state is in the COW system of states (that is, is
#'   independent and sovereign), for this particular date. Experimental.}
#'
#'   \item{z1}{The mean of the latent unfied democracy variable (the factor
#'   scores computed by the model).}
#'
#'   \item{se.z1}{The standard error of the latent variable. This is typically
#'   higher for years in the distant past or with few measurements.}
#'
#'   \item{pct975}{The top of the 95 percent confidence interval around z1.
#'   Calculated as z1 + 1.96*se.z1.}
#'
#'   \item{pct025}{The bottom of the 95 percent confidence interval. Calculated
#'   as z1 - 1.96*se.z1.}
#'
#'   \item{adj.z1}{The mean of the latent unfied democracy variable (the factor
#'   scores computed by the model), adjusted to match the average cutpoints for
#'   the dichotomous measures of democracy used to generate it (essentially, z1
#'   - 0.64). See the vignette
#'   \code{vignette("Replicating_and_extending_the_UD_scores")} for details.}
#'
#'   \item{adj.pct975}{The top of the 95 percent confidence interval around z1,
#'   adjusted to match the average cutpoints for the dichotomous measures of
#'   democracy used to generate it (essentially, pct975 - 0.64).}
#'
#'   \item{adj.pct025}{The bottom of the 95 percent confidence interval,
#'   adjusted to match the average cutpoints for the dichotomous measures of
#'   democracy used to generate it (essentially, pct025 - 0.64).}
#'
#'   \item{index}{A transformation of adj.z1 to a 0-1 scale, using the normal
#'   cumulative distribution function. See Marquez 2016 for more details. This
#'   form of the index has a natural interpretation as the probability that a
#'   country-year is a democracy. It could also be used in ordinal from, with
#'   values from 0 to 0.2 understood to be "closed autocracies," 0.2-0.4
#'   "autocratic", 0.4-0.6 "hybrid", 0.6-0.8 "minimally democratic", and 0.8-1
#'   "fully democratic".}
#'
#'   \item{index.pct025}{A transformation of adj.z1.pct025 to a 0-1 scale, using
#'   the normal cumulative distribution function.}
#'
#'   \item{index.pct975}{A transformation of adj.z1.pct975 to a 0-1 scale, using
#'   the normal cumulative distribution function.}
#'   }
#'
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
#'
#' Coppedge, Michael, John Gerring, Staffan I. Lindberg, Svend-Erik Skaaning,
#' and Jan Teorell, with David Altman, Michael Bernhard, M. Steven Fish, Adam
#' Glynn, Allen Hicken, Carl Henrik Knutsen, Kelly McMann, Pamela Paxton, Daniel
#' Pemstein, Jeffrey Staton, Brigitte Zimmerman, Frida Andersson, Valeriya
#' Mechkova, Farhad Miri. 2016. V-Dem Codebook v6.1. Varieties of Democracy
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
#' Gleditsch, Kristian S. & Michael D. Ward. 1999. "Interstate System
#' Membership: A Revised List of the Independent States since 1816."
#' International Interactions 25: 393-413. The list can be found at
#' \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}
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
#' Working Paper No. 53 (2008),
#' \url{http://utip.gov.utexas.edu/papers/utip_53.pdf}. Data available for
#' download at \url{http://utip.gov.utexas.edu/data/}.
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
#' Marquez, Xavier. 2016. A Quick Method for Extending the Unified Democracy
#' Scores (March 23, 2016). Available at SSRN: http://ssrn.com/abstract=2753830
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
#' @family democracy
#' @author Xavier Marquez, Political Science and International Relations
#'   Programme, Victoria University of Wellington, marquez.x@gmail.com
"extended_uds"

