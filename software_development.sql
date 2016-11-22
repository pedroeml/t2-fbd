--Trabalho 2 - Fundamentos de Banco de dados 2016/2
--Grupo 5, componentes:
--Alexandre Gabiatti Vieira (Matrícula : 15280507-3)
--Pedro Elpidio Melha Lemos (Matrícula : 14104999-9)

CREATE TABLE DESIGN (
 CODIGO_DESIGN CHAR(10) NOT NULL,
 PADROES VARCHAR(200),
 FRAMEWORKS VARCHAR(200),
 LINGUAGENS VARCHAR(200)
);

ALTER TABLE DESIGN ADD CONSTRAINT PK_DESIGN PRIMARY KEY (CODIGO_DESIGN);


CREATE TABLE FERRAMENTA (
 CODIGO_FERRAMENTA NUMBER(20) NOT NULL,
 NOME VARCHAR(50)
);

ALTER TABLE FERRAMENTA ADD CONSTRAINT PK_FERRAMENTA PRIMARY KEY (CODIGO_FERRAMENTA);


CREATE TABLE FUNCIONARIO (
 CODIGO_FUNCIONARIO VARCHAR(10) NOT NULL,
 COMPETENCIAS VARCHAR(120),
 CARGA_HORARIA NUMBER(3),
 NOME VARCHAR(50),
 CONTRATACAO DATE,
 CPF NUMBER(11)
);

ALTER TABLE FUNCIONARIO ADD CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (CODIGO_FUNCIONARIO);

CREATE TABLE HARDWARE (
 CODIGO_FERRAMENTA NUMBER(20) NOT NULL,
 MARCA_MODELO VARCHAR(50)
);

ALTER TABLE HARDWARE ADD CONSTRAINT PK_HARDWARE PRIMARY KEY (CODIGO_FERRAMENTA);



CREATE TABLE MODELA (
 CODIGO_FUNCIONARIO VARCHAR(10),
 CODIGO_MODELO VARCHAR(10),
 INICIO DATE NOT NULL,
 FIM DATE,
 HORAS NUMBER(3)
);

ALTER TABLE MODELA ADD CONSTRAINT PK_MODELA PRIMARY KEY (CODIGO_FUNCIONARIO,CODIGO_MODELO);


CREATE TABLE MODELO (
 CODIGO_MODELO VARCHAR(10) NOT NULL,
 CAMADAS VARCHAR(120),
 DESCRICAO VARCHAR(200),
 VERSAO VARCHAR(10)
);

ALTER TABLE MODELO ADD CONSTRAINT PK_MODELO PRIMARY KEY (CODIGO_MODELO);


CREATE TABLE PLANEJA (
 CODIGO_FUNCIONARIO VARCHAR(10) NOT NULL,
 CODIGO_DESIGN VARCHAR(10) NOT NULL,
 INICIO DATE NOT NULL,
 FIM DATE,
 HORAS NUMBER(3)
);

ALTER TABLE PLANEJA ADD CONSTRAINT PK_PLANEJA PRIMARY KEY (CODIGO_FUNCIONARIO,CODIGO_DESIGN);


CREATE TABLE PROJETO (
 CODIGO_PROJETO NUMBER(10),
 REQUISITOS VARCHAR(120),
 INICIO DATE NOT NULL,
 FIM DATE
);

ALTER TABLE PROJETO ADD CONSTRAINT PK_PROJETO PRIMARY KEY (CODIGO_PROJETO);


CREATE TABLE SISTEMA (
);


CREATE TABLE SOFTWARE (
 CODIGO_FERRAMENTA NUMBER(20) NOT NULL,
 LICENCA VARCHAR(30),
 VERSAO VARCHAR(10)
);

ALTER TABLE SOFTWARE ADD CONSTRAINT PK_SOFTWARE PRIMARY KEY (CODIGO_FERRAMENTA);


CREATE TABLE UTILIZA (
 HORA_USO NUMBER(3) NOT NULL,		-- MEIO INUTIL?
 CODIGO_FERRAMENTA NUMBER(20) NOT NULL,
 CODIGO_FUNCIONARIO VARCHAR(10) NOT NULL
);

ALTER TABLE UTILIZA ADD CONSTRAINT PK_UTILIZA PRIMARY KEY (HORA_USO,CODIGO_FERRAMENTA,CODIGO_FUNCIONARIO);



