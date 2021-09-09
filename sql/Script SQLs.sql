--																											Aula 42 - inserção de dados

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

select * from cliente;
+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
+-----------+--------+------+----------------+-------------+

desc endereco;

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

select * from endereco;
+------------+--------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+----------+----------------+--------+------------+
|          1 | RUA ANTONIO SA     | CENTRO   | B. HORIZONTE   | MG     |          4 |
|          2 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          3 | RUA PRES VARGAS    | JARDINS  | SAO PAULO      | SP     |          3 |
|          4 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |          2 |
|          5 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |          6 |
|          6 | RUA URUGUAIANA     | CENTRO   | VITORIA        | ES     |          5 |
+------------+--------------------+----------+----------------+--------+------------+


--																												Aula 44 - inserções 1xN

insert into telefone values(null,'cel','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

select * from telefone;


--																											Aula 45 - seleção e projeção
/*
select => projeção
projeção é tudo aquilo que será projetado, mostrado na tela
*/
select * from cliente;
select now();
select now() as hora_atual;
select 2 + 2 as soma;
select 2 + 2 as soma, nome, now() from cliente;

--where => seleção
/*
seleção é um subconjunto do conjunto total de
registros de uma tabela, a cláusula de seleção é o WHERE.
*/
select nome, sexo, email
from cliente
where sexo = 'f';

select numero --PROJEÇÃO
from telefone --ORIGEM
where tipo = 'cel'; --SELEÇÃO

--																														aula 46 - junção
--join => junção
select nome, sexo, idcliente, id_cliente, bairro, cidade --projeção
from cliente --origem
inner join endereco --junção com...
on idcliente = id_cliente; --condição
+--------+------+-----------+------------+----------+----------------+
| nome   | sexo | idcliente | id_cliente | bairro   | cidade         |
+--------+------+-----------+------------+----------+----------------+
| JOAO   | M    |         1 |          1 | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    |         2 |          2 | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    |         3 |          3 | JARDINS  | SAO PAULO      |
| CLARA  | F    |         4 |          4 | CENTRO   | B. HORIZONTE   |
| JORGE  | M    |         5 |          5 | CENTRO   | VITORIA        |
| CELIA  | M    |         6 |          6 | FLAMENGO | RIO DE JANEIRO |
+--------+------+-----------+------------+----------+----------------+
/*
observe que a condição está trazendo todos os registros em que a PK e a
FK estão iguais
*/


/*
para junção com filtro:
*/
select nome, sexo, bairro, cidade
from cliente
inner join endereco
on idcliente = id_cliente
where sexo = 'f'; --seleção (filtro)

/*
usando indentação:
*/
select nome, sexo, bairro, cidade
from cliente
	inner join endereco
	on idcliente = id_cliente
where sexo = 'f'; --seleção (filtro)

select nome, sexo, email, tipo, numero
from cliente
	inner join telefone
	on idcliente = id_cliente;


--																				 aula 47 - inner join (junção de mais de duas tabelas)

/*
NOME, SEXO, BAIRRO, CIDADE, TIPO E NÚMERO:
*/
select nome, sexo, bairro, cidade, tipo, numero --ESTA QUERY NÃO VAI DAR CERTO pq
from cliente 									--o id_cliente está nomeado em duas
	inner join endereco 						--tabelas (é ambígua)
	on idcliente = id_cliente
	inner join telefone
	on idcliente = id_cliente
/*
uma alternativa seria, ao criar as tabelas, nomear cada atributo com nomes
diferentes.
Exemplo:
id_cliente_endereco
id_cliente_telefone
*/

/*
podemos também INDICAR de onde uma coluna vem e
por PONTEIROS (PONTERAR) as colunas:
nome da tabela.nome da coluna:
*/
select cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero
from cliente
	inner join endereco
	on cliente.idcliente = endereco.id_cliente
	inner join telefone
	on cliente.idcliente = telefone.id_cliente;
+--------+------+---------+----------------+------+----------+
| nome   | sexo | bairro  | cidade         | tipo | numero   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+


/*
outra forma é o uso de alias (apelidos) para ponteiramento:
*/
select c.nome, c.sexo, e.bairro, e.cidade, t.tipo, t.numero
from cliente c
	inner join endereco e
	on c.idcliente = e.id_cliente
	inner join telefone t
	on c.idcliente = t.id_cliente;
+--------+------+---------+----------------+------+----------+
| nome   | sexo | bairro  | cidade         | tipo | numero   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+

--																												aula 48 - comandos DML

/*
SQL é uma linguagem de 4ª geração, é uma linguagem muito
parecida com a linguagem humana.
ela é dividida em categorias, que são:
	DML - DATA MANIPULATION LANGUAGE - manipulação de dados
	DDL - DATA DEFINITION LANGUAGE - definição (tipagem) de dados
	DCL - DATA CONTROL LANGUAGE - controle de acesso aos dados
	TCL - TRANSACTION CONTROL LANGUAGE - controle de transação
*/
/*
					DML - DATA MANIPULATION LANGUAGE
- INSERT -
*/
insert into cliente values(null, 'Paula', 'm', null, '77437493');
insert into endereco values(null, 'rua joaquim silva',   'Alvorada', 'Niterói', 'RJ', 7);

/*
- SELECT -
*/
select * from cliente;

/*
- FILTROS -
*/
select * from cliente
where sexo = 'm';

/*
- UPDATE -
*/
/*
na tabela a Paula está com sexo M, está errado
vamos fazer um UPDATE para corrigir:
*/
/*
precisamos descobrir a PK da Paula, para alterar
o registro correto:
*/
select * from cliente;
+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
|         7 | Paula  | M    | NULL           | 77437493    |
+-----------+--------+------+----------------+-------------+
/*
a PK(idcliente) é 7
*/
/*
vamos filtrar para nos certificarmos:
*/
select * from cliente
where idcliente = 7;
+-----------+-------+------+-------+----------+
| IDCLIENTE | NOME  | SEXO | EMAIL | CPF      |
+-----------+-------+------+-------+----------+
|         7 | Paula | M    | NULL  | 77437493 |
+-----------+-------+------+-------+----------+
/*
ok, agora faremos o UPDATE:
*/
update cliente
	set sexo = 'f'
	where idcliente = 7;
/*
ok, vamos conferir:
*/
select * from cliente
where idcliente = 7;
+-----------+-------+------+-------+----------+
| IDCLIENTE | NOME  | SEXO | EMAIL | CPF      |
+-----------+-------+------+-------+----------+
|         7 | Paula | F    | NULL  | 77437493 |
+-----------+-------+------+-------+----------+



/*
- DELETE -
*/
insert into cliente values(null, 'xxx', 'm', null, 'xxx');
/*
vanos verificar a PK:
*/
select * from cliente;
/*
PK 8, vamos deletar
*/
delete from cliente
	where idcliente = 8;
/*
ok, vamos conferir a tabela:
*/
select * from cliente;


-- 						  																									aula 49
--				DDL - DATA DEFINITION LANGUAGE

create table produto(
	idproduto int primary key auto_increment,
	nome_produto varchar(30) not null,
	preco int,
	frete float(10,2) not null
);
/*
ao criar uma tabela utilizamos DDL ao definirmos
a tipagem de dados da tabela
*/
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| idproduto    | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto | varchar(30) | NO   |     | NULL    |                |
| preco        | int(11)     | YES  |     | NULL    |                |
| frete        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

/*
- ALTER TABLE -
*/
/*
alterando uma coluna - CHANGE
vamos alterar preco para valor_unitario
e será modificado para not null:
*/
alter table produto
change preco valor_unitario int not null;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idproduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | int(11)     | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*
vamos modificar a mesma coluna para aceitar null:
*/
alter table produto
change valor_unitario valor_unitario int;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idproduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | int(11)     | YES  |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*
alterando uma coluna - MODIFY 
*/
/*
vamos alterar o tipo do 'valor_unitario' para
varchar e será not null:
*/
alter table produto
modify valor_unitario varchar(50) not null;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idproduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/*
adicionando colunas
*/
/*
vamos adicionar a coluna 'peso':
*/
alter table produto
add peso float(10,2) not null;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idproduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
| peso           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*
por padrão, a nova coluna será adicionada na
ultima posição (na ordem) da tabela
*/
/*
lembrando que a cláusula 'select' nos permite
projetar a tabela com as colunas ordem em que desejarmos
*/
/*
a pesar disso, temos como determinar a posição
em que a nova coluna será adicionada na tabela
*/

/*
antes de praticar, vamos apagar a coluna
'peso' da nossa tabela:
*/
alter table produto
drop column peso;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idproduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*
temos duas formas de posicionarmos uma coluna em
uma tabela utilizando o ADD COLUMN:
- FIRST: adiciona como a primeira coluna
- AFTER: adiciona após uma determinada coluna
*/

/*
- AFTER
*/
/*
vamos adicionar a coluna 'peso' após a 
coluna 'nome_produto':
*/
alter table produto
add column peso float(10,2) not null
after nome_produto;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idproduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| peso           | float(10,2) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*
vamos dropar a coluna 'peso' novamente
*/
alter table produto
drop column peso;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idproduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/*
- FIRST
*/
/*
vamos adicionar a coluna 'peso' sendo a
primeira coluna da tabela:
*/
alter table produto
add column peso float(10,2) not null
first;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| peso           | float(10,2) | NO   |     | NULL    |                |
| idproduto      | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome_produto   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | varchar(50) | NO   |     | NULL    |                |
| frete          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+



--																											aula 50: EXERCÍCIOS DE DML


select * from cliente;

/*
vamos povoar nosso banco:
*/

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

select * from cliente;

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',8);

select * from endereco;


/* CADASTRE TELEFONES PARA OS CLIENTES */

INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);
INSERT INTO TELEFONE VALUES(NULL,'CEL','34983755',8);

