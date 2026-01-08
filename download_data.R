#' Download Data and Scripts from GitHub
#'
#' This function connects to the GitHub API to download all files from a 
#' specific folder within a repository.
#'
#' @param owner String. The GitHub username or organization (e.g., "GSK-Biostatistics").
#' @param repo String. The name of the repository.
#' @param path String. The path to the folder within the repo you want to download.
#' @param branch String. The branch name (default is "main").
#' @param dest_dir String. The local directory where you want the files saved.
#'
#' @return Invisible NULL. The function's primary purpose is the side effect of downloading files.
#' @export
#'
#' @examples
#' \dontrun{
#' download_data(
#'   owner = "GSK-Biostatistics",
#'   repo = "intro_to_r_and_the_tidyverse_training",
#'   path = "data",
#'   dest_dir = "~/Tidyverse_Training"
#' )
#' }
# Function to download all files from a specific GitHub folder
download_data <- function(owner, repo, path, branch = "main", dest_dir = "directory") {
 
  # Create destination directory if it doesn't exist
  if (!dir.exists(dest_dir)) dir.create(dest_dir)
  
  # Construct the GitHub API URL to list folder contents
  api_url <- paste0("https://api.github.com/repos/", owner, "/", repo, "/contents/", path, "?ref=", branch)
  
  # Fetch the file list
  res <- GET(api_url)
  stop_for_status(res)
  files <- fromJSON(content(res, as = "text"))
  
  message("Starting download...")
  # Loop through files and download each one
  for (i in 1:nrow(files)) {
    if (files$type[i] == "file") {
      file_url <- files$download_url[i]
      file_name <- files$name[i]
      dest_path <- file.path(dest_dir, file_name)
      
      message("Downloading: ", file_name, "...")
      download.file(file_url, destfile = dest_path, mode = "wb", quiet = TRUE)
    }
  }
  
  message("Success! All files downloaded to: ", normalizePath(dest_dir))
}
