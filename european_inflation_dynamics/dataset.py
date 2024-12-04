from pathlib import Path

import typer
from loguru import logger
from tqdm import tqdm
import pandas as pd

from config import PROCESSED_DATA_DIR, RAW_DATA_DIR, EXTERNAL_DATA_DIR

app = typer.Typer()


def data_inflation_rates():
    df = pd.read_csv(EXTERNAL_DATA_DIR / "oecd-european-inflation-rates-since-2000.csv")
    df = df[["Reference area", "TIME_PERIOD", "OBS_VALUE"]]

    df_countries = df.drop_duplicates(subset=["Reference area"])["Reference area"].to_frame()
    df_countries.to_feather(PROCESSED_DATA_DIR / "countries-with-inflation-data.ftr")

    df_clean = df[(df["TIME_PERIOD"] >= "2005-12") & (df["TIME_PERIOD"] <= "2024-09")]
    df_clean.to_feather(PROCESSED_DATA_DIR / "inflation-data-clean.ftr")


def data_long_lat():
    df_european_countries = pd.read_feather(
        PROCESSED_DATA_DIR / "countries-with-inflation-data.ftr"
    ).rename(columns={"Reference area": "name"})
    country_name_changes = {
        "Turkey": "Türkiye",
        "Czech Republic": "Czechia",
        "Slovakia": "Slovak Republic",
    }
    df_all_countries = pd.read_csv(EXTERNAL_DATA_DIR / "countries_lat_long_google.csv")
    for old_name, new_name in country_name_changes.items():
        df_all_countries["name"] = df_all_countries["name"].replace({old_name: new_name})
    df_long_lat = pd.merge(df_european_countries, df_all_countries, on="name", how="inner")
    df_long_lat.to_feather(PROCESSED_DATA_DIR / "countries-with-long-lat-data.ftr")


@app.command()
def main():
    PROCESSED_DATA_DIR.mkdir(parents=True, exist_ok=True)
    logger.info("Processing dataset...")

    data_functions = [
        (name, func)
        for name, func in globals().items()
        if callable(func) and name.startswith("data_")
    ]
    for _, function in tqdm(data_functions, total=len(data_functions)):
        function()

    logger.success("Processing datasets complete.")


if __name__ == "__main__":
    app()