select * from telefone;


/*
EXERCÍCIOS:
*/

					/* RELATORIO GERAL DE TODOS OS CLIENTES */
					/* RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDERECO) */
select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
	   e.idendereco, e.rua, e.bairro, e.cidade, e.estado, e.id_cliente,
	   t.idtelefone, t.tipo, t.numero, t.id_cliente
from cliente c
inner join endereco e
	on c.idcliente = e.id_cliente
inner join telefone t
	on c.idcliente = t.id_cliente;


					/* RELATORIO DE HOMENS */
select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
	   e.idendereco, e.rua, e.bairro, e.cidade, e.estado, e.id_cliente,
	   t.idtelefone, t.tipo, t.numero, t.id_cliente
from cliente c
inner join endereco e
	on c.idcliente = e.id_cliente
inner join telefone t
	on c.idcliente = t.id_cliente
where sexo = 'm';


					/* RELATORIO DE MULHERES */
select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
	   e.idendereco, e.rua, e.bairro, e.cidade, e.estado, e.id_cliente,
	   t.idtelefone, t.tipo, t.numero, t.id_cliente
from cliente c
inner join endereco e
	on c.idcliente = e.id_cliente
inner join telefone t
	on c.idcliente = t.id_cliente
where sexo = 'f';


					/* QUANTIDADE DE HOMENS E MULHERES */
select sexo, count(*) as QUANTIDADE
from cliente
group by sexo;

					/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
					NAO TENHAM CELULAR */



-- RESPOSTAS:

/* RELATORIO GERAL DE TODOS OS CLIENTES */

/* RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDERECO) */
desc cliente;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

desc endereco;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

desc telefone;
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
	   e.idendereco, e.rua, e.bairro, e.cidade, e.estado, e.id_cliente,
	   t.idtelefone, t.tipo, t.numero, t.id_cliente
from cliente c
inner join endereco e
	on c.idcliente = e.id_cliente
inner join telefone t
	on c.idcliente = t.id_cliente;

+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
| idcliente | nome    | sexo | email             | cpf         | idendereco | rua                | bairro     | cidade         | estado | id_cliente | idtelefone | tipo | numero   | id_cliente |
+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          1 | CEL  | 78458743 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          2 | RES  | 56576876 |          5 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          3 | CEL  | 87866896 |          1 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |          2 |          4 | COM  | 54768899 |          2 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          5 | RES  | 99667587 |          1 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   |          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |          3 |          6 | CEL  | 78989765 |          3 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   |          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |          3 |          7 | CEL  | 99766676 |          3 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          8 | COM  | 66687899 |          1 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          9 | RES  | 89986668 |          5 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |          2 |         10 | CEL  | 88687909 |          2 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |          9 |         11 | RES  | 68976565 |          9 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |          9 |         12 | CEL  | 99656675 |          9 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         13 | CEL  | 33567765 |         11 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         14 | CEL  | 88668786 |         11 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         15 | COM  | 55689654 |         11 |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    |         11 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |         12 |         16 | COM  | 88687979 |         12 |
|        13 | LORENA  | M    | NULL              | 774557887   |         12 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |         13 |         17 | COM  | 88965676 |         13 |
|        15 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    |         14 | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     |         15 |         18 | CEL  | 89966809 |         15 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |         15 | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     |         16 |         19 | COM  | 88679978 |         16 |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    |         16 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |         17 |         20 | CEL  | 99655768 |         17 |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   |         17 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |         18 |         21 | RES  | 89955665 |         18 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |         19 |         22 | RES  | 77455786 |         19 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |         19 |         23 | RES  | 89766554 |         19 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |         20 |         24 | RES  | 77755785 |         20 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |         20 |         25 | COM  | 44522578 |         20 |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |         20 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |          8 |         26 | CEL  | 34983755 |          8 |
+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+



