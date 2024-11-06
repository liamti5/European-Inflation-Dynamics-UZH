# european-inflation-dynamics

This is the GitHub Repository for the course Digital Tools for Finance at the University of Zurich. We are analysing European Inflation Dynamics to see if latitude/longitude can explain european differences in inflation dynamics.

![Alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Eurozone_map.svg/1920px-Eurozone_map.svg.png)

By <a href="//commons.wikimedia.org/wiki/User:Ssolbergj" title="User:Ssolbergj">Ssolbergj</a> - <span class="int-own-work" lang="en">Own work</span>, Public Domain, <a href="https://commons.wikimedia.org/w/index.php?curid=2922522">Link</a>

## List of currenices in Europe:

 | Country                 | Currency       | Symbol | Code | Subunit               | Former Currency           |
|-------------------------|----------------|--------|------|------------------------|----------------------------|
| Albania                 | lek           | L      | ALL  | qindarke              | none                       |
| Andorra                 | euro          | €      | EUR  | euro cent             | none official              |
| Armenia                 | dram          | ֏      | AMD  | luma                  | ruble                      |
| Austria                 | euro          | €      | EUR  | euro cent             | schilling                  |
| Azerbaijan              | manat         | ₼      | AZN  | gapik                 | ruble                      |
| Belarus                 | ruble         | Rbl    | BYN  | kopeck                | old ruble                  |
| Belgium                 | euro          | €      | EUR  | euro cent             | franc                      |
| Bosnia and Herzegovina  | mark          | KM     | BAM  | fening                | dinar                      |
| Bulgaria                | lev           | лв.    | BGN  | stotinka              | old lev (BGL)              |
| Croatia                 | euro          | €      | EUR  | euro cent             | Kuna                       |
| Cyprus                  | euro          | €      | EUR  | euro cent             | pound                      |
| Czech Republic          | koruna        | Kč     | CZK  | heller                | Czechoslovak koruna        |
| Denmark                 | krone         | kr.    | DKK  | øre                   | rigsdaler                  |
| Estonia                 | euro          | €      | EUR  | euro cent             | kroon                      |
| Finland                 | euro          | €      | EUR  | euro cent             | markka                     |
| France                  | euro          | €      | EUR  | euro cent             | franc                      |
| Georgia                 | lari          | ₾      | GEL  | tetri                 | kuponi                     |
| Germany                 | euro          | €      | EUR  | euro cent             | mark                       |
| Greece                  | euro          | €      | EUR  | euro cent             | drachma                    |
| Hungary                 | forint        | Ft.    | HUF  | fillér                | pengő                      |
| Iceland                 | króna         | Kr.    | ISK  | aurar                 | old króna                  |
| Ireland                 | euro          | €      | EUR  | euro cent             | punt                       |
| Italy                   | euro          | €      | EUR  | euro cent             | lira                       |
| Latvia                  | euro          | €      | EUR  | euro cent             | lats                       |
| Liechtenstein           | franc         | CHF    | CHF  | rappen                | krone                      |
| Lithuania               | euro          | €      | EUR  | euro cent             | litas                      |
| Luxembourg              | euro          | €      | EUR  | euro cent             | franc                      |
| Malta                   | euro          | €      | EUR  | euro cent             | lira                       |
| Moldova                 | leu           | L      | MDL  | bani                  | cupon                      |
| Monaco                  | euro          | €      | EUR  | euro cent             | franc                      |
| Montenegro              | euro          | €      | EUR  | euro cent             | dinar                      |
| Netherlands             | euro          | €      | EUR  | euro cent             | guilder                    |
| North Macedonia         | denar         | DEN    | MKD  | deni                  | old denar                  |
| Norway                  | krone         | kr.    | NOK  | øre                   | speciedaler                |
| Poland                  | złoty         | zł     | PLN  | grosz                 | old złoty                  |
| Portugal                | euro          | €      | EUR  | euro cent             | escudo                     |
| Romania                 | leu           | lei    | RON  | bani                  | old leu                    |
| Russia                  | ruble         | ₽      | RUB  | kopeck                | Soviet ruble               |
| San Marino              | euro          | €      | EUR  | euro cent             | lira                       |
| Serbia                  | dinar         | DIN    | RSD  | para                  | Yugoslav dinar             |
| Slovakia                | euro          | €      | EUR  | euro cent             | koruna                     |
| Slovenia                | euro          | €      | EUR  | euro cent             | tolar                      |
| Spain                   | euro          | €      | EUR  | euro cent             | peseta                     |
| Sweden                  | krona         | kr.    | SEK  | öre                   | riksdaler                  |
| Switzerland             | franc         | CHF    | CHF  | rappen                | none                       |
| Turkey                  | lira          | ₺      | TRY  | kuruş                 | old lira                   |
| Ukraine                 | hryvnia       | ₴      | UAH  | kopeck (копійка)      | karbovanets                |
| United Kingdom          | sterling      | £      | GBP  | penny (pl. pence)     | pre-decimal sterling       |
| Vatican City            | euro          | €      | EUR  | euro cent             | lira                       |

Source: [Wikipedia](https://en.wikipedia.org/wiki/List_of_currencies_in_Europe)

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

