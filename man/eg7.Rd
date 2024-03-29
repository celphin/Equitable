% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Equitable_Transform.R
\name{eg7}
\alias{eg7}
\title{Example 7 of equitable system
f(x) Absolute value of linear function in column index
u(x) 0
g(x) step function in row index}
\usage{
eg7(rmult, cmult)
}
\arguments{
\item{rmult}{resolution of sampling of t variable  rmult*15 is the number of points sampled}

\item{cmult}{resolution of sampling of x variable  cmult*10 is the number of points sampled}
}
\value{
matrix of equitable data
}
\description{
Example 7 of equitable system
f(x) Absolute value of linear function in column index
u(x) 0
g(x) step function in row index
}
\examples{
d<-eg7(1,1)       # 15x10 data set
d<-eg7(1,10)      # 15x100 data set
d<-eg7(10,1)      # 150x10 data set
d<-eg7(15,15)    # 150x100 data set

}
