/*
PEGAR exercicio_fixacao1.sql | Exercicio1_DML.sql | EXERCICIO1_DQL.sql e fazer em ordem, para o 
exercicio 1, 2 e 3 mesma logica
*/

/*

CREATE DATABASE EXERCICIO1;
USE EXERCICIO1;

CREATE TABLE IF NOT EXISTS PARTICIPANTES(
NUM_INSCRICAO INT,
CPF VARCHAR(14),
PRIMARY KEY(NUM_INSCRICAO,CPF),
NOME VARCHAR(100) NOT NULL,
DATA_NASC DATE NOT NULL,
EMPRESA VARCHAR(100));

CREATE TABLE IF NOT EXISTS LOCAIS(
ID_LOCAL INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
LOG_LOCAL VARCHAR(100) NOT NULL,
NUMLOG_LOCAL INT,
BAIRRO_LOCAL VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
CEP VARCHAR(100) NOT NULL,
CAPACIDADE INT NOT NULL);

CREATE TABLE IF NOT EXISTS EVENTOS(
ID_EVENTO INT PRIMARY KEY,
NOME_EVENTO VARCHAR(100) NOT NULL,
DATA_EVENTO DATE NOT NULL,
ENTIDADE_EVENTO VARCHAR(100) NOT NULL,
LOCAL_EVENTO INT,
CONSTRAINT FK_LOCAL FOREIGN KEY(LOCAL_EVENTO) REFERENCES LOCAIS(ID_LOCAL));

CREATE TABLE IF NOT EXISTS ATIVIDADES(
ID_ATIVIDADE INT PRIMARY KEY,
NOME_ATV VARCHAR(100) NOT NULL,
DATA_ATV DATE NOT NULL,
HORA_ATV TIME NOT NULL,
EVENTO_ATV INT NOT NULL,
CONSTRAINT FK_EVENTO FOREIGN KEY(EVENTO_ATV) REFERENCES EVENTOS(ID_EVENTO));

CREATE TABLE IF NOT EXISTS PARTICIPANTES_ATIVIDADES(
INSCRICAO INT,
CPF VARCHAR(14),
ATIVIDADE INT,
PRIMARY KEY(INSCRICAO, CPF, ATIVIDADE),
CONSTRAINT FK_PART_ATV FOREIGN KEY(INSCRICAO,CPF) REFERENCES PARTICIPANTES(NUM_INSCRICAO,CPF),
CONSTRAINT FK_ATV_PART FOREIGN KEY(ATIVIDADE) REFERENCES ATIVIDADES(ID_ATIVIDADE));

CREATE TABLE IF NOT EXISTS PARTICIPANTES_EVENTOS(
INSCRICAO INT,
CPF VARCHAR(14),
EVENTO INT,
PRIMARY KEY(INSCRICAO,CPF,EVENTO),
CONSTRAINT FK_PART_EVT FOREIGN KEY(INSCRICAO,CPF) REFERENCES PARTICIPANTES(NUM_INSCRICAO,CPF),
CONSTRAINT FK_EVT_PART FOREIGN KEY(EVENTO) REFERENCES EVENTOS(ID_EVENTO));

#EXEMPLO DE ALTER
ALTER TABLE PARTICIPANTES
ADD EMAIL VARCHAR(30);

#EXEMPLO DE ALTER
ALTER TABLE PARTICIPANTES
MODIFY COLUMN EMAIL VARCHAR(30) NOT NULL;
*/
##########################################################################################################################
/*

USE EXERCICIO1;
ALTER TABLE PARTICIPANTES
MODIFY COLUMN EMAIL VARCHAR(30);
INSERT INTO PARTICIPANTES (NUM_INSCRICAO, CPF, NOME, DATA_NASC, EMPRESA) VALUES 
(1, '123.456.789-00', 'Alice Silva', '1985-06-15', 'Empresa A'),
(2, '987.654.321-00', 'Carlos Souza', '1990-08-22', 'Empresa B'),
(3, '456.123.789-00', 'Maria Oliveira', '1978-03-05', 'Empresa C'),
(4, '321.654.987-00', 'João Pereira', '1995-12-30', 'Empresa D'),
(5, '789.456.123-00', 'Ana Lima', '1982-10-10', 'Empresa E');

INSERT INTO LOCAIS (ID_LOCAL, NOME, LOG_LOCAL, NUMLOG_LOCAL, BAIRRO_LOCAL, CIDADE, CEP, CAPACIDADE) VALUES 
(1, 'Centro de Convenções', 'Av. Central', 100, 'Centro', 'Cidade A', '11111-000', 200),
(2, 'Auditório Principal', 'Rua 1', 50, 'Centro', 'Cidade B', '22222-000', 150),
(3, 'Espaço Cultural', 'Av. das Artes', 75, 'Bairro X', 'Cidade C', '33333-000', 300),
(4, 'Salão de Eventos', 'Av. Brasil', 200, 'Bairro Y', 'Cidade D', '44444-000', 250),
(5, 'Sala de Conferências', 'Rua 2', 10, 'Bairro Z', 'Cidade E', '55555-000', 100);

INSERT INTO EVENTOS (ID_EVENTO, NOME_EVENTO, DATA_EVENTO, ENTIDADE_EVENTO, LOCAL_EVENTO) VALUES 
(1, 'Congresso de Tecnologia', '2024-11-10', 'Associação de TI', 1),
(2, 'Workshop de Inovação', '2024-11-15', 'Fundação de Inovação', 2),
(3, 'Seminário de Engenharia', '2024-11-20', 'Instituto de Engenharia', 3),
(4, 'Conferência de Sustentabilidade', '2024-11-25', 'Organização Verde', 4),
(5, 'Feira de Empreendedorismo', '2024-11-30', 'Agência de Desenvolvimento', 5);

INSERT INTO ATIVIDADES (ID_ATIVIDADE, NOME_ATV, DATA_ATV, HORA_ATV, EVENTO_ATV) VALUES 
(1, 'Palestra de Abertura', '2024-11-10', '09:00:00', 1),
(2, 'Mesa Redonda', '2024-11-15', '14:00:00', 2),
(3, 'Oficina Prática', '2024-11-20', '10:00:00', 3),
(4, 'Painel de Discussões', '2024-11-25', '16:00:00', 4),
(5, 'Encerramento', '2024-11-30', '18:00:00', 5);

INSERT INTO PARTICIPANTES_ATIVIDADES (INSCRICAO, CPF, ATIVIDADE) VALUES 
(1, '123.456.789-00', 1),
(2, '987.654.321-00', 2),
(3, '456.123.789-00', 3),
(4, '321.654.987-00', 4),
(5, '789.456.123-00', 5);

INSERT INTO PARTICIPANTES_EVENTOS (INSCRICAO, CPF, EVENTO) VALUES 
(1, '123.456.789-00', 1),
(2, '987.654.321-00', 2),
(3, '456.123.789-00', 3),
(4, '321.654.987-00', 4),
(5, '789.456.123-00', 5);

*/
#######################################################################################################################

