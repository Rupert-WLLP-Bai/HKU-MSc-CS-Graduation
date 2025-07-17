.PHONY: all clean distclean force

MAIN = main
PDF = $(MAIN).pdf

# 收集所有.tex文件作为依赖
TEX_FILES = $(shell find . -name "*.tex")
BIB_FILES = $(wildcard *.bib)

all: $(PDF)

# 使用 pdflatex + bibtex 编译
$(PDF): $(TEX_FILES) $(BIB_FILES)
	pdflatex $(MAIN)
	bibtex $(MAIN)
	pdflatex $(MAIN)
	pdflatex $(MAIN)

# 强制重新编译
force:
	pdflatex $(MAIN)
	bibtex $(MAIN)
	pdflatex $(MAIN)
	pdflatex $(MAIN)

# 清理中间文件
clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.lof *.lot *.out *.fdb_latexmk *.fls *.synctex.gz
	rm -f *.nav *.snm *.vrb *.bcf *.run.xml *.auxlock

# 完全清理（包括PDF）
distclean: clean
	rm -f $(PDF)