CREATE TABLE ATIVIDADE (
 CODIGO_ATV NUMBER(10) NOT NULL,
 DESCRICAO VARCHAR(200)
);

ALTER TABLE ATIVIDADE ADD CONSTRAINT PK_ATIVIDADE PRIMARY KEY (CODIGO_ATV);


CREATE TABLE PROPRIETARIO (
 CODIGO_FERRAMENTA NUMBER(20) NOT NULL,
 VALIDADE DATE,
 CHAVE VARCHAR(30)
);

ALTER TABLE PROPRIETARIO ADD CONSTRAINT PK_PROPRIETARIO PRIMARY KEY (CODIGO_FERRAMENTA);


CREATE TABLE REALIZA (
 CODIGO_FUNCIONARIO VARCHAR(10) NOT NULL,
 CODIGO_ATV NUMBER(10) NOT NULL,
 NUM_HORAS NUMBER(3)
);

ALTER TABLE REALIZA ADD CONSTRAINT PK_REALIZA PRIMARY KEY (CODIGO_FUNCIONARIO,CODIGO_ATV);
ALTER TABLE REALIZA ADD CONSTRAINT FK_REALIZA_0 FOREIGN KEY (CODIGO_PROJETO) REFERENCES PROJETO (CODIGO_PROJETO);

ALTER TABLE DESIGN ADD CONSTRAINT FK_DESIGN_0 FOREIGN KEY (CODIGO_PROJETO) REFERENCES PROJETO (CODIGO_PROJETO);

ALTER TABLE HARDWARE ADD CONSTRAINT FK_HARDWARE_0 FOREIGN KEY (CODIGO_FERRAMENTA) REFERENCES FERRAMENTA (CODIGO_FERRAMENTA);

ALTER TABLE MODELO ADD CONSTRAINT FK_MODELO_0 FOREIGN KEY (CODIGO_PROJETO) REFERENCES PROJETO (CODIGO_PROJETO);

ALTER TABLE MODELA ADD CONSTRAINT FK_MODELA_0 FOREIGN KEY (CODIGO_FUNCIONARIO) REFERENCES FUNCIONARIO (CODIGO_FUNCIONARIO);
ALTER TABLE MODELA ADD CONSTRAINT FK_MODELA_1 FOREIGN KEY (CODIGO_MODELO) REFERENCES MODELO (CODIGO_MODELO);
ALTER TABLE MODELA ADD CONSTRAINT FK_MODELA_2 FOREIGN KEY (CODIGO_PROJETO) REFERENCES PROJETO (CODIGO_PROJETO);

ALTER TABLE PLANEJA ADD CONSTRAINT FK_PLANEJA_0 FOREIGN KEY (CODIGO_FUNCIONARIO) REFERENCES FUNCIONARIO (CODIGO_FUNCIONARIO);
ALTER TABLE PLANEJA ADD CONSTRAINT FK_PLANEJA_1 FOREIGN KEY (CODIGO_DESIGN) REFERENCES DESIGN (CODIGO_DESIGN);
ALTER TABLE PLANEJA ADD CONSTRAINT FK_PLANEJA_0 FOREIGN KEY (CODIGO_PROJETO) REFERENCES PROJETO (CODIGO_PROJETO);


ALTER TABLE SOFTWARE ADD CONSTRAINT FK_SOFTWARE_0 FOREIGN KEY (CODIGO_FERRAMENTA) REFERENCES FERRAMENTA (CODIGO_FERRAMENTA);

ALTER TABLE ATIVIDADE ADD CONSTRAINT FK_ATIVIDADE_0 FOREIGN KEY (CODIGO_PROJETO) REFERENCES PROJETO (CODIGO_PROJETO);

ALTER TABLE UTILIZA ADD CONSTRAINT FK_UTILIZA_0 FOREIGN KEY (CODIGO_FERRAMENTA) REFERENCES FERRAMENTA (CODIGO_FERRAMENTA);
ALTER TABLE UTILIZA ADD CONSTRAINT FK_UTILIZA_1 FOREIGN KEY (CODIGO_FUNCIONARIO) REFERENCES FUNCIONARIO (CODIGO_FUNCIONARIO);


ALTER TABLE PROPRIETARIO ADD CONSTRAINT FK_PROPRIETARIO_0 FOREIGN KEY (CODIGO_FERRAMENTA) REFERENCES SOFTWARE (CODIGO_FERRAMENTA);


