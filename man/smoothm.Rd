\name{smoothm}
\alias{smoothm}
\alias{sehuber}
\alias{smhuber}
\alias{mbisquare}
\alias{smbisquare}
\alias{mlcauchy}
\alias{smcauchy}
\title{Smoothed and unsmoothed 1-d location M-estimators}
\description{
  \code{smoothm} is an interface for all the smoothed
  M-estimators introduced in Hampel, Hennig and Ronchetti (2011) for
  one-dimensional location, the Huber- and Bisquare-M-estimator and the
  ML-estimator of the Cauchy distribution, calling all the other
  functions documented on this page.    
}
\usage{
   smoothm(y, method="smhuber",
     k=0.862, sn=sqrt(2.046/length(y)),
     tol=1e-06,  s=mad(y), init="median")

   sehuber(y, k = 0.862, tol = 1e-06, s=mad(y), init="median")

   smhuber(y, k = 0.862, sn=sqrt(2.046/length(y)), tol = 1e-06, s=mad(y),
     smmed=FALSE, init="median")

   mbisquare(y, k=4.685, tol = 1e-06, s=mad(y), init="median")

   smbisquare(y, k=4.685, tol = 1e-06, sn=sqrt(1.0526/length(y)),
     s=mad(y), init="median")

   mlcauchy(y, tol = 1e-06, s=mad(y))

   smcauchy(y, tol = 1e-06, sn=sqrt(2/length(y)), s=mad(y))
}
\arguments{
  \item{y}{numeric vector. Data set.}
  \item{method}{one of \code{"huber"}, \code{"smhuber"},
    \code{"bisquare"}, \code{"smbisquare"}, \code{"cauchy"},
    \code{"smcauchy"}, \code{"smmed"}. See details.
  }
  \item{k}{numeric. Tuning constant. This is used for \code{method} one of
    \code{"huber", "smhuber", "bisquare", "smbisquare"}
    in \code{smoothm} and the corresponding functions.      
    Tuning constants are defined for the Huber- and Bisquare M-estimator
    as in Maronna et al. (2006). The default values refer to a Huber
    M-estimator which is optimal under 20\% contamination (0.862) and
    to a Bisquare M-estimator with 95\% efficiency under the Gaussian
    model (4.685).
  }
  \item{sn}{numeric. This is used for \code{method} one of
    \code{"smhuber", "smbisquare", "smcauchy", "smmed"}. This is the
    smoothing standard error \eqn{\sigma_n} in Hampel et al. (2011) depending
    on the sample size and the asymptotic variance of the base
    estimator. The default value of \code{smoothm} and \code{smhuber}
    is based on a Huber estimator with \code{k=0.862} under Huber's
    least favourable distribution for which it is ML. The default value of
    \code{smbisquare} is based on the Bisquare estimator with
    \code{k=4.685} under the Gaussian distribution. The default value of
    \code{smcauchy} is based on the Cauchy ML estimator under the Cauchy
    distribution. A value that can be used for the smoothed median is
    \code{sqrt(1.056/length(y))}, which is based on the median under the
    double exponential (Laplace) distribution with 1.4826 MAD=1. Note
    that the distributional "assumptions" for these choices are by no
    means critical; they should work well under many other distributions
    as well. 
  }
  \item{tol}{numeric. Stopping criterion for algorithms (absolute
    difference between two successive values).}
  \item{s}{numeric. Estimated or assumed scale/standard deviation.}
  \item{init}{\code{"median"} or \code{"mean"}. Initial estimator for
    iteration. Ignored if \code{method=="cauchy"} or \code{"smcauchy"}.}
  \item{smmed}{logical. If \code{FALSE}, the smoothed Huber estimator
    is computed, otherwise the smoothed median by \code{smhuber}.}
}
\details{
  The following estimators can be computed (some computational details
  are given in Hampel et al. 2011):
  \describe{
    \item{Huber estimator.}{\code{method="huber"} and function
      \code{sehuber} compute the standard Huber estimator (Huber and
      Ronchetti 2009). The only differences from \link[MASS]{huber} are
      that \code{s} and \code{init} can be specified and that the
      default \code{k} is different.}
    \item{Smoothed Huber estimator.}{\code{method="smhuber"} and function
      \code{smhuber} compute the smoothed Huber estimator (Hampel et
      al. 2011).}
    \item{Bisquare estimator.}{\code{method="bisquare"} and function
      \code{bisquare} compute the bisquare M-estimator (Maronna et
      al. 2006). This uses \code{\link[MASS]{psi.bisquare}}.}
    \item{Smoothed bisquare estimator.}{\code{method="smbisquare"} and function
      \code{smbisquare} compute the smoothed bisquare M-estimator (Hampel et
      al. 2011). This uses \code{\link[MASS]{psi.bisquare}}}
    \item{ML estimator for Cauchy distribution.}{\code{method="cauchy"}
      and function \code{mlcauchy} compute the ML-estimator for the Cauchy
      distribution.}
    \item{Smoothed ML estimator for Cauchy
      distribution.}{\code{method="smcauchy"} and function
      \code{smcauchy} compute the
      smoothed ML-estimator for the Cauchy distribution (Hampel et
      al. 2011).}
    \item{Smoothed median.}{\code{method="smmed"} and function
      \code{smhuber} with \code{median=TRUE} compute the
      smoothed median (Hampel et al. 2011).}
  }
}
\value{
  A list with components
  \item{mu}{the location estimator.}
  \item{method}{see above.}
  \item{k}{see above.}
  \item{sn}{see above.}
  \item{tol}{see above.}
  \item{s}{see above.}
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
\seealso{ \code{\link{pitman}}, \code{\link[MASS]{huber}},
  \code{\link[MASS]{rlm}}
}
\examples{
  library(MASS)
  set.seed(10001)
  y <- rdoublex(7)
  median(y)
  huber(y)$mu
  smoothm(y)$mu
  smoothm(y,method="huber")$mu
  smoothm(y,method="bisquare",k=4.685)$mu
  smoothm(y,method="smbisquare",k=4.685,sn=sqrt(1.0526/7))$mu
  smoothm(y,method="cauchy")$mu
  smoothm(y,method="smcauchy",sn=sqrt(2/7))$mu
  smoothm(y,method="smmed",sn=sqrt(1.0526/7))$mu
  smoothm(y,method="smmed",sn=sqrt(1.0526/7),init="mean")$mu
}
\keyword{univar}
\keyword{robust}

