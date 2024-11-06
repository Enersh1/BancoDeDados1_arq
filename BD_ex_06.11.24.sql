# select nome_das_colunas_que_quer 
#SELECT nome FROM participantes WHERE empresa = "Empresa A";
#SELECT * FROM participantes WHERE timestampdiff(year, data_nasc, now()) >= 30;
#timestampdiff(year, data_nasc, now()) >= 30; TUDO ISSO É IDADE
#SELECT nome, TIMESTAMPDIFF(year, data_nasc, NOW()) AS idade FROM participantes; #now pega data e hora
#SELECT nome, TIMESTAMPDIFF(year, data_nasc, CURDATE()) AS idade FROM participantes; # curdate pega só a data

# funções lógicas

# SELECT * FROM clientes WHERE cidade = 'São Paulo' AND idade > 30;
# TAUTOLOGIA and a condição tm q ser uma tautologia para ser verdadeira
#só mostra clientes de são paulo E que tem mais de 30 anos

# SELECT * FROM clientes WHERE cidade = 'São Paulo' OR cidade = 'Rio de Janeiro'; #só precisa de um ser Verdadeiro
# contigencia

# SELECT * FROM clientes WHERE NOT cidade = 'São Paulo';
#CONTRADIÇÂO

#SELECT * FROM participantes WHERE NOT empresa = 'Empresa A'; #nego a preposição
/*
SELECT * FROM participantes
WHERE NOT empresa = 'Empresa A'
AND timestampdiff(year, data_nasc, now()) <= 35; #nego a preposição
*/

# COMENTARIO DE LINHA
/*COMENTARIO EM BLOCO*/

#SELECT nome FROM clientes WHERE nome LIKE 'J%';
#ACHA QUEM COMEÇA COM J, OU %J TERMINA COM J, OU %J% SE TIVER J NO MEIO

# SELECT nome, timestampdiff(year, data_nasc, now()) AS IDADE FROM participantes; #mostra idade e renomeiando para IDADE;
/*
SELECT * FROM participantes
WHERE NOT empresa = 'Empresa A'
AND timestampdiff(year, data_nasc, now()) BETWEEN 30 AND 34;
*/

############################################################################################
#1 - CRIE UMA CONSULTA QUE RETORNE APENAS O PARTICIPANTES DA EMPRESA A.
/*
USE EXERCICIO1_DML;
SELECT nome FROM participantes WHERE empresa = "Empresa A";
*/
#2 - CRIE UMA CONSULTA QUE TRAGA COMO RETORNO A QUANTIDADE DE PARTICIPANTES QUE TENHAM MAIS DE 20 ANOS;
SELECT count(*) FROM participantes WHERE timestampdiff(year, data_nasc, now()) < 20;

#3 - CRIE UMA CONSULTA QUE FAÇA A MÉDIA DE IDADE DOS PARTICIPANTES.

#4 LISTAR TODOS OS PARTICIPANTES COM SEUS RESPECTIVOS NOMES E DATAS DE NASCIMENTO.

#5 EXIBIR TODOS OS EVENTOS QUE ACONTECERÃO NO LOCAL COM ID 1.

#6 LISTAR AS ATIVIDADES QUE OCORRERÃO EM UMA DATA ESPECÍFICA (POR EXEMPLO, '2024-11-15').

#7 CONTAR O NÚMERO TOTAL DE PARTICIPANTES CADASTRADOS NO SISTEMA.

#8 EXIBIR O NOME E A CAPACIDADE DE TODOS OS LOCAIS ONDE OS EVENTOS SÃO REALIZADOS.

#9 CALCULAR A CAPACIDADE MÉDIA DOS LOCAIS ONDE OS EVENTOS ACONTECEM.

#10 LISTAR O NOME DOS EVENTOS ORGANIZADOS POR UMA ENTIDADE ESPECÍFICA (POR EXEMPLO, "ASSOCIAÇÃO DE TI").

#11 LISTAR O NOME DOS PARTICIPANTES QUE ESTÃO INSCRITOS EM ATIVIDADES ESPECÍFICAS (POR EXEMPLO, A ATIVIDADE COM ID 3).

#12 LISTAR TODOS OS PARTICIPANTES E O ID DAS ATIVIDADES NAS QUAIS ESTÃO INSCRITOS.


#13 CONTAR QUANTOS EVENTOS ESTÃO PROGRAMADOS PARA O LOCAL COM CAPACIDADE MAIOR QUE 200.

# Comandos DQL - MySQL - Resumão
#https://github.com/gnrochabr/Banco_Dados/blob/main/2024_2/CC1M/DQLs/DQL.md
