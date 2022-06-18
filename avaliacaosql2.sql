CREATE DATABASE avaliacao2;
use avaliacao2;

CREATE TABLE lojas(
	  loj_prod INT(8) not null primary key COMMENT 'Código da Loja',
	  desc_loj VARCHAR(40) not null COMMENT 'Descrição da Loja'
);

CREATE TABLE estoque(
	  cod_prod INT(8) not null primary key COMMENT 'Código do Produto',
    loj_prod INT(8) not null COMMENT 'Código da Loja',
    qtd_prod DECIMAL(15,3) COMMENT 'Quantidade em Estoque do Produto',
    FOREIGN KEY(loj_prod) references lojas(loj_prod)
);

CREATE TABLE produtos(
	  cod_prod INT(8) not null COMMENT 'Código do Produto',
    loj_prod INT(8) not null COMMENT 'Código da Loja',
    desc_prod VARCHAR(40) not null COMMENT 'Descrição do Produto',
    dt_inclu_prod DATE not null COMMENT 'Data de Inclusão do Produto',
    preco_prod DECIMAL(8,3) not null COMMENT 'Preço do Produto',
    FOREIGN KEY(cod_prod) REFERENCES estoque(cod_prod),
    FOREIGN KEY(loj_prod) REFERENCES lojas(loj_prod)
);

SELECT lojas.loj_prod ,lojas.desc_loj,estoque.cod_prod,estoque.qtd_prod,produtos.preco_prod FROM lojas LEFT JOIN estoque ON estoque.loj_prod = lojas.loj_prod LEFT JOIN produtos ON produtos.preco_prod;
SELECT * FROM produtos LEFT JOIN estoque ON estoque.cod_prod = produtos.cod_prod WHERE estoque.cod_prod != produtos.cod_prod;
SELECT * FROM estoque LEFT JOIN produtos ON produtos.cod_prod = estoque.cod_prod WHERE produtos.cod_prod != estoque.cod_prod;
