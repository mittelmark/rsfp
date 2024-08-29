#!/usr/bin/env Rscript
#' FILE: rsfp/DESCRIPTION
#' Package: rsfp
#' Type: Package
#' Title: R single file dummy package
#' Version: 0.0.1
#' Date: 2024-08-28
#' Author: Detlef Groth
#' Authors@R: c(person("Detlef","Groth", role=c("aut", "cre"),
#'                   email = "dgroth@uni-potsdam.de",
#'                   comment=c(ORCID="0000-0002-9441-3978")))
#' Maintainer: Detlef Groth <dgroth@uni-potsdam.de>
#' Description: 
#'    This is a package template which you can use to start your own,
#'    package, all package content is placed in one file.
#' URL:  https://github.com/mittelmark/dummy
#' BugReports: https://github.com/mittelmark/rsfp/issues
#' Depends: R (>= 3.5.0)
#' Suggests: knitr, rmarkdown
#' VignetteBuilder: knitr
#' License: MIT + file LICENSE
#' Language: en-US
#' Encoding: UTF-8
#' NeedsCompilation: no
#' Collate: rsfp.R add.R

#' FILE: rsfp/LICENSE
#' YEAR: 2024
#' COPYRIGHT HOLDER: Detlef Groth

#' FILE: rsfp/NEWS
#' 2024-08-28: Version 0.0.1 - Initial Release

#' FILE: rsfp/NAMESPACE
#' exportPattern("^[[:lower:]]+")
#' importFrom("stats", "sd")

#' FILE: rsfp/inst/files/decathlon.tab
#' 100	long	shot	high	400	110	disq	pole	jave	1500
#' 1	32	7.43	15.48	2.27	29.4479	26.1732	49.28	4.7	61.32	20.0781
#' 2	33.1187	7.45	14.97	1.97	30.1824	27.3859	44.36	5.1	61.76	19.7788
#' 3	32.2004	7.44	14.2	1.97	29.8198	26.7387	43.66	5.2	64.16	20.5167
#' 4	33.8983	7.38	15.02	2.03	29.3518	26.9022	44.8	4.9	64.04	18.9401
#' 5	32.6679	7.43	12.92	1.97	30.3541	27.5	41.2	5.2	57.46	21.0411
#' 6	33.241	7.72	13.58	2.12	29.789	27.9267	43.06	4.9	52.18	19.703
#' 7	32.2004	7.05	14.12	2.06	29.1852	27.5191	41.68	5.7	61.6	18.544
#' 8	32.5792	6.95	15.34	2	29.8693	27.5766	41.32	4.8	63	20.3114
#' 9	32.287	7.12	14.52	2.03	29.2981	27.0123	42.36	4.9	66.46	20.0282
#' 10	32.057	7.28	15.25	1.97	29.6296	26.8293	48.02	5.2	59.48	18.478
#' 11	32.9068	7.45	15.34	1.97	28.8346	27.7895	41.86	4.8	66.64	18.25
#' 12	32.2004	7.34	14.48	1.94	29.3758	26.2078	42.76	4.7	65.84	21.033
#' 13	32.6679	7.29	12.92	2.06	29.8569	26.506	39.54	5	56.8	20.9424
#' 14	32.7571	7.37	13.61	1.97	30.1066	26.9388	43.88	4.3	66.54	20.0766
#' 15	32.6383	7.45	14.2	1.97	29.4238	25.6477	41.66	4.7	64	20.1884
#' 16	32.4617	7.08	14.51	2.03	28.8635	26.793	43.2	4.9	57.18	20.1087
#' 17	31.4136	6.75	16.07	2	28.0811	24.6575	50.66	4.8	72.6	17.856
#' 18	31.115	7	16.6	1.94	28.8925	26.4	46.66	4.9	60.2	18.8785
#' 19	32.5203	7.04	13.41	1.94	30.0188	26.4706	40.38	4.5	51.5	20.5785
#' 20	33.0579	7.07	15.84	1.79	28.9855	25.7477	45.32	4.9	60.48	19.4356
#' 21	31.25	7.36	13.93	1.94	28.8058	25.3197	38.82	4.6	67.04	20.2687
#' 22	31.3316	7.02	13.8	2.03	28.4585	26.0184	39.08	4.7	60.92	20.5378
#' 23	31.6344	7.08	14.31	2	28.6624	26.4529	46.34	4.4	55.68	19.8034
#' 24	31.8584	6.97	13.23	2.15	28.8115	25.7477	38.72	4.6	54.34	19.4356
#' 25	32.7273	7.23	13.15	2.03	28.9564	26.4706	38.06	4.5	52.82	18.9095
#' 26	31.7741	6.83	11.63	2.06	29.7705	25.731	37.52	4.6	55.42	19.9948
#' 27	32.4324	6.98	12.69	1.82	29.6114	26.1732	38.04	4.7	49.52	20.6186
#' 28	31.2772	7.01	14.17	1.94	28.147	26.087	45.84	4.6	56.28	17.8118
#' 29	31.9716	6.9	12.41	1.88	29.8507	25.3684	38.02	4.4	52.68	19.8486
#' 30	31.3043	7.09	12.94	1.82	29.2267	25.4499	42.32	4.5	53.5	18.3767
#' 31	31.4961	6.22	13.98	1.91	28.0976	24.937	46.18	4.6	57.84	18.3057
#' 32	31.3862	6.43	12.33	1.94	28.6282	26.4	38.72	4	57.26	18.3849
#' 33	31.115	7.19	10.27	1.91	28.3968	24.4444	34.36	4.1	54.94	20.0015