ALTER TABLE REALIZA ADD CONSTRAINT FK_REALIZA_0 FOREIGN KEY (CODIGO_FUNCIONARIO) REFERENCES FUNCIONARIO (CODIGO_FUNCIONARIO);
ALTER TABLE REALIZA ADD CONSTRAINT FK_REALIZA_1 FOREIGN KEY (CODIGO_ATV) REFERENCES ATIVIDADE (CODIGO_ATV);


ALTER TABLE SISTEMA ADD CONSTRAINT FK_SISTEMA_0 FOREIGN KEY (CODIGO_DESIGN) REFERENCES DESIGN (CODIGO_DESIGN);
ALTER TABLE SISTEMA ADD CONSTRAINT FK_SISTEMA_1 FOREIGN KEY (CODIGO_MODELO) REFERENCES MODELO (CODIGO_MODELO);



INSERT INTO HARDWARE VALUES(123456, 'DELL XPS');
INSERT INTO HARDWARE VALUES(123457, 'DELL XPS');
INSERT INTO HARDWARE VALUES(123458, 'DELL XPS');
INSERT INTO HARDWARE VALUES(123459, 'DELL XPS');
INSERT INTO HARDWARE VALUES(123460, 'DELL XPS');
INSERT INTO HARDWARE VALUES(123461, 'DELL XPS');
INSERT INTO HARDWARE VALUES(123462, 'DELL XPS');
INSERT INTO HARDWARE VALUES(123463, 'DELL XPS');
INSERT INTO HARDWARE VALUES(6567890, 'LENOVO THINKCENTRE');
INSERT INTO HARDWARE VALUES(6567891, 'LENOVO THINKCENTRE');
INSERT INTO HARDWARE VALUES(6567892, 'LENOVO THINKCENTRE');
INSERT INTO HARDWARE VALUES(6567893, 'LENOVO THINKCENTRE');
INSERT INTO HARDWARE VALUES(6567894, 'LENOVO THINKCENTRE');
INSERT INTO HARDWARE VALUES(6567895, 'LENOVO THINKCENTRE');
INSERT INTO HARDWARE VALUES(6567896, 'LENOVO THINKCENTRE');
INSERT INTO HARDWARE VALUES(6567897, 'LENOVO THINKCENTRE');
INSERT INTO HARDWARE VALUES(543210, 'HP WORKSTATION');
INSERT INTO HARDWARE VALUES(543211, 'HP WORKSTATION');
INSERT INTO HARDWARE VALUES(543212, 'HP WORKSTATION');
INSERT INTO HARDWARE VALUES(543213, 'HP WORKSTATION');
INSERT INTO HARDWARE VALUES(543214, 'HP WORKSTATION');
INSERT INTO HARDWARE VALUES(543215, 'HP WORKSTATION');
INSERT INTO HARDWARE VALUES(543216, 'HP WORKSTATION');


INSERT INTO PROPRIETARIO VALUES(9876543210, TO_DATE('2016/03/01', 'yyyy/mm/dd'), 'AE1592-123456-FAEC12-0001');
INSERT INTO PROPRIETARIO VALUES(9876543211, TO_DATE('2016/03/01', 'yyyy/mm/dd'), 'AE1592-123456-FAEC12-0020');
INSERT INTO PROPRIETARIO VALUES(9876543212, TO_DATE('2016/03/01', 'yyyy/mm/dd'), 'AE1592-123456-FAEC12-0035');
INSERT INTO PROPRIETARIO VALUES(9876543213, TO_DATE('2016/03/01', 'yyyy/mm/dd'), 'AE1592-123456-FAEC12-0044');
INSERT INTO PROPRIETARIO VALUES(876543214, TO_DATE('2016/09/01', 'yyyy/mm/dd'), 'AE1592-654321-FAEC13-0002');
INSERT INTO PROPRIETARIO VALUES(876543215, TO_DATE('2016/09/01', 'yyyy/mm/dd'), 'AE1592-654321-FAEC13-0045');
INSERT INTO PROPRIETARIO VALUES(876543216, TO_DATE('2016/09/01', 'yyyy/mm/dd'), 'AE1592-654321-FAEC13-0014');
INSERT INTO PROPRIETARIO VALUES(876543217, TO_DATE('2016/09/01', 'yyyy/mm/dd'), 'AE1592-654321-FAEC13-0015');


