.PHONY: all clean distclean force

MAIN = main
PDF = $(MAIN).pdf

# 收集所有.tex文件作为依赖
TEX_FILES = $(shell find . -name "*.tex")
BIB_FILES = $(wildcard *.bib)

all: $(PDF)

# 使用latexmk编译
$(PDF): $(TEX_FILES) $(BIB_FILES)
	latexmk -pdf $(MAIN)

# 强制重新编译
force:
	latexmk -pdf -f $(MAIN)

# 清理中间文件
clean:
	latexmk -c

# 完全清理（包括PDF）
distclean:
	latexmk -C