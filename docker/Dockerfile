FROM rocker/rstudio:4.2.3

## In all rocker-images there is this magic folder with lots of predefined scripts for installing stuff
## like `shiny`, `quarto`, `python` including all necessarry system libraries:
## https://github.com/rocker-org/rocker-versioned2/tree/master/scripts

## In rstudio, this is already installed:
## (Source: https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/rstudio_4.2.2.Dockerfile)
## - pandoc
## - quarto


## Install LaTeX:
# ENV CTAN_REPO=https://mirror.ctan.org/systems/texlive/tlnet
# ENV PATH=$PATH:/usr/local/texlive/bin/linux
# RUN /rocker_scripts/install_verse.sh
# RUN /rocker_scripts/install_texlive.sh
RUN quarto install tool tinytex
RUN tlmgr path add
# RUN R -q -e "tinytex::install_tinytex()"


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