INSERT INTO SOFTWARE VALUES(9876543210, 'MS REFERENCE', '2015.100.5');
INSERT INTO SOFTWARE VALUES(9876543211, 'MS REFERENCE', '2015.100.5');
INSERT INTO SOFTWARE VALUES(9876543212, 'MS REFERENCE', '2015.100.5');
INSERT INTO SOFTWARE VALUES(9876543213, 'MS REFERENCE', '2015.100.5');
INSERT INTO SOFTWARE VALUES(9876543214, 'MS REFERENCE', '2015.322.8');
INSERT INTO SOFTWARE VALUES(9876543215, 'MS REFERENCE', '2015.322.8');
INSERT INTO SOFTWARE VALUES(9876543216, 'MS REFERENCE', '2015.322.8');
INSERT INTO SOFTWARE VALUES(9876543217, 'MS REFERENCE', '2015.322.8');


INSERT INTO FERRAMENTA VALUES(123456, 'DESKTOP DELL');
INSERT INTO FERRAMENTA VALUES(123457, 'DESKTOP DELL');
INSERT INTO FERRAMENTA VALUES(123458, 'DESKTOP DELL');
INSERT INTO FERRAMENTA VALUES(123459, 'DESKTOP DELL');
INSERT INTO FERRAMENTA VALUES(123460, 'DESKTOP DELL');
INSERT INTO FERRAMENTA VALUES(123461, 'DESKTOP DELL');
INSERT INTO FERRAMENTA VALUES(123462, 'DESKTOP DELL');
INSERT INTO FERRAMENTA VALUES(123463, 'DESKTOP DELL');
INSERT INTO FERRAMENTA VALUES(6567890, 'DESKTOP LENOVO');
INSERT INTO FERRAMENTA VALUES(6567891, 'DESKTOP LENOVO');
INSERT INTO FERRAMENTA VALUES(6567892, 'DESKTOP LENOVO');
INSERT INTO FERRAMENTA VALUES(6567893, 'DESKTOP LENOVO');
INSERT INTO FERRAMENTA VALUES(6567894, 'DESKTOP LENOVO');
INSERT INTO FERRAMENTA VALUES(6567895, 'DESKTOP LENOVO');
INSERT INTO FERRAMENTA VALUES(6567896, 'DESKTOP LENOVO');
INSERT INTO FERRAMENTA VALUES(6567897, 'DESKTOP LENOVO');
INSERT INTO FERRAMENTA VALUES(543210, 'WORKSTATION HP');
INSERT INTO FERRAMENTA VALUES(543211, 'WORKSTATION HP');
INSERT INTO FERRAMENTA VALUES(543212, 'WORKSTATION HP');
INSERT INTO FERRAMENTA VALUES(543213, 'WORKSTATION HP');
INSERT INTO FERRAMENTA VALUES(543214, 'WORKSTATION HP');
INSERT INTO FERRAMENTA VALUES(543215, 'WORKSTATION HP');
INSERT INTO FERRAMENTA VALUES(543216, 'WORKSTATION HP');
INSERT INTO FERRAMENTA VALUES(9876543210, 'MICROSOFT VISUAL STUDIO');
INSERT INTO FERRAMENTA VALUES(9876543211, 'MICROSOFT VISUAL STUDIO');
INSERT INTO FERRAMENTA VALUES(9876543212, 'MICROSOFT VISUAL STUDIO');
INSERT INTO FERRAMENTA VALUES(9876543213, 'MICROSOFT VISUAL STUDIO');
INSERT INTO FERRAMENTA VALUES(9876543214, 'MICROSOFT VISUAL STUDIO');
INSERT INTO FERRAMENTA VALUES(9876543215, 'MICROSOFT VISUAL STUDIO');
INSERT INTO FERRAMENTA VALUES(9876543216, 'MICROSOFT VISUAL STUDIO');
INSERT INTO FERRAMENTA VALUES(9876543217, 'MICROSOFT VISUAL STUDIO');