USE EXERCICIO1;
#1 CRIE UMA CONSULTA QUE RETORNE APENAS OS PARTICIPANTES DA EMPRESA A.
# SELECT * FROM PARTICIPANTES WHERE EMPRESA = 'EMPRESA A';
#2 CRIE UMA CONSULTA QUE TRAGA COMO RETORNO A QUANTIDADE DE PARTICIPANTES QUE TENHAM MAIS DE 20 ANOS;
# SELECT NOME FROM PARTICIPANTES WHERE TIMESTAMPDIFF(YEAR,DATA_NASC,NOW()) > 20; 

#3 CRIE UMA CONSULTA QUE FAÇA A MÉDIA DE IDADE DOS PARTICIPANTES.
# SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR,DATA_NASC,NOW())),0) AS MEDIA_IDADE FROM PARTICIPANTES;

#4 LISTAR TODOS OS PARTICIPANTES COM SEUS RESPECTIVOS NOMES E DATAS DE NASCIMENTO.
# SELECT NOME, DATA_NASC FROM PARTICIPANTES;

#5 EXIBIR TODOS OS EVENTOS QUE ACONTECERÃO NO LOCAL COM ID 1.
# SELECT * FROM EVENTOS WHERE ID_EVENTO = 1;

#6 LISTAR AS ATIVIDADES QUE OCORRERÃO EM UMA DATA ESPECÍFICA (POR EXEMPLO, '2024-11-15').
# SELECT * FROM ATIVIDADES WHERE DATA_ATV = '2024-11-15';

#7 CONTAR O NÚMERO TOTAL DE PARTICIPANTES CADASTRADOS NO SISTEMA.
# SELECT COUNT(*) FROM PARTICIPANTES;

#8 EXIBIR O NOME E A CAPACIDADE DE TODOS OS LOCAIS ONDE OS EVENTOS SÃO REALIZADOS.
# SELECT NOME, CAPACIDADE FROM LOCAIS;

#9 CALCULAR A CAPACIDADE MÉDIA DOS LOCAIS ONDE OS EVENTOS ACONTECEM.
# SELECT ROUND(AVG(CAPACIDADE),0) FROM LOCAIS;

#10 LISTAR O NOME DOS EVENTOS ORGANIZADOS POR UMA ENTIDADE ESPECÍFICA (POR EXEMPLO, "ASSOCIAÇÃO DE TI").
# SELECT * FROM EVENTOS WHERE ENTIDADE_EVENTO = "ASSOCIAÇÃO DE TI";

#11 LISTAR O NOME DOS PARTICIPANTES QUE ESTÃO INSCRITOS EM ATIVIDADES ESPECÍFICAS (POR EXEMPLO, A ATIVIDADE COM ID 3).
# SELECT * FROM ATIVIDADES WHERE ID_ATIVIDADE = 3;

#12 LISTAR TODOS OS PARTICIPANTES E O ID DAS ATIVIDADES NAS QUAIS ESTÃO INSCRITOS.
SELECT * FROM PARTICIPANTES 

#13 CONTAR QUANTOS EVENTOS ESTÃO PROGRAMADOS PARA O LOCAL COM CAPACIDADE MAIOR QUE 200.
# 

################################
/*
PEGAR exercicio_fixacao1.sql | Exercicio1_DML.sql | EXERCICIO1_DQL.sql e fazer em ordem, para o 
exercicio 1, 2 e 3 mesma logica
*/
