#DROP TABLES#
#DROP TABLE aula;
#DROP TABLE aula_has_receita;
#DROP TABLE aula_has_roteiro;
#DROP TABLE categoria;
#DROP TABLE curso;
#DROP TABLE entrada;
#DROP TABLE fornecedor;
#DROP TABLE insumo;
#DROP TABLE insumo_receita;
#DROP TABLE medida;
#DROP TABLE receita;
#DROP TABLE roteiro;
#DROP TABLE roteiro_receita;
#DROP TABLE saida;
#DROP TABLE solicitacao;
#DROP TABLE solicitacao_insumo;
#DROP TABLE tipoAcesso;
#DROP TABLE usuario;
#DROP TABLES#
 
#CREATE TABLES#
CREATE TABLE aula (
  id_aula INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id_professor INTEGER UNSIGNED NOT NULL,
  data_aula TIMESTAMP NULL,
  PRIMARY KEY(id_aula),
  INDEX aula_FKIndex1(usuario_id_professor)
);
  
CREATE TABLE aula_has_receita (
  aula_id_aula INTEGER UNSIGNED NOT NULL,
  receita_id_receita INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(aula_id_aula, receita_id_receita),
  INDEX aula_has_receita_FKIndex1(aula_id_aula),
  INDEX aula_has_receita_FKIndex2(receita_id_receita)
);
  
CREATE TABLE aula_has_roteiro (
  aula_id_aula INTEGER UNSIGNED NOT NULL,
  roteiro_Curso_id_curso INTEGER UNSIGNED NOT NULL,
  roteiro_id_roteiro INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(aula_id_aula, roteiro_Curso_id_curso, roteiro_id_roteiro),
  INDEX aula_has_roteiro_FKIndex1(aula_id_aula),
  INDEX aula_has_roteiro_FKIndex2(roteiro_id_roteiro, roteiro_Curso_id_curso)
);
  
CREATE TABLE categoria (
  id_categoria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(20) NULL,
  PRIMARY KEY(id_categoria)
);
  
CREATE TABLE curso (
  id_curso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao TEXT NULL,
  nome VARCHAR(30) NULL,
  PRIMARY KEY(id_curso)
);
  
CREATE TABLE entrada (
  id_entrada INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  insumo_id_insumo INTEGER UNSIGNED NOT NULL,
  validade TIMESTAMP NULL,
  lote VARCHAR(20) NULL,
  data_entrada TIMESTAMP NULL,
  quantidade INTEGER NULL,
  data_entrega TIMESTAMP NULL,
  PRIMARY KEY(id_entrada),
  INDEX entrada_FKIndex1(insumo_id_insumo)
);
  
CREATE TABLE fornecedor (
  cnpj INTEGER UNSIGNED NOT NULL,
  status_2 BOOL NULL,
  razaoSocial VARCHAR(40) NULL,
  endereco VARCHAR(50) NULL,
  telefone VARCHAR(8) NULL,
  email CHAR(50) NULL,
  PRIMARY KEY(cnpj)
);
  
CREATE TABLE insumo (
  id_insumo INTEGER UNSIGNED NOT NULL,
  fornecedor_cnpj INTEGER UNSIGNED NOT NULL,
  medida_id_medida INTEGER UNSIGNED NOT NULL,
  categoria_id_categoria INTEGER UNSIGNED NOT NULL,
  nome VARCHAR(20) NULL,
  qtdMinima INTEGER UNSIGNED NULL,
  qtdMaxima INTEGER UNSIGNED NULL,
  qtdAtual INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_insumo),
  INDEX Insumos_FKIndex1(categoria_id_categoria),
  INDEX Insumo_FKIndex2(medida_id_medida),
  INDEX insumo_FKIndex3(fornecedor_cnpj)
);
  
