# european-inflation-dynamics
> [!NOTE]  
> This repository is part of the Digital Tools for Finance course at the University of Zurich. While the focus of this project involves analyzing European Inflation Dynamics, the primary purpose of this repository is not the research itself. Instead, the emphasis is on developing a well-organized project structure, practicing efficient use of digital tools for research, and understanding software development concepts that can boost productivity in research. See the [it-skills-for-research](https://github.com/ipozdeev/it-skills-for-research/tree/master?tab=readme-ov-file) repo for more info.

##  Setting up Development Environment using Docker

The easiest way to start with this repository is to build the docker image using the provided dockerfile:

`docker build -t european-inflation-dynamics .`

Then, once the image is built, run the docker container
- if you want to keep changes that you make in the container, you can mount your project directory to the container using a volume by running
`docker run -it --rm -p 8888:8888 -v $(pwd):/app european-inflation-dynamics`
- if you **don't** want to keep the changes you make in the container, run `docker run -it -p 8888:8888 --rm european-inflation-dynamics
`

This will open an interactive bash session. You can look around the project, run `make` commands etc. If you want to launch a jupyter server, run the following command:

`jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root`

> [!IMPORTANT]  
> Before starting the jupyter server, make sure to process the external data. See section below!

## Processing external data

In order to create the processed data necessary to run the final report, please run the bellow command:

`make data`

This will process the external data and save the processed data to the `data/processed/` folder.



## Compiling .tex files

Pull the latest texlive image:

`docker pull texlive/texlive:latest`

Run the docker image within your working directory as an interactive terminal:

`docker run -it -v "$(pwd):/workdir" texlive/texlive /bin/bash`

To compile the .tex files, run the pdflatex command:

`pdflatex report.tex`

You should see the resulting `report.pdf` in your folder. 

## Naming Conventions for Jupyter Notebooks

`0.01-pjb-data-source-1.ipynb`

0.01 - Helps keep work in chronological order. The structure is PHASE.NOTEBOOK. NOTEBOOK is just the Nth notebook in that phase to be created. For phases of the project, we generally use a scheme like the following, but you are welcome to design your own conventions:
- 0 - Data exploration - often just for exploratory work
- 1 - Data cleaning and feature creation - often writes data to data/processed or data/interim
- 2 - Visualizations - often writes publication-ready viz to reports
- 3 - Modeling - training machine learning models
- 4 - Publication - Notebooks that get turned directly into reports

## Project Organization

```
├── LICENSE            <- Open-source license if one is chosen
├── Makefile           <- Makefile with convenience commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default mkdocs project; see www.mkdocs.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── pyproject.toml     <- Project configuration file with package metadata for 
│                         european_inflation_dynamics and configuration for tools like black
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── setup.cfg          <- Configuration file for flake8
│
└── european_inflation_dynamics   <- Source code for use in this project.
    │
    ├── __init__.py             <- Makes european_inflation_dynamics a Python module
    │
    ├── config.py               <- Store useful variables and configuration
    │
    ├── dataset.py              <- Scripts to download or generate data
    │
    ├── features.py             <- Code to create features for modeling
    │
    ├── modeling                
    │   ├── __init__.py 
    │   ├── predict.py          <- Code to run model inference with trained models          
    │   └── train.py            <- Code to train models
    │
    └── plots.py                <- Code to create visualizations
```

--------



