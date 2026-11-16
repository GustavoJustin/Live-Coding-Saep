CREATE DATABASE IF NOT EXISTS oficina;
USE  oficina;

CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    telefone vARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE veiculos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE agendamento(
    id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT NOT NULL,
    data_agendamento DATETIME NOT NULL,
    servico VARCHAR(100),
    FOREIGN KEY (veiculo_id) REFERENCES veiculos(id)
);

INSERT INTO usuarios(nome, email, senha) VALUES
('Administrador', 'admin@oficina.com', '$2b$10$mDHyxGWwZfFPA1j5x4giaeCyDFkMax0YNecXFwaAz9wX8xtjndcmm'),
('Carlos Mecanico', 'carlos@oficina.com', '$2b$10$mDHyxGWwZfFPA1j5x4giaeCyDFkMax0YNecXFwaAz9wX8xtjndcmm'),
('Fernanda Atendente', 'fernanda@oficina.com', '$2b$10$mDHyxGWwZfFPA1j5x4giaeCyDFkMax0YNecXFwaAz9wX8xtjndcmm');

INSERT INTO clientes(nome, cpf, telefone, email) VALUES
('João da Sailva', '143258aaf546a49c857215f74822e800', '(11)90000-1111', 'joao.silva@email.com'),
('Maria Souza', '6ede5a9078ef6d50ae2b1cd07829435b', '(11)90000-2222', 'maria.souza@email.com'),
('Pedro Oliveira', 'd11d16f767378013c69b152ae3225fb2', '(11)90000-3333', 'pedro.oliveira@email.com');

INSERT INTO veiculos(cliente_id, placa, marca, modelo, ano) VALUES
(1, 'ABC1D23', 'Volksvagen', 'Gol', 2010),
(2, 'DEF4E56', 'Fiat', 'Uno', 1997),
(3, 'GHI7F89', 'Chevrolet', 'Onix', 2021);

INSERT INTO agendamento(veiculo_id, data_agendamento, servico) VALUES
(2, '2026-11-05 09:00:00', 'Troca de oleo'),
(1, '2026-10-20 14:30:00', 'Alinhamento e balanceamento'),
(3, '2026-10-20 00:00:00', 'Revisao dos freios');