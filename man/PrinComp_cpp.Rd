% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{PrinComp_cpp}
\alias{PrinComp_cpp}
\title{Principal component analysis}
\usage{
PrinComp_cpp(X)
}
\arguments{
\item{X}{an R matrix (expression matrix), rows are genes, columns are cells}
}
\value{
a list with three list pca lists
}
\description{
This function provides significant speed gain if the input matrix
is big
}
\examples{
mat_test <-matrix(rnbinom(1000000,mu=0.01, size=10),nrow=1000)
#library(microbenchmark)
#microbenchmark(PrinComp_cpp(mat_test), prcomp(mat_test), times=3)

}
