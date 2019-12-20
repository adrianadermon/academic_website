# Makefile for converting markdown CV to PDF
vpath index.md ./content/CV
vpath CV.pdf ./static/pdf
vpath latex_header.tex ./static/tex

PANDOC_OPTIONS=--standalone --metadata date="`date "+%B %e, %Y"`"
LATEX_OPTIONS=--pdf-engine=xelatex --include-in-header=./static/tex/latex_header.tex --variable=subparagraph --variable papersize=a4

all: CV.pdf 

CV.pdf: index.md latex_header.tex
	pandoc $(PANDOC_OPTIONS) $(LATEX_OPTIONS) -o ./static/pdf/$@ $<
