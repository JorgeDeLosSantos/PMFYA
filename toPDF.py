# -*- coding: utf-8 -*-
# @autor: Jorge De Los Santos
#

import os
import os.path
from glob import glob

def latex2pdf(filename):
	""" Compile latex source with out index """
	this = "pdflatex -synctex=1 -interaction=nonstopmode "+filename
	os.system(this)

def latex2pdf_idx(filename):
	""" Compile latex source with index or table of contents """
	this_01 = "pdflatex -synctex=1 -interaction=nonstopmode "+filename
	this_02 = "makeindex "+filename
	os.system(this_01)
	os.system(this_02) 
	os.system(this_01)

def get_name(_path):
	_fln = os.path.split(_path)
	filename = _fln[1]
	return filename

def change_ext(name,current,replace):
	loc = len(current)
	return name[:-loc]+replace

def main():
	INDEX = True
	OPEN_FILE = True
	# Search tex file
	to_search = os.getcwd()+"\\*.tex"
	tex_info = glob(to_search)
	if len(tex_info)>1:
		filename = "PMFYA.tex"
	filename = get_name("".join(tex_info))
	if not(INDEX):
		latex2pdf(filename)
	else:
		latex2pdf_idx(filename)
	if OPEN_FILE:
		os.startfile(change_ext(filename,"tex","pdf"))
	
if __name__=='__main__':
	main()
