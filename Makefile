all: apa7.csl images/nutshell.svg images/nutshell.pdf
	Rscript -e 'bookdown::render_book("_output.yml", output_format = "all")'
images/nutshell.svg:
	wget -O $@ https://github.com/aaronpeikert/reproducible-research/raw/master/Images/nutshell.svg
images/nutshell.pdf:
	wget -O $@ https://github.com/aaronpeikert/reproducible-research/raw/master/Images/nutshell.pdf
clean:
	Rscript -e 'bookdown::clean_book(TRUE)'
publish: all
	./publish.sh
apa7.csl:
	wget -O $@ https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl
