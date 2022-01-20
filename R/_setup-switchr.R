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
switchr_libs <- file.path(getwd(), ".switchr")
if (!dir.exists(switchr_libs)) {
    dir.create(switchr_libs)
}
switchrBaseDir(switchr_libs)
reps <- options("repos")[[1]]
if (reps["CRAN"] == "CRAN") { # "@CRAN@" as per vignette seems not working
    reps["CRAN"] <- "https://cloud.r-project.org"
    options(repos = reps)
}