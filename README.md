# Sistema de Gerenciamento de Obras de Arte em Museus

Este repositório contém a modelagem e implementação de um banco de dados para gerenciamento de objetos de arte em museus, desenvolvido como parte da disciplina de Banco de Dados ministrada pelo professor André Luiz Moura em 2022/2 no Instituto de Informática da UFG (INF). O projeto foi posteriormente aprimorado com melhorias na modelagem e nas consultas.

## Estrutura do Projeto

O projeto está organizado em pastas conforme o conteúdo:

* **scripts**: Contém o script de criação do banco de dados e das tabelas.
* **queries**: Contém 17 consultas SQL divididas em categorias:

    * Obras
    * Exposições
    * Autores e Técnicas
    * Empréstimos
    * Movimentos
* **escopo e definicao**: Documentação da descrição do problema e definição da estrutura das tabelas.
* **diagram**: Contém o diagrama MER em PDF, a definição em DBML e uma imagem do diagrama gerado a partir do DBML.

## Definição do Problema

O sistema foi projetado para gerenciar a coleção de objetos de arte de múltiplos museus, permitindo registrar informações sobre:

* Museus (nome e identificador)
* Objetos de arte (título, ano de criação, custo, indicador de permanência)
* Autores (nome, sobrenome, país de origem, datas de nascimento e falecimento)
* Categorias de obras: Pintura, Escultura e Genérico
* Técnicas e movimentos artísticos
* Empréstimos e contratos relacionados
* Exposições e obras incluídas em cada exposição

## Estrutura das Tabelas

Algumas das principais tabelas do banco de dados:

### MUSEU

* `ID_museu` (PK, autoincremento)
* `nome_museu` (varchar 50, não nulo)

### AUTORES

* `ID_autor` (PK)
* `nome_autor`, `sobrenome_autor`
* `pais`, `data_nasc`, `data_fale`
* `ID_museu` (FK)

### OBJETO\_ARTE

* `ID_arte` (PK)
* `titulo`, `data_criacao`, `permanente`, `custo`
* `ID_museu`, `ID_tecnica`, `ID_mov`, `ID_autor` (FKs)

### Categorias de Objetos

* **PINTURA**: `comprimento`, `largura`, `ID_objeto` (FK)
* **ESCULTURA**: `altura`, `peso`, `ID_objeto` (FK)
* **GENERICO**: `descricao`, `ID_objeto` (FK)

### TECNICA e MOVIMENTO

* `cod` (PK), `nome`

### EMPRESTIMO e CONTRATO

* `EMPRESTIMO`: datas de devolução, `ID_objeto`, `NUM_contrato` (FKs)
* `CONTRATO`: `num`, `data`

### EXPOSICAO e ARTES\_EXPO

* `EXPOSICAO`: `ID_expo`, `nome_expo`, `data_inicio`, `data_fim`, `ID_museu`
* `ARTES_EXPO`: `ID_objeto`, `nome_obra`, `ID_expo` (FKs)

## Observações sobre a Modelagem

* Permite gerenciar múltiplos museus, pensado para o gerenciamento do acervo nacional.
* Objetos de arte podem ser emprestados e relacionados a contratos específicos.
* Obras de arte são categorizadas, permitindo diferentes atributos para pinturas, esculturas e objetos genéricos.
* A modelagem foi aprimorada após a disciplina com melhorias nas consultas SQL e na definição do banco.

## Como Utilizar

1. Clonar o repositório.
2. Executar os scripts SQL na pasta `scripts` para criar o banco e as tabelas.
3. Utilizar as queries da pasta `queries` para realizar consultas e testes.
4. Visualizar diagramas na pasta `diagram` para referência.

## Autor

[Kelvin de Oliveira](https://www.linkedin.com/in/kelvin-de-oliveira)