/* RELATORIO DE HOMENS */

select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
	   e.idendereco, e.rua, e.bairro, e.cidade, e.estado, e.id_cliente,
	   t.idtelefone, t.tipo, t.numero, t.id_cliente
from cliente c
inner join endereco e
	on c.idcliente = e.id_cliente
inner join telefone t
	on c.idcliente = t.id_cliente
where sexo = 'm';

+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
| idcliente | nome    | sexo | email             | cpf         | idendereco | rua                | bairro     | cidade         | estado | id_cliente | idtelefone | tipo | numero   | id_cliente |
+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          3 | CEL  | 87866896 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          5 | RES  | 99667587 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     |          1 |          8 | COM  | 66687899 |          1 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |          2 |          4 | COM  | 54768899 |          2 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     |          2 |         10 | CEL  | 88687909 |          2 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          1 | CEL  | 78458743 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          2 | RES  | 56576876 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     |          5 |          9 | RES  | 89986668 |          5 |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |         20 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |          8 |         26 | CEL  | 34983755 |          8 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |          9 |         11 | RES  | 68976565 |          9 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |          8 | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |          9 |         12 | CEL  | 99656675 |          9 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         13 | CEL  | 33567765 |         11 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         14 | CEL  | 88668786 |         11 |
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         15 | COM  | 55689654 |         11 |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    |         11 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |         12 |         16 | COM  | 88687979 |         12 |
|        13 | LORENA  | M    | NULL              | 774557887   |         12 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |         13 |         17 | COM  | 88965676 |         13 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |         15 | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     |         16 |         19 | COM  | 88679978 |         16 |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    |         16 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |         17 |         20 | CEL  | 99655768 |         17 |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   |         17 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |         18 |         21 | RES  | 89955665 |         18 |
+-----------+---------+------+-------------------+-------------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
/*
vemos aqui que tem alguns registros de mulheres que estão com SEXO = 'M'
sendo assim vamos aproveitar para corrigir as informações erradas:
*/
/*
os registros a serem atualizados são os de PK 11, 12, 13, 17 e 18
*/

select * from cliente
where idcliente = 11
or idcliente = 12
or idcliente = 13
or idcliente = 17
or idcliente = 18;
+-----------+---------+------+-------------------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       |
+-----------+---------+------+-------------------+-----------+
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778 |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789  |
|        13 | LORENA  | M    | NULL              | 774557887 |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763  |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213 |
+-----------+---------+------+-------------------+-----------+
/*
podemos fazer a projeção assim também:
*/
select * from cliente
where idcliente in (11, 12, 13, 17, 18);
+-----------+---------+------+-------------------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       |
+-----------+---------+------+-------------------+-----------+
|        11 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778 |
|        12 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789  |
|        13 | LORENA  | M    | NULL              | 774557887 |
|        17 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763  |
|        18 | CARMEM  | M    | CARMEM@IG.COM     | 787832213 |
+-----------+---------+------+-------------------+-----------+

/*
agora vamos atualizar os dados que estão errados:
*/
update cliente
	set sexo = 'f'
	where idcliente in (11, 12, 13, 17, 18);
/*
ok, foi alterado
*/
+-----------+---------+------+-------------------+-----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF       |
+-----------+---------+------+-------------------+-----------+
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  |
|        13 | LORENA  | F    | NULL              | 774557887 |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 |
+-----------+---------+------+-------------------+-----------+

/*
vamos novamente trazer o relatório de homens:
*/
select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
	   e.idendereco, e.rua, e.bairro, e.cidade, e.estado, e.id_cliente,
	   t.idtelefone, t.tipo, t.numero, t.id_cliente
from cliente c
inner join endereco e
	on c.idcliente = e.id_cliente
inner join telefone t
	on c.idcliente = t.id_cliente
where sexo = 'm';
+-----------+---------+------+-----------------+-------------+------------+--------------------+-----------+----------------+--------+------------+------------+------+----------+------------+
| idcliente | nome    | sexo | email           | cpf         | idendereco | rua                | bairro    | cidade         | estado | id_cliente | idtelefone | tipo | numero   | id_cliente |
+-----------+---------+------+-----------------+-------------+------------+--------------------+-----------+----------------+--------+------------+------------+------+----------+------------+
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO    | RIO DE JANEIRO | RJ     |          1 |          3 | CEL  | 87866896 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO    | RIO DE JANEIRO | RJ     |          1 |          5 | RES  | 99667587 |          1 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 |          2 | RUA CAPITAO HERMES | CENTRO    | RIO DE JANEIRO | RJ     |          1 |          8 | COM  | 66687899 |          1 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO   | RIO DE JANEIRO | RJ     |          2 |          4 | COM  | 54768899 |          2 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  |          4 | RUA ALFANDEGA      | ESTACIO   | RIO DE JANEIRO | RJ     |          2 |         10 | CEL  | 88687909 |          2 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO    | VITORIA        | ES     |          5 |          1 | CEL  | 78458743 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO    | VITORIA        | ES     |          5 |          2 | RES  | 56576876 |          5 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  |          6 | RUA URUGUAIANA     | CENTRO    | VITORIA        | ES     |          5 |          9 | RES  | 89986668 |          5 |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM   | 4657765     |         20 | RUA GOMES FREIRE   | CENTRO    | RIO DE JANEIRO | RJ     |          8 |         26 | CEL  | 34983755 |          8 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM | 7687567     |          8 | RUA GUEDES         | CASCADURA | B. HORIZONTE   | MG     |          9 |         11 | RES  | 68976565 |          9 |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM | 7687567     |          8 | RUA GUEDES         | CASCADURA | B. HORIZONTE   | MG     |          9 |         12 | CEL  | 99656675 |          9 |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM | 3423565     |         15 | AV CARLOS BARROSO  | JARDINS   | SAO PAULO      | SP     |         16 |         19 | COM  | 88679978 |         16 |
+-----------+---------+------+-----------------+-------------+------------+--------------------+-----------+----------------+--------+------------+------------+------+----------+------------+



/* RELATORIO DE MULHERES */
select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
	   e.idendereco, e.rua, e.bairro, e.cidade, e.estado, e.id_cliente,
	   t.idtelefone, t.tipo, t.numero, t.id_cliente
from cliente c
inner join endereco e
	on c.idcliente = e.id_cliente
