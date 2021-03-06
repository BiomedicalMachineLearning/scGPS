% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MainLassoLDATraining.R
\name{training_scGPS}
\alias{training_scGPS}
\title{Main model training function for finding the best model that characterises a
subpopulation}
\usage{
training_scGPS(genes = NULL, cluster_mixedpop1 = NULL,
  mixedpop1 = NULL, mixedpop2 = NULL, c_selectID = NULL,
  listData = list(), out_idx = 1, standardize = TRUE,
  trainset_ratio = 0.5)
}
\arguments{
\item{genes}{a vector of gene names (for ElasticNet shrinkage); gene symbols 
must be in the same format with gene names in subpop2. Note that genes are 
listed by the order of importance, e.g. differentially expressed genes that 
are most significan, so that if the gene list contains too many genes, only 
the top 500 genes are used.}

\item{cluster_mixedpop1}{a vector of cluster assignment in mixedpop1}

\item{mixedpop1}{is a \linkS4class{SingleCellExperiment} object from the 
train mixed population}

\item{mixedpop2}{is a \linkS4class{SingleCellExperiment} object from the 
target mixed population}

\item{c_selectID}{a selected number to specify which subpopulation to be used
for training}

\item{listData}{list to store output in}

\item{out_idx}{a number to specify index to write results into the list 
output. This is needed for running bootstrap.}

\item{standardize}{a logical value specifying whether or not to standardize 
the train matrix}

\item{trainset_ratio}{a number specifying the proportion of cells to be part
of the training subpopulation}
}
\value{
a \code{list} with prediction results written in to the indexed 
\code{out_idx}
}
\description{
Training a haft of all cells to find optimal ElasticNet and LDA
models to predict a subpopulation
}
\examples{

c_selectID<-1
out_idx<-1
day2 <- sample1
mixedpop1 <-NewscGPS(ExpressionMatrix = day2$dat2_counts, 
    GeneMetadata = day2$dat2geneInfo, CellMetadata = day2$dat2_clusters)
day5 <- sample2
mixedpop2 <-NewscGPS(ExpressionMatrix = day5$dat5_counts,
GeneMetadata = day5$dat5geneInfo, CellMetadata = day5$dat5_clusters)
genes <-GeneList
genes <-genes$Merged_unique
listData  <- training_scGPS(genes, cluster_mixedpop1 = colData(mixedpop1)[, 1],
                            mixedpop1 = mixedpop1, mixedpop2 = mixedpop2, c_selectID,
                            listData =list(), out_idx=out_idx, trainset_ratio = 0.5)
names(listData)
listData$Accuracy
}
\author{
Quan Nguyen, 2017-11-25
}
