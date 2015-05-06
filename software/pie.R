args <- unlist(commandArgs(trailingOnly = TRUE))
gene=as.numeric(args[1])
promoter=as.numeric(args[2])
distal=as.numeric(args[3])
total=as.numeric(args[4])
inter=total-gene-promoter-distal
slices <- c(gene,promoter,distal,inter)
slices
lbls <- c("Gene", "Promoter -2kb", "Distal -10kb", "Intergenic")
pdf(args[5])
par(mfrow=c(1,1))
pie(slices, labels = lbls, main="Pie Chart of Peak locations")
dev.off()