inner join telefone t
	on c.idcliente = t.id_cliente
where sexo = 'f';
+-----------+---------+------+-------------------+-----------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
| idcliente | nome    | sexo | email             | cpf       | idendereco | rua                | bairro     | cidade         | estado | id_cliente | idtelefone | tipo | numero   | id_cliente |
+-----------+---------+------+-------------------+-----------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 |          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |          3 |          6 | CEL  | 78989765 |          3 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 |          3 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     |          3 |          7 | CEL  | 99766676 |          3 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         13 | CEL  | 33567765 |         11 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         14 | CEL  | 88668786 |         11 |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 |         10 | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |         11 |         15 | COM  | 55689654 |         11 |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  |         11 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |         12 |         16 | COM  | 88687979 |         12 |
|        13 | LORENA  | F    | NULL              | 774557887 |         12 | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |         13 |         17 | COM  | 88965676 |         13 |
|        15 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767  |         14 | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     |         15 |         18 | CEL  | 89966809 |         15 |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  |         16 | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     |         17 |         20 | CEL  | 99655768 |         17 |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 |         17 | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     |         18 |         21 | RES  | 89955665 |         18 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  |         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |         19 |         22 | RES  | 77455786 |         19 |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  |         18 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     |         19 |         23 | RES  | 89766554 |         19 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  |         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |         20 |         24 | RES  | 77755785 |         20 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  |         19 | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     |         20 |         25 | COM  | 44522578 |         20 |
+-----------+---------+------+-------------------+-----------+------------+--------------------+------------+----------------+--------+------------+------------+------+----------+------------+

/*
precisamos corrigir o registro 15, Antonio está com sexo F
*/
update cliente
	set sexo = 'm'
	where idcliente = 15;

/*
ok 
*/


/* QUANTIDADE DE HOMENS E MULHERES */
select sexo, count(*) as QUANTIDADE
from cliente
group by sexo;
+------+------------+
| sexo | QUANTIDADE |
+------+------------+
| M    |          9 |
| F    |         11 |
+------+------------+

select count(*) as QUANTIDADE, sexo
from cliente
group by sexo;
+------------+------+
| QUANTIDADE | sexo |
+------------+------+
|          9 | M    |
|         11 | F    |
+------------+------+


/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
NAO TENHAM CELULAR */

/*
faremos por partes
*/
/*
faremos ima projeção para ver os dados:
*/
select c.idcliente, c.email, c.nome, c.sexo
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;

/*
agora vamos adicionar alguns filtros:
*/
select c.idcliente, c.email, c.nome, c.sexo, t.tipo
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and bairro = 'centro'
and cidade = 'rio de janeiro';

/*
vamos detalhar mais, colocando projeções que irão nos auxiliar:
*/
select c.idcliente, c.email, c.nome, c.sexo, t.tipo, e.bairro, e.cidade
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and bairro = 'centro'
and cidade = 'rio de janeiro';

/*
vamos incrementar mais filtros:
*/
select c.idcliente, c.email, c.nome, c.sexo, t.tipo, e.bairro, e.cidade
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and bairro = 'centro'
and cidade = 'rio de janeiro'
and (tipo = 'com' or tipo = 'res');
/*
o resultado não foi o esperado, pois nos retornou um resultado onde um mesmo registro
que contem tipo CEL e COM, por exemplo, retornou devido ao tipo COM que foi filtrado
mas o enunciado nos pediu apenas registro que não possuem celular
*/
/*
este exemplo requer uma query onde será utilizado uma query dentro de outra query,
então o exercício ficara em aberto e retornaremos a ele mais a frente
*/




							-- mais exercícios:

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
select  c.nome, c.email, t.numero as celular 	--projeção
from cliente c 									--origem
inner join endereco e 							--junção
on c.idcliente = e.id_cliente					--junção
inner join telefone t 		 					--junção
on c.idcliente = t.id_cliente					--junção
where estado = 'rj'								--seleção
and tipo = 'cel';  								--seleção
+--------+-----------------+----------+
| nome   | email           | celular  |
+--------+-----------------+----------+
| JOAO   | JOAOA@IG.COM    | 87866896 |
| CARLOS | CARLOSA@IG.COM  | 88687909 |
| KARLA  | KARLA@GMAIL.COM | 33567765 |
| KARLA  | KARLA@GMAIL.COM | 88668786 |
| FLAVIO | FLAVIO@IG.COM   | 34983755 |
+--------+-----------------+----------+


/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
select c.nome, c.email, t.numero as celular
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'f'
and tipo = 'cel'
and estado = 'sp';
+------+------------+----------+
| nome | email      | celular  |
+------+------------+----------+
| ANA  | ANA@IG.COM | 78989765 |
| ANA  | ANA@IG.COM | 99766676 |
+------+------------+----------+



--																											AULA 53 - funções IFNULL
/*
no nosso banco temos um registro sem email, NULL
*/
|        13 | LORENA  | M    | NULL              |

/*
na função IFNULL devemos informar dois parâmetros
ifnull(a coluna a ser tratada, uma string qualquer que será projetada)
*/

select * from cliente;
+-----------+---------+------+-------------------+-------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         |
+-----------+---------+------+-------------------+-------------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   |
|         4 | CLARA   | F    | NULL              | 5687766856  |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  |
|         6 | CELIA   | M    | JCELIA@IG.COM     | 5767876889  |
|         7 | Paula   | F    | NULL              | 77437493    |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |
|        10 | GIOVANA | F    | NULL              | 0876655     |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    |
|        13 | LORENA  | F    | NULL              | 774557887   |
|        14 | EDUARDO | M    | NULL              | 54376457    |
|        15 | ANTONIO | M    | ANTONIO@IG.COM    | 12436767    |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |
+-----------+---------+------+-------------------+-------------+

select nome, ifnull(email, 'não possui email')
from cliente;
+---------+------------------------------------+
| nome    | ifnull(email, 'não possui email')  |
+---------+------------------------------------+
| JOAO    | JOAOA@IG.COM                       |
| CARLOS  | CARLOSA@IG.COM                     |
| ANA     | ANA@IG.COM                         |
| CLARA   | não possui email                   |
| JORGE   | JORGE@IG.COM                       |
| CELIA   | JCELIA@IG.COM                      |
| Paula   | não possui email                   |
| FLAVIO  | FLAVIO@IG.COM                      |
| ANDRE   | ANDRE@GLOBO.COM                    |
| GIOVANA | não possui email                   |
| KARLA   | KARLA@GMAIL.COM                    |
| DANIELE | DANIELE@GMAIL.COM                  |
| LORENA  | não possui email                   |
| EDUARDO | não possui email                   |
| ANTONIO | ANTONIO@IG.COM                     |
| ANTONIO | ANTONIO@UOL.COM                    |
| ELAINE  | ELAINE@GLOBO.COM                   |
| CARMEM  | CARMEM@IG.COM                      |
| ADRIANA | ADRIANA@GMAIL.COM                  |
| JOICE   | JOICE@GMAIL.COM                    |
+---------+------------------------------------+

