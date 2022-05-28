test_that("create_project_folder() works", {

  ## Create a temporary directory
  dir <- withr::local_tempdir()

  expect_error(create_project_folder(dir, verbose = FALSE), regexp = NA)

  expect_true(dir.exists(paste0(dir, "/data")))
  expect_true(dir.exists(paste0(dir, "/data/raw")))
  expect_true(dir.exists(paste0(dir, "/data/processed")))
  expect_true(dir.exists(paste0(dir, "/output")))
  expect_true(dir.exists(paste0(dir, "/reports")))

  expect_true(file.exists(paste0(dir, "/.gitignore")))
  expect_true(file.exists(paste0(dir, "/make_targets_pipeline.Rmd")))
  expect_true(file.exists(paste0(dir, "/data_cleaning.Rmd")))
  expect_true(file.exists(paste0(dir, "/reports/results.Rmd")))
})

test_that("create_project_folder() appends to existing .gitignore", {

  ## Create a temporary directory
  dir <- withr::local_tempdir()

  ## Create a .gitignore file in the temporary directory
  writeLines("TEST", con = paste0(dir, "/.gitignore"))

  expect_error(create_project_folder(dir, verbose = FALSE), regexp = NA)

  ## Check that we have both lines from the existing and the template .gitignore
  res <- readLines(paste0(dir, "/.gitignore"))
  ref <- readLines(system.file("templates", "gitignore_template.txt", package = "OAButils"))

  expect_equal(res[[1]], "TEST")
  expect_equal(res[-1], ref)

})
