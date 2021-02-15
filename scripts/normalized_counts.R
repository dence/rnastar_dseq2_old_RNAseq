#modification for working in hipergator cluster_jobid
#Daniel Ence
#February 8, February 2021

args=commandArgs(trailingOnly=TRUE)
rds=args[1]
output_table=args[2]
log=args[3]


log <- file(log, open="wt")
sink(log)
sink(log, type="message")

library("DESeq2")

dds <- readRDS(rds)

normalized_counts <- counts(dds, normalized=TRUE)
write.table(normalized_counts, file="results/counts/all.norm_counts.tsv", sep="\t", quote=F, col.names=NA)
