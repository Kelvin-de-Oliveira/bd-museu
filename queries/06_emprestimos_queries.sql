--  Obras emprestadas com atraso por museu
SELECT art.ID_arte, art.titulo,
       emp.data_para_devolucao, emp.data_devolucao,
       (emp.data_devolucao - emp.data_para_devolucao) AS dias_atraso
FROM objeto_arte art
INNER JOIN emprestimo emp ON art.ID_arte = emp.ID_objeto
WHERE emp.data_devolucao > emp.data_para_devolucao
  AND art.ID_museu = 1; -- informar ID do museu