USE db_tce;

SELECT 
    YEAR(dt_emissao_despesa) AS year,
    MONTH(dt_emissao_despesa) AS month,
    ds_municipio, ds_funcao_governo,
    SUM(vl_despesa) AS vl_despesa
FROM
    despesas
WHERE
    ano_exercicio = 2017 AND
    ds_municipio IN
		(SELECT name_city FROM ibge
			WHERE population_2018 > 400000)
GROUP BY
	ds_municipio ASC , ds_funcao_governo ASC,
	MONTH(dt_emissao_despesa), YEAR(dt_emissao_despesa);