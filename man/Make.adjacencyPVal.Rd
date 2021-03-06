% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CoExpression.R
\name{Make.adjacencyPVal}
\alias{Make.adjacencyPVal}
\title{Computing an adjacency table with Pvalues associated to a coefficient of correlation}
\usage{
Make.adjacencyPVal(data, Fast = FALSE, method)
}
\arguments{
\item{data}{Dataset of gene expression levels with genes in row and samples in columns}

\item{Fast}{Logical value. 
if Fast = TRUE, only the pearson correlation coefficients will be measured with a fast one-step method. It uses the corAndPvalue() function from the WGCNA package.
if Fast = FALSE, the pvalue of the correlation of the gene pairs will be computed. 
Careful, if Fast = F, it may take a while depending on the number of genes in the dataset.}

\item{method}{Methods to compute the correlation coefficients.
"spearman" computes the Spearman's rho, 
"kendall" uses the Kendall's tau and
"pearson" the Pearson's product moment correlation coefficient.
These functions are called via the cor() function in the stats package.}
}
\value{
Dataframe with 4 columns. the two first are the pairs of genes,
the other two are the correlation coefficients and the associated pvalue.
}
\description{
This function is similar to Cor.square.matrix() and TOM.square.matrix() as it converts the square matrix into a 
4 columns dataframe with no repeated pair of variables and Pvalue associated with a correlation coefficient.
}
\examples{
# Creating a dataset
df = matrix(runif(500, 10, 100), ncol=20)
group = paste0(rep(c("control", "case"), each = 10),rep(c(1:10),each = 1))
genes <- paste0(rep(LETTERS[1:25], each=1))
colnames(df) = group
row.names(df) = genes

# computing fast correlation and pvalues 
Adj = Make.adjacencyPVal(df,Fast = FALSE ,method = "spearman")
}
