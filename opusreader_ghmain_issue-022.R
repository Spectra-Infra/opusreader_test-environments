################################################################################
## Reproduce environment
# Repository: https://github.com/pierreroudier/opusreader
# Issue No. | Date: 22 | 2021-10-29
# Issue URL: https://github.com/pierreroudier/opusreader/issues/22
# Reported by: https://github.com/dylanbeaudette
# OPUS files provided:
#   file name: 26398XS01.0
#   List of 10
#  $ metadata             :'data.frame':  1 obs. of  18 variables:
#   ..$ unique_id       : chr "1_2014-12-30 09:34:39"
#   ..$ sample_id       : chr "1"
#   ..$ date_time_sm    : POSIXct[1:1], format: "2014-12-30 09:34:39"
#   ..$ date_time_rf    : POSIXct[1:1], format: "2014-12-30 09:34:16"
#   ..$ sample_name     : chr "1;40248-41094-13-26398-1;;CGIAR;CGIAR"
#   ..$ instr_name_range: chr "VERTEX 70-MIR"
#   ..$ resolution_wn   : int 4
#   ..$ result_spc      : chr "AB"
#   ..$ beamspl         : chr "KBr"
#   ..$ laser_wn        : num 15798
#   ..$ spc_in_file     : chr "ig_sample;ig_ref;sc_sample;sc_ref;spec"
#   ..$ zero_filling    : int 2
#   ..$ temp_scanner_sm : num 24.9
#   ..$ temp_scanner_rf : num 24.9
#   ..$ hum_rel_sm      : int 9
#   ..$ hum_rel_rf      : logi NA
#   ..$ hum_abs_sm      : logi NA
#   ..$ hum_abs_rf      : logi NA
#  $ spec                 : num [1, 1:3578] 0.295 0.295 0.295 0.296 0.296 ...
#   ..- attr(*, "dimnames")=List of 2
#   .. ..$ : chr "1_2014-12-30 09:34:39"
#   .. ..$ : chr [1:3578] "7498" "7496.1" "7494.2" "7492.3" ...
#  $ spec_no_atm_comp     : NULL
#  $ sc_sample            : NULL
#  $ sc_ref               : NULL
#  $ ig_sample            : NULL
#  $ ig_ref               : NULL
#  $ wavenumbers          : num [1:3578] 7498 7496 7494 7492 7490 ...
#  $ wavenumbers_sc_sample: NULL
#  $ wavenumbers_sc_ref   : NULL
#     OPUS version:
#   file name: 26456XS03.0
# Description: yes
# Reproducible code: no
# Figure output: yes
# Last commit before issue reporting:
#   Date: 2021-10-20
#   URL: https://github.com/pierreroudier/opusreader/commit/5bf92ca8f8ea1ec1bbba5f9846957d5e377ac66a

# Alternative repository and commit:
################################################################################

## Outline #####################################################################
# 1. Produce package cohorts (issue release + old release or fix candidate)
#    in separate environment
# 2. Switch to package cohort version that caused the issue
# 2.1 reproduce and diagnose the issue
# 3. Go back to old branch or test a new feature branch on github
# 2.2 Report the fix
################################################################################

## create, load and snapshot package context when issue occured
source("R/switchr_gen_envs/env_opusreader_ghmain_2021-10-20.R")
library("opusreader")

## Diagnosis for commit where issue was found ==================================

diagnose_issue_022_ghmain <- function() {
  ref <- "ghmain_issue-022"
  pkg_issue <- paste0("opusreader_", ref)
  dir <- file.path("data", "issues", pkg_issue)
  fn <- c("26398XS01.0", "26456XS03.0")
  fs <- file.path(dir, fn)
  spec <- opus_read(fs, type = c("spec"))
  if (!dir.exists("output")) dir.create("output")
  out_subdir <- file.path("output", pkg_issue)
  if (!dir.exists(out_subdir)) dir.create(path = out_subdir)
  # pdf(file = file.path())
  # use automagic plotting function
  # dev.of()
}

diagnose_issue_022_ghmain()

# quite the current R session process with q() before running below

## Diagnosis for currently frozen fork at Spectra-Infra organization ===========

## create, load and snapshot package context when issue occured
source("R/switchr_gen_envs/env_opusreader_ghfork_2021-08-23.R")
library("opusreader")

diagnose_issue_022_ghfork <- function() {
  ref <- "ghmain_issue-022"
  pkg_issue <- paste0("opusreader_", ref)
  dir <- file.path("data", "issues", pkg_issue)
  fn <- c("26398XS01.0", "26456XS03.0")
  fs <- file.path(dir, fn)
  spec <- opus_read(fs, type = c("spec"))
  if (!dir.exists("output")) dir.create("output")
  out_subdir <- file.path("output", pkg_issue)
  if (!dir.exists(out_subdir)) dir.create(path = out_subdir)
  # pdf(file = file.path())
  # use automagic plotting function
  # dev.of()
}

diagnose_issue_022_ghfork()