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
Rscript PACKAGENAME-src.R --build   PACKAGENAME
Rscript PACKAGENAME-src.R --check   PACKAGENAME_VERSION.tar.gz
Rscript PACKAGENAME-src.R --install PACKAGENAME_VERSION.tar.gz
```

Have a look at the [Makefile](Makefile)  which can be used if the tool Make is
installed. 

## EXAMPLE

Let's create a package called `sbi`.

```
### creating a file sbi-src.R
Rscript rsfp-src.R --new-package sbi
### Edit this file with your editor like me/geany/vim
### Change the author and the package title for now
me sbi-src.R
### creating the package structure in sbi folder
Rscript sbi-src.R --process sbi
### processing the package code into a installable package
Rscript sbi-src.R --build sbi
### testing it
Rscript sbi-src.R --check sbi_0.0.1.tar.gz
### installing it
Rscript sbi-src.R --install sbi_0.0.1.tar.gz
```

Here is the process visualized:

![Diagram](https://kroki.io/graphviz/svg/eNqtVEFv2yAUvvdXIO-ySbazVe2pcqUqy6GHdhHZLYoqbJ5tZAwWEHVt1f8-wJg40ZZJ1fDB8L2P7308nk1Zo8jQIozeLpAdQlLY1lIYQXookqXsWYU2RGj0sElS3ZIBCiENpNq8cChqxjnQ1L0qyaUqNOG9FOkzo6YtvuXXO68KtPm76khReqhRdot0ybaclMCLBB0PrCvFBmOZ9ZBpVeUYZZmA52wgVUcacFvRJ_RZigq-BFUHjaKUqX_oWlKUHZSsQOsZ5oRrA2KmbCWd-OPdw2qzvluuTvDvq80S369_3v94PIn0RGB6gmF8Cqy7JlZmsn44-8HGFItep3tK3EUd2Z1RF5FVS05BBZ63NtHsYlHvhZWkIYzxFMMhMgWs22hyYfVjxCu6A5V7xul27BsqjQE6EmL9zpGc_rm4xx2haqHqPORnDmJCG8J56ERmpAo94ZE3pIjobOP2cDOFb3zjvM92TGdb-VUy7_jupeR7SMdVyW0zhsqW8tfMXCzcH9ptdG-RJHw5V_l1eiwfJeeJdoeDnpMfK2GRJ5G7xxCVN68fyhVqeS5boPzXfO7Cwmfu4TDfjjsNKY_Kf7icElgDIe9l2tpVa-xv6Sp1PyPNXqG4_Lq7eP8NBC2byw==)

[Edit this diagram](https://niolesk.top/#https://kroki.io/graphviz/svg/eNqtVEFv2yAUvvdXIO-ySbazVe2pcqUqy6GHdhHZLYoqbJ5tZAwWEHVt1f8-wJg40ZZJ1fDB8L2P7308nk1Zo8jQIozeLpAdQlLY1lIYQXookqXsWYU2RGj0sElS3ZIBCiENpNq8cChqxjnQ1L0qyaUqNOG9FOkzo6YtvuXXO68KtPm76khReqhRdot0ybaclMCLBB0PrCvFBmOZ9ZBpVeUYZZmA52wgVUcacFvRJ_RZigq-BFUHjaKUqX_oWlKUHZSsQOsZ5oRrA2KmbCWd-OPdw2qzvluuTvDvq80S369_3v94PIn0RGB6gmF8Cqy7JlZmsn44-8HGFItep3tK3EUd2Z1RF5FVS05BBZ63NtHsYlHvhZWkIYzxFMMhMgWs22hyYfVjxCu6A5V7xul27BsqjQE6EmL9zpGc_rm4xx2haqHqPORnDmJCG8J56ERmpAo94ZE3pIjobOP2cDOFb3zjvM92TGdb-VUy7_jupeR7SMdVyW0zhsqW8tfMXCzcH9ptdG-RJHw5V_l1eiwfJeeJdoeDnpMfK2GRJ5G7xxCVN68fyhVqeS5boPzXfO7Cwmfu4TDfjjsNKY_Kf7icElgDIe9l2tpVa-xv6Sp1PyPNXqG4_Lq7eP8NBC2byw==)

This process can be as well done within a R console like this:

```{r eval=FALSE}
> library(tools) ## for calling Rcmd
> ## file creation sbi-src.R should be done only one time
> source("rsfp-src.R") 
> Main(c("rsfp-src.R","--new-package","sbi"))
> ## the lines below will be done again and again in development
> ## add your functions to the file sbi-src.R in your editor
> Main(c("sbi-src.R","--process","sbi-src.R"))
> Main(c("sbi-src.R","--build","sbi"))
> Main(c("sbi-src.R","--check","sbi_0.0.1.tar.gz"))
> ## add more functions, fix errors in your editor
> ## then rebuld everything
> Main(c("sbi-src.R","--process","sbi-src.R"))
> ### etc
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

## VIGNETTES 

Vignettes are tutorial on how to use a package. If the user calls the the
`rsfp-src.R` script with the `--new-package` function there will be
automatically a package vignette file created which is called
`PACKAGENAME-vignette.Rmd`. In this the user can write a litte tutorial for
the package. During the package build procedure using the `--build` option
this file is automatically copied to the package vignettes folder. If you
prefere to use an other name you just manually copy this file between calling
`--process` and `--build` this file to the vignette folder.

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







