#' @section Latent variable scores:
#'
#' \describe{
#'
#'   \item{z1}{Raw latent variable score for the model, with mean
#'   (approximately) 0 and sd (approximately) 1.}
#'
#'   \item{se_z1}{Standard errors of raw score.}
#'
#'   \item{z1_pct975, z1_pct025}{95 percent onfidence intervals.}
#'
#'   \item{z1_adj}{Latent variable score for the model, adjusted to match the
#'   cutpoint for the dichotomous indexes included in the model.}
#'
#'   \item{z1_adj_pct975, z1_adj_pct025}{95 percent confidence intervals of the
#'   adjusted score.}
#'
#'   \item{z1_as_prob, z1_adj_as_prob}{Latent variable scores for the model,
#'   unadjusted and adjusted, converted to 0-1 probability index (0 = lowest
#'   probability of dmeocracy, 1 = highest probability).}
#'
#'   \item{z1_pct975_as_prob, z1_pct025_as_prob, z1_adj_pct975_as_prob,
#'   z1_adj_pct025_as_prob}{95 percent onfidence intervals of the probability
#'   score.}}
