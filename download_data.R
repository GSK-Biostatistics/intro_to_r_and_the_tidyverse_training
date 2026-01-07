# Load required libraries
if (!requireNamespace("httr", quietly = TRUE)) install.packages("httr")
if (!requireNamespace("jsonlite", quietly = TRUE)) install.packages("jsonlite")

library(httr)
library(jsonlite)

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


#download data from the tidyverse training
download_data(
  owner = "GSK-Biostatistics",
  repo = "intro_to_r_and_the_tidyverse_training",
  path = "data",
  branch = "main",
  dest_dir = "directory" #update this where you want the files to be saved
)