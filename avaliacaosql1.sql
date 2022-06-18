use avaliacao;

CREATE TABLE produtos(
cod_prod INT(8) not null primary key,
loj_prod INT(8) not null,
desc_prod VARCHAR(40) not null,
dt_inclu_prod DATE not null,
preco_prod decimal(8,3) not null
);

SELECT * FROM produtos;
INSERT INTO produtos VALUES (1233,2,'LEITE CONDENSADO MOCOCA','2010-10-30',45.40);
UPDATE produtos SET preco_prod = 95.40 WHERE cod_prod = 170 AND loj_prod = 2;

SELECT * FROM produtos WHERE loj_prod = 1 OR loj_prod = 2;
SELECT max(dt_inclu_prod) AS MaiorData , min(dt_inclu_prod) AS MenorData FROM produtos;
SELECT count(*) AS QuantidadeRegistros FROM produtos;
SELECT * FROM produtos WHERE substr(desc_prod,1,1) = "L";
SELECT sum(preco_prod) as SomaTotal FROM produtos;
SELECT sum(preco_prod) AS Total, loj_prod AS Loja FROM produtos GROUP BY loj_prod ;
select sum(preco_prod) as Total, loj_prod AS Loja FROM produtos GROUP BY loj_prod HAVING sum(preco_prod) > 100000;
