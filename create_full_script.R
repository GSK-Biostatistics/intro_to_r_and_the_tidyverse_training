library(knitr)

# List of file names to combine
file_names <- c(
  "01_materials_gsk",
  "02_r_rstudio",
  "03_vectors",
  "04_data_frames",
  "05_importing_and_exporting_data",
  "06_basic_data_processing",
  "06_xxx_factors",
  "06_yyy_stringr",
  "06_zzz_dates",
  "07_magrittr",
  "08_summaries_aggregation",
  "09_setting_merging",
  "10_transposing",
  "11_statistical_modelling",
  "11_xxx_other_models"
)

# Initialize an empty string to store the combined content
combined_content <- ""

# Loop through each file, read its content, and append to combined_content
for (file_name in file_names) {
  
  # Define input
  input <- paste0(file_name, ".qmd")
  
  # Define output
  output <- paste0(file_name, ".R")
  
  # Create R script for chapter
  purl(input, documentation = 0)
  
  # Read the content of the current file
  file_content <- readLines(output)
  # 
  # # Add the file name as a comment before the content
  # combined_content <- paste(combined_content, paste0("\n\n#### ", output, "\n"))
  
  # Append the content of the current file to combined_content
  combined_content <- paste(combined_content, "\n\n", paste(file_content, collapse = "\n"), sep = "\n")
  
  file.remove(output)
}

# Write the combined content to a new file
writeLines(combined_content, "full_script.R")


