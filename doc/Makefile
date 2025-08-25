# Makefile para compilar documentos LaTeX

# Archivos fuente
TEXSRC = articulo.tex presentacion.tex
PDFSRC = $(TEXSRC:.tex=.pdf)

# Regla por defecto
all: $(PDFSRC)

# Regla general: compilar .tex -> .pdf
%.pdf: %.tex
	pdflatex -interaction=nonstopmode -halt-on-error $<
	# Si quieres compilar dos veces (por índices o refs cruzadas), descomenta:
	# pdflatex -interaction=nonstopmode -halt-on-error $<

# Limpieza de archivos auxiliares
clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.lof *.lot *.fls *.fdb_latexmk

# Limpieza total (incluye PDFs)
distclean: clean
	rm -f $(PDFSRC)

