# Generated by repro: do not edit by hand
# Please edit Dockerfiles in .repro/
FROM rocker/verse:3.6.3
ARG BUILD_DATE=2020-07-13
WORKDIR /home/rstudio
RUN install2.r --error --skipinstalled \ 
  bookdown \ 
  devtools \ 
  here \ 
  usethis
RUN installGithub.r \ 
  aaronpeikert/repro@1bb2e72d
