#!/usr/bin/env Rscript

# Extract gene names as ordered by GO algo from ngs.plot output zip file.
# Input should be the file name of the zip file without .zip suffix.

library(stringr)

fname <- commandArgs(T)
#fname<-'out'

zip.fname <- paste(fname, 'zip', sep='.')
heatmap.dat <- paste("out", 'heatmap.RData',sep="/")
load(unz(zip.fname, heatmap.dat))

gene.list <- as.data.frame(go.list, stringsAsFactors = FALSE)
gene.list[,1] <- str_split_fixed(gene.list[,1],':',2)[,1]

clusters <- max(gene.list[,2])
for( i in 1:clusters ){
  filename <- paste("cluster",i,".txt",sep="")
  write.table(gene.list$X.1[gene.list[,2]==i], file=paste(fname, filename, sep='.'),  col.names=F, row.names=F, quote = FALSE)
}

