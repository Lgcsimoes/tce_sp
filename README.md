# Public spending data analysis - Municipalities in São Paulo state, Brazil

This is a live project of the data mining and analysis of public expenditure data from all municipalities in São Paulo state, Brazil, excluding the state capital (São Paulo city). This information is publicly available at the Data Transparency website of [São Paulo state Accounting Office (*TCE-SP, Tribunal de Contas do Estado de São Paulo*)](http://transparencia.tce.sp.gov.br/).

Auxiliary information regarding characteristics from each municipality will be obtained from [IBGE website](https://cidades.ibge.gov.br/pesquisas) (Brazilian Institute of Geography and Statistics, *Instituto Brasileiro de Geografia e Estatística*).

The analysis will be done in multiple steps, using several Python notebooks to focus on one analysis at a time.

## TCE-SP_Scrapper.ipynb

The TCE-SP database used in this study is based [here](http://transparencia.tce.sp.gov.br/municipios-csv). It contains a list of every income and expense entry for every municipality in São Paulo state, Brazil (excluding São Paulo city). Each entry has a detailed description of the event, including multiple information on transaction classification, origin/issuer identification and service description.

This notebook basically scrapes this TCE-SP database, generating a list of all `zip` files to be downloaded, separated by year. Each year comprises of around 1GB of compressed `zip` files and the list of files can be found in the [`zip_files`](https://github.com/Lgcsimoes/tce_sp/tree/master/zip_files) folder in this repository.

## TCE-SP_Despesas_MySQL_Upload.ipynb

This notebook allows the TCE-SP database to be imported into a MySQL table (which was created using the [`scripts/create\_table\_despesas.sql`](https://github.com/Lgcsimoes/tce_sp/blob/master/scripts/create_table_despesas.sql) MySQL script). This step is important for future analyses, where only specific columns and rows can be loaded, given that the complete dataset is too large for loading on usual workstations (around 15GB of RAM per year of data).

The data will be appended into `despesas` MySQL table, located inside `db_tce` MySQL database.

## SP state cities - Overview.ipynb

Data was obtained from [IBGE website](https://www.ibge.gov.br/informacoes-por-cidade-e-estado?t=destaques&c=3549904), clicking on *"Exportar*" on the upper right corner and choosing *"Todos os municípios - SP*" and "*CSV*". A `.csv` file will be downloaded with information about every city from São Paulo state. The data exported from IBGE website can also be found on [`db/municipios_SP_IBGE.csv`](https://github.com/Lgcsimoes/tce_sp/blob/master/db/municipios_SP_IBGE.csv).

The notebook presents an exploratory data analysis (EDA), visually inspecting the boxplot and correlation plots, as well as variable skewness. Boxplots are shown below, where a variable dispersion of 1-2 orders of magnitude can be found for income/spending per capita and child mortality rate, indicating a large discrepancy of such parameters between cities in São Paulo state.

![Boxplots for IBGE database](notebooks/images/ibge_boxplot.png)

The correlation matrix is shown below. Besides some obvious correlations between absolute income, spending and population, IDHM shows some positive correlation to economic variables and a negative correlation to child mortality rate. It is also interesting to note that cities with larger population tend to have higher IDHM.

![Variables correlation for IBGE database](notebooks/images/ibge_correlation.png)

After correcting variable skewness by transforming current features from `x` to `log(1+x)`, the complete dataframe is saved to a MySQL table for future analyses.

## TCE-SP_Despesas_EDA_2017.ipynb

Data from TCE-SP database is analyzed in this notebook only with respect to spending values separated by city and primary category, non-dimensionalized by each city population. Similar categories were grouped in order to make the analysis easier. A boxplot analysis show that administration, education and health are the highest per capita spending categories, followed by social security, social assistance, culture and public security, in descending order. The plot also makes it clear a very large variation in spending per capita between cities.

![Boxplots for reduced TCE-SP database](notebooks/images/tce_40kCities2017_boxplot.png)

A clustering analysis was also performed, trying to identify groups of cities with similar spending per capita. This was made using a simple clustering method (K-means, which considers only linear boundaries for clusters) and also a more complex method (t-SNE, which transform the feature space into a 2D space, trying to maintain non-linear relationships between data points).
