# Training Materials

This repo contains the source for the R materials deployed on :

# Editing the Materials (Branching Strategy)

NEVER edit the 'main' or 'preview' branch directly. Always create a new branch by forking the 'preview' branch and work on changes there.

1.  Make your updates to the qmd files
2.  Render/serve the book locally
3.  Generate the course script
4.  Create the manifest file
5.  Commit and push changes
6.  Copy the new course script to the shared location on WARP (if you have permission, else contact the directory owner)

## Updating the Rmd files

The training materials are compiled as a Quarto book document. Everything is now triggered from `_quarto.yml`. 

Note that exercise solutions are provided within the Rmd files but they are not included in the published bookdown (`echo=FALSE`). In order to update the solutions in the course script (`full_script.R`) you must update these hidden code chunks.

## Local rendering

Perhaps obvious, but always check that your changes don't break anything and that the book runs locally.

To render the book run the following command in the terminal:

```{r}
quarto render
```

## Generating the course script

The course script is contained in `full_script.R`. This file must NEVER BE UPDATED MANUALLY. To update the course script run `create_full_script.R`:

```{r}
source("create_full_script.R", echo=TRUE)
```

## Create the Manifest

The training materials are automatically deployed to RStudio Connect once a change is detected on either the master (for the primary materials) or test/preview (for testing) branch in GitHub. You *must* update the manifest before pushing changes for this to work as expected:

```{r}
rsconnect::writeManifest()
```

## Teaching the course

This bookdown contains approximately 10 hours of material when taught in full. Unless teaching over 10 hours, the course must be adapted to fit to the time. Typically, this course is taught over 8 hours with several sections provided mainly for reference (e.g. factors, stringr, dates). These sections are likely to be relevant to participants, but not critical to the overall flow of the course. The expectation is that they read through in their own time and discover the functions that are most relevant to their work themselves. However, if time permits (or the audience have a particular interest in a topic) then it may be beneficial to 
