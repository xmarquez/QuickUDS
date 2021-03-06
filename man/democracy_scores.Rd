% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/QuickUDS.R
\name{democracy_scores}
\alias{democracy_scores}
\title{Extract UD scores from a UD model}
\usage{
democracy_scores(..., model, adjust_to_dichotomous = TRUE, as_prob = TRUE)
}
\arguments{
\item{...}{\link{democracy} variables to use for the model. Can be bare column
names or strings, or a \link[dplyr:select]{dplyr::select} expression.}

\item{model}{a \code{\link{SingleGroupClass-class}} model produced by
\code{\link{democracy_model}}. If missing, calculates a model using the
selected columns.}

\item{adjust_to_dichotomous}{Whether to calculate an adjusted score where the
midpoint represents the average cutpoint for dichotomous scores. See the
vignette for more details. Default is \code{TRUE}.}

\item{as_prob}{Whether to output scores as 0-1 probability scales. See the
vignette for more details. Default is \code{TRUE}.}
}
\value{
A data frame with latent variable democracy scores (the equivalent of
the UDS posterior means) for all country-years in the data, with standard
errors and 95% confidence intervals. The following quantities are output by
default:
}
\description{
This function is a simple wrapper for \code{fscores(model, full.scores =
TRUE, full.scores.SE = TRUE, ...)} that returns scores in a tidy data frame
instead of a matrix. More fine-grained control can be achieved by using
\code{\link{fscores}} directly.
}
\section{Standard descriptive variables (generated by this package)}{

 \describe{

 \item{extended_country_name}{The name of the country in the Gleditsch-Ward
 system of states, or the official name of the entity (for non-sovereign
 entities and states not in the Gleditsch and Ward system of states) or else
 a common name for disputed cases that do not have an official name (e.g.,
 Western Sahara, Hyderabad). The Gleditsch and Ward scheme sometimes
 indicates the common name of the country and (in parentheses) the name of an
 earlier incarnation of the state: thus, they have Germany (Prussia), Russia
 (Soviet Union), Madagascar (Malagasy), etc. For details, see Gleditsch,
 Kristian S. & Michael D. Ward. 1999. "Interstate System Membership: A
 Revised List of the Independent States since 1816." International
 Interactions 25: 393-413. The list can be found at
 \url{http://privatewww.essex.ac.uk/~ksg/statelist.html}.}

 \item{GWn}{Gleditsch and Ward's numeric country code, from the Gleditsch and
 Ward list of independent states.}

 \item{cown}{The Correlates of War numeric country code, 2016 version. This
 differs from Gleditsch and Ward's numeric country code in a few cases. See
 \url{http://www.correlatesofwar.org/data-sets/state-system-membership} for
 the full list.}

 \item{polity_ccode}{The Polity IV country code, 2017 version. This
 differs from Gleditsch and Ward's numeric country code and COW in a few cases. See
 \url{http://www.systemicpeace.org/inscrdata.html} for
 the full list.}

 \item{in_GW_system}{Whether the state is "in system" (that is, is
 independent and sovereign), according to Gleditsch and Ward, for this
 particular date. Matches at the end of the year; so, for example South
 Vietnam 1975 is \code{FALSE} because, according to Gleditsch and Ward, the
 country ended on April 1975 (being absorbed by North Vietnam). It is also
 \code{TRUE} for dates beyond 2012 for countries that did not end by then,
 depsite the fact that the Gleditsch and Ward list has not been updated
 since.}

 \item{year}{The calendar year. Democracy measurements conventionally reflect
 the situation in the country as of the last day of the year.} }
}

\section{UDS measures for comparison purposes}{
 \describe{

\item{uds_2010_mean, uds_2011_mean, uds_2014_mean}{The UDS means for the
2010, 2011, and 2014 releases, for comparison purposes}.

}
}

\section{Latent variable scores}{


\describe{

  \item{z1}{Raw latent variable score for the model, with mean
  (approximately) 0 and sd (approximately) 1.}

  \item{se_z1}{Standard errors of raw score.}

  \item{z1_pct975, z1_pct025}{95 percent onfidence intervals.}

  \item{z1_adj}{Latent variable score for the model, adjusted to match the
  cutpoint for the dichotomous indexes included in the model.}

  \item{z1_adj_pct975, z1_adj_pct025}{95 percent confidence intervals of the
  adjusted score.}

  \item{z1_as_prob, z1_adj_as_prob}{Latent variable scores for the model,
  unadjusted and adjusted, converted to 0-1 probability index (0 = lowest
  probability of dmeocracy, 1 = highest probability).}

  \item{z1_pct975_as_prob, z1_pct025_as_prob, z1_adj_pct975_as_prob,
  z1_adj_pct025_as_prob}{95 percent onfidence intervals of the probability
  score.}}
}

\examples{
\donttest{
# Replicate the official UDS scores (2011 release)
democracy_scores(dplyr::matches("pmm"), verbose = FALSE)}
}