CREATE TABLE insumo_receita (
  insumo_id_insumo INTEGER UNSIGNED NOT NULL,
  receita_id_receita INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(insumo_id_insumo, receita_id_receita),
  INDEX Insumos_has_receita_FKIndex1(insumo_id_insumo),
  INDEX Insumos_has_receita_FKIndex2(receita_id_receita)
);
  
CREATE TABLE medida (
  id_medida INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NULL,
  PRIMARY KEY(id_medida)
);
  
CREATE TABLE receita (
  id_receita INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  modoPreparo TEXT NULL,
  observacao TEXT NULL,
  PRIMARY KEY(id_receita)
);
  
CREATE TABLE roteiro (
  id_roteiro INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Curso_id_curso INTEGER UNSIGNED NOT NULL,
  titulo VARCHAR(50) NULL,
  PRIMARY KEY(id_roteiro, Curso_id_curso),
  INDEX roteiro_FKIndex1(Curso_id_curso)
);
  
CREATE TABLE roteiro_receita (
  roteiro_id_roteiro INTEGER UNSIGNED NOT NULL,
  receita_id_receita INTEGER UNSIGNED NOT NULL,
  roteiro_Curso_id_curso INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(roteiro_id_roteiro, receita_id_receita, roteiro_Curso_id_curso),
  INDEX roteiro_has_receita_FKIndex1(roteiro_id_roteiro, roteiro_Curso_id_curso),
  INDEX roteiro_has_receita_FKIndex2(receita_id_receita)
);
  
CREATE TABLE saida (
  id_saida INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  aula_id_aula INTEGER UNSIGNED NOT NULL,
  insumo_id_insumo INTEGER UNSIGNED NOT NULL,
  quantidade INTEGER UNSIGNED NULL,
  data_2 TIMESTAMP NULL,
  PRIMARY KEY(id_saida),
  INDEX saida_FKIndex1(insumo_id_insumo),
  INDEX saida_FKIndex2(aula_id_aula)
);
  
CREATE TABLE solicitacao (
  id_Requisito INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  fornecedor_cnpj INTEGER UNSIGNED NOT NULL,
  data_requesicao TIMESTAMP NULL,
  nota VARCHAR(40) NULL,
  tipo VARCHAR(20) NULL,
  valor DOUBLE NULL,
  PRIMARY KEY(id_Requisito),
  INDEX Requisicao_FKIndex2(fornecedor_cnpj)
);
  
CREATE TABLE solicitacao_insumo (
  solicitacao_id_Requisito INTEGER UNSIGNED NOT NULL,
  insumo_id_insumo INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(solicitacao_id_Requisito, insumo_id_insumo),
  INDEX solicitacao_has_Insumo_FKIndex1(solicitacao_id_Requisito),
  INDEX solicitacao_has_Insumo_FKIndex2(insumo_id_insumo)
);
  
CREATE TABLE tipoAcesso (
  id_tipoAcesso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipoAcesso VARCHAR(20) NULL,
  descricao TEXT NULL,
  PRIMARY KEY(id_tipoAcesso)
);
  
CREATE TABLE usuario (
  id_usuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipoAcesso_id_tipoAcesso INTEGER UNSIGNED NOT NULL,
  matricula VARCHAR(9) NULL,
  nome VARCHAR(20) NULL,
  senha VARCHAR(20) NULL,
  email CHAR(50) NULL,
  PRIMARY KEY(id_usuario),
  INDEX usuario_FKIndex1(tipoAcesso_id_tipoAcesso)
);
#CREATE TABLES#
 
#Pedro Schwarz - Versão 1.0 - Início#
INSERT INTO tipoAcesso (tipoAcesso, descricao) VALUES
("Coordenador", "Controle total de todas as aulas, roteiros, receita e do estoque."),
("Auxiliar", "Auxilia no controle do estoque."),
("Professor", "Escolhe os dias das aulas, os roteiros necessários e a receita que será utilizada.");
 
