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
#  Last Modified : <240828.1626>
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

pkg=rsfp
VERSION=$(shell grep -Eo "^#' Version: [.0-9]+" *-src.R | sed -E 's/.+: //g; s/ //g;')
default:
	Rscript $(pkg)-src.R --process $(pkg)-src.R
	cd $(pkg) && R CMD build .
	cd $(pkg) && R CMD check $(pkg)_$(VERSION).tar.gz
	