#' FILE: rsfp/man/rsfp-package.Rd
#' \name{rsfp-package}
#' \alias{rsfp-package}
#' \title{rsfp-package - methods for the ...}
#' \description{The rsfp package contains methods ...
#'    ...
#' }
#' \details{
#' This is a collection of useful functions shown ...
#' \describe{
#' \item{\link[rsfp:rsfp_add]{rsfp$add(x,y)}}{simple adding function for illustration}
#' }
#' }
#' \value{returns the result of addition of x and y} 
#' \examples{
#' x=1; y=2
#' rsfp_add(x,y)
#' } 
#' \author{Detlef Groth, University of Potsdam}

#' FILE: rsfp/man/rsfp.Rd
#' \name{rsfp}  
#' \alias{rsfp} 
#' \alias{rsfp-class} 
#' \title{Environment object with functions for ...} 
#' \description{ 
#' The functions within the rsfp environment are functions used in ...
#' }
#' \section{Methods}{ 
#' \itemize{ 
#' \item \code{\link[rsfp:rsfp_add]{rsfp$add(x,y)}}{add two numbers}
#' }
#' } 
#' \examples{ 
#' class(rsfp)
#' ls(rsfp) ## methods
#' }

#' FILE: rsfp/R/rsfp.R
## rsfp-environment

rsfp=new.env()

## Actual code starts
## Functions documentation, protect percent signs % with backslashes \%

#' FILE: rsfp/man/rsfp_add.Rd
#' \name{rsfp$add}
#' \alias{rsfp$add}
#' \alias{rsfp_add}
#' \title{add two numbers}
#' \usage{rsfp_add(x,y)}
#' \description{Return the result of addition for two numbers}
#' \arguments{
#'   \item{x}{a number}
#'   \item{y}{a number}
#' }
#' \details{
#' Some more details about the function ...
#' }
#' \value{the result of the addition of the two numbers}
#' \examples{
#' data(iris)
#' rsfp$add(iris$Sepal.Length,iris$Sepal.Width)
#' rsfp$add(1,2)
#' }
#'
#' \seealso{\link[rsfp:rsfp-package]{rsfp-package}}
#' FILE: rsfp/R/add.R
rsfp$add <- function (x,y) {
    return(x+y)
}

rsfp_add = rsfp$add

#' FILE: EOF

USAGE = "
Usage:
=====
  %s [OPTIONS] [PKGNAME|SRCFILE|PKGDIR|PKGFILE]

  OPTIONS

    --help                 - show this help page%s
    --process      SRCFILE - create package structure from the given
                             R package source file
    --build        PKGDIR  - build a package from the given package dir
    --check        PKGFILE - check the given package file (tar.gz file)
    --install      PKGFILE - install the given package file (tar.gz file)
    
  ARGUMENTS
  
    PKGNAME - the name of a new package, name should only consist of
              letters and numbers
    SRCFILE - a R package source file like sbi-src.R
    PKGDIR  - the directory containing the package files created
    PKGFILE - the package tar.gz file made from the --build argument
    
  AUTHOR
  
    Detlef Groth, University of Potsdam  
    
  HELP     
  
    Use the issue tracker at Github https://github.com/mittelmark/rsfp/issues
  
  LICENSE and COPYRIGHT
  
    Copyright : 2024 - Detlef Groth, University of Potsdam  
    License   : See the file LICENSE
    
    
"
NP="
--new-package  PKGNAME - create a new PKGNAME-src.R file
"

