#' @title Count numbers of observations in the data
#'
#' @description
#' Count numbers of visits, subjects, and max available visits per subject.
#' Checks for duplicated records
#'
#' @param dat A data.frame; has to contain subject ID variable and time
#'   (visit) variable
#' @param ID.var character string - name of subjectID variable in the dat
#' @param visit.var character string - name of visit number/descriptor variable
#'
#' @return prints out number of records, subjects, and max number of records
#'   per subject
#' @export
#'
#' @examples
#' data(ngs_dat)
#' metadat <- ngs_dat$metadat
#' count_rec_subj(metadat, "ID_Number", "Day_Number")
count_rec_subj <- function(dat, ID.var, visit.var){
  stopifnot("There are duplicated records in the data" =
              sum(duplicated(dat[, c(ID.var, visit.var)]))==0)
  cat("dataset has", nrow(dat), "subject/visit records \n")
  cat("dataset has", length(unique(dat[, ID.var])), "subjects with max",
      length(unique(dat[,visit.var])), "records per subject")
}