INSERT INTO FUNCIONARIO VALUES('856123654', 'SCRUM, GERENCIA DE PROJETOS', 40, 'MARIA CLARA SILVEIRA',  TO_DATE('2015/03/01', 'yyyy/mm/dd'), 98765432100);
INSERT INTO FUNCIONARIO VALUES('335468748', 'DESIGN PATTERNS, ARQUITETURA DE SOFTWARE', 34, 'JOAO CARLOS',  TO_DATE('2015/03/01', 'yyyy/mm/dd'), 65498712322);
INSERT INTO FUNCIONARIO VALUES('569981235', 'JAVA, PRIMEFACES, SPRING, SQL', 25, 'MAURICIO BITTENCOURT',  TO_DATE('2015/03/15', 'yyyy/mm/dd'), 52371395411);
INSERT INTO FUNCIONARIO VALUES('568234562', 'NODE.JS, JAVASCRIPT, CSS, HTML', 29, 'CLAUDIO VITORINO',  TO_DATE('2015/05/01', 'yyyy/mm/dd'), 88423281235);
INSERT INTO FUNCIONARIO VALUES('561215884', 'C#, MYSQL, PYTHON, MONGODB, SQL, NOSQL', 24, 'MARCELO DOS SANTOS',  TO_DATE('2015/04/01', 'yyyy/mm/dd'), 86221468755);
INSERT INTO FUNCIONARIO VALUES('568971262', 'PHP, LARAVEL, SQL', 31, 'FERNANDO CHAVES',  TO_DATE('2015/05/01', 'yyyy/mm/dd'), 7532224100);
INSERT INTO FUNCIONARIO VALUES('561231587', 'NODE.JS, JAVASCRIPT, COFFESCRIPT, CSS, HTML', 22, 'AURELIO DA SILVA',  TO_DATE('2016/01/01', 'yyyy/mm/dd'), 52371388820);
INSERT INTO FUNCIONARIO VALUES('563654214', 'C#, MYSQL, SQL', 23, 'VINICIUS CHAGAS',  TO_DATE('2015/09/01', 'yyyy/mm/dd'), 52376512355);
INSERT INTO FUNCIONARIO VALUES('568898115', 'JAVA, SPRING, SQL', 20, 'HENRIQUE DENOVA',  TO_DATE('2015/08/01', 'yyyy/mm/dd'), 88832152300);


-- FALTA INSERIR HORA_USO
--HORA_USO NUMBER(3) NOT NULL, CODIGO_FERRAMENTA NUMBER(20) NOT NULL, CODIGO_FUNCIONARIO VARCHAR(10) NOT NULL
INSERT INTO UTILIZA VALUES(, 123456, '856123654');	-- DEKSTOPS DELL
INSERT INTO UTILIZA VALUES(, 123457, '335468748');
INSERT INTO UTILIZA VALUES(, 123458, '561215884');
INSERT INTO UTILIZA VALUES(, 123459, '563654214');
INSERT INTO UTILIZA VALUES(, 6567890, '569981235');	-- DESKTOPS LENOVO
INSERT INTO UTILIZA VALUES(, 6567891, '568234562');
INSERT INTO UTILIZA VALUES(, 6567892, '568971262');
INSERT INTO UTILIZA VALUES(, 6567893, '561231587');
INSERT INTO UTILIZA VALUES(, 6567894, '568898115');
INSERT INTO UTILIZA VALUES(, 9876543210, '335468748');	-- MICROSOFT VISUAL STUDIO
INSERT INTO UTILIZA VALUES(, 9876543211, '561215884');
INSERT INTO UTILIZA VALUES(, 9876543212, '563654214');


INSERT INTO PROJETO VALUES(1320, 'CONTROLE DE PRODUTOS EM ESTOQUE, REGISTRO DE VENDAS POR CAIXA, ANALISE DE DADOS PELA WEB', TO_DATE('2015/03/10', 'yyyy/mm/dd')), TO_DATE('2015/05/31', 'yyyy/mm/dd');
INSERT INTO PROJETO VALUES(1390, 'ANALISE, MANIPULACAO E VISUALIZACAO DE DADOS PROCESSADOS PELA WEB', TO_DATE('2015/06/10', 'yyyy/mm/dd')), TO_DATE('2015/12/22', 'yyyy/mm/dd');


