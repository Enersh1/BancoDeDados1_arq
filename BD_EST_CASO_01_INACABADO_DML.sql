https://github.com/gnrochabr/Banco_Dados/blob/main/2024_2/CC1M/DMLs/tutorial%20DML.md
https://github.com/Enersh1/CC1M_20242_BD/blob/main/DDL/EST_CASO_I.sql

#SELECIONAR O NOVO SCHEMA OU DATABASE PARA USO:
#USANDO MEU BANQUINHO
USE EC1_CC1M;
/*
# CRIANDO AS TABELAS SEM CHAVES ESTRANGEIRAS
# ########################################################################################
# ##############################| CRIANDO A TABELA FORNECEDORES |#########################
# ########################################################################################
CREATE TABLE IF NOT EXISTS FORNECEDORES(
#NOMEDOATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
FORNEC_COD INT PRIMARY KEY,
FORNEC_NOME VARCHAR(45) NOT NULL,
FORNEC_RUA VARCHAR(45) NOT NULL,
FORNEC_NUMRUA INT,
FORNEC_BAIRRO VARCHAR(45) NOT NULL,
FORNEC_CIDADE VARCHAR(45) NOT NULL,
FORNEC_ESTADO VARCHAR(45) NOT NULL,
FORNEC_PAIS VARCHAR(30) NOT NULL,
FORNEC_CODPOSTAL VARCHAR(10) NOT NULL,
FORNEC_TELEFONE VARCHAR(15) NOT NULL,
FORNEC_CONTATO TEXT NOT NULL
);

# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA FORNECEDORES]
ALTER TABLE FORNECEDORES ADD column DESCRICAO_FORN TEXT NOT NULL;
ALTER TABLE FORNECEDORES MODIFY COLUMN DESCRICAO_FORN VARCHAR(100);
ALTER TABLE FORNECEDORES CHANGE COLUMN DESCRICAO_FORN DESCRICAO_FORN1 VARCHAR(100);
ALTER TABLE FORNECEDORES DROP COLUMN DESCRICAO_FORN1;

INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_PAIS, FORNEC_CONTATO)
VALUES('1', 'Napoleão Sem Medo e Sem Mácula', 'Beco da Navalha', 1000, 'Centro', 'São Paulo', 'SP', '01000-000', '91234-5678', 'Brasil', 'João Silva');
INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_PAIS, FORNEC_CONTATO)
VALUES('2', 'Aeronauta Barata', 'Caminho da Falta de Esperança', 1001, 'Jardim das Flores', 'Curitiba', 'PR', '80000-000', '99876-5432', 'Brasil', 'Maria Oliveira');
INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_PAIS, FORNEC_CONTATO)
VALUES('3', 'Alucinética Honorata', 'Beco da Esperança', 1002, 'Vila Nova', 'Rio de Janeiro', 'RJ', '20000-000', '98765-4321', 'Brasil', 'Carlos Santos');
INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_PAIS, FORNEC_CONTATO)
VALUES('4', 'Veneza Americana Derecife', 'Alameda da Tristeza', 1003, 'Praia do Leste', 'Salvador', 'BA', '40000-000', '92345-6789', 'Brasil', 'Ana Costa');
INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_PAIS, FORNEC_CONTATO)
VALUES('5', 'Maxwelbe', 'Travessa do Ventilador', 1004, 'Bairro Alto', 'Belo Horizonte', 'MG', '30000-000', '93456-7890', 'Brasil', 'Luiz Pereira');
INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_PAIS, FORNEC_CONTATO)
VALUES ('6', 'Distribuidora Sol Nascente', 'Rua da Esperança', 1005, 'Vila Verde', 'Florianópolis', 'SC', '88000-000', '91234-5679', 'Brasil', 'Fernanda Lima');
UPDATE FORNECEDORES SET FORNEC_NUMRUA = 1010 WHERE FORNEC_COD = 1;
UPDATE FORNECEDORES SET FORNEC_NUMRUA = 1012 WHERE FORNEC_COD = 2;

DELETE FROM FORNECEDORES WHERE FORNEC_COD = '6';

# ########################################################################################
# ##############################| CRIANDO A TABELA FILIAIS |##############################
# ########################################################################################
CREATE TABLE IF NOT EXISTS FILIAIS(
FILIAL_COD INT PRIMARY KEY,
FILIAL_NOME VARCHAR(45) NOT NULL,
FILIAL_RUA VARCHAR(100) NOT NULL,
FILIAL_NUMRUA INT,
FILIAL_BAIRRO VARCHAR(50) NOT NULL,
FILIAL_CIDADE VARCHAR(50) NOT NULL,
FILIAL_ESTADO VARCHAR(50) NOT NULL,
FILIAL_PAIS VARCHAR(50) NOT NULL,
FILIAL_CODPOSTAL VARCHAR(10) NOT NULL,
FILIAL_CAPACIDADE TEXT NOT NULL);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA FILIAIS]
ALTER TABLE FILIAIS ADD column DESCRICAO_FILIAIS TEXT NOT NULL;
ALTER TABLE FILIAIS MODIFY COLUMN DESCRICAO_FILIAIS VARCHAR(100);
ALTER TABLE FILIAIS CHANGE COLUMN DESCRICAO_FILIAIS DESCRICAO_FILIAIS1 VARCHAR(100);
ALTER TABLE FILIAIS DROP COLUMN DESCRICAO_FILIAIS1;

INSERT INTO FILIAIS (FILIAL_COD, FILIAL_NOME, FILIAL_RUA, FILIAL_NUMRUA, FILIAL_BAIRRO, FILIAL_CIDADE, FILIAL_ESTADO, FILIAL_PAIS, FILIAL_CODPOSTAL, FILIAL_CAPACIDADE)
VALUES 
(1, 'Filial Centro', 'Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', 'Brasil', '01000-000', 'Capacidade para 100 pessoas'),
(2, 'Filial Norte', 'Avenida das Árvores', 456, 'Jardim Verde', 'Curitiba', 'PR', 'Brasil', '80000-000', 'Capacidade para 150 pessoas'),
(3, 'Filial Sul', 'Rua do Sol', 789, 'Vila Nova', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000', 'Capacidade para 200 pessoas'),
(4, 'Filial Leste', 'Alameda da Paz', 1011, 'Praia do Leste', 'Salvador', 'BA', 'Brasil', '40000-000', 'Capacidade para 120 pessoas'),
(5, 'Filial Oeste', 'Travessa do Ventilador', 1213, 'Bairro Alto', 'Belo Horizonte', 'MG', 'Brasil', '30000-000', 'Capacidade para 80 pessoas'),
(6, 'Filial Oeste II', 'Rua do Comércio', 202, 'Centro Comercial', 'Fortaleza', 'CE', '90000-000', 'Brasil', 'Capacidade para 90 pessoas');

UPDATE FILIAIS SET FILIAL_NOME = 'Filial Centro-Oeste' WHERE FILIAL_COD = 6;
UPDATE FILIAIS SET FILIAL_CAPACIDADE = 'Capacidade para 150 pessoas' WHERE FILIAL_COD = 3;

DELETE FROM FILIAIS WHERE FILIAL_COD = 6;
*/















