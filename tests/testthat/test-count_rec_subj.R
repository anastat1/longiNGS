test_that("Duplicates result in error", {
  testDS <- data.frame(ID = c("a", "b", "c", "a"), visit = c(1, 2, 3, 1))
  expect_error(count_rec_subj(testDS, "ID", "visit"))
})
