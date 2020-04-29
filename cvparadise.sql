-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Abr-2020 às 16:37
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cvparadise`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` varchar(512) NOT NULL,
  `contacto` int(11) DEFAULT NULL,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `contacto`, `email`, `password`) VALUES
('a36855', 93645989, 'renatomaskiace@gmail.com', 'caboverde'),
('a41863', 938730504, 'ducalopes09@gmail.com', 'caboverde');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` varchar(512) NOT NULL,
  `nome_cliente` text DEFAULT NULL,
  `morada` text DEFAULT NULL,
  `nif` int(11) NOT NULL,
  `email` varchar(512) DEFAULT NULL,
  `contacto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `morada`, `nif`, `email`, `contacto`) VALUES
('0001', 'Pai Delas', 'Mirandela', 365987452, 'fantamorango@gmail.com', 965498966),
('0002', 'Andrea Pacheco', 'Paço Ferreira', 996584562, 'andreapacheco@gmail.com', 965986565),
('0003', 'Txuk Barbosa', 'Lisboa', 656998456, 'txukbarbosa@gmail.com', 369969565),
('0004', 'Ana Francisca', 'Felgueiras', 96656146, 'franciscasousa@gmail.com', 565986646),
('0005', 'João Silva', 'Bragança', 55694699, 'joaosilva@gmail.com', 2365897);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` varchar(512) NOT NULL,
  `cat_produto` text DEFAULT NULL,
  `nome_produto` text DEFAULT NULL,
  `preco_produto` varchar(512) DEFAULT NULL,
  `quant_stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `cat_produto`, `nome_produto`, `preco_produto`, `quant_stock`) VALUES
('01', 'Bebidas', 'Grogue', '20€', 400),
('02', 'Vestuário', 'Vestuários Africanos', '20€', 50),
('03', 'Vestuário', 'Tecidos Africanos', '20€', 39),
('04', 'Alimentos', 'Cachupa', '10€', 400);

-- --------------------------------------------------------

--
-- Estrutura da tabela `registar_produtos`
--

CREATE TABLE `registar_produtos` (
  `id_venda` int(11) NOT NULL,
  `id_produto` varchar(512) NOT NULL,
  `quant_produto` int(11) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_cliente` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `registar_produtos`
--
ALTER TABLE `registar_produtos`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `registar_produtos_fk1` (`id_cliente`),
  ADD KEY `registar_produtos_fk2` (`id_produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `registar_produtos`
--
ALTER TABLE `registar_produtos`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `registar_produtos`
--
ALTER TABLE `registar_produtos`
  ADD CONSTRAINT `registar_produtos_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `registar_produtos_fk2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
