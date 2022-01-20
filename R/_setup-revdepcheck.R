if (!require("revdepcheck")) {
    if (!require("remotes")) {
        install.packages("remotes")
    }
    remotes::install_github("r-lib/revdepcheck")
}

library("revdepcheck")

# revdepcheck is not yet relevant, because opusreader is not yet on CRAN
# reserve this paths for scripts that test particular commits: ./R/revdepchecks/
dir_revdepcheck_scripts <- file.path("R", "revdepchecks")
if (!dir.exists(dir_revdepcheck_scripts)) {
    dir.create(dir_revdepcheck_scripts)
}