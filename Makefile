##-*- makefile -*-############################################################
#
#  System        : 
#  Module        : 
#  Object Name   : $RCSfile$
#  Revision      : $Revision$
#  Date          : $Date$
#  Author        : $Author$
#  Created By    : Detlef Groth
#  Created       : Wed Aug 28 16:08:38 2024
#  Last Modified : <240829.0851>
#
#  Description	
#
#  Notes
#
#  History
#	
#  $Log$
#
##############################################################################
#
#  Copyright (c) 2024 Detlef Groth.
# 
#  All Rights Reserved.
# 
#  This  document  may  not, in  whole  or in  part, be  copied,  photocopied,
#  reproduced,  translated,  or  reduced to any  electronic  medium or machine
#  readable form without prior written consent from Detlef Groth.
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
	

