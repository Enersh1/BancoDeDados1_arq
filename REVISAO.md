# CORREÇÃO DAS ATIVIDADES DE FIXAÇÃO

```sql
# DDL

-- Criando o banco de dados
CREATE DATABASE Revisao;
USE Revisao;

-- Tabela de endereços (normalizada)
CREATE TABLE enderecos (
    endereco_id INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL
);

-- Tabela de jogos
CREATE TABLE jogos (
    jogo_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    plataforma ENUM('PlayStation', 'Xbox', 'Nintendo Switch', 'PC') NOT NULL,
    genero VARCHAR(50) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    preco_diaria DECIMAL(5, 2) NOT NULL
);

-- Tabela de clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco_id INT NOT NULL,
    FOREIGN KEY (endereco_id) REFERENCES enderecos(endereco_id)
);

-- Tabela de locações
CREATE TABLE locacoes (
    locacao_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    jogo_id INT NOT NULL,
    data_locacao DATE NOT NULL,
    data_devolucao DATE,
    multa_atraso DECIMAL(7, 2),
    status_loc ENUM('Em andamento', 'Concluída', 'Atrasada') NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (jogo_id) REFERENCES jogos(jogo_id)
);

-- Tabela de pagamentos
CREATE TABLE pagamentos (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    locacao_id INT NOT NULL,
    valor_pago DECIMAL(7, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    metodo_pagamento ENUM('Cartão de Crédito', 'Cartão de Débito', 'Dinheiro', 'Pix') NOT NULL,
    FOREIGN KEY (locacao_id) REFERENCES locacoes(locacao_id)
);



#DML

-- Inserções na tabela de endereços
INSERT INTO enderecos (rua, numero, complemento, bairro, cidade, estado, cep) VALUES
('Rua das Palmeiras', '123', 'Apto 202', 'Praia do Canto', 'Vitória', 'ES', '29055-000'),
('Rua Jacarandá', '456', NULL, 'Centro', 'Cariacica', 'ES', '29150-000'),
('Rua dos Ipês', '789', 'Casa', 'Praia da Costa', 'Vila Velha', 'ES', '29101-000'),
('Rua Antônio Ferreira', '1000', 'Sala 5', 'Jardim Camburi', 'Vitória', 'ES', '29090-100'),
('Rua Esperança', '50', NULL, 'Campo Grande', 'Cariacica', 'ES', '29146-000'),
('Rua das Rosas', '22', 'Bloco A', 'Itapuã', 'Vila Velha', 'ES', '29101-400'),
('Rua do Sol', '35', NULL, 'Laranjeiras', 'Serra', 'ES', '29165-020'),
('Rua dos Anjos', '120', 'Apto 15', 'Santa Lúcia', 'Vitória', 'ES', '29056-030'),
('Rua XV de Novembro', '65', 'Sobrado', 'Centro', 'Vila Velha', 'ES', '29100-310'),
('Rua Silva', '150', NULL, 'Jardim América', 'Cariacica', 'ES', '29150-390'),
('Rua Atlântica', '2000', 'Cobertura', 'Coqueiral de Itaparica', 'Vila Velha', 'ES', '29102-010'),
('Rua Amazonas', '300', 'Apto 101', 'Jardim Camburi', 'Vitória', 'ES', '29090-000'),
('Rua Santa Clara', '555', 'Casa', 'Barro Vermelho', 'Vitória', 'ES', '29057-000'),
('Rua do Contorno', '120', NULL, 'Campo Grande', 'Cariacica', 'ES', '29146-100'),
('Rua Sete de Setembro', '90', NULL, 'Centro', 'Vitória', 'ES', '29015-001'),
('Rua José de Alencar', '75', 'Fundos', 'Glória', 'Vila Velha', 'ES', '29122-000'),
('Rua Amazonas', '800', NULL, 'Centro', 'Serra', 'ES', '29164-000'),
('Rua Tiradentes', '140', 'Casa', 'Centro', 'Cariacica', 'ES', '29150-000'),
('Rua Alfredo', '85', 'Loja 1', 'Serra-Sede', 'Serra', 'ES', '29160-000'),
('Rua Pioneiros', '33', 'Apto 305', 'Cobilândia', 'Vila Velha', 'ES', '29122-000');

-- Inserções na tabela de jogos
INSERT INTO jogos (titulo, plataforma, genero, ano_lancamento, preco_diaria) VALUES
('The Last of Us', 'PlayStation', 'Ação', 2013, 15.00),
('Halo Infinite', 'Xbox', 'FPS', 2021, 20.00),
('The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'Aventura', 2017, 18.00),
('Minecraft', 'PC', 'Sandbox', 2011, 10.00),
('FIFA 23', 'PlayStation', 'Esportes', 2022, 12.50),
('Mario Kart 8 Deluxe', 'Nintendo Switch', 'Corrida', 2017, 16.00),
('Red Dead Redemption 2', 'PlayStation', 'Ação', 2018, 17.00),
('Forza Horizon 5', 'Xbox', 'Corrida', 2021, 19.00),
('Cyberpunk 2077', 'PC', 'RPG', 2020, 14.50),
('Super Smash Bros. Ultimate', 'Nintendo Switch', 'Luta', 2018, 15.00),
('Animal Crossing: New Horizons', 'Nintendo Switch', 'Simulação', 2020, 13.00),
('Assassin’s Creed Valhalla', 'PlayStation', 'RPG', 2020, 17.50),
('Call of Duty: Warzone', 'Xbox', 'FPS', 2020, 18.00),
('Fortnite', 'PC', 'Battle Royale', 2017, 9.50),
('Gran Turismo 7', 'PlayStation', 'Corrida', 2022, 16.50),
('Metroid Dread', 'Nintendo Switch', 'Aventura', 2021, 15.00),
('Valorant', 'PC', 'FPS', 2020, 10.50),
('Gears 5', 'Xbox', 'Ação', 2019, 13.00),
('The Witcher 3: Wild Hunt', 'PC', 'RPG', 2015, 14.00),
('Splatoon 3', 'Nintendo Switch', 'Ação', 2022, 17.00);

-- Inserções na tabela de clientes
INSERT INTO clientes (nome, telefone, email, data_nascimento, endereco_id) VALUES
('João Silva', '11987654321', 'joao.silva@gmail.com', '1990-05-15', 1),
('Maria Oliveira', '21998765432', 'maria.oliveira@yahoo.com', '1985-10-10', 2),
('Pedro Santos', '31912345678', 'pedro.santos@hotmail.com', '1993-08-22', 3),
('Ana Souza', '21987654312', 'ana.souza@outlook.com', '1995-12-01', 4),
('Lucas Lima', '41987654343', 'lucas.lima@gmail.com', '1988-07-19', 5),
('Carla Mendes', '21987654300', 'carla.mendes@hotmail.com', '1991-04-25', 6),
('Paulo Gonçalves', '51987654322', 'paulo.goncalves@yahoo.com', '1996-09-30', 7),
('Renata Costa', '21999998888', 'renata.costa@gmail.com', '1987-03-15', 8),
('Gustavo Rocha', '81987654354', 'gustavo.rocha@uol.com.br', '1990-06-10', 9),
('Fernanda Ribeiro', '21988887777', 'fernanda.ribeiro@icloud.com', '1992-11-05', 10),
('Thiago Martins', '11987654355', 'thiago.martins@gmail.com', '1991-02-12', 11),
('Sofia Castro', '11998877665', 'sofia.castro@outlook.com', '1994-03-14', 12),
('André Lima', '31987654390', 'andre.lima@yahoo.com', '1995-01-01', 13),
('Clara Mendes', '21988776543', 'clara.mendes@gmail.com', '1997-04-20', 14),
('Roberto Almeida', '31987766532', 'roberto.almeida@hotmail.com', '1992-09-11', 15),
('Isabel Moraes', '21987654310', 'isabel.moraes@icloud.com', '1993-05-23', 16),
('Gabriel Santos', '31988776654', 'gabriel.santos@uol.com.br', '1989-10-30', 17),
('Juliana Silva', '51998877654', 'juliana.silva@outlook.com', '1990-07-27', 18),
('Felipe Torres', '41987766541', 'felipe.torres@gmail.com', '1996-08-18', 19),
('Camila Oliveira', '21988775432', 'camila.oliveira@hotmail.com', '1988-06-06', 20);

-- Inserções na tabela de locações
INSERT INTO locacoes (cliente_id, jogo_id, data_locacao, data_devolucao, multa_atraso,status_loc) VALUES
(3, 1, '2024-11-01', '2024-11-05', NULL, 'Concluída'),
(7, 2, '2024-11-03', '2024-11-07', NULL, 'Concluída'),
(2, 3, '2024-11-05', NULL, NULL, 'Em andamento'),
(1, 4, '2024-11-08', '2024-11-12', NULL, 'Concluída'),
(5, 5, '2024-11-10', NULL, NULL, 'Em andamento'),
(4, 6, '2024-11-01', '2024-11-04', NULL, 'Concluída'),
(8, 7, '2024-11-05', NULL, NULL, 'Em andamento'),
(6, 8, '2024-11-09', NULL, NULL, 'Atrasada'),
(9, 9, '2024-11-11', NULL, NULL, 'Em andamento'),
(10, 10, '2024-11-12', NULL, NULL, 'Atrasada'),
(1, 11, '2024-11-13', '2024-11-17', NULL, 'Concluída'),
(5, 12, '2024-11-15', '2024-11-19', NULL, 'Concluída'),
(3, 13, '2024-11-01', NULL, NULL, 'Atrasada'),
(9, 14, '2024-11-03', '2024-11-07', NULL, 'Concluída'),
(2, 15, '2024-11-05', NULL, NULL, 'Em andamento'),
(6, 16, '2024-11-08', NULL, NULL, 'Atrasada'),
(4, 17, '2024-11-09', '2024-11-12', NULL, 'Concluída'),
(8, 18, '2024-11-10', NULL, NULL, 'Em andamento'),
(10, 19, '2024-11-11', '2024-11-15', NULL, 'Concluída'),
(5, 20, '2024-11-12', NULL, NULL, 'Em andamento'),
(7, 1, '2024-11-14', '2024-11-18', NULL, 'Concluída'),
(3, 6, '2024-11-15', '2024-11-19', NULL, 'Concluída'),
(5, 9, '2024-11-16', NULL, NULL, 'Em andamento'),
(2, 12, '2024-11-17', '2024-11-21',NULL,  'Concluída'),
(8, 15, '2024-11-18', NULL, NULL, 'Em andamento'),
(4, 18, '2024-11-19', '2024-11-23', NULL, 'Concluída'),
(9, 20, '2024-11-20', '2024-11-24', NULL, 'Concluída'),
(1, 2, '2024-11-21', NULL, NULL, 'Atrasada'),
(6, 4, '2024-11-22', NULL, NULL, 'Em andamento'),
(3, 7, '2024-11-23', NULL, NULL, 'Em andamento'),
(7, 10, '2024-11-24', '2024-11-28', NULL, 'Concluída'),
(2, 13, '2024-11-25', NULL,NULL,  'Em andamento'),
(8, 16, '2024-11-26', NULL,NULL,  'Atrasada'),
(5, 19, '2024-11-27', '2024-12-01', NULL, 'Concluída'),
(10, 2, '2024-11-28', '2024-12-02', NULL, 'Concluída'),
(4, 5, '2024-11-29', NULL,NULL,  'Em andamento'),
(6, 8, '2024-11-30', NULL, NULL, 'Atrasada'),
(9, 11, '2024-12-01', '2024-12-05',NULL,  'Concluída'),
(1, 14, '2024-12-02', NULL, NULL, 'Em andamento'),
(7, 17, '2024-12-03', '2024-12-07', NULL, 'Concluída');


-- Inserções na tabela de pagamentos
INSERT INTO pagamentos (locacao_id, valor_pago, data_pagamento, metodo_pagamento) VALUES
(1, 60.00, '2024-11-05', 'Cartão de Crédito'),
(2, 80.00, '2024-11-07', 'Dinheiro'),
(4, 51.00, '2024-11-12', 'Pix'),
(6, 45.00, '2024-11-04', 'Cartão de Débito'),
(8, 32.00, '2024-11-15', 'Cartão de Crédito'),
(10, 75.00, '2024-11-13', 'Pix'),
(12, 60.00, '2024-11-19', 'Dinheiro'),
(14, 54.00, '2024-11-07', 'Pix'),
(16, 39.00, '2024-11-08', 'Cartão de Débito'),
(18, 95.00, '2024-11-09', 'Cartão de Crédito'),
(11, 65.00, '2024-11-17', 'Dinheiro'),
(13, 70.00, '2024-11-20', 'Pix'),
(15, 85.00, '2024-11-22', 'Cartão de Crédito'),
(17, 40.00, '2024-11-10', 'Cartão de Débito'),
(19, 77.00, '2024-11-15', 'Dinheiro'),
(3, 55.00, '2024-11-21', 'Cartão de Crédito'),
(5, 90.00, '2024-11-23', 'Pix'),
(7, 42.00, '2024-11-24', 'Cartão de Débito'),
(9, 68.00, '2024-11-25', 'Dinheiro'),
(20, 100.00, '2024-11-26', 'Pix'),
(21, 72.00, '2024-11-18', 'Cartão de Crédito'),
(22, 85.00, '2024-11-19', 'Dinheiro'),
(23, 60.00, '2024-11-25', 'Pix'),
(24, 95.00, '2024-11-21', 'Cartão de Débito'),
(25, 55.00, '2024-11-30', 'Cartão de Crédito'),
(26, 105.00, '2024-11-23', 'Dinheiro'),
(27, 110.00, '2024-11-24', 'Pix'),
(28, 50.00, '2024-11-29', 'Cartão de Débito'),
(29, 65.00, '2024-11-30', 'Dinheiro'),
(30, 78.00, '2024-12-01', 'Cartão de Crédito'),
(31, 90.00, '2024-12-05', 'Pix'),
(32, 80.00, '2024-12-02', 'Cartão de Débito'),
(33, 100.00, '2024-12-06', 'Dinheiro'),
(34, 120.00, '2024-12-01', 'Pix'),
(35, 130.00, '2024-12-03', 'Cartão de Crédito'),
(36, 56.00, '2024-12-07', 'Dinheiro'),
(37, 75.00, '2024-12-08', 'Pix'),
(38, 67.00, '2024-12-05', 'Cartão de Débito'),
(39, 82.00, '2024-12-09', 'Dinheiro'),
(40, 99.00, '2024-12-10', 'Pix');


#DQL

USE revisao;

-- 1. Selecione todos os jogos disponíveis no banco de dados
SELECT * FROM jogos;

-- 2. Liste os nomes e telefones de todos os clientes cadastrados
SELECT nome, telefone 
FROM clientes;

-- 3. Encontre todos os jogos lançados após o ano de 2020
SELECT titulo, ano_lancamento 
FROM jogos 
WHERE ano_lancamento > 2020
ORDER BY ano_lancamento; -- opcional

-- 4. Liste todos os clientes que moram na cidade de 'Vila Velha'
SELECT nome 
FROM clientes -- AS c
JOIN enderecos ON clientes.endereco_id = enderecos.endereco_id
-- JOIN enderecos AS e ON c.endereco_id = e.endereco_id 
WHERE cidade = 'Vila Velha';

-- 5. Obtenha todas as locações feitas no último mês (considerando a data atual)
SELECT * 
FROM locacoes 
WHERE MONTH(data_locacao) = MONTH(CURDATE())-1 ;

-- 6. Liste os jogos disponíveis em ordem crescente de preço da diária
SELECT titulo, CONCAT('R$ ',preco_diaria) AS 'Diária'
FROM jogos 
ORDER BY preco_diaria ASC;

-- 7. Mostre os 5 clientes mais recentes cadastrados, ordenados pela data de nascimento
SELECT cliente_id, nome, data_nascimento FROM(
	SELECT cliente_id, nome, data_nascimento 
	FROM clientes
    ORDER BY cliente_id DESC
	LIMIT 5) AS ultimos_cadastros
ORDER BY data_nascimento DESC;

-- 8. Calcule a quantidade de locações feitas por cada cliente
SELECT c.nome, COUNT(l.cliente_id) AS total_locacoes 
FROM locacoes l 
RIGHT JOIN clientes c ON c.cliente_id = l.cliente_id
-- RIGHT JOIN: Clientes vem depois de locações
-- Toda vez que for uma tabela que eu quero selecionar valores nulos também
-- precisamos observar a posição dela no código
-- se tiver antes da tabela que tem NULL é LEFT JOIN, se tiver depois é RIGHT JOIN
GROUP BY c.nome
ORDER BY c.nome; -- opcional (Ordenado por nome do cliente, poderia ser pela quantidade)

-- 9. Encontre os jogos mais alugados (com pelo menos 5 locações)
SELECT j.titulo, COUNT(l.jogo_id) AS 'nº de locações' 
FROM locacoes l
JOIN jogos j ON j.jogo_id = l.jogo_id
GROUP BY j.titulo 
HAVING COUNT(*) >= 5 -- USAMOS HAVING PARA FILTRAR USANDO FUNÇÕES DE AGREGAÇÃO
ORDER BY COUNT(l.jogo_id) DESC;

-- 10. Liste os métodos de pagamento e a soma total de valores pagos para cada método
SELECT metodo_pagamento, CONCAT('R$ ',SUM(valor_pago)) AS 'Valor recebido'
FROM pagamentos 
GROUP BY metodo_pagamento;

-- 11. Recupere os detalhes das locações, incluindo o nome do cliente e o título do jogo
SELECT c.nome, j.titulo, l.data_locacao, l.data_devolucao as 'devolução', l.status_loc as 'status'
FROM locacoes l
JOIN clientes AS C ON l.cliente_id = c.cliente_id 
JOIN jogos AS j ON l.jogo_id = j.jogo_id
ORDER BY l.locacao_id;

-- 12. Liste os endereços de todos os clientes, com seus respectivos nomes
SELECT c.nome, e.rua, e.numero, e.bairro, e.cidade, e.estado 
FROM clientes AS c
JOIN enderecos AS e ON c.endereco_id = e.endereco_id;

-- 13. Mostre todas as locações em que o status é 'Atrasada', incluindo os dados do cliente e o jogo alugado
SELECT c.nome, j.titulo, l.data_locacao, l.data_devolucao as 'devolução', l.status_loc as 'status'
FROM locacoes l
JOIN clientes AS C ON l.cliente_id = c.cliente_id 
JOIN jogos AS j ON l.jogo_id = j.jogo_id
WHERE l.status_loc = 'Atrasada';

-- 14. Calcule o valor médio das diárias dos jogos
SELECT CONCAT('R$ ',ROUND(AVG(preco_diaria),2)) AS preco_medio 
FROM jogos;

-- 15. Determine o valor total arrecadado em pagamentos
SELECT CONCAT('R$ ',ROUND(SUM(valor_pago),2)) AS total_arrecadado 
FROM pagamentos;

-- 16. Encontre o jogo mais caro no banco de dados
SELECT titulo, CONCAT('R$ ',MAX(preco_diaria)) AS preco_maximo 
FROM jogos 
GROUP BY titulo;

-- 17. Liste os 3 jogos mais baratos disponíveis para locação
SELECT titulo, CONCAT('R$ ',preco_diaria) AS 'Preço'
FROM jogos 
ORDER BY preco_diaria ASC 
LIMIT 3;

-- 18. Mostre as 10 locações mais recentes, incluindo a data de locação e o status
SELECT locacao_id, data_locacao, status_loc 
FROM locacoes 
ORDER BY data_locacao DESC 
LIMIT 10;

-- 19. Identifique os clientes que fizeram mais de 3 locações
SELECT c.nome, COUNT(l.locacao_id) AS 'Total de locações'
FROM locacoes AS l
JOIN clientes AS c ON l.cliente_id = c.cliente_id 
GROUP BY c.cliente_id 
HAVING COUNT(l.locacao_id) > 3 -- USANDO FUNÇÃO COUNT, SÓ O HAVING PODE ME AJUDAR
ORDER BY COUNT(l.locacao_id) DESC;

-- 20. Liste os jogos com preço médio diário acima de R$5 e que possuem mais de 2 locações
SELECT j.titulo, j.preco_diaria, COUNT(l.locacao_id) AS total_locacoes 
FROM jogos j
JOIN locacoes l ON j.jogo_id = l.jogo_id
WHERE j.preco_diaria > 5 -- WHERE PARA COMPARAÇÕES DE DADOS CONHECIDOS 
GROUP BY j.jogo_id 
HAVING COUNT(l.locacao_id) > 2; -- HAVING PARA DADOS PARAMETRIZADOS POR FUNÇÕES DE AGRUPAMENTO
```