select nome, ifnull(email, 'não tem') as email
from cliente;
+---------+-------------------+
| nome    | email             |
+---------+-------------------+
| JOAO    | JOAOA@IG.COM      |
| CARLOS  | CARLOSA@IG.COM    |
| ANA     | ANA@IG.COM        |
| CLARA   | não tem           |
| JORGE   | JORGE@IG.COM      |
| CELIA   | JCELIA@IG.COM     |
| Paula   | não tem           |
| FLAVIO  | FLAVIO@IG.COM     |
| ANDRE   | ANDRE@GLOBO.COM   |
| GIOVANA | não tem           |
| KARLA   | KARLA@GMAIL.COM   |
| DANIELE | DANIELE@GMAIL.COM |
| LORENA  | não tem           |
| EDUARDO | não tem           |
| ANTONIO | ANTONIO@IG.COM    |
| ANTONIO | ANTONIO@UOL.COM   |
| ELAINE  | ELAINE@GLOBO.COM  |
| CARMEM  | CARMEM@IG.COM     |
| ADRIANA | ADRIANA@GMAIL.COM |
| JOICE   | JOICE@GMAIL.COM   |
+---------+-------------------+

select nome, ifnull(email, '**********') as email
from cliente;
+---------+-------------------+
| nome    | email             |
+---------+-------------------+
| JOAO    | JOAOA@IG.COM      |
| CARLOS  | CARLOSA@IG.COM    |
| ANA     | ANA@IG.COM        |
| CLARA   | **********        |
| JORGE   | JORGE@IG.COM      |
| CELIA   | JCELIA@IG.COM     |
| Paula   | **********        |
| FLAVIO  | FLAVIO@IG.COM     |
| ANDRE   | ANDRE@GLOBO.COM   |
| GIOVANA | **********        |
| KARLA   | KARLA@GMAIL.COM   |
| DANIELE | DANIELE@GMAIL.COM |
| LORENA  | **********        |
| EDUARDO | **********        |
| ANTONIO | ANTONIO@IG.COM    |
| ANTONIO | ANTONIO@UOL.COM   |
| ELAINE  | ELAINE@GLOBO.COM  |
| CARMEM  | CARMEM@IG.COM     |
| ADRIANA | ADRIANA@GMAIL.COM |
| JOICE   | JOICE@GMAIL.COM   |
+---------+-------------------+


--																														AULA 54 - VIEWS
/*
temos uma query que utilizamos por diversas vezes:
*/
select c.nome,
	   c.sexo,
	   ifnull(c.email, '**********') as email,
	   t.tipo,
	   t.numero,
	   e.bairro,
	   e.cidade,
	   e.estado
from cliente c
inner join telefone t
	on c.idcliente = t.id_cliente
inner join endereco e
	on c.idcliente = e.id_cliente;


/*
vamos criar uma VIEW para facilitar o uso daquery
para não precisarmos criar a query sempre que quisermos usar
a view será como um ponteiramento para uma query definida
*/
create view relatorio as
select c.nome,
	   c.sexo,
	   ifnull(c.email, '**********') as email,
	   t.tipo,
	   t.numero,
	   e.bairro,
	   e.cidade,
	   e.estado
from cliente c
inner join telefone t
	on c.idcliente = t.id_cliente
inner join endereco e
	on c.idcliente = e.id_cliente;
/*
ok, view criada
*/

/*
para chamar/utilizar a view:
*/
select * from relatorio;
+---------+------+-------------------+------+----------+------------+----------------+--------+
| nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| JORGE   | M    | JORGE@IG.COM      | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JORGE   | M    | JORGE@IG.COM      | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| JOAO    | M    | JOAOA@IG.COM      | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| JOAO    | M    | JOAOA@IG.COM      | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JORGE   | M    | JORGE@IG.COM      | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOSA@IG.COM    | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| LORENA  | F    | **********        | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 34983755 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+------------+----------------+--------+

/*
para visualizarmos nossas views criadas, damos um SHOW TABLES:
*/
show tables;
+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| produto            |
| relatorio          |
| telefone           |
+--------------------+

/*
apagando uma view:
*/
drop view relatorio;
/*
ok, view apagada
*/

/*
vamos criar novamente nossa view, agora com 
algumas melhorias para a identificação, colocando
um prefixo no nome da view facilitará a identificação
da view quando dermos um SHOW TABLES
*/
create view v_relatorio as
select c.nome,
	   c.sexo,
	   ifnull(c.email, '**********') as email,
	   t.tipo,
	   t.numero,
	   e.bairro,
	   e.cidade,
	   e.estado
from cliente c
inner join telefone t
	on c.idcliente = t.id_cliente
inner join endereco e
	on c.idcliente = e.id_cliente;
/*
ok, view criada
ao padronizar com um prefixo, facilita 
para sabermos quais são nossas views
no SHOW TABLES:
*/
+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| produto            |
| telefone           |
| v_relatorio        |
+--------------------+

/*
podemos também fazer uma query da nossa view
note que neste caso não se faz necessário 
o uso de ponteiramento:
*/
select nome, numero, estado
from v_relatorio;
+---------+----------+--------+
| nome    | numero   | estado |
+---------+----------+--------+
| JORGE   | 78458743 | ES     |
| JORGE   | 56576876 | ES     |
| JOAO    | 87866896 | RJ     |
| CARLOS  | 54768899 | RJ     |
| JOAO    | 99667587 | RJ     |
| ANA     | 78989765 | SP     |
| ANA     | 99766676 | SP     |
| JOAO    | 66687899 | RJ     |
| JORGE   | 89986668 | ES     |
| CARLOS  | 88687909 | RJ     |
| ANDRE   | 68976565 | MG     |
| ANDRE   | 99656675 | MG     |
| KARLA   | 33567765 | RJ     |
| KARLA   | 88668786 | RJ     |
| KARLA   | 55689654 | RJ     |
| DANIELE | 88687979 | RJ     |
| LORENA  | 88965676 | ES     |
| ANTONIO | 89966809 | PR     |
| ANTONIO | 88679978 | SP     |
| ELAINE  | 99655768 | PR     |
| CARMEM  | 89955665 | SP     |
| ADRIANA | 77455786 | RJ     |
| ADRIANA | 89766554 | RJ     |
| JOICE   | 77755785 | RJ     |
| JOICE   | 44522578 | RJ     |
| FLAVIO  | 34983755 | RJ     |
+---------+----------+--------+



