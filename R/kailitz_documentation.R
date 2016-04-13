#' The Steffen Kailitz Dataset of Authoritarian Regime Types
#'
#' Contains the authoritarian regime types dataset from Kailitz,
#'   Steffen. 2013. Classifying political regimes revisited: legitimation and
#'   durability. Democratization 20 (1): 39-60. Original data available at
#'   \url{http://dx.doi.org/10.1080/13510347.2013.738861}.
#'
#' @section Variables:
#'
#'   \describe{
#'
#'   \item{year}{The calendar year. Only in the \code{kailitz.yearly} file. Note that more than one regime type may overlap over a single year.}
#'
#'   \item{kailitz_country}{The country name, as in the original dataset. Use
#'   \code{country_name} instead.}
#'
#'   \item{start}{The start year of the regime. More than one regime type may overlap over a period of time. For example Spain has three regime types - military, personalistic, and party - overlapping for the entire period 1946-1974. Only in the \code{kailitz} file.}
#'
#'   \item{end}{The end year of the regime. More than one regime type may overlap over a period of time. For example Spain has three regime types - military, personalistic, and party - overlapping for the entire period 1946-1974. Only in the \code{kailitz} file.}
#'
#'   \item{regime}{The regime type for the period within the start-end years. Can be: Communist Ideocracy, Electoral Autocracy, Liberal Democracy, Military Autocracy, Monarchy, One party Autocracy, Personalist Autocracy, State Failure or Occupation, Transition.}
#'
#'   \item{combined_regime}{Only in the \code{kailitz.yearly} file. The "combined regime" for the country year. This is just identical to \code{regime} if the country only has one regime for the year, but it is the concatenation of all regimes for that year if the country has more than one regime type. For example, Spain has a "combined regime" of "Military Autocracy-One party Autocracy-Personalist Autocracy" for the each of the years 1946-1974.}
#'
#'   \item{kailitz_binary}{Only in the \code{kailitz.yearly} file. Dichotomous democracy indicator. 1 if \code{combined_regime} is "Liberal democracy", 0 otherwise.}
#'
#'   \item{kailitz_tri}{Only in the \code{kailitz.yearly} file. Trichotomous democracy indicator. 2 if \code{combined_regime} is "Liberal Democracy", 1 if it is "Electoral Autocracy" or "Electoral Autocracy-Liberal Democracy", 0 otherwise.}
#'
#'   \item{personal}{Only in the \code{kailitz.yearly} file. Binary indicator of personalism. \code{TRUE} if \code{combined_regime} contains "Personal Autocracy", \code{FALSE} otherwise.}
#'
#'   \item{communist}{Only in the \code{kailitz.yearly} file. Binary indicator of communism. \code{TRUE} if \code{combined_regime} contains "Communist Ideocracy", \code{FALSE} otherwise.}
#'
#'   \item{military}{Only in the \code{kailitz.yearly} file. Binary indicator of military autocracy. \code{TRUE} if \code{combined_regime} contains "Military Autocracy", \code{FALSE} otherwise.}
#'
#'   \item{party}{Only in the \code{kailitz.yearly} file. Binary indicator of one party autocracy \code{TRUE} if \code{combined_regime} contains "One party Autocracy", \code{FALSE} otherwise.}
#'
#'   \item{monarchy}{Only in the \code{kailitz.yearly} file. Binary indicator of monarchy. \code{TRUE} if \code{combined_regime} contains "Monarchy", \code{FALSE} otherwise.}
#'
#'   \item{electoral}{Only in the \code{kailitz.yearly} file. Binary indicator of electoral autocracy. \code{TRUE} if \code{combined_regime} contains "Electoral autocracy", \code{FALSE} otherwise.}
#'
#'   \item{failure}{Only in the \code{kailitz.yearly} file. Binary indicator of state failure or occupation. \code{TRUE} if \code{combined_regime} contains "State Failure or Occupation", \code{FALSE} otherwise.}
#'
#'   \item{transition}{Only in the \code{kailitz.yearly} file. Binary indicator of transition. \code{TRUE} if \code{combined_regime} contains "Transition", \code{FALSE} otherwise.}
#'
#'   }
#' @template standard-variables
#' @source Kailitz, Steffen. 2013. Classifying political regimes revisited:
#'   legitimation and durability. Democratization 20 (1): 39-60. Original data
#'   available at \url{http://dx.doi.org/10.1080/13510347.2013.738861}.
#' @family democracy
#' @family authoritarianism
#' @family dichotomous democracy indexes
#' @family trichotomous democracy indexes
"kailitz"

#' @rdname kailitz
"kailitz.yearly"
