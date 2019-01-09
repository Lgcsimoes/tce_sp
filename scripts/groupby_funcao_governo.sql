USE db_tce;

SELECT 
    ds_municipio, ds_funcao_governo, SUM(vl_despesa)
FROM
    despesas
WHERE
    ano_exercicio = 2017 AND
    ds_municipio IN
		(SELECT name_city FROM ibge
			WHERE population_2018 > 40000)
GROUP BY ds_municipio ASC , ds_funcao_governo ASC;