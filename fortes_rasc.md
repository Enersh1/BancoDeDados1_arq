# Rascunho até o momento do projeto Fortes

```sql
create schema fortes;
use fortes;
create table if not exists usuarios(
user_cod int primary key,
user_cnpj varchar(14) not null,
user_nome varchar(45) not null,
user_categoria tinyint not null,
user_tel varchar(15) not null,
user_email varchar(100) not null,
user_razaoSocial varchar(45) not null
);

create table if not exists editais(
edital_cod int primary key,
edital_prazoInicio date not null,
edital_prazoFim date not null

)

create table if not exists projetos(
proj_cod int primary key,
proj_nome varchar(45) not null,
proj_respTec varchar(45) not null,
proj_respCool varchar(45) not null
);

#create table if not exists categoria(
#chave composta, 1 para fortes e 1 para donatário
#user_categoria

#);

create table if not exists relatorios(
#relat_cod int primary key, entidade fraca?
relat_data date not null,
relat_img blob,
relat_text longtext not null,
user_cod int,
CONSTRAINT FK_user_cod_relat FOREIGN KEY (user_cod) REFERENCES usuarios(user_cod)
);

create table if not exists propostas_pedidos(
prope_ #puxar o identificador e nao o nome
prope_valor dec(10,2) not null,
user_cod int,
CONSTRAINT FK_user_cod_prope FOREIGN KEY (user_cod) REFERENCES usuarios(user_cod)
);

```
