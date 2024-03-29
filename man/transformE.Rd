% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Equitable_Transform.R
\name{transformE}
\alias{transformE}
\title{Equitable transform}
\usage{
transformE(
  d,
  Ave = TRUE,
  cAve = FALSE,
  Zero = FALSE,
  zero = NULL,
  diagonal = TRUE,
  imageplot = FALSE,
  old = NULL
)
}
\arguments{
\item{d}{2D data to be transformed}

\item{Ave}{Include a new column with Row averages \code{"TRUE"}(Default) or \code{"FALSE"}}

\item{cAve}{Include a new row with Column averages \code{"TRUE"} or \code{"FALSE"}(Default)}

\item{Zero}{if TRUE subtract a zero from data set. Default FALSE}

\item{zero}{Value to be subtracted off of all data when transforming Default=0}

\item{diagonal}{Include diagonals of matrices when transforming \code{"TRUE"}(Default) or \code{"FALSE"}}

\item{imageplot}{TRUE plots image of data Default FALSE}

\item{old}{Default NULL (could use old transform slopes to mask new slope transform)}
}
\value{
Output from the TransformE function

Running Td<-transformE(d) gives Td that contains several variables  (see summary(Td))

(access variables via Td$variable_name ).

Td$smat is original data set         :view using imagenan(Td$smat)

Equitable Transform: Td$ET.x  matrix of transformed data      :view using imagenan(Td$ET.x)

least squared Transform: Td$l.s.x                              :view using imagenan(Td$l.s.x)

Equitable Transform based only on average column: Td$Ave.ET.x (assumes Ave=TRUE)

l.s. prefix indicates LEAST SQUARES result

s=slope, b=intercept                       sse =std error of slope       bse=std error of intercept

r2=coef. of determination                  N: # of points in fit         pslope: prob. for no correlation

node== indication if fit is due to a node  p_par:sequences approximately  parallel

zero: subtracted value

Examples of LEAST SQUARES variables:

l.s.s      l.s.sse

l.s.b      l.s.bse   l.s.r2    l.s.N      l.s.pslope l.s.node l.s.p_par l.s.zero

# e.g. view using  imagenan(Td$l.s.s)

l.s.x= Least squared transform       std. dev. errors at each point: l.s.xsd

l.s.Es l.s.Eb   l.s.Ep    : masked matrices of best values included slope=Es  intercept=Eb prob= Ep

E prefix indicates EQUITABLE result

Equitable slopes: E.s                 intercepts: E.b

errors: E.rtestxsd,                     E.rtestbsd

#view using  imagenan(Td$E.s)

with convergence information (E.rtestxm,E.rtestbm) Values of r^2 after convergence functions

E.numrun: # runs to get convergence

first iteration slopes/intercepts: (E.s1,E.b1) with std. dev. errors  (E.sd1, E.bsd1)

E.s        E.numrun    E.rtestxm   E.rtestxsd  E.s1       E.sd1  E.sN   E.snode

E.b        E.numrun    E.rtestbm   E.rtestbsd  E.b1       E.bsd1  E.bN

ET.x: Equitable tranform () with std. dev. errors at each point: ET.xsd

ET.N: number of points averaged to get point

ET.x       ET.xsd    ET.N

ET.Es ET.Eb   ET.Ep             : masked matrices included slope=Es  interceprt=Eb prob= Ep

Ave.ET.x   Ave.ET.xsd Ave.ET.N Ave.ET.Es Ave.ET.Eb   Ave.ET.Ep

transform based on only average column: masked matrices included
}
\description{
Creates an equitable transform and returns information regarding it
}
\examples{
# Find a transform using a signal with no noise and then
# add noise and show the results for a noisy data set.
# A researcher with a data set can simply use transformE and plotsummary
#  on their data set placed in variable d
# d is an example (4) of a two dimensional separable signal
d<-eg4(3,3)
Td<-transformE(d, Ave=TRUE)  #Run and equitable transform on the data
#creates summary plots of the data comparing sequences in various ways
plotsummary(Td)
               #add noise to this signal data set
#find the std dev of the overall signal and add normally distributed noise
# that has a std. dev that is some fraction (fac) of this signal std dev
#let the fraction be 1/2 the standard deviaiton of the signal
#add to signal a normal distribution of noise with this std dev.
d_noise<-d+rnorm(prod(dim(d)),mean=0,sd=1/2*sd(d,na.rm=TRUE))
      # Once you have a data set (named d_noise) and
      #you want to find if there is an underlying pattern, run the transform
#Ave= TRUE includes an additional sequence of averages, if not desired set to FALSE
Td_noise<-transformE(d_noise, Ave=TRUE)
 #summary plots of the transform data compared to the thwe original
plotsummary(Td_noise)
 # if you want to include units for the rows columns and data add in the units
plotsummary(Td_noise,row_unit="Year", col_unit="Day Number",z_unit="Temperature")
#shows statistics relative to Signal :Cnonly run this if you already have a signal
runstatsNS(Td,Td_noise)
#shows signal along with noisy data and transforms
#plotsummary puts togetwher numerous calls to plotsome, and plotsquares
plotsummary(Td_noise,Td)
#shows signal along with noisy data and transforms
plotsummary(Td_noise,Td)
#plotsummary puts togetwher numerous calls to plotsome, and plotsquares

plotsummary(Td_noise,Td,row_unit="Year", col_unit="Day Number",z_unit="Temperature")
plotsummary(Td_noise,Td,row_unit="Year", col_unit="Day Number",z_unit="Temperature")

#if you already know the "signal" (in d), create the separable
# Transforms into Td
      #Any of the above stepts could be run with data sets
      # having less than about 450 sequences
      # other examples include eg0, eg1,eg2,eg3,e4,eg5, eg6,eg7,eg8,egrand
      #resolutions of these examples can be altered by changing rmult and cmult
d<-eg5(1,1)
d<-eg5(2,2)
d<-eg5(5,5)
d<-eg5(15,15)
d<-eg5(1,15)
d<-eg5(15,1)
}
