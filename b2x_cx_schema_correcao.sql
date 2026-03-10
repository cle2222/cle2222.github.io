USE b2x_cx;
GO

IF OBJECT_ID('dbo.trilha_conteudos','U') IS NOT NULL DROP TABLE dbo.trilha_conteudos;
IF OBJECT_ID('dbo.trilhas','U') IS NOT NULL DROP TABLE dbo.trilhas;
IF OBJECT_ID('dbo.conteudo_chamados','U') IS NOT NULL DROP TABLE dbo.conteudo_chamados;
IF OBJECT_ID('dbo.conteudo_tags','U') IS NOT NULL DROP TABLE dbo.conteudo_tags;
IF OBJECT_ID('dbo.conteudos_versoes','U') IS NOT NULL DROP TABLE dbo.conteudos_versoes;
IF OBJECT_ID('dbo.conteudos','U') IS NOT NULL DROP TABLE dbo.conteudos;
IF OBJECT_ID('dbo.logs_auditoria','U') IS NOT NULL DROP TABLE dbo.logs_auditoria;
IF OBJECT_ID('dbo.motivos_versao','U') IS NOT NULL DROP TABLE dbo.motivos_versao;
IF OBJECT_ID('dbo.categorias','U') IS NOT NULL DROP TABLE dbo.categorias;
IF OBJECT_ID('dbo.status_conteudo','U') IS NOT NULL DROP TABLE dbo.status_conteudo;
IF OBJECT_ID('dbo.publicos','U') IS NOT NULL DROP TABLE dbo.publicos;
IF OBJECT_ID('dbo.tags','U') IS NOT NULL DROP TABLE dbo.tags;
IF OBJECT_ID('dbo.temas','U') IS NOT NULL DROP TABLE dbo.temas;
IF OBJECT_ID('dbo.tipos_conteudo','U') IS NOT NULL DROP TABLE dbo.tipos_conteudo;
IF OBJECT_ID('dbo.areas_solicitantes','U') IS NOT NULL DROP TABLE dbo.areas_solicitantes;
IF OBJECT_ID('dbo.colaboradores','U') IS NOT NULL DROP TABLE dbo.colaboradores;
GO