--																									AULA 55 - OPERAÇÕES DE DML EM VIEWS

/*
update - insert - delete - seleção
*/

/*
insert:
*/
insert into v_relatorio values(
	'ANDREIA', 'F', 'ANDREIA@UOL.COM.BR', 'CEL', 35456629, 'CENTRO', 'VITORIA', 'ES'
);

ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list
mysql>
/*
o erro nos diz que não posso inserir um registro em
uma view com JOIN
*/

/*
delete:
*/
delete from v_relatorio
	where nome = 'jorge';

ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio'
mysql>
/*
o erro nos diz que não posso deletar um registro em
uma view com JOIN
*/

/*
update:
*/
update v_relatorio set nome = 'JOSE' where nome = 'JORGE';
/*
ok, foi alterado
*/
select * from v_relatorio;
+---------+------+-------------------+------+----------+------------+----------------+--------+
| nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| JOSE    | M    | JORGE@IG.COM      | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| JOAO    | M    | JOAOA@IG.COM      | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |

/*
é permitido fazer update em view com JOIN

MUITO CUIDADO AO FAZER UPDATE NA VIEW,
O QUE FOR MUDADO NA VIEW, VAI MUDAR NA TABELA 
TAMBÉM
*/

/*
TEMOS QUE TER MUITO CUIDADO NAS VIEWS SEM JOIN, PODEMOS
FAZER INSERT E DELETE, POREM TEMOS QUE TER CUIDADO 
COM OS PARÂMETROS E TIPAGEM DOS DADOS, COM AS
RESTRIÇÕES SE TEM UNIQUE, SE NÃO TEM UNIQUE
SE TEM NOT NULL SE NÃO TEM NOT NULL
*/


/*
seleção:
*/
select * from v_relatorio
where sexo = 'f';  	--SELEÇÃO
+---------+------+-------------------+------+----------+------------+----------------+--------+
| nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| LORENA  | F    | **********        | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+------------+----------------+--------+



--																											AULA 56 - ORDENANDO DADOS
/*
ORDER BY
*/
select * from cliente;
+-----------+---------+------+-------------------+-------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         |
+-----------+---------+------+-------------------+-------------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   |
|         4 | CLARA   | F    | NULL              | 5687766856  |
|         5 | JOSE    | M    | JORGE@IG.COM      | 8756547688  |
|         6 | CELIA   | M    | JCELIA@IG.COM     | 5767876889  |
|         7 | Paula   | F    | NULL              | 77437493    |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |
|        10 | GIOVANA | F    | NULL              | 0876655     |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    |
|        13 | LORENA  | F    | NULL              | 774557887   |
|        14 | EDUARDO | M    | NULL              | 54376457    |
|        15 | ANTONIO | M    | ANTONIO@IG.COM    | 12436767    |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |
+-----------+---------+------+-------------------+-------------+

select * from cliente
order by nome;
+-----------+---------+------+-------------------+-------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         |
+-----------+---------+------+-------------------+-------------+
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |
|        15 | ANTONIO | M    | ANTONIO@IG.COM    | 12436767    |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   |
|         6 | CELIA   | M    | JCELIA@IG.COM     | 5767876889  |
|         4 | CLARA   | F    | NULL              | 5687766856  |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    |
|        14 | EDUARDO | M    | NULL              | 54376457    |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |
|        10 | GIOVANA | F    | NULL              | 0876655     |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |
|         5 | JOSE    | M    | JORGE@IG.COM      | 8756547688  |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   |
|        13 | LORENA  | F    | NULL              | 774557887   |
|         7 | Paula   | F    | NULL              | 77437493    |
+-----------+---------+------+-------------------+-------------+

select * from cliente
order by 1;

select * from cliente
order by 2;

/*
podemos ordenar tanto pelo nome da coluna como 
também pelo número da coluna:
idcliente = 1
nome = 2
*/


/*
podemos também ordenar por mais de uma coluna:
*/
select * from v_relatorio
order by 8, 1;

select * from v_relatorio
order by estado, nome;
+---------+------+-------------------+------+----------+------------+----------------+--------+
| nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| JOSE    | M    | JORGE@IG.COM      | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| LORENA  | F    | **********        | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 34983755 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
+---------+------+-------------------+------+----------+------------+----------------+--------+


select nome, estado
from v_relatorio
order by 2, 1;
+---------+--------+
| nome    | estado |
+---------+--------+
| JOSE    | ES     |
| JOSE    | ES     |
| JOSE    | ES     |
| LORENA  | ES     |
| ANDRE   | MG     |
| ANDRE   | MG     |
| ANTONIO | PR     |
| ELAINE  | PR     |
| ADRIANA | RJ     |
| ADRIANA | RJ     |
| CARLOS  | RJ     |
| CARLOS  | RJ     |
| DANIELE | RJ     |
| FLAVIO  | RJ     |
| JOAO    | RJ     |
| JOAO    | RJ     |
| JOAO    | RJ     |
| JOICE   | RJ     |
| JOICE   | RJ     |
| KARLA   | RJ     |
| KARLA   | RJ     |
| KARLA   | RJ     |
| ANA     | SP     |
| ANA     | SP     |
| ANTONIO | SP     |
| CARMEM  | SP     |
+---------+--------+

/*
ao ordenar utilizando os index das colunas (numeros das colunas) temos
que ter o cuidado se as colunas indexadas serão projetadas, caso não
o banco de dados não vai respoder:
*/
select nome
from v_relatorio
order by 8, 1;

ERROR 1054 (42S22): Unknown column '8' in 'order clause'

/*
sendo assim, por boa prática, utilizamos os nomes das colunas:
*/
select nome
from v_relatorio
order by estado, nome;
+---------+
| nome    |
+---------+
| JOSE    |
| JOSE    |
| JOSE    |
| LORENA  |
| ANDRE   |
| ANDRE   |
| ANTONIO |
| ELAINE  |
| ADRIANA |
| ADRIANA |
| CARLOS  |
| CARLOS  |
| DANIELE |
| FLAVIO  |
| JOAO    |
| JOAO    |
| JOAO    |
| JOICE   |
| JOICE   |
| KARLA   |
| KARLA   |
| KARLA   |
| ANA     |
| ANA     |
| ANTONIO |
| CARMEM  |
+---------+


/*
order by desc(descendente) / asc(ascendente)
*/
select * from v_relatorio
order by estado desc, nome desc;
+---------+------+-------------------+------+----------+------------+----------------+--------+
| nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 34983755 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| LORENA  | F    | **********        | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
+---------+------+-------------------+------+----------+------------+----------------+--------+

