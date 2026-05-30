CREATE DATABASE  gestao_escolar;
USE gestao_escolar;


CREATE TABLE tb_endereco (
    pk_id_endereco INT AUTO_INCREMENT,
    cep_endereco VARCHAR(9) NOT NULL,
    logradouro_endereco VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL,
    PRIMARY KEY (pk_id_endereco)
) ;


CREATE TABLE tb_responsavel (
    pk_id_responsavel INT AUTO_INCREMENT,
    nome_responsavel VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email_responsavel VARCHAR(100),
    telefone_responsavel VARCHAR(20),
    cpf_responsavel VARCHAR(14) NOT NULL,
    fk_id_endereco INT,
    PRIMARY KEY (pk_id_responsavel),
    CONSTRAINT fk_responsavel_endereco FOREIGN KEY (fk_id_endereco) 
        REFERENCES tb_endereco(pk_id_endereco) ON DELETE SET NULL,
    CONSTRAINT uc_cpf_responsavel UNIQUE (cpf_responsavel)
) ;


CREATE TABLE tb_aluno (
    pk_id_aluno INT AUTO_INCREMENT,
    nome_aluno VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_cadastro DATE NOT NULL,
    email_cadastro VARCHAR(100),
    telefone_aluno VARCHAR(20),
    cpf_aluno VARCHAR(14) NOT NULL,
    fk_id_endereco INT,
    fk_id_responsavel INT,
    PRIMARY KEY (pk_id_aluno),
    CONSTRAINT fk_aluno_endereco FOREIGN KEY (fk_id_endereco) 
        REFERENCES tb_endereco(pk_id_endereco) ON DELETE SET NULL,
    CONSTRAINT fk_aluno_responsavel FOREIGN KEY (fk_id_responsavel) 
        REFERENCES tb_responsavel(pk_id_responsavel) ON DELETE SET NULL,
    CONSTRAINT uc_cpf_aluno UNIQUE (cpf_aluno)
) ;


CREATE TABLE tb_professor (
    pk_id_professor INT AUTO_INCREMENT,
    nome_professor VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_admissao DATE NOT NULL,
    email_professor VARCHAR(100),
    telefone_professor VARCHAR(20),
    cpf_professor VARCHAR(14) NOT NULL,
    fk_id_endereco INT,
    PRIMARY KEY (pk_id_professor),
    CONSTRAINT fk_professor_endereco FOREIGN KEY (fk_id_endereco) 
        REFERENCES tb_endereco(pk_id_endereco) ON DELETE SET NULL,
    CONSTRAINT uc_cpf_professor UNIQUE (cpf_professor)
) ;


CREATE TABLE tb_turma (
    pk_id_turma INT AUTO_INCREMENT,
    nome_turma VARCHAR(50) NOT NULL,
    ano_letivo INT NOT NULL,
    periodo VARCHAR(20) NOT NULL,
    PRIMARY KEY (pk_id_turma)
) ;


CREATE TABLE tb_disciplina (
    pk_id_disciplina INT AUTO_INCREMENT,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    PRIMARY KEY (pk_id_disciplina)
) ;




CREATE TABLE tb_matriculado (
    fk_id_aluno INT,
    fk_id_turma INT,
    PRIMARY KEY (fk_id_aluno, fk_id_turma),
    CONSTRAINT fk_matriculado_aluno FOREIGN KEY (fk_id_aluno) 
        REFERENCES tb_aluno(pk_id_aluno) ON DELETE CASCADE,
    CONSTRAINT fk_matriculado_turma FOREIGN KEY (fk_id_turma) 
        REFERENCES tb_turma(pk_id_turma) ON DELETE CASCADE
) ;


CREATE TABLE tb_conteudo (
    fk_id_turma INT,
    fk_id_disciplina INT,
    PRIMARY KEY (fk_id_turma, fk_id_disciplina),
    CONSTRAINT fk_conteudo_turma FOREIGN KEY (fk_id_turma) 
        REFERENCES tb_turma(pk_id_turma) ON DELETE CASCADE,
    CONSTRAINT fk_conteudo_disciplina FOREIGN KEY (fk_id_disciplina) 
        REFERENCES tb_disciplina(pk_id_disciplina) ON DELETE CASCADE
) ;


CREATE TABLE tb_leciona (
    fk_id_professor INT,
    fk_id_disciplina INT,
    PRIMARY KEY (fk_id_professor, fk_id_disciplina),
    CONSTRAINT fk_leciona_professor FOREIGN KEY (fk_id_professor) 
        REFERENCES tb_professor(pk_id_professor) ON DELETE CASCADE,
    CONSTRAINT fk_leciona_disciplina FOREIGN KEY (fk_id_disciplina) 
        REFERENCES tb_disciplina(pk_id_disciplina) ON DELETE CASCADE
) ;
