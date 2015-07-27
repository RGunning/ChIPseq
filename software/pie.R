args     <- unlist(commandArgs(trailingOnly = TRUE))
gene     <- as.numeric(args[1])
promoter <- as.numeric(args[2])
distal   <- as.numeric(args[3])
total    <- as.numeric(args[4])
inter    <- total-gene-promoter-distal
slices   <- c(gene,promoter,distal,inter)
slices
lbls     <- c("Gene", "Promoter -2kb", "Distal -10kb", "Intergenic")
pct      <- round(slices/sum(slices)*100)
lbls     <- paste(lbls, pct) # add percents to labels
lbls     <- paste(lbls,"%",sep="") # ad % to labels
#lbls     <- paste(lbls,",",slices,sep="") # ad % to labels
pdf(args[5],width = 6, height = 4,bg = "transparent")
par(mfrow=c(1,1))
pie(slices, labels = lbls, main="Pie Chart of Peak locations")
dev.off()


