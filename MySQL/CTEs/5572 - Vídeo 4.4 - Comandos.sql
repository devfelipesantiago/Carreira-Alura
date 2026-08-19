-- Exemplo: Total movimentado por cliente nos últimos 30 dias.;
WITH ultimos_30_dias AS (
	SELECT
		*
	FROM
		transacoes
	WHERE
		data_transacao >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
),
total_por_conta AS (
	SELECT
		id_conta,
		SUM(valor) AS total_conta,
		COUNT(*) AS qtd_transacoes
	FROM
		ultimos_30_dias
	GROUP BY
		id_conta
),
total_por_cliente AS (
	SELECT
		c.id_cliente,
		c.nome,
		SUM(tc.total_conta) AS total_cliente,
		SUM(tc.qtd_transacoes) AS transacoes_cliente
	FROM
		clientes c
	JOIN contas ct ON
		c.id_cliente = ct.id_cliente
	JOIN total_por_conta tc ON
		ct.id_conta = tc.id_conta
	GROUP BY
		c.id_cliente,
		c.nome
)
SELECT
	*
FROM
	total_por_cliente
ORDER BY
	total_cliente DESC;

-- Exemplo: Contas sem movimentação, mas ativas.;
WITH contas_sem_transacoes AS (
	SELECT
		ct.id_conta,
		ct.numero_conta,
		c.nome AS cliente
	FROM
		contas ct
	LEFT JOIN transacoes t ON
		ct.id_conta = t.id_conta
	JOIN clientes c ON
		c.id_cliente = ct.id_cliente
	WHERE
		t.id_transacao IS NULL
		AND ct.id_status = 1
		-- supondo status 1 = ativa
)
SELECT * FROM contas_sem_transacoes;

-- Exemplo: Obter o extrato resumido por tipo de conta (ticket médio, volume, etc.).;
WITH transacoes_tipos AS (
	SELECT
		tp.nome AS tipo_conta,
		t.valor
	FROM
		transacoes t
	JOIN contas ct ON
		t.id_conta = ct.id_conta
	JOIN tipos_conta tp ON
		ct.id_tipo_conta = tp.id_tipo_conta
)
SELECT
	tipo_conta,
	COUNT(*) AS total_transacoes,
	SUM(valor) AS volume_total,
	AVG(valor) AS ticket_medio,
	MAX(valor) AS maior_valor,
	MIN(valor) AS menor_valor
FROM
	transacoes_tipos
GROUP BY
	tipo_conta
ORDER BY
	volume_total DESC;

-- Exemplo: Volume e comportamento agrupado por tipo de conta.;
WITH total_por_conta AS (
	SELECT
		id_conta,
		SUM(valor) AS total
	FROM
		transacoes
	GROUP BY
		id_conta
),
total_por_cliente AS (
	SELECT
		c.id_cliente,
		c.nome,
		SUM(tc.total) AS total_cliente
	FROM
		clientes c
	JOIN contas ct ON
		c.id_cliente = ct.id_cliente
	JOIN total_por_conta tc ON
		ct.id_conta = tc.id_conta
	GROUP BY
		c.id_cliente,
		c.nome
),
ranking AS (
	SELECT
		*,
		RANK() OVER (
		ORDER BY
			total_cliente DESC
		) AS posicao
	FROM
		total_por_cliente
)
SELECT
	*
FROM
	ranking
WHERE
	posicao <= 20;

-- Exemplo: Identificar transações atípicas (acima de 2x a média do cliente).;
WITH media_por_cliente AS (
	SELECT
		ct.id_conta,
		AVG(t.valor) AS media_cliente
	FROM
		transacoes t
	JOIN contas ct ON
		t.id_conta = ct.id_conta
	GROUP BY
		ct.id_conta
),
transacoes_acima_do_dobro AS (
	SELECT
		t.*,
		m.media_cliente
	FROM
		transacoes t
	JOIN media_por_cliente m ON
		t.id_conta = m.id_conta
	WHERE
		t.valor > (
			m.media_cliente * 2
		)
)
SELECT
	*
FROM
	transacoes_acima_do_dobro
ORDER BY
	valor DESC;
