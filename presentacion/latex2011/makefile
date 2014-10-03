DOC = presentacion.tex

PDF = pdflatex

pdf:
	$(PDF) $(DOC) && $(PDF) $(DOC)

clean: 
	$(RM) *.aux *.toc *.log \
	*.lof *.lot *.out *.bbl \
	*.ps *.dvi *.idx *.ind \
	*.ilg *.snm *.nav \
	*.blg *~ *\#
	$(RM) -r auto

clean-all:
	make clean
	$(RM) $(NOM).pdf $(NOM).dvi
