% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CoExpression.R
\name{Cor.square.matrix}
\alias{Cor.square.matrix}
\title{Computing a square matrix of correlation coefficients}
\usage{
Cor.square.matrix(data, method)
}
\arguments{
\item{data}{Dataset of gene expression levels with genes in row and samples in columns}

\item{method}{Methods to compute the correlation coefficients.
"spearman" computes the Spearman's rho, 
"kendall" uses the Kendall's tau and
"pearson" the Pearson's product moment correlation coefficient.
These functions are called via the cor() function in the stats package.}
}
\value{
square matrix of correlation coefficients
}
\description{
Computing a square matrix of correlation coefficients
}
\examples{
# Creating a dataset
df = matrix(runif(500, 10, 100), ncol=20)
group = paste0(rep(c("control", "case"), each = 10),rep(c(1:10),each = 1))
genes <- paste0(rep(LETTERS[1:25], each=1))
colnames(df) = group
row.names(df) = genes

# Computing square matrix with Spearman's rho
Cor = Cor.square.matrix(df,"spearman")
}
