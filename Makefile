##-*- makefile -*-############################################################
#  Created By    : Detlef Groth, University of Potsdam
#  Created       : Wed Aug 28 16:08:38 2024
#  Last Modified : <240829.0855>
#
#  Description	 : Makefile for creating packages from the sfrp-src.R script
#
##############################################################################
#
#  Copyright (c) 2024 Detlef Groth, University of Potsdam
# 
#  MIT-License - see the file LICENSE in this folder
#
##############################################################################

pkg=sbi
VERSION=$(shell grep -Eo "^#' Version: [.0-9]+" $(pkg)-src.R | sed -E 's/.+: //g; s/ //g;')
help:
	@printf "Usage:\n"
	@printf "   make new\n      for creating a single file package (default) sbi\n"
	@printf "   make new pkg=xyz\n     for creating a single file package named xyz\n"
	@printf "   make package pkg=sbi\n      for creating a true R package named xyz\n" 
new:
	Rscript rsfp-src.R --new-package $(pkg)
package:
	Rscript $(pkg)-src.R --process $(pkg)-src.R
	R CMD build $(pkg)
	R CMD check $(pkg)_$(VERSION).tar.gz
	

