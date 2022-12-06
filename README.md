# Reproducible Publishing using Quarto

## Motivation

Loads of tutorials and literature about reproducible research is available but it turned out that there was no repository (that I know of) that reproducibly maps everything from the beginning (data analysis) to the end (publication). This repo is supposed to offer exactly that:
It should be directly usable without customization, but also provide help to be able to adapt it to your own needs at necessary points.

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

3. Open RStudio in your browser at [`http://127.0.0.1:8787/`](http://127.0.0.1:8787/) and open the project `repub.Rproj` in the lower right corner.
4. Build the manuscript using the `Render Book` Button in the upper right sub-window

## Questions?

- Bugs or Feature Requests: <https://github.com/joundso/repub/issues>
