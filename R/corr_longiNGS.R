# Correlation function

corr_longiNGS <- function(taxa.dat, metadat,
                         sample.id, subj.id, time.var, taxon.name){
  taxa.dat <- data.frame(taxon = taxa.dat[grepl(taxon.name, rownames(taxa.dat))],
                                             SeqID = colnames(taxa.dat))
  metadat <- metadat[ ,c(sample.id, subj.id, time.var)]
  merged.ds <- merge(y = taxa.dat, x = metadat, by = sample.id)
  merged.ds[, time.var] <- as.factor(merged.ds[, time.var])
  merged.ds[,sample.id] <- NULL
  check.w <- reshape(merged.ds, direction = "wide",
        idvar = subj.id, timevar = time.var, # mandatory
         v.names = c("taxon"))
  colnames(check.w) <- c(subj.id, paste0("tax_prop", levels(merged.ds[, time.var])))
#  return(check.w)
  cor.check <- cor(check.w[, -1], method = "spearman")
  return(cor.check)
}
check <- corr_longiNGS(prop.mat.3tp, metadat.df.3tp, "SeqID", "CHILDid", "Visit", "Moraxella lincolnii 1")

