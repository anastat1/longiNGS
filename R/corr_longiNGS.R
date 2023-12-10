#' Within subject correlations for selected taxon
#'
#' @description
#' The function outputs matrix of Spearman correlations for bacterial abundances
#' between timepoints for a selected taxon calculated from all available pairwise
#' complete observations
#'
#' @param taxa.dat numeric matrix with taxa as rows and samples as columns
#'   annotated with both column (sample ids) and row names (taxa names)
#' @param metadat A data.frame; has to contain subject ID variable, time
#'   (visit) variable and sample ID variable
#' @param sample.id character string - name of sample ID variable in the metadat
#' @param subj.id character string - name of subject ID variable in the metadat
#' @param time.var character string - name of time/visit ID variable
#' @param taxon.name character string - name of the taxon of interest
#'
#' @return matrix of Spearman correlation estimates
#' @export
#'
#' @examples
#' data(ngs_dat)
#' counts.dat <- ngs_dat$counts
#' metadat <- ngs_dat$metadat
#' corr_longiNGS(counts.dat, metadat,
#'               "ID_sample", "ID_Number", "Day_Number",
#'               "g_Bacteroides")[1:6, 1:6]
corr_longiNGS <- function(taxa.dat, metadat,
                         sample.id, subj.id, time.var, taxon.name){
    new.dat <- data.frame(taxa.dat[grepl(taxon.name, rownames(taxa.dat))])
    new.dat[,2] <- colnames(taxa.dat)
    names(new.dat) <- c("abund", sample.id)
    metadat <- metadat[ ,c(sample.id, subj.id, time.var)]
    merged.ds <- merge(y = new.dat, x = metadat, by = sample.id)
    merged.ds[, time.var] <- as.factor(merged.ds[, time.var])
    merged.ds[,sample.id] <- NULL
    check.w <- reshape(merged.ds, direction = "wide",
        idvar = subj.id, timevar = time.var,
         v.names = c("abund"))
  colnames(check.w) <- c(subj.id, paste0("tax_abund", levels(merged.ds[, time.var])))
  cor.check <- cor(check.w[, -1], method = "spearman", use = "pairwise.complete.obs")
  return(cor.check)
}

