#Daniel Ence
#February 4, February 2021

args=commandArgs(trailingOnly=TRUE)
rds=args[1]
output=args[2]
params_labels=args[3]
log=args[4]


log <- file(log, open="wt")
sink(log)
sink(log, type="message")

library("DESeq2")

# load deseq2 data
dds <- readRDS(rds)

# obtain normalized counts
counts <- rlog(dds, blind=FALSE)
svg(output)
plotPCA(counts, intgroup=params_labels)
dev.off()