Usage <- function (argv) {
    if (!grepl("rsfp-src.",argv[1])) {
        help=sprintf(USAGE,argv[1],"")
    } else {
        help=sprintf(USAGE,argv[1],NP)
    }
    cat(help)
}
Main <- function (argv) {
    VERSION=""
    PACKAGE=""
    if ("--help" %in% argv) {
        Usage(argv)
        
    } else if ("--new-package" %in% argv & length(argv) == 3) {
        if (!grepl("rsfp",argv[1])) {
            cat("Error: Only the file rspf-src.R can be used to create new packages!\n")
            return()
        }
        idx=which(argv=="--new-package") ;
        if (idx != 2) {
            Usage(argv)
        } else {
            new_pkgname = argv[3]
            if (!grepl("^[a-zA-Z][A-Za-z0-9]{2,}$",new_pkgname)) {
                cat("Error: The package name should only consist of numbers and letters!\n")
            } else {
                fin = file(argv[1],'r')
                outname = paste(new_pkgname,"-src.R",sep="")
                if (file.exists(outname)) {
                    cat(sprintf("Error: File '%s' already exists, remove if you like to create a new package!\n",outname))
                    return()
                }
                fout = file(outname,'w')
                main = FALSE
                while(length((line = readLines(fin,n=1)))>0) {
                    if (grepl("^#' +FILE: +EOF",line)) {
                        main = TRUE      
                    } 
                    if (main) {
                        cat(sprintf("%s\n",line),file=fout)
                    } else {
                        cat(sprintf("%s\n",gsub("rsfp",new_pkgname,line)),file=fout)
                    }
                }
                close(fin)
                close(fout)
            }
        }
    } else if ("--build" %in% argv & length(argv) == 3) {
        library(tools)
        tools::Rcmd(c("build", argv[3]))
    } else if ("--check" %in% argv & length(argv) == 3) {
        library(tools)
        tools::Rcmd(c("check", argv[3]))
    } else if ("--install" %in% argv & length(argv) == 3) {
        library(tools)
        tools::Rcmd(c("INSTALL", argv[3]))
    } else if ("--process" %in% argv & length(argv) > 2) {
        idx=which(argv=="--process")
        rfile = argv[idx+1]
        if (!file.exists(rfile)) {
            cat(sprintf("Error: File '%s' does not exists!",rfile))
            return
        }
        fin = file(rfile,'r')
        fout = NULL
        while(length((line = readLines(fin,n=1)))>0) {
            if (grepl("^#' +FILE:",line)) {
                f = gsub("#' +FILE: +([^ ]+)","\\1",line)
                if (!is.null(fout)) {
                    close(fout)
                    fout = NULL
                }
                if (f == "EOF") {
                    next
                }
                print(paste("creating", f))
                if (grepl(".+/",f)) {
                    d = gsub("(.+)/.+","\\1",f) 
                    if (!dir.exists(d)) {
                        print(paste("creating",d))
                        dir.create(d,recursive=TRUE,showWarnings=FALSE)
                    }
                    fout=file(f,'w') 
                    next
                } else {
                    fout=file(f,'w') 
                }
            } else if (!is.null(fout)) {
                if (grepl("^#' Package:",line)) {
                    PACKAGE=gsub("^#' Package: +([^ ]+) ?.*","\\1",line)
                } else if (grepl("^#' Version:",line)) {
                    VERSION=gsub("^#' Version: +([^ ]+) ?.*","\\1",line)
                }            
                cat(gsub("^#' ?","",line),"\n",file=fout)
           }
        }
        close(fin)
        if (!is.null(fout)) {
            close(fout)
        }
        ## TODO extract 
        ## DESCRIPTION, NAMESPACE, LICENSE, NEWS
        ## extract tests/* files
        ## extract inst/files/* files
        cat("\nDone!\n\nYou can create and install a package file like this:\n\n")
        cat(sprintf("  cd %s\n",PACKAGE))
        cat("  R CMD build .\n")
        cat(sprintf("  R CMD check %s_%s.tar.gz\n",PACKAGE, VERSION))
        cat(sprintf("  R CMD INSTALL %s_%s.tar.gz\n\n", PACKAGE, VERSION))
    } else {
        Usage(argv)
    }
}
if (sys.nframe() == 0L && !interactive()) {
    ## extract application's filename
    binname = gsub("--file=", "", grep("--file", commandArgs(), value=TRUE)[1])
    Main(c(binname,commandArgs(trailingOnly=TRUE)))
    
}
