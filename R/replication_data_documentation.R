#' Replication data for Pemstein, Meserve, and Melton 2010
#'
#' Replication data for Pemstein, Meserve, and Melton (2010), released as
#' Pemstein, Meserve, and Melton 2013. For a discussion of the differences
#' between the original sources  for these variables and PMM's replication data,
#' see \code{vignette("Differences_between_PMM_and_original_data")}.
#'
#' \describe{
#'
#' \item{uds_country}{The name of the country in the UDS release}
#'
#' \item{year}{Calendar year. Min 1945, max 2008.}
#'
#' \item{uds_ccode}{The correlates of war numeric code, as in the original UDS
#' release. This may differ from the actual COW code in some cases. Use the
#' \code{cown} variable instead for merging with COW-indexed data.}
#'
#' \item{country_name}{Standardized country name.}
#'
#' \item{GWn}{Gleditsch and Ward's numeric country code, from the Gleditsch and
#' Ward list of independent states. For details, see Gleditsch, Kristian S. &
#' Michael D. Ward. 1999. "Interstate System Membership: A Revised List of the
#' Independent States since 1816." International Interactions 25: 393-413. The
#' list can be found at
#' \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.}
#'
#' \item{GWc}{Gleditsch and Ward's alphabetic country code, from the Gleditsch
#' and Ward list of independent states. For details, see Gleditsch, Kristian S.
#' & Michael D. Ward. 1999. "Interstate System Membership: A Revised List of the
#' Independent States since 1816." International Interactions 25: 393-413. The
#' list can be found at
#' \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.}
#'
#' \item{cown}{The Correlates of War numeric country code. This differs from
#' Gleditsch and Ward's numeric country code in a few cases, due to the
#' treatment of a couple of country terminations: Germany becomes 255 in
#' CoW after reunification, but stays as 260 in G & W; Serbia continues as 345
#' in CoW after the break up of Yugoslavia, whereas it becomes 340 in GWn;
#' Vietnam before 1948 is 816 in CoW, but 815 in G & W; and Yemen after
#' unification is 679 in CoW, but it remains 678 on G & W, which considers it a
#' continuation of the same state (absorbing South Yemen). Finally, Kiribati,
#' Tonga, Tuvalu, and Nauru have different codes in G & W for reasons I cannot
#' determine.  For a full discussion of these differences, see the vignette at
#' \code{vignette("Spatial_and_temporal_coverage")}.}
#'
#' \item{polity_ccode}{The numeric country code of the country in the Polity
#' dataset, which is based on, but not identical to, the CoW codes in a few
#' cases. For a full discussion of these differences, see the vignette at
#' \code{vignette("Spatial_and_temporal_coverage")}.}
#'
#' \item{year}{Year. See the section on spatial and temporal organization for
#' details on coding.}
#'
#' \item{region}{Region. Based on the UN region classifications. For historic
#' states, the region is the same as the region of the successor states (or
#' states that absorbed the territory, as for example in the case of the German
#' principalities). In one case, Austria-Hungary, the successor states straddle
#' two regions (Western Europe and Eastern Europe); I have opted to assign it
#' the region "Central Europe."}
#'
#' \item{continent}{Continent. Based on the UN continent classifications.}
#'
#' \item{GW_startdate}{The entry date of the state into the international system
#' (usually the date of independence, though there can be more than one),
#' according to Gleditsch and Ward, or 1 January 1816, whichever is later.}
#'
#' \item{GW_enddate}{The exit date of the state from the international system
#' (usually the date the state lost its independence, though there can be more
#' than one), according to Gleditsch and Ward, or \code{NA} for countries that
#' are still in the international system.}
#'
#' \item{microstate}{Whether the state is a microstate, according to Gleditsch.
#' His tentative list of microstates is available at
#' \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.}
#'
#' \item{lat}{The rough latitude of the state.}
#'
#' \item{lon}{The rough longitude of the state.}
#'
#' \item{in_system}{Whether the state is "in system" (that is, is independent
#' and sovereign), according to Gleditsch and Ward, for this particular date.}
#'
#' \item{in_cow}{Whether the state is in the COW system of states (that is, is
#' independent and sovereign), for this particular date. Experimental.}
#'
#' \item{arat}{Democracy score from Arat, Zehra F. 1991. Democracy and human
#' rights in developing countries. Boulder: Lynne Rienner Publishers. Min = 29,
#' max = 109, n = 3873.}
#'
#' \item{blm}{Trichotomous measure of regime type from Bowman, Kirk, Fabrice
#' Lehoucq, and James Mahoney. 2005. Measuring Political Democracy: Case
#' Expertise, Data Adequacy, and Central America. Comparative Political Studies
#' 38 (8): 939-970. \url{http://cps.sagepub.com/content/38/8/939}. Data
#' available at \url{http://www.blmdemocracy.gatech.edu/}. 0 = authoritarian,
#' 0.5 = semidemocratic, 1 = democratic.}
#'
#' \item{bollen}{0-100 index of democracy from Bollen, Kenneth A. 2001.
#' "Cross-National Indicators of Liberal Democracy, 1950-1990." 2nd ICPSR
#' version. Chapel Hill, NC: University of North Carolina, 1998. Ann Arbor, MI:
#' Inter-university Consortium for Political and Social Research, 2001. Original
#' data available at
#' \url{http://webapp.icpsr.umich.edu/cocoon/ICPSR-STUDY/02532.xml}.}
#'
#' \item{freedomhouse}{Average civil liberties + political rights score
#' (reversed so higher values are more democratic) from Freedom House. 2015.
#' "Freedom in the World." Original data available at
#' \url{http://www.freedomhouse.org}. Goes from 1 (least democratic) to 7 (most
#' democratic). In this version index stops at 2008. It also includes a value
#' for 1981, which the original Freedom House scores skip.}
#'
#' \item{hadenius}{0-10 index of democracy from Hadenius, Axel. 1992. Democracy
#' and Development. Cambridge: Cambridge University Press.}
#'
#' \item{mainwaring}{Trichotomous democracy indicator from Mainwaring, Scott,
#' Daniel Brinks, and Anibal Perez Linan. 2008. "Political Regimes in Latin
#' America, 1900-2007." Original data available from
#' \url{http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf}. -1 =
#' non-democracy, 0 = hybrid, 1 = democracy.}
#'
#' \item{pacl}{Dichotomous measure of democracy from Cheibub, Jose Antonio,
#' Jennifer Gandhi, and James Raymond Vreeland. 2010. "Democracy and
#' Dictatorship Revisited." Public Choice. 143(1):67-101. Original data
#' available at
#' \url{https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited}.
#' 1= democracy. The replication data for PMM is missing a couple of countries.}
#'
#' \item{polity}{Annual polity2 index, interpolating values for interruption,
#' interregnum, and transition periods. Higher values are more democratic. From
#' Marshall, Monty G., Ted Robert Gurr, and Keith Jaggers. 2012. "Polity IV:
#' Political Regime Characteristics and Transitions, 1800-2012." Updated to
#' 2015. Original data available from
#' \url{http://www.systemicpeace.org/polity/polity4.htm}.}
#'
#' \item{poliarchy}{0-10 index of democracy from Coppedge, Michael and Wolfgang
#' H. Reinicke. 1991. Measuring Polyarchy. In On Measuring Democracy: Its
#' Consequences and Concomitants, ed. Alex Inkeles. New Brunswuck, NJ:
#' Transaction pp. 47-68. Higher values are more democratic. }
#'
#' \item{prc}{1-4 index of democracy from Gasiorowski, Mark J. 1996. "An
#' Overview of the Political Regime Change Dataset." Comparative Political
#' Studies 29(4):469-483. Available in updated form in Reich, G. 2002.
#' Categorizing Political Regimes: New Data for Old Problems. Democratization 9
#' (4): 1-24. \url{http://www.tandfonline.com/doi/pdf/10.1080/714000289}. 1=
#' Authoritarian, 2 = transitional, 3 = semidemocratic, 4 = democratic. The
#' version in PMM's replication data is inconsistent regarding the treatment of
#' years with transitions - it does not always obey the "31 Dec" coding rule.}
#'
#' \item{vanhanen_full}{Index of democratization from Vanhanen, Tatu. 2012.
#' "FSD1289 Measures of Democracy 1810-2012." Original data available from
#' \url{http://www.fsd.uta.fi/english/data/catalogue/FSD1289/meF1289e.html}.
#' Higher values are more democratic.}
#'
#' }
#'
#' @references
#'
#' Arat, Zehra F. 1991. Democracy and human rights in developing countries.
#' Boulder: Lynne Rienner Publishers.
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
#' Coppedge, Michael and Wolfgang H. Reinicke. 1991. Measuring Polyarchy. In On
#' Measuring Democracy: Its Consequences and Concomitants, ed. Alex Inkeles. New
#' Brunswuck, NJ: Transaction pp. 47-68.
#'
#' Freedom House. 2015. "Freedom in the World." Original data available at
#' \url{http://www.freedomhouse.org}.
#'
#' Gasiorowski, Mark J. 1996. "An Overview of the Political Regime Change
#' Dataset." Comparative Political Studies 29(4):469-483.
#'
#' Hadenius, Axel. 1992. Democracy and Development. Cambridge: Cambridge
#' University Press.
#'
#' Mainwaring, Scott, Daniel Brinks, and Anibal Perez Linan. 2008. "Political
#' Regimes in Latin America, 1900-2007." Original data available from
#' \url{http://kellogg.nd.edu/scottmainwaring/Political_Regimes.pdf}.
#'
#' Marshall, Monty G., Ted Robert Gurr, and Keith Jaggers. 2012. "Polity IV:
#' Political Regime Characteristics and Transitions, 1800-2012." Updated to
#' 2015. Original data available from
#' \url{http://www.systemicpeace.org/polity/polity4.htm}.
#'
#' Munck, Gerardo L. 2009. Measuring Democracy: A Bridge Between
#' Scholarship and Politics. Baltimore: Johns Hopkins University Press.
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
#' Reich, G. 2002. Categorizing Political Regimes: New Data for Old
#' Problems. Democratization 9 (4): 1-24.
#' \url{http://www.tandfonline.com/doi/pdf/10.1080/714000289}.
#'
#' Vanhanen, Tatu. 2012. "FSD1289 Measures of Democracy 1810-2012." Original
#' data available from
#' \url{http://www.fsd.uta.fi/english/data/catalogue/FSD1289/meF1289e.html}
#' @family democracy
"original_pmm_democracy_data_1946_2008"