INSERT INTO ATIVIDADE VALUES(0323, 'CONTROLE DE ACESSO DOS PRODUTOS NO BANCO DE DADOS');
INSERT INTO ATIVIDADE VALUES(0324, 'MANIPULACAO DOS PRODUTOS NO BANCO DE DADOS');
INSERT INTO ATIVIDADE VALUES(0325, 'MODULO DE REGISTRO DE VENDAS');
INSERT INTO ATIVIDADE VALUES(0326, 'PESQUISA DIRECIONADA DE FRAMEWORKS E BIBLIOTECAS PARA ANALISE DE DADOS');
INSERT INTO ATIVIDADE VALUES(0327, 'MODULO DE ANALISE DE DADOS NO BANCO DE DADOS');
INSERT INTO ATIVIDADE VALUES(0328, 'INTEGRACAO DOS MODULOS');
INSERT INTO ATIVIDADE VALUES(0329, 'BACK-END E SISTEMA');
INSERT INTO ATIVIDADE VALUES(0330, 'DESIGN DA INTERFACE WEB');
INSERT INTO ATIVIDADE VALUES(0331, 'FRONT-END');
INSERT INTO ATIVIDADE VALUES(0332, 'INTEGRACAO BACK-END E FRONT-END');
INSERT INTO ATIVIDADE VALUES(0333, 'TESTES FINAIS');
INSERT INTO ATIVIDADE VALUES(0334, 'PREPARACOES PARA ENTREGA');

INSERT INTO ATIVIDADE VALUES(0810, 'PESQUISA DIRECIONADA DE FRAMEWORKS E BIBLIOTECAS PARA VISUALIZACAO');
INSERT INTO ATIVIDADE VALUES(0811, 'MODULO DE ANALISE DE DADOS NO BANCO DE DADOS');
INSERT INTO ATIVIDADE VALUES(0812, 'MODULO DE MANIPULACAO DE DADOS NO BANCO DE DADOS');
INSERT INTO ATIVIDADE VALUES(0813, 'INTEGRACAO DOS MODULOS');
INSERT INTO ATIVIDADE VALUES(0814, 'COMPONENTES DE VISUALIZACAO');
INSERT INTO ATIVIDADE VALUES(0815, 'BACK-END E INTEGRACAO DO SISTEMA');
INSERT INTO ATIVIDADE VALUES(0816, 'DESIGN DA INTERFACE WEB');
INSERT INTO ATIVIDADE VALUES(0817, 'FRONT-END');
INSERT INTO ATIVIDADE VALUES(0818, 'INTEGRACAO BACK-END E FRONT-END');
INSERT INTO ATIVIDADE VALUES(0819, 'TESTES FINAIS');
INSERT INTO ATIVIDADE VALUES(0820, 'PREPARACOES PARA ENTREGA');


INSERT INTO REALIZA VALUES('568971262', 0323, 32);
INSERT INTO REALIZA VALUES('568971262', 0324, 54);
INSERT INTO REALIZA VALUES('569981235', 0325, 30);
INSERT INTO REALIZA VALUES('561215884', 0326, 10);
INSERT INTO REALIZA VALUES('561215884', 0327, 80);
INSERT INTO REALIZA VALUES('569981235', 0328, 20);
INSERT INTO REALIZA VALUES('568971262', 0329, 15);
INSERT INTO REALIZA VALUES('568234562', 0330, 44);
INSERT INTO REALIZA VALUES('568234562', 0331, 38);
INSERT INTO REALIZA VALUES('568971262', 0332, 26);
INSERT INTO REALIZA VALUES('569981235', 0333, 30);
INSERT INTO REALIZA VALUES('569981235', 0334, 10);

INSERT INTO REALIZA VALUES('561215884', 0810, 20);
INSERT INTO REALIZA VALUES('569981235', 0811, 60);
INSERT INTO REALIZA VALUES('568971262', 0812, 48);
INSERT INTO REALIZA VALUES('568898115', 0813, 10);
INSERT INTO REALIZA VALUES('561215884', 0814, 23);
INSERT INTO REALIZA VALUES('568971262', 0815, 40);
INSERT INTO REALIZA VALUES('568234562', 0816, 76);
INSERT INTO REALIZA VALUES('568234562', 0817, 29);
INSERT INTO REALIZA VALUES('563654214', 0818, 18);
INSERT INTO REALIZA VALUES('568898115', 0819, 45);
INSERT INTO REALIZA VALUES('569981235', 0820, 20);

-- Resta inserir dados nas tabelas:
-- DESIGN
-- MODELA
-- MODELO
-- PLANEJA
-- SISTEMA


COMMIT;