INSERT INTO receita (nome, modoPreparo, observacao) VALUES
("Arroz à Valencia", "Frite a cebola no óleo. Acrescente o caldo de carne. Cozinhe em fogo baixo, com a panela tampada por 15 minutos.", NULL),
("Risoto de Frango", "Aqueça o óleo e frite os peitos de frango. Acrescente a cebola, o alho, o tomate e o extrato de tomate. Refogue por 1 ou 2 minutos.", "Cada peito de frango deve ter 200g"),
("Pão de Grãos", "Refogue por 1 ou 2 minutos. Refogue por 1 ou 2 minutos. Em uma vasilha, coloque e misture os ingredientes secos.", NULL),
("Pão de Mel", "Em uma tigela, misture todos os ingredientes da massa. Unte e enfarinhe uma forma de bolo inglês. Depois de assado e frio, corte o pão de mel ao meio.Recheie com doce de leite.", "xícaras de chá"),
("Pão para Cachorro Quente", "Faça uma esponja com o fermento, um pouco do açúcar e um pouco de leite morno. Se necessário, acrescente um pouco mais de trigo ou de leite. Se necessário, acrescente um pouco mais de trigo ou de leite.", NULL);
 
INSERT INTO usuario (tipoAcesso_id_tipoAcesso, matricula, nome, senha, email) VALUES
(1, "1111111", "Marco da Silva", "coordenador2", "marcodasilva@gmail.com"),
(2, "8989898", "Patricia de Oliveira", "patricia123", "patriciaoliveira@gmail.com"),
(2, "9797979", "Rodrigo Ferrazo", "rodrigoferr54", "rodrigo87@gmail.com"),
(3, "7777777", "Matheus Rocha", "matheusv90", "mathrocha@gmail.com"),
(3, "6565656", "Mariana de Souza", "marisouza1987", "marisouz87@gmail.com");
 
INSERT INTO medida (nome) VALUES
("Miligrama/mg"),
("Grama/g"),
("Quilograma/kg"),
("Mililitro/ml"),
("Litro/l"),
("Cabeça de Alho"),
("Dente de Alho"),
("Molho");
#Pedro Schwarz - Versão 1.0 - Fim#

#Pedro Schwarz - Versão 3.0 - Início#
INSERT INTO aula (usuario_id_professor, data_aula) VALUES
(4, '2016-04-16 9:00:00'),
(4, '2016-05-09 9:00:00'),
(4, '2016-06-21 9:00:00'),
(5, '2016-07-05 21:00:00'),
(5, '2016-08-23 21:00:00'),
(5, '2016-09-30 21:00:00');

INSERT INTO aula_has_receita (aula_id_aula, receita_id_receita) VALUES
(1,1),
(1,2),
(2,3),
(3,5),
(4,4),
(5,4),
(5,2),
(6,1);

INSERT INTO solicitacao_insumo (solicitacao_id_Requisito, insumo_id_insumo) VALUES
(1,1),
(1,2),
(2,1),
(2,2);

INSERT INTO curso (descricao, nome) VALUES
("O curso apresenta conhecimentos sobre as técnicas de elaboração, montagem e decoração de bolos artísticos.", "Bolos Artísticos"),
("O curso visa a propiciar aos participantes o domínio das técnicas de confeitaria, agregando conhecimentos e competências relacionadas às exigências do mercado.", "Confeiteiro"),
("O curso de Cozinheiro prepara o participante para o desempenho de técnicas de cozinha, seguindo os princípios de boas práticas de manipulação de alimentos.", "Cozinheiro"),
("O curso visa propiciar aos participantes o domínio das técnicas de preparo de sushis, sashimis e culinária japonesa básica, agregando conhecimentos e competências relacionadas às exigências do mercado.", "Culinária para Sushi");
#Pedro Schwarz - Versão 3.0 Fim#

