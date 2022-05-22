#' Set up template data sience project folder
#'
#' Sets-up a template, ready-to-use folder for a new data science project.
#'
#' Sets up the directory given in \code{path} as follows:
#' \itemize{
#' \item Creates folders \code{data/}, \code{output/} and \code{reports};
#' \item Creates or ammend the \code{.gitignore} file to exclude \code{targets} files
#' and folders;
#' \item Creates template RMarkdown files \code{make_targets_pipeline.Rmd} and
#' \code{data_cleaning.Rmd};
#' \item Creates template RMardown file \code{results.Rmd} in the \code{reports/} folder.
#' }
#' See \code{vignette("create_project_folder")} for more information on the
#' template and how to use it.
#'
#' @param path Path to directory in which to set up the template folder.
#' @param verbose Boolean, should a message be displayed after each step?
#' Default value is \code{TRUE}.
#' @export
create_project_folder <- function(path = ".", verbose = TRUE){

  ## Creates path if not existing
  ## showWarnings set to FALSE: will be silent if path already exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  path <- xfun::normalize_path(path)
  path <- paste0(path, "/")

  ## Create folders
  dir.create(paste0(path, "data/"))
  dir.create(paste0(path, "output/"))
  dir.create(paste0(path, "reports/"))
  if(verbose) message("Created folders 'data/', 'outputs/' and 'reports/'...")

  ## .gitignore file
  ## If no file exists, create one
  ## Otherwise write at the end of the existing file
  gitignore_template <- system.file("templates", "gitignore_template.txt", package = "OAButils")
  gitignore_path <- paste0(path, ".gitignore")

  if(file.exists(gitignore_path)){
    file.append(gitignore_path, gitignore_template)
    if(verbose) message("Amended .gitignore...")
  } else {
    file.copy(gitignore_template, gitignore_path, overwrite = TRUE)
    if(verbose) message("Created .gitignore...")
  }

  ## Add template files
  rmd_template <- system.file("templates", "make_targets_pipeline.Rmd", package = "OAButils")
  rmd2_template <- system.file("templates", "data_cleaning.Rmd", package = "OAButils")
  rmdres_template <- system.file("templates", "results.Rmd", package = "OAButils")

  file.copy(rmd_template, paste0(path, "make_targets_pipeline.Rmd"), overwrite = FALSE)
  file.copy(rmd2_template, paste0(path, "data_cleaning.Rmd"), overwrite = FALSE)
  if(verbose) message("Created 'make_targets_pipeline.Rmd' and 'data_cleaning.Rmd'...")

  file.copy(rmdres_template, paste0(path, "reports/results.Rmd"), overwrite = FALSE)
  if(verbose) message("Created 'reports/results.Rmd...")

  if(verbose) message("Done :)")

  invisible(TRUE)
}
