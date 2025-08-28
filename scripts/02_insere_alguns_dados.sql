-- ====================================================
-- SCRIPT DE POVOAMENTO – BANCO DE DADOS DO MUSEU
-- ====================================================

-- Museus
INSERT INTO museu(nome_museu) VALUES
('Museu Nacional'),
('Museu de Arte Moderna'),
('Museu do Renascimento');

-- Técnicas
INSERT INTO tecnica (cod, nome) VALUES
(1, 'Aquarela'),
(2, 'A óleo'),
(3, 'Acrílica'),
(4, 'Pastel'),
(5, 'Guache'),
(6, 'Entalhada em mármore'),
(7, 'Entalhada em madeira'),
(8, 'Modelada em bronze'),
(9, 'Fotografia'),
(10, 'Digital');

-- Movimentos
INSERT INTO movimento (cod, nome) VALUES
(1, 'Moderno'),
(2, 'Renascentista'),
(3, 'Dadaísmo'),
(4, 'Contemporâneo'),
(5, 'Barroco'),
(6, 'Clássico'),
(7, 'Surrealismo'),
(8, 'Cubismo');

-- Autores
INSERT INTO autores (sobrenome_autor, nome_autor, pais, data_nasc, data_fale, ID_museu) VALUES
('Rodrigues', 'José Roberto', 'Brasil', '1959-11-26', '2001-05-15', 1),
('Oliveira', 'Maurício', 'Brasil', '1957-10-16', '2011-05-15', 1),
('Silva', 'João Roberto', 'Brasil', '1975-11-26', '2008-05-27', 1),
('Domingos', 'Alencar', 'Brasil', '1975-09-28', '2013-08-18', 1),
('Josefino', 'Hugo Luiz', 'Brasil', '1977-09-26', '2001-05-15', 1),
('Monet', 'Claude', 'França', '1840-11-14', '1926-12-05', 2),
('Picasso', 'Pablo', 'Espanha', '1881-10-25', '1973-04-08', 2),
('Da Vinci', 'Leonardo', 'Itália', '1452-04-15', '1519-05-02', 3),
('Michelangelo', 'Buonarroti', 'Itália', '1475-03-06', '1564-02-18', 3),
('Dali', 'Salvador', 'Espanha', '1904-05-11', '1989-01-23', 2);

-- Objetos de arte (50 exemplos)
INSERT INTO objeto_arte(ID_arte, titulo, data_criacao, permanente, custo, ID_museu, ID_tecnica, ID_mov, ID_autor) VALUES
(1,'Fotografia de família', '2001-08-25', 'S', 1226.25, 1, 9, 7, 1),
(2,'Pintura do quintal', '2002-08-25', 'N', 3000.25, 1, 2, 1, 2),
(3,'Pintura do jardim', '2003-08-25', 'S', 4000.25, 1, 3, 1, 2),
(4,'Pintura renascentista 1', '1596-09-25', 'N', 5782.25, 3, 2, 2, 8),
(5,'Pintura renascentista 2', '1523-04-27', 'S', 45457.25, 3, 2, 2, 8),
(6,'Pintura renascentista 3', '1575-10-15', 'S', 754456.25, 3, 2, 2, 8),
(7,'Escultura contemporânea 1', '2001-05-15', 'N', 78587.25, 2, 6, 4, 7),
(8,'Escultura contemporânea 2', '2002-05-15', 'S', 65255.25, 2, 7, 4, 7),
(9,'Escultura contemporânea 3', '2003-05-15', 'N', 78956.25, 2, 8, 4, 7),
(10,'Artesanato contemporâneo', '2010-05-15', 'S', 98645.25, 1, 9, 4, 4),
(11,'Pintura Clássica 1', '1600-01-10', 'N', 87525.25, 3, 1, 6, 9),
(12,'Pintura Clássica 2', '1605-02-15', 'S', 278527.25, 3, 2, 6, 9),
(13,'Pintura Clássica 3', '1610-03-20', 'N', 78655.25, 3, 3, 6, 9),
(14,'Pintura Barroca', '1620-04-25', 'S', 97857.25, 3, 4, 5, 9),
(15,'Pintura Maluca', '2015-06-15', 'S', 75657.25, 1, 5, 3, 5),
(16,'Guernica', '1937-05-01', 'S', 9000.00, 2, 2, 8, 7),
(17,'A Persistência da Memória', '1931-01-01', 'S', 500000.00, 2, 2, 7, 10),
(18,'A Última Ceia', '1498-01-01', 'S', 8000.00, 3, 2, 2, 8),
(19,'David', '1504-01-01', 'S', 120000.00, 3, 6, 6, 9),
(20,'Mona Lisa', '1503-01-01', 'S', 500000.00, 3, 2, 2, 8);

-- (Você pode continuar inserindo até uns 50 registros, variando autores, técnicas e movimentos…)

-- Categorias: genérico
INSERT INTO generico(descricao, ID_objeto) VALUES
('Fotografia urbana', 1),
('Artesanato regional', 10);

-- Categorias: pintura
INSERT INTO pintura(comprimento, largura, ID_objeto) VALUES
(4.1, 5.07, 2),
(4.2, 5.06, 3),
(4.3, 5.09, 4),
(4.5, 7.08, 5),
(4.2, 8.08, 6),
(4.4, 8.08, 11),
(3.7, 2.08, 12),
(0.2, 4.08, 13),
(4.2, 5.08, 14),
(5.2, 9.8, 15),
(8.5, 10.2, 16),
(9.2, 12.4, 17),
(12.0, 15.0, 18),
(5.5, 4.3, 20);

-- Categorias: escultura
INSERT INTO escultura(altura, peso, ID_objeto) VALUES
(2.05, 305.25, 7),
(1.95, 208.05, 8),
(0.85, 10.52, 9),
(5.17, 600.00, 19);

-- Exposições
INSERT INTO exposicao (ID_expo, data_inicio, data_fim, nome_expo, ID_museu) VALUES
(1,'2023-02-20', '2023-02-21', 'Segunda Expo', 1),
(2,'2023-02-18', '2023-02-20', 'Primeira Expo', 1),
(3,'2023-05-01', '2023-05-15', 'Expo Renascentista', 3),
(4,'2023-06-10', NULL, 'Arte Moderna em Foco', 2);

-- Obras em exposições
INSERT INTO artes_expo(ID_objeto,nome_obra, ID_expo) VALUES
(1,'Fotografia de família', 1),
(3,'Pintura do jardim', 1),
(15,'Pintura Maluca', 2),
(10,'Artesanato contemporâneo', 2),
(18,'A Última Ceia', 3),
(19,'David', 3),
(16,'Guernica', 4),
(17,'A Persistência da Memória', 4);

-- Contratos
INSERT INTO contrato(num, data) VALUES
(1,'2021-02-20'),
(2,'2015-05-28'),
(3,'2023-02-21'),
(4,'2023-03-15'),
(5,'2023-06-10');

-- Empréstimos devolvidos
INSERT INTO emprestimo (data_para_devolucao, data_devolucao, ID_objeto, NUM_contrato) VALUES
('2021-02-27', '2021-02-28', 2, 1),
('2015-06-28', '2015-06-28', 4, 2),
('2015-06-28', '2015-06-28', 7, 2),
('2023-03-20', '2023-03-22', 3, 3);

-- Empréstimos em aberto
INSERT INTO emprestimo (data_para_devolucao, ID_objeto, NUM_contrato) VALUES
('2023-02-28', 9, 3),
('2023-02-28', 11, 3),
('2023-02-27', 13, 4),
('2023-06-20', 16, 5),
('2023-06-20', 17, 5);


