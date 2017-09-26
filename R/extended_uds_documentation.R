#' Extended UDS
#'
#' A dataset extending the Unified Democracy Scores of Pemstein, Meserve, and
#' Melton (2010) to the 19th century (and sometimes before), updating it with
#' 2013-2016 data, and calculating scores for countries not in the official UD
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
#'   democracy scores for 26,258 country-years (248 distinct countries and
#'   territories), including 18,345 country-years for independent, sovereign
#'   countries from 1816 to 2016.
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
#'   The latent variable score is calculated using the following variables in
#'   the [democracy] dataset: "pmm_arat", "blm", "bmr_democracy",
#'   "bnr_extended", "pmm_bollen", "doorenspleet",
#'   "wgi_democracy","fh_total_reversed", "fh_electoral",
#'   "gwf_democracy_extended", "pmm_hadenius", "kailitz_tri", "lexical_index",
#'   "mainwaring", "magaloni_democracy_extended", "pmm_munck", "pacl", "PEPS1v",
#'   "pitf", "polity2", "reign_democracy", "polyarchy_original_contestation",
#'   "prc", "svolik_democracy", "ulfelder_democracy_extended",
#'   "utip_dichotomous_strict", "v2x_polyarchy", "vanhanen_democratization",
#'   "wth_democ1". Please refer to the documentation of [democracy] for more
#'   details on these measures of democracy, and to Marquez 2016 for more
#'   details on the construction of the extended latent variable model used to
#'   generate the scores.
#'
#' @template standard-variables
#'
#' @template latent-variables
#'
#' @references
#'
#' Marquez, Xavier. 2016. A Quick Method for Extending the Unified Democracy
#' Scores (March 23, 2016). Available at SSRN:
#' \url{http://ssrn.com/abstract=2753830}
#'
#' Pemstein, Daniel, Stephen Meserve, and James Melton. 2010. Democratic
#' Compromise: A Latent Variable Analysis of Ten Measures of Regime Type.
#' Political Analysis 18 (4): 426-449. DOI:10.1093/pan/mpq020
#'
#' @family democracy
#' @author Xavier Marquez, Political Science and International Relations
#'   Programme, Victoria University of Wellington, marquez.x@gmail.com
"extended_uds"