CREATE TABLE dbo.colaboradores(
    id INT IDENTITY(1,1) PRIMARY KEY,
    matricula VARCHAR(30) NOT NULL UNIQUE,
    nome VARCHAR(200) NOT NULL,
    perfil VARCHAR(20) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.temas(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.tipos_conteudo(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.tags(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.areas_solicitantes(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.publicos(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.status_conteudo(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.categorias(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.motivos_versao(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.conteudos(
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(500) NOT NULL,
    descricao NVARCHAR(MAX) NULL,
    link_url VARCHAR(1000) NULL,
    tema_id INT NOT NULL,
    tipo_id INT NOT NULL,
    categoria_id INT NULL,
    publico_id INT NULL,
    status_id INT NULL,
    b2x VARCHAR(10) NULL,
    origem_material VARCHAR(200) NULL,
    carga_horaria TIME NOT NULL DEFAULT '00:10:00',
    area_solicitante_id INT NULL,
    versao INT NOT NULL DEFAULT 1,
    criado_por INT NULL,
    criado_em DATETIME NOT NULL DEFAULT GETDATE(),
    atualizado_por INT NULL,
    atualizado_em DATETIME NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.conteudos_versoes(
    id INT IDENTITY(1,1) PRIMARY KEY,
    conteudo_id INT NOT NULL,
    versao INT NOT NULL,
    motivo VARCHAR(200) NULL,
    dados_json NVARCHAR(MAX) NOT NULL,
    criado_por INT NULL,
    criado_em DATETIME NOT NULL DEFAULT GETDATE()
);
GO

CREATE TABLE dbo.conteudo_tags(
    id INT IDENTITY(1,1) PRIMARY KEY,
    conteudo_id INT NOT NULL,
    tag_id INT NOT NULL
);
GO

CREATE TABLE dbo.conteudo_chamados(
    id INT IDENTITY(1,1) PRIMARY KEY,
    conteudo_id INT NOT NULL,
    area_id INT NOT NULL,
    numero VARCHAR(100) NOT NULL,
    observacao VARCHAR(300) NULL
);
GO

CREATE TABLE dbo.trilhas(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(250) NOT NULL,
    tema_id INT NOT NULL,
    criado_por INT NULL,
    criado_em DATETIME NOT NULL DEFAULT GETDATE(),
    atualizado_por INT NULL,
    atualizado_em DATETIME NULL,
    ativo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE dbo.trilha_conteudos(
    id INT IDENTITY(1,1) PRIMARY KEY,
    trilha_id INT NOT NULL,
    conteudo_id INT NOT NULL,
    ordem INT NOT NULL
);
GO

CREATE TABLE dbo.logs_auditoria(
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id INT NULL,
    acao VARCHAR(30) NOT NULL,
    entidade VARCHAR(50) NOT NULL,
    entidade_id INT NULL,
    criado_em DATETIME NOT NULL DEFAULT GETDATE()
);
GO

INSERT INTO dbo.colaboradores (matricula, nome, perfil, senha, ativo) VALUES
('1001', 'Admin Exemplo', 'Admin', 'admin123', 1),
('1002', 'Curador Exemplo', 'Curador', 'curador123', 1),
('1003', 'Leitor Exemplo', 'Leitor', 'leitor123', 1);
GO

INSERT INTO dbo.temas (nome, ativo) VALUES
('Suporte Técnico', 1),
('Comercial', 1),
('Financeiro', 1),
('RH', 1),
('Processos', 1);
GO

INSERT INTO dbo.tipos_conteudo (nome, ativo) VALUES
('Vídeo', 1),
('PPT', 1),
('PDF', 1),
('Gamificação', 1),
('E-learning', 1),
('Simulador', 1);
GO

INSERT INTO dbo.tags (nome, ativo) VALUES
('fibra', 1),
('modem', 1),
('atendimento', 1),
('rede', 1),
('onboarding', 1),
('processo', 1);
GO

INSERT INTO dbo.areas_solicitantes (nome, ativo) VALUES
('Processos', 1),
('RH', 1),
('Comercial', 1),
('TI', 1),
('Financeiro', 1);
GO

INSERT INTO dbo.publicos (nome, ativo) VALUES
('Novatos', 1),
('Especialistas', 1),
('Liderança', 1),
('Backoffice', 1);
GO

INSERT INTO dbo.status_conteudo (nome, ativo) VALUES
('Ativo', 1),
('Em revisão', 1),
('Arquivado', 1);
GO

INSERT INTO dbo.categorias (nome, ativo) VALUES
('Base técnica', 1),
('Fluxo operacional', 1),
('Onboarding', 1),
('Compliance', 1);
GO

INSERT INTO dbo.motivos_versao (nome, ativo) VALUES
('Correção de conteúdo', 1),
('Atualização de processo', 1),
('Mudança de link', 1),
('Ajuste de classificação', 1);
GO

INSERT INTO dbo.conteudos
(titulo, descricao, link_url, tema_id, tipo_id, categoria_id, publico_id, status_id, b2x, origem_material, carga_horaria, area_solicitante_id, versao, criado_por, ativo)
VALUES
('Atendimento Técnico - Fibra', 'Conceitos base para atendimento técnico de fibra com foco em diagnóstico inicial.', 'https://intranet/fibra', 1, 1, 1, 1, 1, 'B2C', 'SharePoint', '00:35:00', 1, 1, 1, 1),
('Diagnóstico de Modem / Roteador', 'Checklist de diagnóstico e apoio ao cliente final.', 'https://intranet/modem', 1, 1, 1, 2, 1, 'B2C', 'LMS', '00:22:00', 4, 1, 2, 1),
('Onboarding - Atendimento Vivo', 'Trilha introdutória para novos atendentes.', 'https://intranet/onboarding', 1, 5, 3, 1, 1, 'B2B', 'Academia interna', '00:45:00', 2, 1, 2, 1),
('Abertura de chamado para processos', 'Fluxo de abertura e governança para times de processo.', 'https://intranet/processos', 5, 2, 2, 4, 1, 'B2B', 'SharePoint', '00:18:00', 1, 1, 1, 1);
GO

INSERT INTO dbo.conteudo_tags (conteudo_id, tag_id) VALUES
(1,1),(1,3),(1,4),
(2,2),(2,4),
(3,3),(3,5),
(4,6);
GO

INSERT INTO dbo.conteudo_chamados (conteudo_id, area_id, numero, observacao) VALUES
(1,1,'PROC-10234','Revisão do passo a passo'),
(1,1,'PROC-10411','Complemento de processo'),
(1,2,'RH-8891','Ajuste de onboarding'),
(1,2,'RH-8892','Inclusão de observação'),
(2,4,'TI-12011','Atualização técnica do material');
GO

INSERT INTO dbo.trilhas (nome, tema_id, criado_por, ativo) VALUES
('Trilha Suporte Técnico - Starter', 1, 1, 1),
('Trilha Onboarding Atendimento', 1, 1, 1);
GO

INSERT INTO dbo.trilha_conteudos (trilha_id, conteudo_id, ordem) VALUES
(1,3,1),(1,1,2),(1,2,3),
(2,3,1),(2,4,2);
GO

INSERT INTO dbo.logs_auditoria (usuario_id, acao, entidade, entidade_id, criado_em) VALUES
(1,'CREATE','CONTEUDO',1,GETDATE()),
(2,'CREATE','CONTEUDO',2,GETDATE()),
(2,'CREATE','CONTEUDO',3,GETDATE()),
(1,'CREATE','TRILHA',1,GETDATE());
GO
