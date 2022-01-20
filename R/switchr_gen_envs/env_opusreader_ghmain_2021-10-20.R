################################################################################
## Define and install (seed) package manifest into newly created decentral
##   package library
## Export and distribute package cohort (gist and on this github repo) so that
##   other users and developers can contribute to improve opusreader
################################################################################

## 1. Load {switchr} infrastructure ============================================

source("R/_setup-switchr.R")

## Install version by commit date ==============================================

# repository: github main branch
opusreader_ghmain_20211020 <- GithubManifest(
    "pierreroudier/opusreader@5bf92ca8f8ea1ec1bbba5f9846957d5e377ac66a"
)

# Install and/or use packages listed in the manifest
# by seeding a new local package library
# while in a new R process in the working directory
switchTo(
    name = "opusreader_ghmain_20211020",
    seed = opusreader_ghmain_20211020,
)

# switchr complains first that "rlang" is needed, but then also that "jsonlite"
# is needed. This might be due some reverse dependendies that are not
# appropriatly handled downstream -> need to look into that
# install also downstream dependencies
switchr::install_packages(
    pkgs = c("rlang", "jsonlite"),
    versions = c("0.4.12", "1.7.2"),
    opusreader_ghmain_20211020
)

library("opusreader")

# regenerate or reverse seed a package manifest
# from currently available packages
mani_opusreader_ghmain_20211020 <- libManifest(
    lib = "opusreader_ghmain_20211020", # default is current switchr library
)

subdir_pkg_rev_manifests <- file.path(
    "_pkg_rev_manifests", "opusreader_ghmain_20211020"
)

# make the manifest available on this github repo or as gist
mani_pub_opusreader_ghmain_20211020 <- publishManifest(
    mani_opusreader_ghmain_20211020,
    dest = subdir_pkg_rev_manifests
)