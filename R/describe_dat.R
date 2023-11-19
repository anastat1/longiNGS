

# Number of records and number of subjects
subj_rec_count <- function(dat, ID.var, visit.var){
  stopifnot("There are duplicated records in the data" = sum(duplicated(dat[, c(ID.var, visit.var)]))==0)
  cat("dataset has", nrow(dat), "subject/visit records \n")
  cat("dataset has", length(unique(dat[, ID.var])), "subjects with max",
      length(unique(dat[,visit.var])), "records per subject")
}

subj_rec_count(metadat.df.3tp, "CHILDid", "Visit")
subj_rec_count(metadat.df, "CHILDid", "Visit")

# Number of visits (records) per subject
visits_per_subj <- function(dat, ID.var, visit.var){
  stopifnot("There are duplicated records in the data" = sum(duplicated(dat[, c(ID.var, visit.var)]))==0)
  dat$helper <- 1
  vis.per.subj <- as.data.frame(table(aggregate(helper ~ dat[,ID.var], data = dat, sum)$helper))
#  vis.per.subj <- as.data.frame(table(aggregate(helper ~ ID.var, data = dat, sum)))
  names(vis.per.subj) <- c("n_TimePoints", "N_subjects")
  return(vis.per.subj)
}

visits_per_subj(metadat.df, "CHILDid", "Visit")





