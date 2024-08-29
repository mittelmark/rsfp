---
title: rsfp - R single file package
author: Detlef Groth
date: 2024-08-29 08:35
include-before: |
    <style>
    body { max-width: 1000px; font-family: Candara, sans-serif; }
    pre  { font-family: Consolas; monospaced; }
    table { min-width: 400px; border-spacing: 5px;  border-collapse: collapse; }
    </style>
    <center>some links on top</center>
---

## NAME

__rsfp__ - build R packages from only one file.
 
## SYNOPSIS

```
Rscript rsfp-src.R --new-package PACKAGENAME
Rscript PACKAGENAME-src.R --process
R CMD build PACKAGENAME
R CMD check PACKAGENAME_VERSION.tar.gz
R CMD INSTALL PACKAGENAME_VERSION.tar.gz
```

Have a look at the [Makefile](Makefile)  which can be used if the tool Make is
installed. 

<center>

![Diagram](https://kroki.io/graphviz/svg/eNqVUl1rwjAUffdXlD5t0FbG8Ek6EO2DoE6ibzJG2tx-0JiUJCJO_O9L07TWMjbWviTnnHs49-aSIhO4yh3kXEeO_hgncJA5riBkXIEn1YVCmBaUAvESTrkIJaZHzrxzQVQevgSTD1MoZJU6_psj4-JAcQw0dH2fwdmvcFLiDJwnzhJ4dhu1VlkxKcRdXwmegJRamypgPbFW1frNbB3ttrN5NMAX0W6Oltv98n0zYI6YITLAEBoC2zLrmmjTCJlWvhRJgO4xWk4fLeU1s3LrYT3E7UnHnSrllICwOhOtlenLOD0xbUksjVDLIcu0hE7bhRxr_44xjnVD8amg5NC8HeFKAWkE3fx-E9X-v_EGrwVJDklpIHOqoYJJhSk1IJBCcWGf2SBXR2BW6gU6wrSlp2YXbr2KtrfI3Nx268pLTE_Qi9CNx5mvFzaV9nLtZr4Gk59KTdTH0ia9Lv1kQf0rLILs6w8f2-mj03Kz289Wq_94jUa3b_heGV8=)

[Edit](https://niolesk.top/#https://kroki.io/graphviz/svg/eNqVUl1rwjAUffdXlD5t0FbG8Ek6EO2DoE6ibzJG2tx-0JiUJCJO_O9L07TWMjbWviTnnHs49-aSIhO4yh3kXEeO_hgncJA5riBkXIEn1YVCmBaUAvESTrkIJaZHzrxzQVQevgSTD1MoZJU6_psj4-JAcQw0dH2fwdmvcFLiDJwnzhJ4dhu1VlkxKcRdXwmegJRamypgPbFW1frNbB3ttrN5NMAX0W6Oltv98n0zYI6YITLAEBoC2zLrmmjTCJlWvhRJgO4xWk4fLeU1s3LrYT3E7UnHnSrllICwOhOtlenLOD0xbUksjVDLIcu0hE7bhRxr_44xjnVD8amg5NC8HeFKAWkE3fx-E9X-v_EGrwVJDklpIHOqoYJJhSk1IJBCcWGf2SBXR2BW6gU6wrSlp2YXbr2KtrfI3Nx268pLTE_Qi9CNx5mvFzaV9nLtZr4Gk59KTdTH0ia9Lv1kQf0rLILs6w8f2-mj03Kz289Wq_94jUa3b_heGV8=)

</center>

## EXAMPLE

Let's create a package called `sbi`.

```
### creating a file sbi-src.R
Rscript rsfp-src.R --new-package sbi
### Edit this file with your editor like me == MicroEmacs
me sbi-src.R
### creating the package structure in sbi folder
Rscript sbi-src.R --process 
### processing the package code into a installable package
R CMD build sbi
R CMD check sbi_0.0.1.tar.gz
R CND INSTALL sbi_0.0.1.tar.gz
```

This process can be as well done within a R console like this:

```{r eval=FALSE}
> library(tools) ## for calling Rcmd
> ## file creation sbi-src.R should be done only one time
> source("rsfp-src.R") 
> Main(c("rsfp-src.R","--new-package","sbi"))
> ## the lines below will be done again and again in development
> ## add your functions to the file sbi-src.R in your editor
> Main("sbi-src.R","--process","sbi-src.R")
> tools::Rcmd(c("build", "sbi"))
> tools::Rcmd(c("check", "sbi_0.0.1.tar.gz"))
> ## add more functions, fix errors in your editor
> setwd("..")
> Main("sbi-src.R","--process","sbi-src.R")
> setwd("sbi") ### etc
```

## DESCRIPTION

Single file approch for R packages. Build your R package from a single file.
The source file  contains the files  required to build a package in a single R
script  where the  different  files are marked  within R comments. A rsfp file
has FILE marks  embedded  with the source  file to  indicate  where a new file
starts.  During  processing  these  files are  created in the current  working
directory.

```{.r}
#' FILE: rsfp/DESCRIPTION
#' Package: rsfp
#' Type: Package
#' Title: R single file dummy package
...

#' FILE: rsfp/LICENSE
#' YEAR: 2024
#' COPYRIGHT HOLDER: Detlef Groth

#' FILE: rsfp/NEWS
#' 2024-08-28: Version 0.0.1 - Initial Release
...

#' FILE: rsfp/man/add.Rd
#' \name{add}
#' \alias{add}
...

#' FILE: rsfp/R/add.R
add <- function (x,y) {
    return(x,y)
}
...
```

## BACKGROUND

Creating  R  packages  is a  laborius  approach.  You  need to have a  certain
directory  structure,  files  like  NAMESPACE  and  DESCRIPTION  and the users
usually jumps between these different files around and has to do the neccesary
edits to get a starting package. Although it is recommended for my students to
start for their  projects by  collecting  their code in  packages,  due to the
complicated  techniques they usually end up with a unorganized collection of R
script files and  documentation. It is true that there are existing R packages
which help in package  development  like devtools or roxygen2 but they are too
complicated and huge to do a simple package. The package devtools for instance,
installs around 60-80 other required  packages and required more than 400MB of
disk space if everything is installed. 

In contrast the __rsfp__  approach just needs a basic R  installation  and one
single  file, the  rsfp-src.R  script.  The  basic  procedure  to create a new
package based on the file __rsfp-src.R__ is to call the Rscript file with the 
`--new-package` argument like this.

```
Rscript rsfp-src.R --new-package sbi
```

This will create a file  `sbi-src.R` in the current  folder which is a copy of
the file  `rsfp-src.R`  but with all  appearances  of the string "rsfp" replaced
with the string  "sbi" - the new  package  name  string. You can then add your
code  to  the  file  `sbi-src.R`  and  remove  the  example  function(s)  like
`sbi_add`.  Please  note,  that  all  functions  in  this  file  belong  to an
environment  object,  called  `sbi`,  like the  package  name.  This  allows a
flexible export of all functions for instance into a RDS file.







