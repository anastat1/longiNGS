library(readxl)
library(tidyr)
library(dplyr)

# Load datasets
ds.counts <- read_excel("pkg_dat.xlsx", na = "NA", sheet = "S1-6")
names(ds.counts)[1] <- "ID_sample"
ds.counts$ID_sample <- ifelse(nchar(ds.counts$ID_sample) == 1, paste0("s000", ds.counts$ID_sample),
                               ifelse(nchar(ds.counts$ID_sample) == 2, paste0("s00", ds.counts$ID_sample),
                                      paste0("s0", ds.counts$ID_sample)))
ds.counts1 <- ds.counts |> drop_na(2:195) |>
  # this sample have all 0s in all genera; to exclude
  filter(!(ID_sample == "s0332"))

ds.metadat <- read_excel("pkg_dat.xlsx", na = "NA", sheet = "S1-3")
names(ds.metadat)[1] <- "ID_sample"
ds.metadat$ID_sample <- ifelse(nchar(ds.metadat$ID_sample) == 1, paste0("s000", ds.metadat$ID_sample),
                               ifelse(nchar(ds.metadat$ID_sample) == 2, paste0("s00", ds.metadat$ID_sample),
                                      paste0("s0", ds.metadat$ID_sample)))
metadat_for_pkg <- ds.metadat |> drop_na("Enterotype_nr") |>
  filter(Day_Number<21)
metadat_for_pkg <- as.data.frame(metadat_for_pkg)

# Filter out these samples in ds.counts
ds.counts2 <- ds.counts1 |> filter(ID_sample %in% metadat_for_pkg$ID_sample); rm(ds.counts1)
counts_for_pkg <- t(ds.counts2[, -1])
dimnames(counts_for_pkg)[[2]] <- ds.counts2$ID_sample
str(counts_for_pkg)

ngs_dat <- list(metadat = metadat_for_pkg, counts =  counts_for_pkg)
save(ngs_dat, file='ngs_dat.rda')


usethis::use_data(raw_data_prep, overwrite = TRUE)