/*
lembrando que no order by, quando não especificamos desc ou asc, por default o
order by vai trazer em ordem crescente(asc):
*/
select * from v_relatorio
order by estado, nome desc;
+---------+------+-------------------+------+----------+------------+----------------+--------+
| nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| LORENA  | F    | **********        | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 34983755 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
+---------+------+-------------------+------+----------+------------+----------------+--------+


/*
ordenando com joins:
*/
select c.nome,
	   c.sexo,
	   ifnull(c.email, '**********') as email,
	   t.tipo,
	   t.numero,
	   e.bairro,
	   e.cidade,
	   e.estado
from cliente c
inner join telefone t
	on c.idcliente = t.id_cliente
inner join endereco e
	on c.idcliente = e.id_cliente;
+---------+------+-------------------+------+----------+------------+----------------+--------+
| nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| JOSE    | M    | JORGE@IG.COM      | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| JOAO    | M    | JOAOA@IG.COM      | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| JOAO    | M    | JOAOA@IG.COM      | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOSA@IG.COM    | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| LORENA  | F    | **********        | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 34983755 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+------------+----------------+--------+

select c.nome,
	   c.sexo,
	   ifnull(c.email, '**********') as email,
	   t.tipo,
	   t.numero,
	   e.bairro,
	   e.cidade,
	   e.estado
from cliente c
inner join telefone t
	on c.idcliente = t.id_cliente
inner join endereco e
	on c.idcliente = e.id_cliente
order by 8;
+---------+------+-------------------+------+----------+------------+----------------+--------+
| nome    | sexo | email             | tipo | numero   | bairro     | cidade         | estado |
+---------+------+-------------------+------+----------+------------+----------------+--------+
| JOSE    | M    | JORGE@IG.COM      | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| LORENA  | F    | **********        | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM      | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM   | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| ELAINE  | F    | ELAINE@GLOBO.COM  | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM    | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM   | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM    | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM   | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM      | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM     | CEL  | 34983755 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM   | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM     | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
+---------+------+-------------------+------+----------+------------+----------------+--------+



--																												AULA 57 - DELIMITER
/*
vamos alterar nosso delimitador para podermos programar em SQL
*/

/*
o comando STATUS vai nos trazer as informações do nosso servidor,
neste comando não digitamos ; no final
*/

STATUS

mysql> status
--------------
C:\Program Files (x86)\MySQL\MySQL Server 5.7\bin\mysql.exe  Ver 14.14 Distrib 5.7.20, for Win32 (AMD64)

Connection id:          3
Current database:       comercio
Current user:           root@localhost
SSL:                    Not in use
Using delimiter:        ;
Server version:         5.7.20-log MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 1 hour 4 min 55 sec

/*
para mudar o delimitador usamos o comando: DELIMITER seguido do 
novo delimitador a ser utilizado:
*/

delimiter $

/*
ok, o delimiter agora é $
*/

select * from cliente$
+-----------+---------+------+-------------------+-------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         |
+-----------+---------+------+-------------------+-------------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   |
|         4 | CLARA   | F    | NULL              | 5687766856  |
|         5 | JOSE    | M    | JORGE@IG.COM      | 8756547688  |
|         6 | CELIA   | M    | JCELIA@IG.COM     | 5767876889  |
|         7 | Paula   | F    | NULL              | 77437493    |
|         8 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     |
|         9 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     |
|        10 | GIOVANA | F    | NULL              | 0876655     |
|        11 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778   |
|        12 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789    |
|        13 | LORENA  | F    | NULL              | 774557887   |
|        14 | EDUARDO | M    | NULL              | 54376457    |
|        15 | ANTONIO | M    | ANTONIO@IG.COM    | 12436767    |
|        16 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     |
|        17 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763    |
|        18 | CARMEM  | F    | CARMEM@IG.COM     | 787832213   |
|        19 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    |
|        20 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    |
+-----------+---------+------+-------------------+-------------+

/*
todas as vezes em que o banco for fechado e reaberto
o delimiter reinicia sendo ;
*/


--																				AULA 58 - INICIANDO COM PROGRAMAÇÃO EM BANCO DE DADOS
/*
STORED PROCEDURES - são procedimentos armazenados,
blocos de programação que ficam armazenados no banco
*/

/*
existem blocos de programação anônimos e
blocos de programação armazenados que ficam no banco, estes
recebem nome, são procedimentos nomeados, ou PROCEDURES
*/

/*
bloco anônimo:
*/
select 'mafra';
/*
ele será executado, mas não fica no banco
*/



/*
exemplo prático:
*/
/*
temos um requisito que pede:
"toda vez em que alguém logar no banco, deve trazer o nome da empresa,
essa 'função' deverá ficar armazenada no banco como um bloco de programação."
*/
use comercio;

delimiter $

status

/*
sintaxe da criação da procedure:
*/
create procedure nome()
	begin
		qualquer código de programação,
		pode ser um insert, ou delete, ou update
		ou qualquer coisa
	end
$


/*
criando a procedure que foi pedida:
(procedure sem parâmetro)
*/
create procedure nome_empresa()
	begin
		select 'UNIVERSIDADE DOS DADOS' as empresa;
	end
$
Query OK,

delimiter ;

/*
chamando a procedure:
*/
call nome_empresa;
+------------------------+
| empresa                |
+------------------------+
| UNIVERSIDADE DOS DADOS |
+------------------------+

/*
apagando uma procedure:
*/
drop procedure nome_empresa;
Query OK

/*
PROCEDURE COM PARÂMETROS
*/
delimiter $

create procedure conta(num1 int, num2 int)
	begin
		select num1 + num2 as conta;
	end
$
Query OK

delimiter ;

/*
chamando a procedure:
*/
call conta(100, 50);
+-------+
| conta |
+-------+
|   150 |
+-------+


--																								AULA 59 - PROCEDURES NO MUNDO REAL

--																									AULA 60 - PROCEDURES COM QUERY

/*
vou apagar as databases trabalhadas até o momento
para iniciar do zero
*/
show databases;

drop database comercio;
drop database exercicio;
drop database livraria;
drop database projeto;
/*
ok foram apagadas
*/

/*
vamos iniciar com as procedures:
*/
/*
criar duas procedures,
uma para inserir dados
uma para consultar cursos
*/

create database projeto;

use projeto;

create table cursos(
	idcurso int primary key auto_increment,
	nome varchar(30) not null,
	horas int(3) not null,
	valor float(10,2)
);

insert into cursos values(null, 'java', 30, 500.00);
insert into cursos values(null, 'fundamentos de bancos de dados', 40, 700.00);

