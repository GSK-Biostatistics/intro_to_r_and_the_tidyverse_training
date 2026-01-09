# Training Materials

This repo contains the source for the R materials deployed on : [GitHub Pages](https://gsk-biostatistics.github.io/intro_to_r_and_the_tidyverse_training/)

# Editing the Materials (Branching Strategy)

NEVER edit the 'main'  branch directly. Always create a new branch by forking the 'main' branch and work on changes there.

1.  Make your updates to the qmd files
2.  Render/serve the book locally
3.  Generate the course script
5.  Commit and push changes

## Updating the Qmd files

The training materials are compiled as a Quarto book document. Everything is now triggered from `_quarto.yml`. 

Note that exercise solutions are provided within the Qmd files but they are not included in the published bookdown (`echo=FALSE`). In order to update the solutions in the course script (`full_script.R`) you must update these hidden code chunks.

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

## Teaching the course

This bookdown contains approximately 10 hours of material when taught in full. Unless teaching over 10 hours, the course must be adapted to fit to the time. Typically, this course is taught over 8 hours with several sections provided mainly for reference (e.g. factors, stringr, dates). These sections are likely to be relevant to participants, but not critical to the overall flow of the course. The expectation is that they read through in their own time and discover the functions that are most relevant to their work themselves. However, if time permits (or the audience have a particular interest in a topic) then it may be beneficial to 
