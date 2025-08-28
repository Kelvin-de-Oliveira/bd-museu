--  Valor total das obras por movimento artístico de todos os museus
SELECT mov.nome AS movimento,
       SUM(art.custo) AS valor_total
FROM movimento mov
INNER JOIN objeto_arte art ON mov.cod = art.ID_mov
GROUP BY mov.nome
ORDER BY valor_total DESC;