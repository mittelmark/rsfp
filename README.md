---
title: rsfp - R single file package
author: Detlef Groth
date: 2024-08-29 09:49
include-before: |
    <style>
    body { max-width: 1000px; font-family: Candara, sans-serif; }
    pre  { font-family: Consolas; monospaced; }
    table { min-width: 400px; border-spacing: 5px;  border-collapse: collapse; }
    </style>
    <center>some links on top</center>
---

## NAME

__rsfp__ - build R packages from only one file
 
## SYNOPSIS

```.bash
### create a new R single file package
Rscript rsfp-src.R --new-package PACKAGENAME
### Create the package files 
Rscript PACKAGENAME-src.R --process
### Build, check and install the package
R CMD build PACKAGENAME
R CMD check PACKAGENAME_VERSION.tar.gz
R CMD INSTALL PACKAGENAME_VERSION.tar.gz
```

Have a look at the [Makefile](Makefile)  which can be used if the tool Make is
installed. 

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

Here is the process visualized:

![Diagram](https://kroki.io/graphviz/svg/eNqdkl9rwjAUxd_3KUqfNmgrY_gkHYj2QVAn0TcZI21u_9CYlCTinPjdl6ZprX2QsfYlueeXw7k3IUUmcJU7yLk8OfpjnMBe5riCkHEFnlRnCmFaUArESzjlIpSYHjjzTgVRefgajD_NQSGr1PHfHRkXe4pjoKHr-wxOfoWTEmfgPHOWwIvb0JqyMCnEja8ET0BKzaYKWA_WVM2vp6tou5nOokF9Hm1naLHZLT7WA-WAGSKDGkLDwqbMuibaNEKmlS9FEqBbjFbTSyt5zazcelh3cXvoqKNSTgkIy5loLaY3o_TItCWxMkKthqzSCjptF3Kk_TvFONYNxceCkn1zd4QrBaQBuvk9gmr_R7qp10CSQ1KaklnVpYJJhSk1RSCF4sJes6lcHIFZqR_QASatPDFv4do70fYWmZ3bvrryHNMj2EnG_LsXphuUM1vNbT7t6to3-haMH5uY-PcmTUfa5IsF9a-wCLKfPzvaOdx7Ltbb3XS5_J_r0_UX7_8oYQ==)

[EditDia](https://niolesk.top/#https://kroki.io/graphviz/svg/eNqdkl9rwjAUxd_3KUqfNmgrY_gkHYj2QVAn0TcZI21u_9CYlCTinPjdl6ZprX2QsfYlueeXw7k3IUUmcJU7yLk8OfpjnMBe5riCkHEFnlRnCmFaUArESzjlIpSYHjjzTgVRefgajD_NQSGr1PHfHRkXe4pjoKHr-wxOfoWTEmfgPHOWwIvb0JqyMCnEja8ET0BKzaYKWA_WVM2vp6tou5nOokF9Hm1naLHZLT7WA-WAGSKDGkLDwqbMuibaNEKmlS9FEqBbjFbTSyt5zazcelh3cXvoqKNSTgkIy5loLaY3o_TItCWxMkKthqzSCjptF3Kk_TvFONYNxceCkn1zd4QrBaQBuvk9gmr_R7qp10CSQ1KaklnVpYJJhSk1RSCF4sJes6lcHIFZqR_QASatPDFv4do70fYWmZ3bvrryHNMj2EnG_LsXphuUM1vNbT7t6to3-haMH5uY-PcmTUfa5IsF9a-wCLKfPzvaOdx7Ltbb3XS5_J_r0_UX7_8oYQ==)

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







