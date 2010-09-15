\name{pdens}
\alias{pdens}
\alias{dens}
\alias{sdens}
\title{Auxiliary functions for pitman}
\description{
  Auxiliary functions for \code{\link{pitman}}.
}
\usage{
  pdens(z, x, dfunction, ...)
  sdens(z, x, dfunction, ...)
  dens(x, dfunction, ...)
}
\arguments{
  \item{z}{numeric vector.}
  \item{x}{numeric vector.}
  \item{dfunction}{a density function defining the distribution for which the
    Pitman estimator is computed.}
  \item{...}{further arguments to be passed on to the density function
    \code{dfunction}.}
}
\details{
  \describe{
    \item{dens}{product of density values at \code{x}.}
    \item{pdens}{vector of \code{z*dens(x-z)}.}
    \item{sdens}{vector of \code{dens(x-z)}.}
  }
}

\value{
  Numeric value (\code{dens}) or vector.
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
\seealso{ \code{\link{pitman}}
}
\examples{
  dens(1:5,dcauchy)
  pdens(1:5,0,dcauchy)
  sdens(1:5,0:2,dcauchy)
} 
\keyword{univar}

