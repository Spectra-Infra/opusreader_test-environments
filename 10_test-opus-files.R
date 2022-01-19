################################################################################
## Author: Philipp Baumann, Kompetenzzentrum Boden (KOBO), Soil Data Science,
##   Bern University of Applied Sciences (BFH),
##   philipp.baumann@bfh.ch
## Goal:
## Setup: package environment
################################################################################

# We will use awesome {switchr} to manage and switch between package sources and
# versions (git, svn, package repositories, CRAN Archive)
# see https://cran.r-project.org/web/packages/switchr/vignettes/switchrvign.pdf
# https://www.jstatsoft.org/article/view/v082i01
# Becker, G., Barr C., Gentleman R., Lawrence, M.:
# "Enhancing Reproducibility and Collaboration via Management of R Package
# Cohorts" (2017)
if (!require("switchr")) {
    install.packages("switchr")
}
if (!require("switchrGist")) {
    # https://cran.r-project.org/web/packages/switchrGist/index.html
    # "Package ‘switchrGist’ was removed from the CRAN repository...
    # "... Archived on 2020-02-22 as depends on archived package 'switchr'. ..."
    # -> CRAN Package Check Results of both {switchr} and {switchR} are <OK>
    remotes::install_github("gmbecker/switchrGist")
}
library("switchr")
library("switchrGist")

# initialize local .switchr directory for managing multiple sets
# of package libraries (cohorts) at the same time;
# has only an effect if the directory not yet exists
switchrBaseDir(file.path(getwd(), ".switchr"))
reps <- options("repos")[[1]]
if (reps["CRAN"] == "CRAN") { # "@CRAN@" as per vignette seems not working
    reps["CRAN"] <- "https://cloud.r-project.org"
    options(repos = reps)
}

## Install versions by commit date =============================================

# current main repository: github main branch
opusreader_ghmain_20201020 <- GithubManifest(
    "pierreroudier/opusreader@5bf92ca8f8ea1ec1bbba5f9846957d5e377ac66a"
)

# Install packages listed in the manifest by seeding a new package library
# with the new manifest while in a new R process in the working directory
switchTo(
    name = "opusreader_ghmain_20201020",
    seed = opusreader_ghmain_20201020,
)

# switchr complains first that "rlang" ist needed, but then also that "jsonlite"
# is needed. This might be due some reverse dependendies that are not
# appropriatly handled downstream
# install also downstream dependencies
switchr::install_packages(
    pkgs = c("rlang", "jsonlite"),
    versions = c("0.4.12", "1.7.2"),
    opusreader_ghmain_20201020
)


## Install current versions ====================================================

switchTo(
    name = "opusreader_ghmain_current",
    seed = opusreader_ghmain_current,
)

switchr::install_packages(
    pkgs = c("rlang", "jsonlite"),
    opusreader_ghmain_20201020
)

## Install major releases (for CRAN) ===========================================