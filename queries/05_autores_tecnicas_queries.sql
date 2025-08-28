--  Autores mais produtivos
SELECT aut.ID_autor, aut.nome_autor, aut.sobrenome_autor,
       COUNT(art.ID_arte) AS qtd_obras
FROM autores aut
LEFT JOIN objeto_arte art ON aut.ID_autor = art.ID_autor
GROUP BY aut.ID_autor, aut.nome_autor, aut.sobrenome_autor
ORDER BY qtd_obras DESC;


--  Técnicas mais utilizadas por museu
SELECT tec.nome,
    COUNT(art.ID_arte) AS qtd_obras
FROM tecnica tec
INNER JOIN objeto_arte art ON tec.cod = art.ID_tecnica
WHERE art.ID_museu = 1 -- informar ID do museu
GROUP BY tec.nome
ORDER BY qtd_obras DESC;
