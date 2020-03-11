all: apa7.csl
	Rscript -e 'bookdown::render_book("_output.yml", output_format = "all")'
clean:
	Rscript -e 'bookdown::clean_book(TRUE)'
publish: all
	./publish.sh
apa7.csl:
	wget -O $@ https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl
