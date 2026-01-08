-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Jan-2026 às 13:02
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_ideias`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome_categoria`) VALUES
(1, 'Infraestruturas'),
(2, 'Tecnologia'),
(3, 'Ambiente'),
(4, 'Eventos'),
(5, 'Desporto'),
(6, 'Cultura'),
(7, 'Segurança'),
(8, 'Alimentação'),
(9, 'Educação'),
(10, 'Comunidade');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `texto` text NOT NULL,
  `data_comentario` datetime DEFAULT current_timestamp(),
  `id_utilizador` int(11) NOT NULL,
  `id_ideia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `texto`, `data_comentario`, `id_utilizador`, `id_ideia`) VALUES
(1, 'Excelente ideia!', '2026-01-08 11:42:25', 2, 1),
(2, 'Muito necessário.', '2026-01-08 11:42:25', 3, 1),
(3, 'Apoio totalmente.', '2026-01-08 11:42:25', 4, 2),
(4, 'Boa iniciativa.', '2026-01-08 11:42:25', 5, 3),
(5, 'Concordo plenamente.', '2026-01-08 11:42:25', 6, 4),
(6, 'Pode ser melhorado.', '2026-01-08 11:42:25', 1, 5),
(7, 'Ótima proposta.', '2026-01-08 11:42:25', 7, 6),
(8, 'A escola precisa disto.', '2026-01-08 11:42:25', 8, 7),
(9, 'Gostava de participar.', '2026-01-08 11:42:25', 9, 8),
(10, 'Ideia interessante.', '2026-01-08 11:42:25', 10, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ideia`
--

CREATE TABLE `ideia` (
  `id_ideia` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text NOT NULL,
  `data_submissao` datetime DEFAULT current_timestamp(),
  `estado` enum('pendente','aprovada','rejeitada') DEFAULT 'pendente',
  `id_utilizador` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `ideia`
--

INSERT INTO `ideia` (`id_ideia`, `titulo`, `descricao`, `data_submissao`, `estado`, `id_utilizador`, `id_categoria`) VALUES
(1, 'Melhorar Wi-Fi da escola', 'Instalar novos pontos de acesso Wi-Fi.', '2026-01-08 11:42:08', 'aprovada', 1, 2),
(2, 'Criar horta escolar', 'Projeto ecológico com participação dos alunos.', '2026-01-08 11:42:08', 'pendente', 2, 3),
(3, 'Mais bancos no recreio', 'Adicionar zonas de descanso.', '2026-01-08 11:42:08', 'aprovada', 3, 1),
(4, 'Clube de programação', 'Criar clube extracurricular.', '2026-01-08 11:42:08', 'pendente', 4, 9),
(5, 'Câmaras de segurança', 'Reforçar segurança nos corredores.', '2026-01-08 11:42:08', 'rejeitada', 5, 7),
(6, 'Torneio inter-turmas', 'Competição desportiva anual.', '2026-01-08 11:42:08', 'aprovada', 6, 5),
(7, 'Feira cultural', 'Evento para divulgar culturas.', '2026-01-08 11:42:08', 'pendente', 7, 6),
(8, 'Melhorar cantina', 'Opções mais saudáveis.', '2026-01-08 11:42:08', 'aprovada', 8, 8),
(9, 'Aplicação escolar', 'App para comunicação escolar.', '2026-01-08 11:42:08', 'pendente', 9, 2),
(10, 'Dia da comunidade', 'Evento entre escola e freguesia.', '2026-01-08 11:42:08', 'aprovada', 10, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
  `id_utilizador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('aluno','professor','admin') DEFAULT 'aluno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`id_utilizador`, `nome`, `email`, `senha`, `tipo`) VALUES
(1, 'Tiago Castro', 'tiago@escola.pt', 'senha_hash_1', 'aluno'),
(2, 'Ana Silva', 'ana@escola.pt', 'senha_hash_2', 'aluno'),
(3, 'João Mendes', 'joao@escola.pt', 'senha_hash_3', 'aluno'),
(4, 'Maria Costa', 'maria@escola.pt', 'senha_hash_4', 'aluno'),
(5, 'Pedro Lopes', 'pedro@escola.pt', 'senha_hash_5', 'aluno'),
(6, 'Rita Alves', 'rita@escola.pt', 'senha_hash_6', 'aluno'),
(7, 'Professor Carlos', 'carlos@escola.pt', 'senha_hash_7', 'professor'),
(8, 'Professora Sofia', 'sofia@escola.pt', 'senha_hash_8', 'professor'),
(9, 'Admin Escola', 'admin@escola.pt', 'senha_hash_9', 'admin'),
(10, 'Miguel Rocha', 'miguel@escola.pt', 'senha_hash_10', 'aluno');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voto`
--

CREATE TABLE `voto` (
  `id_voto` int(11) NOT NULL,
  `data_voto` datetime DEFAULT current_timestamp(),
  `id_utilizador` int(11) NOT NULL,
  `id_ideia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `voto`
--

INSERT INTO `voto` (`id_voto`, `data_voto`, `id_utilizador`, `id_ideia`) VALUES
(1, '2026-01-08 11:42:35', 1, 1),
(2, '2026-01-08 11:42:35', 2, 1),
(3, '2026-01-08 11:42:35', 3, 2),
(4, '2026-01-08 11:42:35', 4, 3),
(5, '2026-01-08 11:42:35', 5, 4),
(6, '2026-01-08 11:42:35', 6, 5),
(7, '2026-01-08 11:42:35', 7, 6),
(8, '2026-01-08 11:42:35', 8, 7),
(9, '2026-01-08 11:42:35', 9, 8),
(10, '2026-01-08 11:42:35', 10, 9);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_utilizador` (`id_utilizador`),
  ADD KEY `id_ideia` (`id_ideia`);

--
-- Índices para tabela `ideia`
--
ALTER TABLE `ideia`
  ADD PRIMARY KEY (`id_ideia`),
  ADD KEY `id_utilizador` (`id_utilizador`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices para tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`id_utilizador`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `voto`
--
ALTER TABLE `voto`
  ADD PRIMARY KEY (`id_voto`),
  ADD UNIQUE KEY `id_utilizador` (`id_utilizador`,`id_ideia`),
  ADD KEY `id_ideia` (`id_ideia`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `ideia`
--
ALTER TABLE `ideia`
  MODIFY `id_ideia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `id_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `voto`
--
ALTER TABLE `voto`
  MODIFY `id_voto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_ideia`) REFERENCES `ideia` (`id_ideia`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ideia`
--
ALTER TABLE `ideia`
  ADD CONSTRAINT `ideia_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`) ON DELETE CASCADE,
  ADD CONSTRAINT `ideia_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `voto_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id_utilizador`) ON DELETE CASCADE,
  ADD CONSTRAINT `voto_ibfk_2` FOREIGN KEY (`id_ideia`) REFERENCES `ideia` (`id_ideia`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
