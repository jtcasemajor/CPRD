% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DEG.R
\name{tools.DEG.Nanostring.merge}
\alias{tools.DEG.Nanostring.merge}
\title{Merge the DEG Pvalues for each tool used by tools.DEG.Nanostring in one dataframe}
\usage{
tools.DEG.Nanostring.merge(
  raw.data,
  tools_DEG,
  tools_norm,
  DESeq = T,
  dir = NULL
)
}
\arguments{
\item{raw.data}{rcc type file. List of 4 elements: 
Samples.IDs is a dataframe with four columns: sample name, status (WildType, Mutated), filename. 
rcc.df contains expression levels with samples in column and genes in rows. 
annots.df is a dataframe with 3 columns: geneclass (endogenous, housekeeping, negative, positive), gene name, and the accession number. 
FOV is a dataframe that contains Field of views information.}

\item{tools_DEG}{Method to use to compute the pvalues of differentially expressed genes.
"Wilcox" uses the wilcoxDEG() function implemented in this very same pacakge 
"limma" uses the functions DEG_limma() that comes from the limma package
"RankProduct" and "RankSum" perform respectively a Rank Product and a Rank Sum analysis with the RankProducts() function from the RankProd package}

\item{tools_norm}{Normalization tool. "nappa.NS", "nappa.param1","nappa.param2","nappa.param3" are different parameters used with the NAPPA() function from the NAPPA package.
"nanostringnorm.default","nanostringnorm.param1","nanostringnorm.param2" use the NanoStringNorm() normalization function from the package NanoStringNorm
"nanostringR" uses the HKnorm() function from the package nanostringr.
"nanoR.top100","nanoR.total" uses the nsNormalize() function from the nanoR package.
For the nanoR package, it is needed to give the file path to rcc files}

\item{DESeq}{logical values.
TRUE to use DESeq2 DEG analysis with its own normalization}

\item{dir}{directory of rcc files. 
This parameter is only necessary if the nanoR normalizations are wanted.}
}
\value{
Dataframe with genes in columns and as many rows as there is possible combination of methods
}
\description{
Merge the DEG Pvalues for each tool used by tools.DEG.Nanostring in one dataframe
}
\examples{
# Retrieve gene expression data from Nanostring
# raw.data = Simul.data(type = "Nanostring")

# Compute the DEG pvalues with some of the possible methods
tools_DEG = c("Wilcox","limma")
tools_norm = c("nappa.NS","nanoR.total")
# Give the location of your rcc files
#RCC.dir <- file.path("./data/NANOSTRING","GSE146204_RAW")
#res.DEG = tools.DEG.Nanostring.merge(raw.data =raw.data,
#                                      tools_DEG = tools_DEG,
#                                      tools_norm = tools_norm,
#                                      DESeq = FALSE,
#                                      dir = RCC.dir)

# Compute the DEG pvalues with only "nappa.default" normalization 
#and Wilcoxon's test only
#res.DEG = tools.DEG.Nanostring.merge(raw.data =raw.data,
#                                      "Wilcox",
#                                      "nappa.default",
#                                      DESeq = FALSE)
}
