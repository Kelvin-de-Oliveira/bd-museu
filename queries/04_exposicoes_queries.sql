--  Exposições em um período por museu

SELECT ID_expo, nome_expo, data_inicio, data_fim
FROM exposicao
WHERE ID_museu = 1
  AND (
        (data_inicio BETWEEN '2023-02-19' AND '2023-02-21')
        OR (data_fim BETWEEN '2023-02-19' AND '2023-02-21')
        OR (data_inicio <= '2023-02-19' AND (data_fim IS NULL OR data_fim >= '2023-02-21'))
      )
ORDER BY data_inicio;

--  Exposições em andamento por museu
SELECT ID_expo, nome_expo, data_inicio, data_fim
FROM exposicao
WHERE data_fim IS NULL
  AND ID_museu = 1 -- informar ID do museu
ORDER BY data_inicio;

--  Obras de uma exposição específica
SELECT ae.ID_objeto, ae.nome_obra
FROM artes_expo ae
INNER JOIN exposicao expo ON ae.ID_expo = expo.ID_expo
WHERE expo.ID_expo = 1 -- informar ID da exposição
  AND expo.ID_museu = 1 -- informar ID do museu
ORDER BY ae.nome_obra;

--  Exposições e número de obras exibidas por museu
SELECT expo.ID_expo, expo.nome_expo,
     COUNT(ae.ID_objeto) AS qtd_obras
FROM exposicao expo
LEFT JOIN artes_expo ae ON expo.ID_expo = ae.ID_expo
WHERE expo.ID_museu = 1  -- informar ID do museu
GROUP BY expo.ID_expo, expo.nome_expo
ORDER BY qtd_obras DESC;