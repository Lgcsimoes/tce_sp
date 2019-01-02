# Public spending data analysis - Municipalities in São Paulo state, Brazil

This is a live project of the data mining and analysis of public expenditure data from all municipalities in São Paulo state, Brazil, excluding the state capital (São Paulo city). This information is publicly available at the Data Transparency website of [São Paulo state Accounting Office (*TCE-SP, Tribunal de Contas do Estado de São Paulo*)](http://transparencia.tce.sp.gov.br/).

Auxiliary information regarding characteristics from each municipality will be obtained from [IBGE website](https://cidades.ibge.gov.br/pesquisas) (Brazilian Institute of Geography and Statistics, *Instituto Brasileiro de Geografia e Estatística*).

The analysis will be done in multiple steps, using several Python notebooks to focus on one analysis at a time.

## TCE-SP_Scrapper.ipynb

The TCE-SP database used in this study is based [here](http://transparencia.tce.sp.gov.br/municipios-csv). It contains a list of every income and expense entry for every municipality in São Paulo state, Brazil (excluding São Paulo city). Each entry has a detailed description of 

This notebook basically scrapes this TCE-SP database, generating a list of all `zip` files to be downloaded, separated by year. Each year comprises of around 1GB of compressed `zip` files and the list of files can be found in the [`zip_files`](https://github.com/Lgcsimoes/tce_sp/tree/master/zip_files) folder in this repository.

## TCE-SP_Despesas_MySQL_Upload.ipynb

MySQL upload notebook

## SP state cities - Overview.ipynb

Data was obtained from [IBGE website](https://www.ibge.gov.br/informacoes-por-cidade-e-estado?t=destaques&c=3549904), clicking on *"Exportar*" on the upper right corner and choosing *"Todos os municípios - SP*" and "*CSV*". A `.csv` file will be downloaded with information about every city from São Paulo state.
