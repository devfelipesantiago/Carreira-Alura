-- Exemplo: DATE.;
SELECT
	data_abertura
FROM
	contas;

-- Exemplo: DATETIME.;
SELECT
	data_transacao
FROM
	transacoes;

-- Exemplo: TIMESTAMP.;
SELECT NOW();

-- Exemplo: NOW(), CURDATE(), CURTIME().;
SELECT
	NOW() AS data_hora_atual,
	CURDATE() AS data_atual,
	CURTIME() AS hora_atual;

-- Exemplo: DATE_ADD e DATE_SUB.;
SELECT
	data_transacao,
	DATE_SUB(data_transacao, INTERVAL 30 DAY) AS data_30_dias_antes
FROM
	transacoes;

SELECT
	CURDATE(),
	DATE_ADD(CURDATE(), INTERVAL 1 MONTH) AS proximo_mes;

-- Exemplo: DATEDIFF.;
SELECT
	id_conta,
	DATEDIFF(CURDATE(), data_abertura) AS dias_desde_abertura
FROM
	contas;

-- Exemplo: TIMESTAMPDIFF.;
SELECT
	id_conta,
	TIMESTAMPDIFF(MONTH, data_abertura, CURDATE()) AS meses_de_conta,
	TIMESTAMPDIFF(YEAR, data_abertura, CURDATE()) AS anos_de_conta,
	TIMESTAMPDIFF(DAY, data_abertura, CURDATE()) AS dias_de_conta
FROM
	contas;

-- Exemplo: YEAR, MONTH, DAY.;
SELECT
	YEAR(data_transacao) AS ano,
	MONTH(data_transacao) AS mes,
	COUNT(*) AS total_transacoes
FROM
	transacoes
GROUP BY
	YEAR(data_transacao),
	MONTH(data_transacao);

-- Exemplo: HOUR e MINUTE.;
SELECT
	HOUR(data_transacao) AS hora,
	COUNT(*) AS qtd
FROM
	transacoes
GROUP BY
	HOUR(data_transacao);

-- Exemplo: Formatação de datas – DATE_FORMAT.;
SELECT
	DATE_FORMAT(data_transacao, '%d/%m/%Y %H:%i') AS data_formatada
FROM
	transacoes;

-- Exemplo: Apenas data (padrão brasileiro).;
SELECT
	DATE_FORMAT(data_transacao, '%d/%m/%Y') AS data_br
FROM
	transacoes;

-- Exemplo: Apenas hora.;
SELECT
	DATE_FORMAT(data_transacao, '%H:%i:%s') AS hora
FROM
	transacoes;

-- Exemplo: Mês e ano (relatórios mensais).;
SELECT
	DATE_FORMAT(data_transacao, '%m/%Y') AS mes_ano
FROM
	transacoes;

-- Exemplo: Nome do mês (legível para relatórios).;
SELECT
	DATE_FORMAT(data_transacao, '%M %Y') AS mes_por_extenso
FROM
	transacoes;

-- Exemplo: Dia da semana.;
SELECT
	DATE_FORMAT(data_transacao, '%W') AS dia_da_semana
FROM
	transacoes;

-- Exemplo: Data padrão ISO (integrações).;
SELECT
	DATE_FORMAT(data_transacao, '%Y-%m-%d') AS data_iso
FROM
	transacoes;

-- Exemplo: Ano + trimestre (financeiro).;
SELECT
	CONCAT(
        YEAR(data_transacao),
        ' Q',
        QUARTER(data_transacao)
    ) AS ano_trimestre
FROM
	transacoes;

-- Exemplo: Listando as transações dos últimos 30 dias.;
SELECT
	*
FROM
	transacoes
WHERE
	data_transacao >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- Exemplo: Contas sem movimentação há mais de 60 dias.;
SELECT
	c.id_conta
FROM
	contas c
LEFT JOIN transacoes t ON
	t.id_conta = c.id_conta
GROUP BY
	c.id_conta
HAVING
	MAX(t.data_transacao) < DATE_SUB(CURDATE(), INTERVAL 60 DAY)
	OR MAX(t.data_transacao) IS NULL;
