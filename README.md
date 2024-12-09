# european-inflation-dynamics
> [!NOTE]  
> This repository is part of the Digital Tools for Finance course at the University of Zurich. While the focus of this project involves analyzing European Inflation Dynamics, the primary purpose of this repository is not the research itself. Instead, the emphasis is on developing a well-organized project structure, practicing efficient use of digital tools for research, and understanding software development concepts that can boost productivity in research. See the [it-skills-for-research](https://github.com/ipozdeev/it-skills-for-research/tree/master?tab=readme-ov-file) repo for more info.

## Abstract

This project analyzes European inflation dynamics with a focus on the
effects of longitude and latitude on inflation rates. By examining spatial
patterns across different countries, the study aims to uncover how geographic location influences economic indicators within Europe. Utilizing
data visualization and statistical modeling, the project provides insights
into regional inflation trends and their relationship with geographical co-
ordinates. Our research shows that geographical coordinates play a minor role in explaining inflation rates.
Longitude's significance suggests potential east-west economic trends, while latitude appears to have no impact. 
This is further supported by the correlation matrix, where longitude consistently shows a stronger relationship with inflation rates across all years (except 2009). 
However, the low R-squared indicates that geographic data alone is insufficient to model inflation, emphasizing the need to incorporate other economic factors for 
a more comprehensive analysis.

```
OLS Regression Results                            
==============================================================================
Dep. Variable:              OBS_VALUE   R-squared:                       0.205
Model:                            OLS   Adj. R-squared:                  0.144
Method:                 Least Squares   F-statistic:                     3.362
Date:                Mon, 09 Dec 2024   Prob (F-statistic):             0.0503
Time:                        13:39:59   Log-Likelihood:                -69.342
No. Observations:                  29   AIC:                             144.7
Df Residuals:                      26   BIC:                             148.8
Df Model:                           2                                         
Covariance Type:            nonrobust                                         
==============================================================================
                 coef    std err          t      P>|t|      [0.025      0.975]
------------------------------------------------------------------------------
Intercept      4.8369      3.838      1.260      0.219      -3.053      12.727
latitude      -0.0556      0.074     -0.755      0.457      -0.207       0.096
longitude      0.1022      0.043      2.372      0.025       0.014       0.191
==============================================================================
Omnibus:                       45.716   Durbin-Watson:                   1.979
Prob(Omnibus):                  0.000   Jarque-Bera (JB):              198.622
Skew:                           3.175   Prob(JB):                     7.41e-44
Kurtosis:                      14.138   Cond. No.                         386.
==============================================================================

Notes:
[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
```

##  Setting up Development Environment using Docker to reproduce findings

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

> [!TIP]
> If references in the resulting pdf don't show correctly, run the `biber report` command. This should solve the issue. 

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
├── Makefile           <- Makefile with convenience commands like `make data` or `make train`
├── Dockerfile         <- Dockerfile to dockerize the project to easily reproduce our research.
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── pyproject.toml     <- Project configuration file with package metadata for 
│                         european_inflation_dynamics and configuration for tools like black
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── setup.cfg          <- Configuration file for flake8
│
└── european_inflation_dynamics <- Source code for use in this project.
    │
    ├── __init__.py             <- Makes european_inflation_dynamics a Python module
    │
    ├── config.py               <- Store useful variables and configuration
    │
    └──dataset.py               <- Scripts to download or generate data
```

--------



