################################################################################
## Author: Philipp Baumann,
## Setup: package environment
################################################################################

# We will use awesome {switchr} to manage and switch between package sources and
# versions (git, svn, package repositories, CRAN Archive, ...)
# see https://cran.r-project.org/web/packages/switchr/vignettes/switchrvign.pdf
# https://www.jstatsoft.org/article/view/v082i01
# Becker, G., Barr C., Gentleman R., Lawrence, M.:
# "Enhancing Reproducibility and Collaboration via Management of R Package
# Cohorts" (2017)
source("R/_setup-switchr.R")

## Install versions by commit date =============================================

# repository: github main branch -----------------------------------------------

# commit: Oct 10, 2021
source("R/switchr_gen_envs/env_opusreader_ghmain_2021-10-20.R")

# forked repositories ----------------------------------------------------------

# commit: Aug 23, 2021
source("R/switchr_gen_envs/env_opusreader_ghfork_2021-18-23.R")

## Install current versions ====================================================


## Install major releases (for CRAN) ===========================================

## Example: test different OPUS files and issues ###############################