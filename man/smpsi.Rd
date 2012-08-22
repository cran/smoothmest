\name{smpsi}
\alias{psicauchy}
\alias{psidcauchy}
\alias{likcauchy}
\alias{flikcauchy}
\alias{smtfcauchy}
\alias{smcipsi}
\alias{smcipsid}
\alias{smcpsi}
\alias{smcpsid}
\alias{smbpsi}
\alias{smbpsid}
\alias{smbpsii}
\alias{smbpsidi}
\alias{smpsi}
\alias{smpmed}
\title{Auxiliary functions for smoothm}
\description{
  Psi-functions, derivatives and further auxiliary functions used for
  computing the estimators in \code{\link{smoothm}}.
}
\usage{
  psicauchy(x) 
  psidcauchy(x)
  likcauchy(x,mu)
  flikcauchy(y,x,mu,sn)
  smtfcauchy(x,mu,sn)
  smcipsi(y, x, sn=sqrt(2/length(x)))
  smcipsid(y, x, sn=sqrt(2/length(x)))
  smcpsi(x, sn=sqrt(2/length(x)))
  smcpsid(x, sn=sqrt(2/length(x)))
  smbpsi(y, x, k=4.685, sn=sqrt(2/length(x)))
  smbpsid(y, x, k=4.685, sn=sqrt(2/length(x)))
  smbpsii(x, k=4.685, sn=sqrt(2/length(x)))
  smbpsidi(x, k=4.685, sn=sqrt(2/length(x)))
  smpsi(x,k=0.862,sn=sqrt(2/length(x)))
  smpmed(x,sn=sqrt(1/5))
}

\arguments{
  \item{x}{numeric vector.}
  \item{mu}{numeric.}
  \item{y}{numeric vector.}
  \item{sn}{numeric. Smoothing constant. See \code{\link{smoothm}}.}
  \item{k}{numeric. Tuning constant. See \code{\link{smoothm}}.}
}
\details{
  \describe{
    \item{psicauchy}{psi-function for Cauchy ML-estimator at \code{x}.}
    \item{psidcauchy}{derivative of \code{psicauchy} at \code{x}.}
    \item{likcauchy}{Cauchy likelihood of data \code{x} for mode
      parameter \code{mu}.}
    \item{flikcauchy}{vector of Gaussian density at \code{y} with mean 0 and
      st. dev. \code{sn} times Cauchy log-likelihood of \code{x} with
      mode parameter \code{mu+y}.}
    \item{smtfcauchy}{integral of \code{flikcauchy} with \code{y}
      running from \code{-Inf} to \code{Inf}.}
    \item{smcipsi}{\code{psicauchy(x-y)*dnorm(y,sd=sn)}.}
    \item{smcipsid}{derivative of \code{smcipsi} w.r.t. \code{x}.}
    \item{smcpsi}{psi-function for smoothed Cauchy
      ML-estimator. Integral of \code{smpcipsi} with \code{y}
      running from \code{-Inf} to \code{Inf}.}
    \item{smcpsid}{integral of \code{smpcipsid} with \code{y}
      running from \code{-Inf} to \code{Inf}.}
    \item{smbpsi}{\code{(x-y)*psi.bisquare(x-y,c=k)*dnorm(y,sd=sn)}.}
    \item{smbpsid}{\code{psi.bisquare(x-y,c=k,deriv=1)*dnorm(y,sd=sn)}.}
    \item{smbpsii}{psi-function for smoothed bisquare
      M-estimator. Integral of \code{smbpsi} with \code{y}
      running from \code{-Inf} to \code{Inf}.}
    \item{smbpsidi}{integral of \code{smbpsid} with \code{y}
      running from \code{-Inf} to \code{Inf}.}
    \item{smpsi}{psi-function for smoothed Huber-estimator at \code{x}.}
    \item{smpmed}{psi-function for smoothed median at \code{x}.}
  }
}
\value{
  A numeric vector.
}
\references{
  Hampel, F., Hennig, C. and Ronchetti, E. (2011) A smoothing principle
  for the Huber and other location M-estimators. Computational
  Statistics and Data Analysis 55, 324-337.

  Huber, P. J. and Ronchetti, E. (2009) Robust Statistics (2nd
  ed.). Wiley, New York.
  
  Maronna, A.R., Martin, D.R., Yohai, V.J. (2006).
  Robust Statistics: Theory and Methods. Wiley, New York
}
\author{Christian Hennig
  \email{chrish@stats.ucl.ac.uk}
  \url{http://www.homepages.ucl.ac.uk/~ucakche/}
}
\seealso{ \code{\link{smoothm}}, \code{\link[MASS]{psi.huber}},
  \code{\link[MASS]{psi.bisquare}}
}
\examples{
psicauchy(1:5)
psidcauchy(1:5)
likcauchy(1:5,0)
flikcauchy(3,1:5,0,1)
smtfcauchy(1:5,0,1)
smcipsi(1,1:3)
smcipsid(1,1:3)
smcpsi(1:5)
smcpsid(1:5)
smbpsi(1,1:5)
smbpsid(0:4,1:5)
smbpsii(1:5)
smbpsidi(1:5)
smpsi(1:5)
smpmed(1:5)
}
\keyword{univar}
\keyword{robust}

