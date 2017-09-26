#' The Unified Democracy Scores
#'
#' The 2014, 2011, and 2010 releases of the Unified Democracy Scores by
#' Pemstein, Meserve, and Melton (2010).
#'
#' \describe{
#'
#' \item{uds_country}{The name of the country in the UDS release}
#'
#' \item{uds_cowcode}{The correlates of war numeric code, as in the original UDS
#' release. This is different from the actual COW code in a few cases; it looks
#' like they were using GW codes instead of COW codes. Use the \code{cown}
#' variable instead for merging with COW-indexed data.}
#'
#' \item{mean}{The posterior mean of the latent variable in the UD release.}
#'
#' \item{sd}{The posterior standard deviation of the latent variable in the UD
#' release.}
#'
#' \item{median}{The posterior median of the latent variable in the UD release.}
#'
#' \item{pct025}{Unified democracy score posterior 2.5 percentile.}
#'
#' \item{pct975}{Unified democracy score posterior 97.5 percentile.} }
#'
#' @template standard-variables
#'
#' @references Pemstein, Daniel, Stephen Meserve, and James Melton. 2010.
#'   Democratic Compromise: A Latent Variable Analysis of Ten Measures of Regime
#'   Type. Political Analysis 18 (4): 426-449.
#'
#'   Pemstein, Daniel, Stephen A. Meserve, and James Melton. 2013. "Replication
#'   data for: Democratic Compromise: A Latent Variable Analysis of Ten Measures
#'   of Regime Type." In: Harvard Dataverse.
#'   \url{http://hdl.handle.net/1902.1/PMM}
#'
#' @aliases uds
#' @family democracy
"uds_2014"

#' @rdname uds_2014
"uds_2011"

#' @rdname uds_2014
"uds_2010"
