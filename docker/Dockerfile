FROM rocker/r-ver:4.3.0

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
    org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
    org.opencontainers.image.vendor="Rocker Project" \
    org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

## In all rocker-images there is this magic folder with lots of predefined scripts for installing stuff
## like `shiny`, `quarto`, `python` including all necessarry system libraries:
## https://github.com/rocker-org/rocker-versioned2/tree/master/scripts
## So to get an image with RStudio, Quarto, TeX and some publishing stuff, we need to combine:
## - RStudio image (including Quarto)
## - (tidy)verse (including TeX and publishing packages like `bookdown`)

## #################################
## ----- Environment variables: -----
## #################################
## From: https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/rstudio_4.3.0.Dockerfile
ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=2023.03.0+386
ENV DEFAULT_USER=rstudio
ENV PANDOC_VERSION=default
ENV QUARTO_VERSION=default
## Quarto versions: https://quarto.org/docs/download/
# ENV QUARTO_VERSION=1.3.324
## From: https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/verse_4.3.0.Dockerfile
ENV CTAN_REPO=https://mirror.ctan.org/systems/texlive/tlnet
ENV PATH=$PATH:/usr/local/texlive/bin/linux


## #################################
## ----- Installation scripts: -----
## #################################
## From: https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/rstudio_4.3.0.Dockerfile
## --> https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_rstudio.sh
## --> https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_pandoc.sh
## --> https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_quarto.sh
RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh
RUN /rocker_scripts/install_quarto.sh

## From: https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/tidyverse_4.3.0.Dockerfile
## --> https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_tidyverse.sh
RUN /rocker_scripts/install_tidyverse.sh

## From: https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/verse_4.3.0.Dockerfile
## --> https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_verse.sh
RUN /rocker_scripts/install_verse.sh


## #################################
## ----- Custom stuff for our needs: -----
## #################################
## Install some system libraries we need
RUN apt-get update && apt-get install -y --no-install-recommends \
    # ca-certificates important for curl from https:
    ca-certificates \
    curl \
    libssl-dev \
    libxml2-dev && \
    ## Clear caches:
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /home/${USER}/.cache/pip/* && \
    apt-get clean all && \
    apt-get autoclean && \
    apt-get autoremove -y


## Install some packages we need during this tutorial:
RUN install2.r --error \
    cleaR \
    DIZtools \
    ggplot2 \
    htmltools \
    jsonlite \
    knitr \
    rmarkdown \
    ## Clear caches:
    && rm -rf /tmp/downloaded_packages \
    && rm -rf /var/lib/apt/lists/*

## Start RStudio at init:
## -----------------------
## From: https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/rstudio_4.3.0.Dockerfile
EXPOSE 8787
CMD ["/init"]
