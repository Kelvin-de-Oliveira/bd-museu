--  Obras que podem ser emprestadas (não permanentes) por museu
SELECT ID_arte, titulo
FROM objeto_arte
WHERE permanente = 'N'
  AND ID_museu = 1 -- informar ID do museu
ORDER BY titulo;


--  Obras devolvidas a partir de certa data por museu
SELECT art.ID_arte, art.titulo
FROM objeto_arte art
INNER JOIN emprestimo emp ON art.ID_arte = emp.ID_objeto
WHERE emp.data_devolucao >= '2015-06-28'
  AND art.ID_museu = 1 -- informar ID do museu
ORDER BY emp.data_devolucao;

--  Obras devolvidas depois da data marcada para devolução por museu
SELECT art.ID_arte, art.titulo
FROM objeto_arte art
INNER JOIN emprestimo emp ON art.ID_arte = emp.ID_objeto
WHERE emp.data_devolucao > emp.data_para_devolucao
  AND art.ID_museu = 1 -- informar ID do museu
ORDER BY emp.data_devolucao;

--  Obras ainda não devolvidas por museu
SELECT art.ID_arte, art.titulo
FROM objeto_arte art
INNER JOIN emprestimo emp ON art.ID_arte = emp.ID_objeto
WHERE emp.data_devolucao IS NULL
  AND art.ID_museu = 1 -- informar ID do museu
ORDER BY emp.data_para_devolucao;

--  Obras permanentes de um museu
SELECT *
FROM objeto_arte
WHERE permanente = 'S'
  AND ID_museu = 1 -- informar ID do museu
ORDER BY titulo;

--  Obras de um autor específico em todos os museus
SELECT aut.nome_autor AS NOME, aut.sobrenome_autor AS SOBRENOME,
       art.ID_arte, art.titulo
FROM objeto_arte art
INNER JOIN autores aut ON art.ID_autor = aut.ID_autor
WHERE aut.ID_autor = 5 -- informar ID do autor
ORDER BY art.titulo;

--  Obras por categoria e museu
-- Pintura
SELECT art.ID_arte, art.titulo, p.comprimento, p.largura
FROM pintura p
INNER JOIN objeto_arte art ON art.ID_arte = p.ID_objeto
WHERE art.ID_museu = 1 -- informar ID do museu
ORDER BY art.titulo;

-- Escultura
SELECT art.ID_arte, art.titulo, e.altura, e.peso
FROM escultura e
INNER JOIN objeto_arte art ON art.ID_arte = e.ID_objeto
WHERE art.ID_museu = 1 -- informar ID do museu
ORDER BY art.titulo;

-- Genérico
SELECT art.ID_arte, art.titulo, g.descricao
FROM generico g
INNER JOIN objeto_arte art ON art.ID_arte = g.ID_objeto
WHERE art.ID_museu = 1 -- informar ID do museu
ORDER BY art.titulo;

--  Obras acima da média de custo por museu
WITH media AS (
    SELECT AVG(custo) AS avg_custo
    FROM objeto_arte
    WHERE ID_museu = 1 -- informar ID do museu
)
SELECT art.ID_arte, art.titulo, art.custo, media.avg_custo
FROM objeto_arte art
CROSS JOIN media
WHERE art.custo > media.avg_custo
  AND art.ID_museu = 1 -- informar ID do museu
ORDER BY art.custo DESC;

--  Obras abaixo da média de custo por museu
WITH media AS (
    SELECT AVG(custo) AS avg_custo
    FROM objeto_arte
    WHERE ID_museu = 1 -- informar ID do museu
)
SELECT art.ID_arte, art.titulo, art.custo, media.avg_custo
FROM objeto_arte art
CROSS JOIN media
WHERE art.custo < media.avg_custo
  AND art.ID_museu = 1 -- informar ID do museu
ORDER BY art.custo ASC;