/*
procedure para inserir dados:
*/

delimiter $

create procedure cad_curso(p_nome varchar(30),
						   p_horas int(3),
						   p_valor float(10,2))
	begin
		insert into cursos values(null, p_nome, p_horas, p_valor);
	end
$

delimiter ;

call cad_curso('bi sql server',35,3000.00);
call cad_curso('power bi',20,1000.00);
call cad_curso('tableau',30,1200.00);

select * from cursos;
+---------+--------------------------------+-------+---------+
| idcurso | nome                           | horas | valor   |
+---------+--------------------------------+-------+---------+
|       1 | java                           |    30 |  500.00 |
|       2 | fundamentos de bancos de dados |    40 |  700.00 |
|       3 | bi sql server                  |    35 | 3000.00 |
|       4 | power bi                       |    20 | 1000.00 |
|       5 | tableau                        |    30 | 1200.00 |
+---------+--------------------------------+-------+---------+


/*
procedure para selecionar cursos:
*/

delimiter $

create procedure sel_curso()
	begin
		select idcurso, nome, horas, valor
		from cursos;
	end
$

delimiter ;

call sel_curso();


drop database projeto;

========================================================================================================================================



--																						67 - GROUP BY, COUNT, MAX, MIN, AVG, E FUNÇÕES

/*
funções de agregação numéricas:
*/

create database projeto;

use projeto;

create table vendedores(
	idvendedor int primary key auto_increment,
	nome varchar(30),
	sexo char(1),
	janeiro float(10,2),
	fevereiro float(10,2),
	marco float(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO VENDEDORES VALUES(NULL,'IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA','F',89667.78,57654.87,5755.90);

select * from vendedores;
+------------+----------+------+-----------+-----------+-----------+
| idvendedor | nome     | sexo | janeiro   | fevereiro | marco     |
+------------+----------+------+-----------+-----------+-----------+
|          1 | CARLOS   | M    |  76234.78 |  88346.87 |   5756.90 |
|          2 | MARIA    | F    |   5865.78 |   6768.87 |   4467.90 |
|          3 | ANTONIO  | M    |  78769.78 |   6685.87 |   6664.90 |
|          4 | CLARA    | F    |   5779.78 | 446886.88 |   8965.90 |
|          5 | ANDERSON | M    | 676545.75 |  77544.87 | 578665.88 |
|          6 | IVONE    | F    |  57789.78 |  44774.87 |  68665.90 |
|          7 | JOAO     | M    |   4785.78 |  66478.87 |   6887.90 |
|          8 | CELIA    | F    |  89667.78 |  57654.87 |   5755.90 |
+------------+----------+------+-----------+-----------+-----------+



/*
função max:
traz o valor máximo de uma coluna
*/
select max(fevereiro) as maior_fev
from vendedores;
+-----------+
| maior_fev |
+-----------+
| 446886.88 |
+-----------+

/*
função min:
traz o valor menor de uma coluna
*/
select min(fevereiro) as menor_fev
from vendedores;
+-----------+
| menor_fev |
+-----------+
|   6685.87 |
+-----------+

/*
função avg:
traz o valor medio de uma coluna
*/
select avg(fevereiro) as media_fev
from vendedores;
+--------------+
| media_fev    |
+--------------+
| 99392.744873 |
+--------------+

/*
função truncate:

esta função pede dois parâmetros, são
um número e um número de casas decimais após a vírgula
*/
--				(1ºparam, 2ºparam)
select truncate(avg(fevereiro),2) as media_fev
from vendedores;
+-----------+
| media_fev |
+-----------+
|  99392.74 |
+-----------+


/*
tudo numa query só:
*/
select max(janeiro) as max_jan,
	   min(janeiro) as min_jan,
	   truncate(avg(janeiro),2) as media_jan
	   from vendedores;
+-----------+---------+-----------+
| max_jan   | min_jan | media_jan |
+-----------+---------+-----------+
| 676545.75 | 4785.78 | 124429.90 |
+-----------+---------+-----------+



--																													68 - função sum
/*
a função sum soma os valores de uma coluna
*/
select sum(janeiro) as total_jan
	from vendedores;
+-----------+
| total_jan |
+-----------+
| 995439.21 |
+-----------+


select sum(janeiro) as total_jan,
	   sum(fevereiro) as total_fev,
	   sum(marco) as total_mar
	   from vendedores;
+-----------+-----------+-----------+
| total_jan | total_fev | total_mar |
+-----------+-----------+-----------+
| 995439.21 | 795141.96 | 685831.17 |
+-----------+-----------+-----------+


/*
exemplo, vendas por sexo:
*/
select sexo, sum(fevereiro) as total_fev
	from vendedores
group by sexo;
+------+-----------+
| sexo | total_fev |
+------+-----------+
| F    | 556085.49 |
| M    | 239056.47 |
+------+-----------+



--																													69 - SUBQUERIES

/*
vendedor que vendeu menos em março e seu nome:
vendedor que vendeu mais em marco e seu nome:
vendedor que vendeu em marco mais do que a media de fevereiro:
*/


--vendedor que vendeu menos em março e seu nome:
select nome,
	   marco as menor_valor_marco
	   from vendedores
where marco = (select min(marco) from vendedores);
+-------+-------------------+
| nome  | menor_valor_marco |
+-------+-------------------+
| MARIA |           4467.90 |
+-------+-------------------+
/*
neste caso temos uma subquery, uma query dentro de uma query
a query"(select min(marco) from vendedores)" é chamada de 
inner query ou query de dentro, esta será resolvida primeiro
e após isso será resolvida a query
*/

--vendedor que vendeu mais em marco e seu nome:
select nome,
	   marco as maior_valor_marco
	   from vendedores
where marco = (select max(marco) from vendedores);
+----------+-------------------+
| nome     | maior_valor_marco |
+----------+-------------------+
| ANDERSON |         578665.88 |
+----------+-------------------+

--vendedor que vendeu em marco mais do que a media de fevereiro:
select nome, marco
	   from vendedores
where marco > (select avg(fevereiro) from vendedores);

--vendedor que vendeu em marco menos do que a media de fevereiro:
select nome, marco
	   from vendedores
where marco < (select avg(fevereiro) from vendedores);
+---------+----------+
| nome    | marco    |
+---------+----------+
| CARLOS  |  5756.90 |
| MARIA   |  4467.90 |
| ANTONIO |  6664.90 |
| CLARA   |  8965.90 |
| IVONE   | 68665.90 |
| JOAO    |  6887.90 |
| CELIA   |  5755.90 |
+---------+----------+


--																									70 - OPERADORES (CÁLCULOS) EM LINHA

