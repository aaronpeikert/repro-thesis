PROJECT := reprothesis
WORKDIR := $(CURDIR)

# list below your targets and their recipies
all: apa7.csl images/nutshell.svg images/nutshell.pdf *.Rmd images/rmarkdown.svg
	$(RUN1) Rscript -e 'bookdown::render_book("_output.yml", output_format = "all")' $(RUN2)

### Wrap Commands ###
# if a command is to be send to another process e.g. a container/scheduler use:
# $(RUN1) mycommand --myflag $(RUN2)
RUN1 = $(QRUN1) $(SRUN) $(DRUN)
RUN2 = $(QRUN2)

### Rmd's ###
include .repro/Makefile_Rmds

### Docker ###
# this is a workaround for windows users
# please set WINDOWS=TRUE and adapt WINPATH if you are a windows user
# note the unusual way to specify the path
WINPATH = //c/Users/someuser/Documents/myproject/
include .repro/Makefile_Docker

images/nutshell.svg:
	wget -O $@ https://github.com/aaronpeikert/reproducible-research/raw/master/Images/nutshell.svg
images/nutshell.pdf:
	wget -O $@ https://github.com/aaronpeikert/reproducible-research/raw/master/Images/nutshell.pdf
clean:
	Rscript -e 'bookdown::clean_book(TRUE)'
publish:
	make all DOCKER=TRUE \
	&& ./publish.sh
apa7.csl:
	wget -O $@ https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl
images/rmarkdown.svg: images/rmarkdown.pdf
	$(RUN1) inkscape --export-plain-svg=$@ $< $(RUN2)