#Rafael Frohlich - Versão 2.0 - Início#
 INSERT INTO `fornecedor`(`cnpj`, `status_2`, `razaoSocial`, `endereco`, `telefone`, `email`) VALUES 
(000111,true,"Mercearia Biolionario","Aonde Judas Perdeu as botas","3333-2222","chicoalencar_pegatodas@hotmail.com"),
(111111,true,"Industria Lima de Varejo","Rua dos achados","2222-2222","chicoalencar_pegatodasemaisumpouco@hotmail.com"),
(12231,false,"Mercearia do Tio Chico","Rua dos perdidos","2222-4444","chicoalencar_pegatodasemaisumpoucoemaisumpouco@hotmail.com");

INSERT INTO `categoria`(`id_categoria`, `nome`) VALUES
(1,"Leite e produtos lácteos"),
(2,"Óleos, gorduras, cremes vegetais e margarinas");

INSERT INTO `insumo`(`id_insumo`, `fornecedor_cnpj`, `medida_id_medida`, `categoria_id_categoria`, `nome`, `qtdMinima`, `qtdMaxima`, `qtdAtual`) VALUES
(1,000111,5,1,"Leite Longa vida",1,2,5),
(2,12231,2,2,"Oleo de Soja",1,2,1999);


INSERT INTO `entrada`(`id_entrada`, `insumo_id_insumo`, `validade`, `lote`, `data_entrada`, `quantidade`, `data_entrega`) VALUES
(1,1,'2016-04-18 23:03:20',001,'2016-04-1 20:03:20',12,'2016-04-2 20:03:20'),
(2,2,'2016-06-14 13:03:20',002,'2016-05-1 21:03:20',32,'2016-05-2 10:03:20');

INSERT INTO `insumo_receita`(`insumo_id_insumo`, `receita_id_receita`) VALUES 
(2,1),
(1,3);

INSERT INTO `solicitacao`(`id_Requisito`, `fornecedor_cnpj`, `data_requesicao`, `nota`, `tipo`, `valor`) VALUES 
(1,000111,'2016-05-1 21:03:20',"Embalado em caixotes de madeira","compra",343.2321),
(2,111111,'2016-06-1 11:03:20',"Entregar para o auxiliar","compra",4303.2001);
#Rafael Frohlich - Versão 2.0 - Fim#


#Jair Ferraz - Versão 4.0 - Início#
INSERT INTO `saida`(`id_saida`, `aula_id_aula`, `insumo_id_insumo`, `quantidade`, `data_2`) VALUES
(1,1,2,4,'2016-04-2 20:00:00'),
(2,2,1,3,'2016-04-2 20:01:00'),
(3,3,2,4,'2016-04-2 20:02:00'),
(4,4,1,3,'2016-04-2 20:03:00'),
(5,5,2,4,'2016-04-2 20:04:00'),
(6,6,1,3,'2016-04-2 20:05:00');

INSERT INTO `roteiro`(`id_roteiro`, `Curso_id_curso`, `titulo`) VALUES
(1,1,"Aula 1"),
(2,1,"Aula 2"),
(3,2,"Aula 1"),
(4,2,"Aula 2"),
(5,3,"Aula 1"),
(6,3,"Aula 2"),
(7,4,"Aula 1"),
(8,4,"Aula 2");

INSERT INTO `roteiro_receita`(`roteiro_id_roteiro`, `receita_id_receita`, `roteiro_Curso_id_curso`) VALUES
(1,4,1),
(2,3,1),
(3,4,2),
(4,3,2),
(5,1,3),
(6,2,3),
(7,5,4),
(8,5,4);

INSERT INTO `aula_has_roteiro`(`aula_id_aula`, `roteiro_Curso_id_curso`, `roteiro_id_roteiro`) VALUES
(1,1,1),
(1,1,2),
(2,2,3),
(2,2,4),
(3,3,5),
(4,3,6),
(5,4,7),
(6,4,8);

#Jair Ferraz - Versão 4.0 - Fim#
