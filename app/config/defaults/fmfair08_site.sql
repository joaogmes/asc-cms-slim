-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 29-Maio-2023 às 23:36
-- Versão do servidor: 5.7.23-23
-- versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fmfair08_site`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `arquivos`
--

CREATE TABLE `arquivos` (
  `id` int(10) UNSIGNED NOT NULL,
  `prospect` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nome` varchar(255) NOT NULL DEFAULT '0',
  `arquivo` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `arquivos`
--

INSERT INTO `arquivos` (`id`, `prospect`, `nome`, `arquivo`) VALUES
(1, 1, 'pexels-energepiccom-159888', '1671638873-1-pexels-energepiccom-159888.jpg'),
(2, 1, 'boleto', '1671638873-1-boleto.pdf'),
(3, 1, 'boleto-recovery (1)', '1671638873-1-boleto-recovery (1).pdf'),
(4, 1, '2000004656671396', '1671638873-1-2000004656671396.pdf'),
(5, 1, 'Wave Line Background Free Download - 1280x960', '1671638874-1-Wave Line Background Free Download - 1280x960.jpg'),
(6, 1, 'pngwing.com', '1671638874-1-pngwing.com.png'),
(7, 2, 'pexels-energepiccom-159888', '1671639486-2-pexels-energepiccom-159888.jpg'),
(8, 2, 'boleto', '1671639489-2-boleto.pdf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `razaosocial` varchar(100) DEFAULT NULL,
  `cnpj` varchar(30) DEFAULT NULL,
  `responsavel` varchar(50) DEFAULT NULL,
  `cpfresponsavel` varchar(30) DEFAULT NULL,
  `textosobre` text,
  `fotosobre` varchar(100) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `googleplus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `razaosocial`, `cnpj`, `responsavel`, `cpfresponsavel`, `textosobre`, `fotosobre`, `endereco`, `whatsapp`, `telefone`, `email`, `facebook`, `instagram`, `twitter`, `youtube`, `googleplus`) VALUES
(1, 'FairMoney', 'FairMoney', '', 'Danilo de Araújo santos', '448221358-61', '<p>Sobre a FairMoney</p>', '1669086722635727254services-background.png', '', '11 98686-3098', '', 'contato@fairmoney.com.br', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `configuracoes`
--

CREATE TABLE `configuracoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modooperacao` varchar(100) DEFAULT NULL,
  `datainstalacao` datetime DEFAULT NULL,
  `tokenativacao` varchar(100) DEFAULT NULL,
  `statusativacao` varchar(10) DEFAULT NULL,
  `permissoesadm` text,
  `permissoeseditor` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `configuracoes`
--

INSERT INTO `configuracoes` (`id`, `modooperacao`, `datainstalacao`, `tokenativacao`, `statusativacao`, `permissoesadm`, `permissoeseditor`) VALUES
(1, 'manutencao', '2022-11-22 00:10:17', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `id` int(10) UNSIGNED NOT NULL,
  `textoPrimario` text NOT NULL,
  `textoSecundario` text NOT NULL,
  `textoCta` varchar(255) NOT NULL DEFAULT '',
  `linkCta` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`id`, `textoPrimario`, `textoSecundario`, `textoCta`, `linkCta`) VALUES
(1, 'Trabalhamos para oferecer para sua empresa mais <b><font color=\"#0000ff\">eficiência, transparência e rapidez</font></b> para <b><font color=\"#0000ff\" style=\"\">potencializar </font></b>seu <font color=\"#0000ff\"><b>fluxo de caixa</b></font>', 'Entre em contato com a Fair Money e entraremos em contato para encontrar as opções perfeitas para seu negócio!', 'Saiba mais', '#');

-- --------------------------------------------------------

--
-- Estrutura da tabela `footer`
--

CREATE TABLE `footer` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(200) DEFAULT '0',
  `telefone` varchar(200) DEFAULT '0',
  `cnpj` varchar(200) DEFAULT '0',
  `linkedin` varchar(200) DEFAULT '0',
  `instagram` varchar(200) DEFAULT '0',
  `youtube` varchar(200) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `footer`
--

INSERT INTO `footer` (`id`, `email`, `telefone`, `cnpj`, `linkedin`, `instagram`, `youtube`) VALUES
(1, 'contato@fmfairmoney.com.br', '+55 (11) 91777-3098', '', 'https://www.linkedin.com/company/fairmoneybr', 'https://instagram.com', 'https://youtube.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `header`
--

CREATE TABLE `header` (
  `id` int(10) UNSIGNED NOT NULL,
  `logotipo` varchar(200) NOT NULL DEFAULT '0',
  `textoDestaque` varchar(200) NOT NULL DEFAULT '0',
  `iconeDestaque` varchar(200) NOT NULL DEFAULT '0',
  `corPrimaria` varchar(50) NOT NULL,
  `corSecundaria` varchar(50) NOT NULL,
  `corTerciaria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `header`
--

INSERT INTO `header` (`id`, `logotipo`, `textoDestaque`, `iconeDestaque`, `corPrimaria`, `corSecundaria`, `corTerciaria`) VALUES
(1, '16695739501107710568logo.png', 'Vencedores do Startup One 2021 – FIAP & Shark Tank 2022 – Babson College', '1669573950931710159badge.png', '#3254fa', '#e5ae0d', '#171717');

-- --------------------------------------------------------

--
-- Estrutura da tabela `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomeResponsavel` varchar(255) DEFAULT NULL,
  `razaoSocial` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `tipo` enum('cedente','financiador','outro') DEFAULT 'outro',
  `politicas` enum('sim','nao') DEFAULT 'nao',
  `newsletter` enum('sim','nao') DEFAULT 'nao',
  `datacadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `leads`
--

INSERT INTO `leads` (`id`, `nomeResponsavel`, `razaoSocial`, `email`, `telefone`, `tipo`, `politicas`, `newsletter`, `datacadastro`) VALUES
(1, 'Pedro Pereira', 'Digital Deck', 'contato@digitaldeck.com.br', '+55 (17) 9 9647 6427', 'cedente', 'sim', 'nao', '2022-12-21 13:08:24'),
(2, 'João Gomes', 'Ascending', 'joao@ascending.com.br', '+55 (17) 9 8825 1166', 'outro', 'sim', 'nao', '2022-12-21 13:16:42'),
(3, 'Contato de teste', 'Razao de teste', 'email@teste', '+55 (65) 4 9616 5818', 'financiador', 'sim', 'nao', '2022-12-21 13:26:03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario` varchar(10) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  `operacao` varchar(30) DEFAULT NULL,
  `tabela` varchar(30) DEFAULT NULL,
  `antigo` text,
  `novo` text,
  `campo` varchar(100) DEFAULT NULL,
  `chave` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id`, `usuario`, `datahora`, `operacao`, `tabela`, `antigo`, `novo`, `campo`, `chave`) VALUES
(1, '1', '2022-11-26 18:02:09', 'alterar', 'header', '0', 'Teste', 'textoDestaque', '1'),
(2, '1', '2022-11-26 18:02:09', 'alterar', 'header', '0', '16694965291629102462badge.png', 'logotipo', '1'),
(3, '1', '2022-11-26 18:02:09', 'alterar', 'header', '0', '16694965291959075120badge.png', 'iconeDestaque', '1'),
(4, '1', '2022-11-26 18:05:32', 'alterar', 'header', '16694965291629102462badge.png', '16694967322120983434logo.png', 'logotipo', '1'),
(5, '1', '2022-11-26 18:05:55', 'alterar', 'header', 'Teste', 'Vencedores do Startup One 2021 – FIAP & Shark Tank 2022 – Babson College', 'textoDestaque', '1'),
(6, '1', '2022-11-26 18:14:04', 'alterar', 'header', '', '#3254fa', 'corPrimaria', '1'),
(7, '1', '2022-11-26 18:14:04', 'alterar', 'header', '', '#e5ae0d', 'corSecundaria', '1'),
(8, '1', '2022-11-26 18:14:04', 'alterar', 'header', '', '#171717', 'corTerciaria', '1'),
(9, '1', '2022-11-26 18:43:39', 'alterar', 'footer', '0', 'contato@fmfairmoney.com.br', 'email', '1'),
(10, '1', '2022-11-26 18:43:39', 'alterar', 'footer', '0', '+55 17 99647 6427', 'telefone', '1'),
(11, '1', '2022-11-26 18:43:39', 'alterar', 'footer', '0', '99.999.999/9999-99', 'cnpj', '1'),
(12, '1', '2022-11-26 18:43:39', 'alterar', 'footer', '0', 'https://linkedin.com', 'linkedin', '1'),
(13, '1', '2022-11-26 18:43:39', 'alterar', 'footer', '0', 'https://instagram.com', 'instagram', '1'),
(14, '1', '2022-11-26 18:43:39', 'alterar', 'footer', '0', 'https://youtube.com', 'youtube', '1'),
(15, '1', '2022-11-26 18:47:11', 'alterar', 'header', '16694967322120983434logo.png', '1669499231308337937logo.png', 'logotipo', '1'),
(16, '1', '2022-11-26 18:47:11', 'alterar', 'header', '16694965291959075120badge.png', '16694992311838554337badge.png', 'iconeDestaque', '1'),
(17, '1', '2022-11-26 19:43:50', 'alterar', 'footer', '99.999.999/9999-99', '99.999.999/9999-99 teste', 'cnpj', '1'),
(18, '1', '2022-11-26 19:43:55', 'alterar', 'footer', '99.999.999/9999-99 teste', '99.999.999/9999-99', 'cnpj', '1'),
(19, '1', '2022-11-27 13:43:47', 'alterar', 'sobre', '', '<p>Teste</p>', 'texto', '1'),
(20, '1', '2022-11-27 13:43:47', 'alterar', 'sobre', '', 'Bota', 'textoCta', '1'),
(21, '1', '2022-11-27 13:43:47', 'alterar', 'sobre', '', 'link', 'linkCta', '1'),
(22, '1', '2022-11-27 13:43:47', 'alterar', 'sobre', '', 'Texto 1', 'textoIcone1', '1'),
(23, '1', '2022-11-27 13:43:47', 'alterar', 'sobre', '', 'Texto 2', 'textoIcone2', '1'),
(24, '1', '2022-11-27 13:43:47', 'alterar', 'sobre', '', '1669567427254343181services-background.png', 'imagemBackground', '1'),
(25, '1', '2022-11-27 13:48:15', 'alterar', 'sobre', 'link', '', 'linkCta', '1'),
(26, '1', '2022-11-27 13:48:15', 'alterar', 'sobre', '', '16695676951488144294badge.png', 'icone1', '1'),
(27, '1', '2022-11-27 13:49:35', 'alterar', 'sobre', '', '1669567775836985021logo.png', 'icone2', '1'),
(28, '1', '2022-11-27 13:58:12', 'alterar', 'sobre', '1669567775836985021logo.png', '1669568292533224929turn-right-arrow.png', 'icone2', '1'),
(29, '1', '2022-11-27 14:00:12', 'alterar', 'sobre', '1669568292533224929turn-right-arrow.png', '166956841217635437984t5.png', 'icone2', '1'),
(30, '1', '2022-11-27 14:00:23', 'alterar', 'sobre', '166956841217635437984t5.png', '16695684231381905029note-and-pen-svgrepo-com.svg', 'icone2', '1'),
(31, '1', '2022-11-27 14:11:17', 'alterar', 'sobre', '', 'link.co', 'linkCta', '1'),
(32, '1', '2022-11-27 15:15:25', 'alterar', 'servico', '', 'PME e financiador enviam documentos cadastrais apenas uma única vez', 'texto1', '1'),
(33, '1', '2022-11-27 15:15:25', 'alterar', 'servico', '', '16695729251412304118number-one-bold-svgrepo-com.svg', 'icone1', '1'),
(34, '1', '2022-11-27 15:23:18', 'alterar', 'servico', '', '16695733982070639626number-two-bold-svgrepo-com.svg', 'icone2', '1'),
(35, '1', '2022-11-27 15:32:30', 'alterar', 'header', '1669499231308337937logo.png', '16695739501107710568logo.png', 'logotipo', '1'),
(36, '1', '2022-11-27 15:32:30', 'alterar', 'header', '16694992311838554337badge.png', '1669573950931710159badge.png', 'iconeDestaque', '1'),
(37, '1', '2022-11-27 15:36:30', 'alterar', 'sobre', '1669567427254343181services-background.png', '16695741901407558044services-background.png', 'imagemBackground', '1'),
(38, '1', '2022-11-27 15:36:30', 'alterar', 'sobre', '16695676951488144294badge.png', '1669574190488239887building-svgrepo-com.svg', 'icone1', '1'),
(39, '1', '2022-11-27 15:36:30', 'alterar', 'sobre', '16695684231381905029note-and-pen-svgrepo-com.svg', '16695741901930918565store-svgrepo-com.svg', 'icone2', '1'),
(40, '1', '2022-11-27 15:37:18', 'alterar', 'sobre', '<p>Teste</p>', '<p><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">Apoiando o&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>desenvolvimento</b>&nbsp;</span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">de&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>pequenas e médias empresas</b>,&nbsp;<b>otimizando</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">&nbsp;e&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>ampliando</b>&nbsp;</span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">as opções de crédito por meio de um ambiente</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\">&nbsp;<b>mais seguro&nbsp;</b>e&nbsp;<b>transparente</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">&nbsp;para os&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>envolvidos</b></span><br></p>', 'texto', '1'),
(41, '1', '2022-11-27 15:37:18', 'alterar', 'sobre', 'Bota', 'Saiba mais', 'textoCta', '1'),
(42, '1', '2022-11-27 15:37:18', 'alterar', 'sobre', 'link.co', '#', 'linkCta', '1'),
(43, '1', '2022-11-27 15:37:18', 'alterar', 'sobre', 'Texto 1', '+50 Credores', 'textoIcone1', '1'),
(44, '1', '2022-11-27 15:37:18', 'alterar', 'sobre', 'Texto 2', '+ 30 PMEs Atendidas', 'textoIcone2', '1'),
(45, '1', '2022-11-27 15:38:24', 'alterar', 'servico', '16695729251412304118number-one-bold-svgrepo-com.svg', '1669574304665535965number-one-bold-svgrepo-com.svg', 'icone1', '1'),
(46, '1', '2022-11-27 15:40:41', 'alterar', 'servico', '', '166957444117651194421t2.png', 'transicao1', '1'),
(47, '1', '2022-11-27 15:41:32', 'alterar', 'servico', '', 'PME acrescenta recebíveis na plataforma e decide qual gostaria de antecipar', 'texto2', '1'),
(48, '1', '2022-11-27 15:41:32', 'alterar', 'servico', '16695733982070639626number-two-bold-svgrepo-com.svg', '16695744921865756318number-two-bold-svgrepo-com.svg', 'icone2', '1'),
(49, '1', '2022-11-27 15:41:32', 'alterar', 'servico', '', '1669574492973474842t3.png', 'transicao2', '1'),
(50, '1', '2022-11-27 15:43:45', 'alterar', 'servico', '', 'Recebível é validado pelo solicitante da mercadoria (Cliente do PME)', 'texto3', '1'),
(51, '1', '2022-11-27 15:43:45', 'alterar', 'servico', '', 'Financiadores tem acesso ao título validado e fazem a oferta', 'texto4', '1'),
(52, '1', '2022-11-27 15:43:45', 'alterar', 'servico', '', 'PME escolhe a melhor oferta', 'texto5', '1'),
(53, '1', '2022-11-27 15:43:45', 'alterar', 'servico', '', 'Financiador e PME realizam a transação por fora da plataforma', 'texto6', '1'),
(54, '1', '2022-11-27 15:43:45', 'alterar', 'servico', '', '16695746252018674435number-four-bold-svgrepo-com.svg', 'icone4', '1'),
(55, '1', '2022-11-27 15:43:45', 'alterar', 'servico', '', '16695746251487249393number-five-bold-svgrepo-com.svg', 'icone5', '1'),
(56, '1', '2022-11-27 15:43:45', 'alterar', 'servico', '', '16695746252001399423number-six-bold-svgrepo-com.svg', 'icone6', '1'),
(57, '1', '2022-11-27 15:43:45', 'alterar', 'servico', '', '166957462513379981824t5.png', 'transicao4', '1'),
(58, '1', '2022-11-27 15:48:57', 'alterar', 'servico', '', '16695749371586965680services.png', 'transicao3', '1'),
(59, '1', '2022-11-27 15:48:57', 'alterar', 'servico', '', '166957493713447868755t6.png', 'transicao5', '1'),
(60, '1', '2022-11-27 15:57:14', 'alterar', 'servico', '', '16695754342121181604number-three-bold-svgrepo-com.svg', 'icone3', '1'),
(61, '1', '2022-11-27 18:01:54', 'alterar', 'servico', '', 'Cta serviço', 'textoCta', '1'),
(62, '1', '2022-11-27 18:01:54', 'alterar', 'servico', '', 'urldoservico', 'linkCta', '1'),
(63, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Menos burocracia', 'tituloVantagem1', '1'),
(64, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Em um único lugar e com um único cadastro, você consegue antecipar seus recebíveis', 'textoVantagem1', '1'),
(65, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Maior agilidade', 'tituloVantagem2', '1'),
(66, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Eficiência, transparência e rapidez para potencializar seu fluxo de caixa', 'textoVantagem2', '1'),
(67, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Flexibilidade', 'tituloVantagem3', '1'),
(68, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Atendimento flexível aos cedentes e sacados', 'textoVantagem3', '1'),
(69, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Menores taxas', 'tituloVantagem4', '1'),
(70, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Consiga a melhor oferta na nossa base de financiadores', 'textoVantagem4', '1'),
(71, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Mais crédito', 'tituloVantagem5', '1'),
(72, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', 'Cresça com o dinheiro que já é da sua empresa por direito e receba hoje o que seus clientes PJ pagarão à prazo', 'textoVantagem5', '1'),
(73, '1', '2022-12-01 21:36:59', 'alterar', 'vantagens', '', '16699414191554998191document-svgrepo-com.svg', 'iconeVantagem1', '1'),
(74, '1', '2022-12-01 22:10:42', 'alterar', 'vantagens', '0', 'teste', 'tituloVantagem1', '1'),
(75, '1', '2022-12-01 22:10:42', 'alterar', 'vantagens', '0', 'ste', 'textoVantagem1', '1'),
(76, '1', '2022-12-01 22:10:52', 'alterar', 'vantagens', '0', 'teste2', 'tituloVantagem2', '1'),
(77, '1', '2022-12-01 22:10:52', 'alterar', 'vantagens', '0', 'este2', 'textoVantagem2', '1'),
(78, '1', '2022-12-01 22:12:09', 'alterar', 'vantagens', '0', 'teste3', 'tituloVantagem3', '1'),
(79, '1', '2022-12-01 22:12:09', 'alterar', 'vantagens', '0', '03', 'textoVantagem3', '1'),
(80, '1', '2022-12-01 22:13:14', 'alterar', 'vantagens', '0', '123', 'tituloVantagem4', '1'),
(81, '1', '2022-12-01 22:13:14', 'alterar', 'vantagens', '0', '123', 'tituloVantagem5', '1'),
(82, '1', '2022-12-01 22:48:18', 'alterar', 'vantagem', 'teste', 'Menos burocracia', 'tituloVantagem1', '1'),
(83, '1', '2022-12-01 22:48:18', 'alterar', 'vantagem', 'ste', 'Em um único lugar e com um único cadastro, você consegue antecipar seus recebíveis', 'textoVantagem1', '1'),
(84, '1', '2022-12-01 22:48:18', 'alterar', 'vantagem', '0', '1669945698718732868document-svgrepo-com.svg', 'iconeVantagem1', '1'),
(85, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', 'teste2', 'Maior agilidade', 'tituloVantagem2', '1'),
(86, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', 'este2', 'Eficiência, transparência e rapidez para potencializar seu fluxo de caixa', 'textoVantagem2', '1'),
(87, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', 'teste3', 'Flexibilidade', 'tituloVantagem3', '1'),
(88, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '03', 'Atendimento flexível aos cedentes e sacados', 'textoVantagem3', '1'),
(89, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '123', 'Menores taxas', 'tituloVantagem4', '1'),
(90, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '0', 'Consiga a melhor oferta na nossa base de financiadores', 'textoVantagem4', '1'),
(91, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '123', 'Mais crédito', 'tituloVantagem5', '1'),
(92, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '0', 'Cresça com o dinheiro que já é da sua empresa por direito e receba hoje o que seus clientes PJ pagarão à prazo', 'textoVantagem5', '1'),
(93, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '1669945698718732868document-svgrepo-com.svg', '16699459547153029note-and-pen-svgrepo-com.svg', 'iconeVantagem1', '1'),
(94, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '0', '1669945954858430039sitemap-svgrepo-com.svg', 'iconeVantagem2', '1'),
(95, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '0', '1669945954334017000shield-check-svgrepo-com.svg', 'iconeVantagem3', '1'),
(96, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '0', '16699459541510695592piggy-bank-svgrepo-com.svg', 'iconeVantagem4', '1'),
(97, '1', '2022-12-01 22:52:34', 'alterar', 'vantagem', '0', '1669945954248265781economy-sales-discount-svgrepo-com.svg', 'iconeVantagem5', '1'),
(98, '1', '2022-12-01 22:53:39', 'alterar', 'vantagem', '16699459547153029note-and-pen-svgrepo-com.svg', '16699460191737753788iconmonstr-note-35.svg', 'iconeVantagem1', '1'),
(99, '1', '2022-12-01 22:53:39', 'alterar', 'vantagem', '1669945954248265781economy-sales-discount-svgrepo-com.svg', '1669946019139672340iconmonstr-banknote-15.svg', 'iconeVantagem5', '1'),
(100, '1', '2022-12-01 22:53:53', 'alterar', 'vantagem', '0', 'Texto', 'textoCta', '1'),
(101, '1', '2022-12-01 22:53:53', 'alterar', 'vantagem', '0', '#', 'linkCta', '1'),
(102, '1', '2022-12-01 23:00:56', 'alterar', 'sobre', '<p><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">Apoiando o&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>desenvolvimento</b>&nbsp;</span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">de&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>pequenas e médias empresas</b>,&nbsp;<b>otimizando</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">&nbsp;e&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>ampliando</b>&nbsp;</span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">as opções de crédito por meio de um ambiente</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\">&nbsp;<b>mais seguro&nbsp;</b>e&nbsp;<b>transparente</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">&nbsp;para os&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>envolvidos</b></span><br></p>', '<p><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">Apoiando o </span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>desenvolvimento</b> </span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">de </span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>pequenas e médias empresas</b>, <b>otimizando</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\"> e </span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>ampliando</b> </span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">as opções de crédito por meio de um ambiente</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"> <b>mais seguro </b>e <b>transparente</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\"> para os </span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>envolvidos</b></span><br></p>', 'texto', '1'),
(103, '1', '2022-12-01 23:01:52', 'alterar', 'sobre', '16695741901407558044services-background.png', '16699465121341042622pngwing.com.png', 'imagemBackground', '1'),
(104, '1', '2022-12-01 23:02:38', 'alterar', 'sobre', '', '16699465584568460pngwing.com.png', 'imagemCta', '1'),
(105, '1', '2022-12-01 23:07:44', 'alterar', 'sobre', '16699465121341042622pngwing.com.png', '16699468642036288785WaveLineBackgroundFreeDownload-1280x960.jpg', 'imagemBackground', '1'),
(106, '1', '2022-12-03 15:24:19', 'alterar', 'sobre', 'Saiba mais', 'Saiba mais s', 'textoCta', '1'),
(107, '1', '2022-12-03 15:24:26', 'alterar', 'sobre', 'Saiba mais s', 'Saiba mais', 'textoCta', '1'),
(108, '1', '2022-12-03 15:45:24', 'alterar', 'sobre', '<p><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">Apoiando o </span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>desenvolvimento</b> </span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">de </span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>pequenas e médias empresas</b>, <b>otimizando</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\"> e </span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>ampliando</b> </span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">as opções de crédito por meio de um ambiente</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"> <b>mais seguro </b>e <b>transparente</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\"> para os </span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>envolvidos</b></span><br></p>', '<p><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">Apoiando o&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>desenvolvimento</b>&nbsp;</span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">de&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>pequenas e médias empresas</b>,&nbsp;<b>otimizando</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">&nbsp;e&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>ampliando</b>&nbsp;</span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">as opções de crédito por meio de um ambiente</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\">&nbsp;<b>mais seguro&nbsp;</b>e&nbsp;<b>transparente</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">&nbsp;para os&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>envolvidos</b></span><br></p>', 'texto', '1'),
(109, '1', '2022-12-03 15:45:53', 'alterar', 'sobre', '<p><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">Apoiando o&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>desenvolvimento</b>&nbsp;</span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">de&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>pequenas e médias empresas</b>,&nbsp;<b>otimizando</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">&nbsp;e&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>ampliando</b>&nbsp;</span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">as opções de crédito por meio de um ambiente</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\">&nbsp;<b>mais seguro&nbsp;</b>e&nbsp;<b>transparente</b></span><span style=\"color: rgb(84, 89, 95); font-family: Roboto, sans-serif; font-size: 24px;\">&nbsp;para os&nbsp;</span><span style=\"font-family: Roboto, sans-serif; font-size: 24px; color: rgb(0, 0, 255);\"><b>envolvidos</b></span><br></p>', '<p>Apoiando o desenvolvimento de pequenas e médias empresas, otimizando e ampliando as opções de crédito por meio de um ambiente mais seguro e transparente para os envolvidos<br></p>', 'texto', '1'),
(110, '1', '2022-12-03 15:47:12', 'alterar', 'sobre', '<p>Apoiando o desenvolvimento de pequenas e médias empresas, otimizando e ampliando as opções de crédito por meio de um ambiente mais seguro e transparente para os envolvidos<br></p>', '<p>Apoiando o <b><font color=\"#0000ff\">desenvolvimento </font></b>de <b><font color=\"#0000ff\">pequenas e médias empresas, otimizando e ampliando</font></b> as opções de crédito por meio de um ambiente <b><font color=\"#0000ff\" style=\"\">mais seguro e transparente</font></b> para os <b><font color=\"#0000ff\">envolvidos</font></b><br></p>', 'texto', '1'),
(111, '1', '2022-12-04 14:19:00', 'alterar', 'servico', 'Financiador e PME realizam a transação por fora da plataforma', 'Financiador e PME realizam a transação por fora da plataforma 123', 'texto6', '1'),
(112, '1', '2022-12-04 14:19:10', 'alterar', 'servico', 'Financiador e PME realizam a transação por fora da plataforma 123', 'Financiador e PME realizam a transação por fora da plataforma', 'texto6', '1'),
(113, '1', '2022-12-05 07:42:54', 'alterar', 'contato', '', '<p>Teste</p>', 'textoPrimario', '1'),
(114, '1', '2022-12-05 07:43:36', 'alterar', 'contato', '', 'Secundário', 'textoSecundario', '1'),
(115, '1', '2022-12-05 07:43:36', 'alterar', 'contato', '', '123', 'textoCta', '1'),
(116, '1', '2022-12-05 07:43:36', 'alterar', 'contato', '', 'asd', 'linkCta', '1'),
(117, '1', '2022-12-05 07:44:45', 'alterar', 'contato', '<p>Teste</p>', 'Trabalhamos para oferecer para sua empresa mais <b><font color=\"#0000ff\">eficiência, transparência e rapidez</font></b> para <b><font color=\"#0000ff\" style=\"\">potencializar </font></b>seu <font color=\"#0000ff\"><b>fluxo de caixa</b></font>', 'textoPrimario', '1'),
(118, '1', '2022-12-05 07:44:45', 'alterar', 'contato', 'Secundário', 'Entre em contato com a Fair Money e entraremos em contato para encontrar as opções perfeitas para seu negócio!', 'textoSecundario', '1'),
(119, '1', '2022-12-05 07:44:45', 'alterar', 'contato', '123', 'Saiba mais', 'textoCta', '1'),
(120, '1', '2022-12-05 07:44:45', 'alterar', 'contato', 'asd', '#', 'linkCta', '1'),
(121, '1', '2022-12-05 20:45:14', 'alterar', 'footer', '+55 17 99647 6427', '+55 (11) 99875-5570', 'telefone', '1'),
(122, '2', '2022-12-07 01:05:52', 'alterar', 'header', 'Vencedores do Startup One 2021 – FIAP & Shark Tank 2022 – Babson College', 'Vencedores do Startup One 2021 – FIAP & Shark Tank 2022 – Babson College teste', 'textoDestaque', '1'),
(123, '2', '2022-12-07 01:06:04', 'alterar', 'header', 'Vencedores do Startup One 2021 – FIAP & Shark Tank 2022 – Babson College teste', 'Vencedores do Startup One 2021 – FIAP & Shark Tank 2022 – Babson College', 'textoDestaque', '1'),
(124, '1', '2022-12-20 15:30:35', 'alterar', 'seo', '16690868071630911560badge.png', '16715610352084296285fairmoney-favicon.png', 'icone', '1'),
(125, '1', '2022-12-20 15:32:35', 'alterar', 'seo', '16690868071142720870services.png', '1671561155168253976pexels-energepiccom-159888.jpg', 'imagem', '1'),
(126, '1', '2022-12-21 13:21:33', 'alterar', 'sobre', 'Saiba mais', 'Nossos serviços', 'textoCta', '1'),
(127, '1', '2022-12-21 13:21:33', 'alterar', 'sobre', '#', 'servico', 'linkCta', '1'),
(128, '1', '2023-01-09 09:08:55', 'alterar', 'seo', ' //', '<!-- Google tag (gtag.js) -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-QX9DLTQ0RP\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'G-QX9DLTQ0RP\');\r\n</script>', 'scripts', '1'),
(129, '2', '2023-05-02 12:41:46', 'alterar', 'sobre', '16699468642036288785WaveLineBackgroundFreeDownload-1280x960.jpg', '16830421061308465448abstrato-liso-azul-escuro-com-vinheta-preta-studio-bem-usado-como-plano-de-fundorelatorio-de-negociosmodelo-de-site-digitalbackdrop.jpg', 'imagemBackground', '1'),
(130, '2', '2023-05-02 12:43:40', 'alterar', 'sobre', '16830421061308465448abstrato-liso-azul-escuro-com-vinheta-preta-studio-bem-usado-como-plano-de-fundorelatorio-de-negociosmodelo-de-site-digitalbackdrop.jpg', '16830422201017597556fundo-do-estudio-do-fotografo-vazio-claro-abstrato-textura-do-fundo-da-beleza-da-parede-plana-gradiente-azul-claro-escuro-e-claro-cinza-frio-branco-de-neve-e-piso-no-interior-do-inverno-do-quarto-espacoso-vazio.jpg', 'imagemBackground', '1'),
(131, '2', '2023-05-02 12:43:48', 'alterar', 'footer', '99.999.999/9999-99', '', 'cnpj', '1'),
(132, '2', '2023-05-02 12:45:21', 'alterar', 'sobre', '16830422201017597556fundo-do-estudio-do-fotografo-vazio-claro-abstrato-textura-do-fundo-da-beleza-da-parede-plana-gradiente-azul-claro-escuro-e-claro-cinza-frio-branco-de-neve-e-piso-no-interior-do-in', '16830423212042998087fundo-geometrico-abstrato-conceito-de-tecnologia-design-de-pontos-de-conexao.jpg', 'imagemBackground', '1'),
(133, '2', '2023-05-02 12:51:19', 'alterar', 'footer', 'https://linkedin.com', 'https://www.linkedin.com/company/fairmoneybr', 'linkedin', '1'),
(134, '2', '2023-05-02 13:05:42', 'alterar', 'sobre', '16830423212042998087fundo-geometrico-abstrato-conceito-de-tecnologia-design-de-pontos-de-conexao.jpg', '16830435424680179269410.jpg', 'imagemBackground', '1'),
(135, '2', '2023-05-02 13:08:37', 'alterar', 'sobre', '16830435424680179269410.jpg', '16830437171753503270026059358910.jpg', 'imagemBackground', '1'),
(136, '2', '2023-05-02 13:13:04', 'alterar', 'sobre', '16830437171753503270026059358910.jpg', '168304398466762878800386062241.jpg', 'imagemBackground', '1'),
(137, '2', '2023-05-02 13:13:36', 'alterar', 'sobre', '168304398466762878800386062241.jpg', '168304401616677254117938277.jpg', 'imagemBackground', '1'),
(138, '2', '2023-05-02 13:18:30', 'alterar', 'vantagem', 'Menos burocracia', 'Menos Burocracia', 'tituloVantagem1', '1'),
(139, '2', '2023-05-02 13:18:30', 'alterar', 'vantagem', 'Maior agilidade', 'Maior Agilidade', 'tituloVantagem2', '1'),
(140, '2', '2023-05-02 13:18:30', 'alterar', 'vantagem', 'Menores taxas', 'Menores Taxas', 'tituloVantagem4', '1'),
(141, '2', '2023-05-02 13:18:30', 'alterar', 'vantagem', 'Mais crédito', 'Mais Crédito', 'tituloVantagem5', '1'),
(142, '2', '2023-05-02 13:18:51', 'alterar', 'sobre', 'Nossos serviços', 'Nossos Serviços', 'textoCta', '1'),
(143, '2', '2023-05-02 13:22:25', 'alterar', 'seo', 'fairmoney', 'fairmoney, antecipação de recebíveis, crédito para PMEs, crédito, capital, grana, dinheiro, financiamento, duplicatas, antecipação, recebíveis', 'keywords', '1'),
(144, '2', '2023-05-02 13:32:25', 'alterar', 'sobre', 'Nossos Serviços', 'Saiba Mais', 'textoCta', '1'),
(145, '2', '2023-05-25 10:00:44', 'alterar', 'footer', '+55 (11) 99875-5570', '+55 (11) 91777-3098', 'telefone', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `destinatario` varchar(100) DEFAULT NULL,
  `remetente` varchar(100) DEFAULT NULL,
  `canal` varchar(100) DEFAULT NULL,
  `contato` varchar(10) DEFAULT NULL,
  `assunto` varchar(150) DEFAULT NULL,
  `mensagem` text,
  `data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prospects`
--

CREATE TABLE `prospects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomeResponsavel` varchar(255) DEFAULT NULL,
  `razaoSocial` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `faturamento` varchar(255) DEFAULT NULL,
  `setor` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `politicas` enum('sim','nao') DEFAULT 'nao',
  `newsletter` enum('sim','nao') DEFAULT 'nao',
  `datacadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `prospects`
--

INSERT INTO `prospects` (`id`, `nomeResponsavel`, `razaoSocial`, `email`, `cnpj`, `faturamento`, `setor`, `endereco`, `telefone`, `politicas`, `newsletter`, `datacadastro`) VALUES
(1, 'João Gomes', 'Ascending', 'contato@ascending.com.br', '34902100000125', '15500', 'Tech', 'R Sergipe 937 Fernandópolis', '+55 (17) 9 8825 1166', 'sim', 'nao', '2022-12-21 13:07:26'),
(2, 'João Gomes', 'Ascending', 'joao@ascending.com.br', '34902100000125', '15500', 'Tech', 'R Sergipe 937 Fernandópolis/Sp', '+55 (17) 9 8825 1166', 'sim', 'nao', '2022-12-21 13:17:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `seo`
--

CREATE TABLE `seo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `icone` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `descricao` text,
  `keywords` text,
  `imagem` varchar(100) DEFAULT NULL,
  `scripts` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `seo`
--

INSERT INTO `seo` (`id`, `titulo`, `icone`, `autor`, `descricao`, `keywords`, `imagem`, `scripts`) VALUES
(1, 'FairMoney', '16715610352084296285fairmoney-favicon.png', 'FairMoney', 'Antecipação de recebíveis', 'fairmoney, antecipação de recebíveis, crédito para PMEs, crédito, capital, grana, dinheiro, financiamento, duplicatas, antecipação, recebíveis', '1671561155168253976pexels-energepiccom-159888.jpg', '<!-- Google tag (gtag.js) -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-QX9DLTQ0RP\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'G-QX9DLTQ0RP\');\r\n</script>');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(10) UNSIGNED NOT NULL,
  `icone1` varchar(200) DEFAULT NULL,
  `texto1` varchar(200) DEFAULT NULL,
  `transicao1` varchar(200) DEFAULT NULL,
  `icone2` varchar(200) DEFAULT NULL,
  `texto2` varchar(200) DEFAULT NULL,
  `transicao2` varchar(200) DEFAULT NULL,
  `icone3` varchar(200) DEFAULT NULL,
  `texto3` varchar(200) DEFAULT NULL,
  `transicao3` varchar(200) DEFAULT NULL,
  `icone4` varchar(200) DEFAULT NULL,
  `texto4` varchar(200) DEFAULT NULL,
  `transicao4` varchar(200) DEFAULT NULL,
  `icone5` varchar(200) DEFAULT NULL,
  `texto5` varchar(200) DEFAULT NULL,
  `transicao5` varchar(200) DEFAULT NULL,
  `icone6` varchar(200) DEFAULT NULL,
  `texto6` varchar(200) DEFAULT NULL,
  `textoCta` varchar(200) DEFAULT NULL,
  `linkCta` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id`, `icone1`, `texto1`, `transicao1`, `icone2`, `texto2`, `transicao2`, `icone3`, `texto3`, `transicao3`, `icone4`, `texto4`, `transicao4`, `icone5`, `texto5`, `transicao5`, `icone6`, `texto6`, `textoCta`, `linkCta`) VALUES
(1, '1669574304665535965number-one-bold-svgrepo-com.svg', 'PME e financiador enviam documentos cadastrais apenas uma única vez', '166957444117651194421t2.png', '16695744921865756318number-two-bold-svgrepo-com.svg', 'PME acrescenta recebíveis na plataforma e decide qual gostaria de antecipar', '1669574492973474842t3.png', '16695754342121181604number-three-bold-svgrepo-com.svg', 'Recebível é validado pelo solicitante da mercadoria (Cliente do PME)', '16695749371586965680services.png', '16695746252018674435number-four-bold-svgrepo-com.svg', 'Financiadores tem acesso ao título validado e fazem a oferta', '166957462513379981824t5.png', '16695746251487249393number-five-bold-svgrepo-com.svg', 'PME escolhe a melhor oferta', '166957493713447868755t6.png', '16695746252001399423number-six-bold-svgrepo-com.svg', 'Financiador e PME realizam a transação por fora da plataforma', 'Cta serviço', 'urldoservico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sobre`
--

CREATE TABLE `sobre` (
  `id` int(10) UNSIGNED NOT NULL,
  `texto` text,
  `textoCta` varchar(200) DEFAULT '',
  `linkCta` varchar(200) DEFAULT '',
  `icone1` varchar(200) DEFAULT '',
  `textoIcone1` varchar(200) DEFAULT '',
  `icone2` varchar(200) DEFAULT '',
  `textoIcone2` varchar(200) DEFAULT '',
  `imagemBackground` varchar(200) DEFAULT '',
  `imagemCta` varchar(200) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sobre`
--

INSERT INTO `sobre` (`id`, `texto`, `textoCta`, `linkCta`, `icone1`, `textoIcone1`, `icone2`, `textoIcone2`, `imagemBackground`, `imagemCta`) VALUES
(1, '<p>Apoiando o <b><font color=\"#0000ff\">desenvolvimento </font></b>de <b><font color=\"#0000ff\">pequenas e médias empresas, otimizando e ampliando</font></b> as opções de crédito por meio de um ambiente <b><font color=\"#0000ff\" style=\"\">mais seguro e transparente</font></b> para os <b><font color=\"#0000ff\">envolvidos</font></b><br></p>', 'Saiba Mais', 'servico', '1669574190488239887building-svgrepo-com.svg', '+50 Credores', '16695741901930918565store-svgrepo-com.svg', '+ 30 PMEs Atendidas', '168304401616677254117938277.jpg', '16699465584568460pngwing.com.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `template`
--

CREATE TABLE `template` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logotipo` varchar(100) DEFAULT NULL,
  `bghero` varchar(100) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `subtitulo` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `tema` varchar(50) DEFAULT NULL,
  `corprimaria` varchar(50) DEFAULT NULL,
  `corsecundaria` varchar(50) DEFAULT NULL,
  `corterciaria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `template`
--

INSERT INTO `template` (`id`, `logotipo`, `bghero`, `titulo`, `subtitulo`, `link`, `tema`, `corprimaria`, `corsecundaria`, `corterciaria`) VALUES
(1, '16690867641762443652logo.png', '16690867641981911559services-background.png', '<p>Headline</p>', '<p>Sub</p>', '#', 'padrao', '#001eff', '#ffb029', '#2b2b2b');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `nivel` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `lp` int(11) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `scripts` text,
  `pixel` varchar(100) DEFAULT NULL,
  `logradouro` varchar(200) DEFAULT NULL,
  `numero` varchar(200) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `cidade` varchar(200) DEFAULT NULL,
  `estado` varchar(200) DEFAULT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL,
  `mensagem_whatsapp` varchar(200) DEFAULT NULL,
  `mapa` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `login`, `senha`, `email`, `telefone`, `nivel`, `status`, `tipo`, `lp`, `codigo`, `whatsapp`, `scripts`, `pixel`, `logradouro`, `numero`, `bairro`, `cidade`, `estado`, `latitude`, `longitude`, `facebook`, `instagram`, `mensagem_whatsapp`, `mapa`) VALUES
(1, 'Ascending', 'ascending', '#Asc2022', 'desenvolvimento@ascending.com.br', '5517988251166', '10', 'ativo', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'FairMoney', 'fairmoney', '#FM2022', 'contato@fairmoney.com.br', '', '10', 'ativo', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vantagem`
--

CREATE TABLE `vantagem` (
  `id` int(10) UNSIGNED NOT NULL,
  `tituloVantagem1` varchar(200) DEFAULT '0',
  `tituloVantagem2` varchar(200) DEFAULT '0',
  `tituloVantagem3` varchar(200) DEFAULT '0',
  `tituloVantagem4` varchar(200) DEFAULT '0',
  `tituloVantagem5` varchar(200) DEFAULT '0',
  `iconeVantagem1` varchar(200) DEFAULT '0',
  `iconeVantagem2` varchar(200) DEFAULT '0',
  `iconeVantagem3` varchar(200) DEFAULT '0',
  `iconeVantagem4` varchar(200) DEFAULT '0',
  `iconeVantagem5` varchar(200) DEFAULT '0',
  `textoVantagem1` varchar(200) DEFAULT '0',
  `textoVantagem2` varchar(200) DEFAULT '0',
  `textoVantagem3` varchar(200) DEFAULT '0',
  `textoVantagem4` varchar(200) DEFAULT '0',
  `textoVantagem5` varchar(200) DEFAULT '0',
  `textoCta` varchar(200) DEFAULT '0',
  `linkCta` varchar(200) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vantagem`
--

INSERT INTO `vantagem` (`id`, `tituloVantagem1`, `tituloVantagem2`, `tituloVantagem3`, `tituloVantagem4`, `tituloVantagem5`, `iconeVantagem1`, `iconeVantagem2`, `iconeVantagem3`, `iconeVantagem4`, `iconeVantagem5`, `textoVantagem1`, `textoVantagem2`, `textoVantagem3`, `textoVantagem4`, `textoVantagem5`, `textoCta`, `linkCta`) VALUES
(1, 'Menos Burocracia', 'Maior Agilidade', 'Flexibilidade', 'Menores Taxas', 'Mais Crédito', '16699460191737753788iconmonstr-note-35.svg', '1669945954858430039sitemap-svgrepo-com.svg', '1669945954334017000shield-check-svgrepo-com.svg', '16699459541510695592piggy-bank-svgrepo-com.svg', '1669946019139672340iconmonstr-banknote-15.svg', 'Em um único lugar e com um único cadastro, você consegue antecipar seus recebíveis', 'Eficiência, transparência e rapidez para potencializar seu fluxo de caixa', 'Atendimento flexível aos cedentes e sacados', 'Consiga a melhor oferta na nossa base de financiadores', 'Cresça com o dinheiro que já é da sua empresa por direito e receba hoje o que seus clientes PJ pagarão à prazo', 'Texto', '#');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `arquivos`
--
ALTER TABLE `arquivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `configuracoes`
--
ALTER TABLE `configuracoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `prospects`
--
ALTER TABLE `prospects`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices para tabela `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sobre`
--
ALTER TABLE `sobre`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vantagem`
--
ALTER TABLE `vantagem`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arquivos`
--
ALTER TABLE `arquivos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `configuracoes`
--
ALTER TABLE `configuracoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `header`
--
ALTER TABLE `header`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de tabela `mensagem`
--
ALTER TABLE `mensagem`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `prospects`
--
ALTER TABLE `prospects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `seo`
--
ALTER TABLE `seo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sobre`
--
ALTER TABLE `sobre`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `template`
--
ALTER TABLE `template`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `vantagem`
--
ALTER TABLE `vantagem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