# ########################################################################################
# ##############################| CRIANDO A TABELA PRODUTOS |#############################
# ########################################################################################
CREATE TABLE IF NOT EXISTS PRODUTOS(
PROD_COD INT PRIMARY KEY,
PROD_NOME VARCHAR(50) NOT NULL,
PROD_DESCRICAO TEXT NOT NULL,
PROD_ESPECTEC TEXT NOT NULL,
PROD_QUANT DECIMAL(10,3) NOT NULL,
PROD_PRECOUNIT DECIMAL(10,2) NOT NULL,
PROD_UNIDMEDIDA VARCHAR(10) NOT NULL,
PROD_ESTOQ_MIN DECIMAL(10,3) NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PRODUTOS]
ALTER TABLE PRODUTOS ADD column DESCRICAO_PRODUTOS TEXT NOT NULL;
ALTER TABLE PRODUTOS MODIFY COLUMN DESCRICAO_PRODUTOS VARCHAR(100);
ALTER TABLE PRODUTOS CHANGE COLUMN DESCRICAO_PRODUTOS DESCRICAO_PRODUTOS1 VARCHAR(100);
ALTER TABLE PRODUTOS DROP COLUMN DESCRICAO_PRODUTOS1;

INSERT INTO PRODUTOS (PROD_COD, PROD_NOME, PROD_DESCRICAO, PROD_ESPECTEC, PROD_QUANT, PROD_PRECOUNIT, PROD_UNIDMEDIDA, PROD_ESTOQ_MIN)
VALUES 
(1, 'Camiseta Polo', 'Camiseta polo de algodão com várias cores.', 'Tecido leve e respirável.', 150000, 49.90, 'unidades', 20000),
(2, 'Tênis Esportivo', 'Tênis ideal para corrida e atividades físicas.', 'Solado em borracha e design ergonômico.', 75500, 299.90, 'par', 10000),
(3, 'Relógio Digital', 'Relógio digital à prova da água com cronômetro.', 'Bateria de longa duração.', 200000, 199.99, 'unidades', 15000),
(4, 'Mochila Escolar', 'Mochila com compartimentos para laptop e material escolar.', 'Material resistente à água.', 120000, 89.90, 'unidades', 30000),
(5, 'Fone de Ouvido Bluetooth', 'Fone de ouvido sem fio com cancelamento de ruído.', 'Conexão rápida e qualidade de som superior.', 180000, 149.90, 'unidades', 25000),
(6, 'Cadeira Ergonomica', 'Cadeira projetada para conforto e suporte durante longas horas de trabalho.', 'Ajuste de altura e apoio lombar.', 50000, 349.90, 'unidades', 5000);

