FROM rocker/verse:4.4.0

## In all rocker-images there is this magic folder with lots of predefined scripts for installing stuff
## like `shiny`, `quarto`, `python` including all necessarry system libraries:
## https://github.com/rocker-org/rocker-versioned2/tree/master/scripts
## So to get an image with RStudio, Quarto, TeX and some publishing stuff, we need to combine:
## - RStudio image (including Quarto)
## - (tidy)verse (including TeX and publishing packages like `bookdown`)
## --> rbase --> rstudio --> tidyverse --> verse


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

