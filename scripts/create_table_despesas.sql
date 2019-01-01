#SHOW DATABASES;
USE db_tce;

DROP TABLE despesas;

CREATE TABLE `despesas` (
	`id_despesa_detalhe` INT UNSIGNED NOT NULL,
	`ano_exercicio` YEAR NOT NULL,
	`vl_despesa` DECIMAL(13,2) NOT NULL,
	`cd_programa` MEDIUMINT UNSIGNED NOT NULL,
	`cd_acao` MEDIUMINT UNSIGNED NOT NULL,
	#`vl_acumulado` DECIMAL(14,2) NOT NULL,
    `dt_emissao_despesa` DATE NOT NULL,
    `ds_municipio` VARCHAR(40) NOT NULL,
	`ds_orgao` VARCHAR(110) NOT NULL,
	`nr_empenho` VARCHAR(30) NOT NULL,
	`identificador_despesa` VARCHAR(100) NOT NULL,
	`ds_despesa` VARCHAR(110) NOT NULL,
	`ds_funcao_governo` VARCHAR(40) NOT NULL,
	`ds_subfuncao_governo` VARCHAR(70) NOT NULL,
	`ds_programa` VARCHAR(110) NOT NULL,
	`ds_acao` VARCHAR(110) NOT NULL,
	`ds_fonte_recurso` VARCHAR(110) NOT NULL,
	`ds_cd_aplicacao_fixo` VARCHAR(100) NOT NULL,
	`ds_modalidade_lic` VARCHAR(70) NOT NULL,
	`ds_elemento` VARCHAR(150) NOT NULL,
	`historico_despesa` TEXT,
	`ds_cpf_cnpj` VARCHAR(20) NOT NULL,
	`ds_tipo_identif` VARCHAR(40) NOT NULL #,
    #PRIMARY KEY (`id_despesa_detalhe`),
    #UNIQUE KEY `id_despesa_detalhe_db_tce_UNIQUE` (`id_despesa_detalhe`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=4;

SHOW TABLES;