UPDATE PRODUTOS SET PROD_DESCRICAO = 'Tecido leve e abrasivo.' WHERE PROD_COD = 1;
UPDATE PRODUTOS SET PROD_QUANT = '150000' WHERE PROD_COD = 4;

DELETE FROM PRODUTOS WHERE PROD_COD = 6;

#######################################################################################################################################
# CRIANDO AS TABELAS COM DEPENDÊNCIA DE CHAVE ESTRANGEIRA
# ########################################################################################
# ##############################| CRIANDO A TABELA PEDIDOS |##############################
# ########################################################################################
CREATE TABLE IF NOT EXISTS PEDIDOS(
PED_CODIGO INT PRIMARY KEY,
PED_DATA DATE NOT NULL,
PED_HORA TIME NOT NULL,
PED_PREVISAO DATE NOT NULL,
PED_STATUS ENUM('PENDENTE','CONCLUÍDO','EM ESPERA'), #!!!
PED_FORNECEDOR INT NOT NULL, # CHAVE ESTRANGEIRA DE FORNECEDOR
#CRIANDO A REFERENCIA PARA A CHAVE ESTRANGEIRA
#RESTRIÇÃO APELIDO CH.ESTRANGEIRA(CAMPO CRIADO) REFERENCIA TABELA(CH.PRIMÁRIA)
CONSTRAINT FK_FORNECEDOR FOREIGN KEY (PED_FORNECEDOR) #DAR NOME A RESTRIÇÃO(CONSTRAINT) É UMA BOA PRÁTICA
REFERENCES FORNECEDORES(FORNEC_COD) #REFERENCIA A CHAVE PRIMÁRIA DE FORNECEDORES
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PEDIDOS]
ALTER TABLE PEDIDOS ADD column DESCRICAO_PEDIDOS TEXT NOT NULL;
ALTER TABLE PEDIDOS MODIFY COLUMN DESCRICAO_PEDIDOS VARCHAR(100);
ALTER TABLE PEDIDOS CHANGE COLUMN DESCRICAO_PEDIDOS DESCRICAO_PEDIDOS1 VARCHAR(100);
ALTER TABLE PEDIDOS DROP COLUMN DESCRICAO_PEDIDOS1;

# Inserções na tabela PEDIDOS
INSERT INTO PEDIDOS (PED_CODIGO, PED_DATA, PED_HORA, PED_PREVISAO, PED_STATUS, PED_FORNECEDOR)
VALUES 
(1, '12/11/2024', '10:30:00', '20/11/2024', 'PENDENTE', 11),
(2, '13/11/2024', '14:00:00', '21/11/2024', 'CONCLUÍDO', 22),
(3, '14/11/2024', '09:15:00', '22/11/2024', 'EM ESPERA', 33),
(4, '15/11/2024', '16:45:00', '23/11/2024', 'PENDENTE', 44),
(5, '16/11/2024', '11:00:00', '24/11/2024', 'CONCLUÍDO', 55),
(6, '17/11/2024', '13:30:00', '25/11/2024', 'EM ESPERA', 66);

DELETE FROM PEDIDOS WHERE PED_CODIGO = 6;

# ########################################################################################
# ##############################| CRIANDO A TABELA RECEBIMENTOS |#########################
# ######################################################################################## (VEIO DEPOIS POIS TEM DEPENDÊNCIA DE PEDIDOS)
CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
RECEB_DATA DATE NOT NULL,
RECEB_HORA TIME NOT NULL,
RECEB_QUANT_PROD DECIMAL(10,3),
RECEB_CONDICAO TEXT NOT NULL,
RECEB_PEDIDOS INT PRIMARY KEY,
CONSTRAINT FK_PEDIDOS FOREIGN KEY(RECEB_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA RECEBIMENTOS]
ALTER TABLE RECEBIMENTOS ADD column DESCRICAO_PEDIDOS TEXT NOT NULL;
ALTER TABLE RECEBIMENTOS MODIFY COLUMN DESCRICAO_PEDIDOS VARCHAR(100);
ALTER TABLE RECEBIMENTOS CHANGE COLUMN DESCRICAO_PEDIDOS DESCRICAO_PEDIDOS1 VARCHAR(100);
ALTER TABLE RECEBIMENTOS DROP COLUMN DESCRICAO_PEDIDOS1;

