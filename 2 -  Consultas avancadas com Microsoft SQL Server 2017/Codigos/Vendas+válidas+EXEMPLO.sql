SELECT * FROM [TABELA DE CLIENTES]

SELECT * FROM [ITENS NOTAS FISCAIS]

SELECT * FROM [NOTAS FISCAIS]

SELECT * FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 

SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7) AS ANO_MES
, INF.QUANTIDADE  FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 

SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7) AS ANO_MES
, SUM(INF.QUANTIDADE) AS QUANTIDADE_MES  FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 
GROUP BY NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7)

SELECT TC.NOME, TC.[VOLUME DE COMPRA] FROM [TABELA DE CLIENTES] TC

SELECT * FROM [TABELA DE CLIENTES] TC

SELECT TC.NOME, CQ.ANO_MES, CQ.QUANTIDADE_MES, TC.[VOLUME DE COMPRA]
FROM
(SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7) AS ANO_MES
, SUM(INF.QUANTIDADE) AS QUANTIDADE_MES  FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 
GROUP BY NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7)) CQ
INNER JOIN [TABELA DE CLIENTES] TC ON TC.CPF = CQ.CPF

SELECT AUX1.NOME, AUX1.ANO_MES, AUX1.QUANTIDADE_MES, 
CASE WHEN AUX1.QUANTIDADE_MES <= AUX1.[VOLUME DE COMPRA] THEN 'VENDA V�LIDA'
WHEN AUX1.QUANTIDADE_MES > AUX1.[VOLUME DE COMPRA] THEN 'VENDA INV�LIDA'
END AS STATUS_VENDA
FROM 
(SELECT TC.NOME, CQ.ANO_MES, CQ.QUANTIDADE_MES, TC.[VOLUME DE COMPRA]
FROM
(SELECT NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7) AS ANO_MES
, SUM(INF.QUANTIDADE) AS QUANTIDADE_MES  FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF
ON NF.NUMERO = INF.NUMERO 
GROUP BY NF.CPF, SUBSTRING(CONVERT(VARCHAR, NF.[DATA], 120),1,7)) CQ
INNER JOIN [TABELA DE CLIENTES] TC ON TC.CPF = CQ.CPF) AUX1
ORDER BY AUX1.NOME, AUX1.ANO_MES













