Comparing binary reads of OPUS with ono python package vs. opusreader in
R
================
Philipp Baumann, Kompetenzzentrum Boden (KOBO), Datenwissenschaften
<philipp.baumann@bfh.ch>

-   [Setup to reproduce examples](#setup-to-reproduce-examples)

# Setup to reproduce examples

-   Use [renv](https://rstudio.github.io/renv/articles/python.html)
    together with python virtual environments to log and restore
    dependencies

<!-- -->

    # install Python virtual environment in Debian
    sudo apt install python3.8-venv

Install [ono](https://pypi.org/project/ono/) via reticulate, Python
virtual environments, and pip

``` bash
sudo apt install python3-pip
pip install ono
```

``` r
install.packages("renv")
install.packages("reticulate")
library("reticulate")
virtualenv_create("ono_opusreader")
reticulate::use_virtualenv("ono_opusreader")
virtualenv_install("ono_opusreader", "ono")
renv::use_python()
# 1: ~/.virtualenvs/ono_opusreader/bin/python
renv::snapshot()
# writes Python packages in requirements.txt
```

To deploy the R and Python environments on a new computer after cloning
this repository, install python3-pip and python3.8-venv using your linux
package manager (i.e. apt; see above).

``` r
renv::restore()
```

    ## * The library is already synchronized with the lockfile.
    ## * The Python library is already up to date.

``` r
# load project-local version of Python
```
