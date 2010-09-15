\name{pitman}
\alias{pitman}
\title{Pitman location estimator}
\description{
  Pitman estimator of one-dimensional location, optimal with scale
  assumed to be known.
  Calculated by brute force (using \code{\link{integrate}}).
}
\usage{
  pitman(y, d=ddoublex, lower=-Inf, upper=Inf, s=mad(y), ...)
}
\arguments{
  \item{y}{numeric vector. Data set.}
  \item{d}{a density function defining the distribution for which the
    Pitman estimator is computed.}
  \item{lower}{numeric. Lower bound for the involved integrals (should
    be \code{-Inf} unless there are numerical problems).}
  \item{upper}{numeric. Lower bound for the involved integrals (should
    be \code{Inf} unless there are numerical problems).}
  \item{s}{numeric. Estimated or assumed scale/standard deviation.}
  \item{...}{further arguments to be passed on to the density function
    \code{d}.}
}

\value{
  The estimated value.
}
\references{
  Pitman, E.J. (1939) The estimation of the location and scale
  parameters of a continuous population of any given form. Biometrika
  30, 391-421.
}
\author{Christian Hennig
  \email{chrish@stats.ucl.ac.uk}
  \url{http://www.homepages.ucl.ac.uk/~ucakche/}
}
\seealso{ \code{\link{smoothm}}
}
\examples{
  set.seed(10001)
  y <- rdoublex(7)
  pitman(y,ddoublex)
  pitman(y,dcauchy)
  pitman(y,dnorm)
}
\keyword{univar}

