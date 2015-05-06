#!/usr/bin/env Rscript

# Extract gene names as ordered by GO algo from ngs.plot output zip file.
# Input should be the file name of the zip file without .zip suffix.

library(stringr)

fname <- commandArgs(T)
#fname<-'out'

heatmap.dat <- paste(fname, 'RData',sep=".")
load(heatmap.dat)

gene.list <- as.data.frame(go.list, stringsAsFactors = FALSE)
gene.list[,1] <- str_split_fixed(gene.list[,1],':',2)[,1]

clusters <- max(gene.list[,2])
for( i in 1:clusters ){
  filename <- paste("cluster",i,"txt",sep=".")
  write.table(gene.list[gene.list[,2]==i,1], file=filename,  col.names=F, row.names=F, quote = FALSE)
}

