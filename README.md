# PCIT


<!-- badges: start -->
[![Travis build status](https://travis-ci.com/nathanhaigh/pcit.svg?branch=master)](https://travis-ci.com/nathanhaigh/pcit)
[![Codecov test coverage](https://codecov.io/gh/nathanhaigh/pcit/branch/master/graph/badge.svg)](https://codecov.io/gh/nathanhaigh/pcit?branch=master)
<!-- badges: end -->

An R package for weighted gene co-expression networks based on partial correlation and information theory approaches

# Installing

## From CRAN

PCIT is currently not available from CRAN - I failed to address some build issues I failed to address in a timely manner.
Due to the CRAN Submission Teams holidays, there will be a few week's delay before PCIT becomes available on CRAN again.

## From GitHub

You can install the PCIT directly from GitHub in a variety of ways:

```bash
library(devtools)

# Latest dev code
install_github("nathanhaigh/pcit")

# A specific tag
install_github("nathanhaigh/pcit@1.6.0")

# The latest release
install_github("nathanhaigh/pcit@*release")

```

# Building and Submitting Packages

 1) Update "Version" and "Date" in the DESCRIPTION file
 2) Add info about changes since last release to ChangeLog file
 3) `R CMD build pcit`
 4) Check the built tarball: `R CMD check --as-cran PCIT_*.tar.gz`
 5) Submit the tarball at http://cran.r-project.org/submit.html or via FTP uisng instructions here: http://cran.r-project.org/banner.shtml#submitting
 6) Tag the release on github:

```bash
# Parse out the version info from the DESCRIOTION file
version=$(grep "^Version:" DESCRIPTION | awk '{print $2}')
# Tag the current branch using the Changelog entry for this version, asthe message
git tag -a "${version}" -F <(perl -e '$v_encountered=0; while(<>){if (/'${version}'/){$v_encountered=1;print;next}; last if /^\d/; print}' ChangeLog)
# Push the tag up to github
git push origin "${version}"
```
