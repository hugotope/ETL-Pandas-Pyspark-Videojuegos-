-- Modelo Data Warehouse PySpark
-- Dimension tables
CREATE TABLE dim_game (
    id_game INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    genre TEXT
);

CREATE TABLE dim_platform (
    id_platform INTEGER PRIMARY KEY AUTOINCREMENT,
    platform TEXT NOT NULL
);

CREATE TABLE dim_developer (
    id_developer INTEGER PRIMARY KEY AUTOINCREMENT,
    developer TEXT NOT NULL
);

CREATE TABLE dim_publisher (
    id_publisher INTEGER PRIMARY KEY AUTOINCREMENT,
    publisher TEXT NOT NULL
);

CREATE TABLE dim_year (
    id_year INTEGER PRIMARY KEY AUTOINCREMENT,
    year INTEGER NOT NULL
);

-- Fact table
CREATE TABLE fact_sales (
    id_fact INTEGER PRIMARY KEY AUTOINCREMENT,
    id_game INTEGER,
    id_platform INTEGER,
    id_developer INTEGER,
    id_publisher INTEGER,
    id_year INTEGER,
    copies_sold_millions REAL,
    revenue_millions_usd REAL,
    FOREIGN KEY (id_game) REFERENCES dim_game(id_game),
    FOREIGN KEY (id_platform) REFERENCES dim_platform(id_platform),
    FOREIGN KEY (id_developer) REFERENCES dim_developer(id_developer),
    FOREIGN KEY (id_publisher) REFERENCES dim_publisher(id_publisher),
    FOREIGN KEY (id_year) REFERENCES dim_year(id_year)
);