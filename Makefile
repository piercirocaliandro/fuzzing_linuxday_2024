main:
	latexmk -pdflatex='pdflatex' -pdf linux_day_2024.tex

clean:
	latexmk -pdf -C
	rm *-blx.bib *bbl *nav *snm
