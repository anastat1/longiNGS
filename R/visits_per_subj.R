#' Count numbers of records per subject
#'
#' @description Outputs description of longitudinal observations structure:
#' numbers of subjects with different numbers of records. Checks for duplicated
#' records
#'
#' @param dat A data.frame; has to contain subject ID variable and time
#'   (visit) variable
#' @param ID.var character string - name of subjectID variable in the dat
#' @param visit.var character string - name of visit number/descriptor variable
#'
#' @return data.frame with 2 columns
#'   - n_TimePoints
#'   - N_subjects
#' @export
#'
#' @examples
#' data(ngs_dat)
#' metadat <- ngs_dat$metadat
#' visits_per_subj(metadat, "ID_Number", "Day_Number")
visits_per_subj <- function(dat, ID.var, visit.var){
  stopifnot("There are duplicated records in the data" =
              sum(duplicated(dat[, c(ID.var, visit.var)]))==0)
  dat$helper <- 1
  vis.per.subj <- as.data.frame(table(aggregate(helper ~ dat[,ID.var],
                                                data = dat, sum)$helper))
  names(vis.per.subj) <- c("n_TimePoints", "N_subjects")
  return(vis.per.subj)
}