INSERT INTO RECEBIMENTOS (RECEB_DATA, RECEB_HORA, RECEB_QUANT_PROD, RECEB_CONDICAO, RECEB_PEDIDOS)
VALUES
('01/11/2024', '10:30:00', 150500, 'Recebido em boas condições', 1),
('02/11/2024', '14:00:00', 200750, 'Recebido com avarias', 2),
('03/11/2024', '09:15:00', 300000, 'Recebido em perfeitas condições', 3),
('04/11/2024', '16:45:00', 120250, 'Recebido parcialmente danificado', 4),
('05/11/2024', '08:00:00', 75500, 'Recebido conforme o pedido', 5),
('06/11/2024', '11:30:00', 250000, 'Recebido em boas condições', 6);

# ###############| CRIANDO AS TABELAS ASSOCIATIVAS (ENTIDADES ASSOCIATIVAS) |#############
##########################################################################################
# ##############################| CRIANDO A TABELA PEDIDOS_PRODUTOS |#####################
# ########################################################################################
CREATE TABLE IF NOT EXISTS PEDIDOS_PRODUTOS(
PDPR_PEDIDOS INT,
PDPR_PRODUTOS INT,
PRIMARY KEY(PDPR_PEDIDOS,PDPR_PRODUTOS),
PDPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT PDPR_FK_PEDIDOS FOREIGN KEY(PDPR_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO),
CONSTRAINT PDPR_FK_PRODUTOS FOREIGN KEY(PDPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PEDIDOS_PRODUTOS]
ALTER TABLE PEDIDOS_PRODUTOS ADD column DESCRICAO_PEDIDOS_PRODUTOS TEXT NOT NULL;
ALTER TABLE PEDIDOS_PRODUTOS MODIFY COLUMN DESCRICAO_PEDIDOS_PRODUTOS VARCHAR(100);
ALTER TABLE PEDIDOS_PRODUTOS CHANGE COLUMN DESCRICAO_PEDIDOS_PRODUTOS DESCRICAO_PEDIDOS_PRODUTOS1 VARCHAR(100);
ALTER TABLE PEDIDOS_PRODUTOS DROP COLUMN DESCRICAO_PEDIDOS_PRODUTOS1;
# ########################################################################################
# ##############################| CRIANDO A TABELA FILIAIS_PRODUTOS |#####################
# ########################################################################################
CREATE TABLE IF NOT EXISTS FILIAIS_PRODUTOS(
FLPR_FILIAL INT,
FLPR_PRODUTOS INT,
PRIMARY KEY(FLPR_FILIAL,FLPR_PRODUTOS),
FLPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT FLPR_FK_FILIAIS FOREIGN KEY(FLPR_FILIAL) REFERENCES FILIAIS(FILIAL_COD),
CONSTRAINT FLPR_FK_PRODUTOS FOREIGN KEY(FLPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA FILIAIS_PRODUTOS]
ALTER TABLE FILIAIS_PRODUTOS ADD column FILIAIS_PRODUTOS TEXT NOT NULL;
ALTER TABLE FILIAIS_PRODUTOS MODIFY COLUMN FILIAIS_PRODUTOS VARCHAR(100);
ALTER TABLE FILIAIS_PRODUTOS CHANGE COLUMN FILIAIS_PRODUTOS FILIAIS_PRODUTOS1 VARCHAR(100);
ALTER TABLE FILIAIS_PRODUTOS DROP COLUMN FILIAIS_PRODUTOS1;
# ########################################################################################
# ##############################| CRIANDO A TABELA FORNECEDORES_PRODUTOS |################
# ########################################################################################
CREATE TABLE IF NOT EXISTS FORNECEDORES_PRODUTOS(
FRPR_FORNECEDOR INT,
FRPR_PRODUTOS INT,
PRIMARY KEY(FRPR_FORNECEDOR,FRPR_PRODUTOS),
CONSTRAINT FRPR_FK_FORNECEDORES FOREIGN KEY(FRPR_FORNECEDOR) REFERENCES FORNECEDORES(FORNEC_COD),
CONSTRAINT FRPR_FK_PRODUTOS FOREIGN KEY(FRPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA FORNECEDORES_PRODUTOS]
ALTER TABLE FORNECEDORES_PRODUTOS ADD column FORNECEDORES_PRODUTOS TEXT NOT NULL;
ALTER TABLE FORNECEDORES_PRODUTOS MODIFY COLUMN FORNECEDORES_PRODUTOS VARCHAR(100);
ALTER TABLE FORNECEDORES_PRODUTOS CHANGE COLUMN FORNECEDORES_PRODUTOS FORNECEDORES_PRODUTOS1 VARCHAR(100);
ALTER TABLE FORNECEDORES_PRODUTOS DROP COLUMN FORNECEDORES_PRODUTOS1;