# Reproducible Publishing using Quarto

## Motivation

Loads of tutorials and literature about reproducible research is available but it turned out that there was no repository (that I know of) that reproducibly maps everything from the beginning (data analysis) to the end (publication). This repo is supposed to offer exactly that:
It should be directly usable without customization, but also provide help to be able to adapt it to your own needs at necessary points.

## Preparations

1. Make sure, you have [Docker](https://docs.docker.com/get-docker/) installed
2. Make sure, you have [Git](https://git-scm.com/downloads) installed

## How to use

1. Clone this repository:

    ```bash
    git clone https://github.com/joundso/repub.git
    cd repub
    ```

2. Start the containerized RStudio:

    ```bash
    cd docker
    docker-compose up -d
    ```

3. Open RStudio in your browser at [`http://127.0.0.1:8080/`](http://127.0.0.1:8080/)
   1. Login with the username `rstudio` and password `pwd`
   2. Open the project `repub.Rproj` in the lower right corner of the file browser
4. Build the manuscript in the upper right part of RStudio: `Build` tab --> `Render Book` button
5. See the result in the included viewer or the file in the [`docs`](./docs/) folder

## Questions?

- Bugs or Feature Requests: <https://github.com/joundso/repub/issues>

## Details

### Literature

For the integration of the sources from the `references.bib` file in the continuous text, permanent citation keys are used.
To dynamically create a `references.bib` file, the Zotero plugin (`Better BibTeX for Zotero`)[https://retorque.re/zotero-better-bibtex/] can be used.

1. Install manual: <https://retorque.re/zotero-better-bibtex/installation/>
2. Afterwards, the ['automatic export'](https://retorque.re/zotero-better-bibtex/installation/preferences/automatic-export/) function can be used to automatically create and update a `*.bib` file depending on the content in your Zotero instance.
