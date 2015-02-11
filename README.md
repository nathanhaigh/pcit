[![Build Status](https://travis-ci.org/nathanhaigh/pcit.png?branch=master)](https://travis-ci.org/nathanhaigh/pcit)
pcit
====

PCIT: an R package for weighted gene co-expression networks based on partial correlation and information theory approaches

Building and Submitting Packages
================================
1) Update "Version" and "Date" in the DESCRIPTION file
2) Add info about changes since last release to ChangeLog file
3) `R CMD build pcit`
4) Check the built tarball: `R CMD check --as-cran PCIT_*.tar.gz`
5) Submit the tarball at http://cran.r-project.org/submit.html or via FTP uisng instructions here: http://cran.r-project.org/banner.shtml#submitting

