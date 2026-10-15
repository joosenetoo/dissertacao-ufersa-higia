-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 15, 2026 at 04:43 PM
-- Server version: 11.8.9-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u211421087_higia`
--

-- --------------------------------------------------------

--
-- Table structure for table `consultas`
--

CREATE TABLE `consultas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `medico_id` bigint(20) UNSIGNED NOT NULL,
  `atendente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime DEFAULT NULL,
  `status` enum('AGENDADA','CONFIRMADA','EM_ATENDIMENTO','CONCLUIDA','CANCELADA','FALTOU') NOT NULL DEFAULT 'AGENDADA',
  `motivo` varchar(255) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `queixa_principal` varchar(255) DEFAULT NULL,
  `anamnese` text DEFAULT NULL,
  `hipotese_diagnostica` text DEFAULT NULL,
  `conduta` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consultas`
--

INSERT INTO `consultas` (`id`, `paciente_id`, `medico_id`, `atendente_id`, `inicio`, `fim`, `status`, `motivo`, `observacoes`, `queixa_principal`, `anamnese`, `hipotese_diagnostica`, `conduta`, `created_at`, `updated_at`) VALUES
(6, 1, 1, 1, '2026-06-24 09:00:00', NULL, 'AGENDADA', 'Consulta de pré-natal', 'Sem queixas específicas no momento.', NULL, NULL, NULL, NULL, '2026-03-10 15:11:06', '2026-05-06 12:11:14'),
(8, 1, 1, 2, '2026-06-25 12:18:55', NULL, 'AGENDADA', 'Acompanhamento', 'Paciente refere leves desconfortos abdominais ocasionais, sem piora progressiva ou outros sintomas associados.', NULL, NULL, NULL, NULL, '2026-03-25 15:19:25', '2026-05-06 12:11:20'),
(9, 1, 1, 1, '2026-02-24 10:00:00', '2026-02-24 10:35:00', 'CONCLUIDA', 'Consulta de rotina pré-natal', 'Paciente compareceu acompanhada, colaborativa durante toda a consulta.', 'Dor leve em região lombar e sensação de peso abdominal.', 'Paciente gestante, G1P0, com idade gestacional estimada de 24 semanas. Refere dor lombar leve há cerca de 5 dias, sem irradiação, sem fatores agravantes importantes. Nega sangramentos, perda de líquido ou contrações uterinas. Movimentos fetais presentes e regulares. Sem histórico de comorbidades.', 'Gestação em evolução com dor lombar de provável origem postural.', 'Orientações posturais, repouso relativo e uso de analgésico leve se necessário. Solicitação de ultrassonografia obstétrica para avaliação do crescimento fetal. Manter acompanhamento pré-natal regular.', '2026-03-25 15:27:57', '2026-03-25 15:28:23'),
(10, 1, 1, 1, '2026-03-02 09:00:00', '2026-03-02 09:30:00', 'CONCLUIDA', 'Avaliação de cefaleia recorrente', 'Paciente orientada, em bom estado geral, colaborativa durante a consulta. Sinais vitais dentro da normalidade no momento da avaliação. Não apresenta sinais neurológicos focais ao exame clínico.', 'Paciente refere episódios recorrentes de dor de cabeça há cerca de duas semanas, com intensidade moderada e piora no período da tarde.', 'Paciente relata cefaleia em região frontal, de caráter opressivo, sem irradiação. Nega náuseas, vômitos ou alterações visuais. Refere aumento do estresse recente e padrão de sono irregular. Sem histórico prévio de enxaqueca. Nega uso recente de medicações contínuas.', 'Cefaleia tensional', 'Orientado medidas não farmacológicas, incluindo melhora da higiene do sono, redução de estresse e pausas durante atividades prolongadas. Prescrito analgésico simples se necessário. Reavaliar em caso de persistência ou piora dos sintomas.', '2026-03-30 12:25:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exames_paciente`
--

CREATE TABLE `exames_paciente` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `medico_id` bigint(20) UNSIGNED DEFAULT NULL,
  `consulta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nome_exame` varchar(200) NOT NULL,
  `laboratorio` varchar(160) DEFAULT NULL,
  `data_solicitacao` date DEFAULT NULL,
  `data_realizacao` date DEFAULT NULL,
  `status` enum('SOLICITADO','AGENDADO','REALIZADO','RESULTADO_DISPONIVEL','CANCELADO') NOT NULL DEFAULT 'SOLICITADO',
  `resultado_resumo` text DEFAULT NULL,
  `laudo_texto` mediumtext DEFAULT NULL,
  `url_laudo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exames_paciente`
--

INSERT INTO `exames_paciente` (`id`, `paciente_id`, `medico_id`, `consulta_id`, `nome_exame`, `laboratorio`, `data_solicitacao`, `data_realizacao`, `status`, `resultado_resumo`, `laudo_texto`, `url_laudo`, `created_at`, `updated_at`) VALUES
(6, 1, 1, 6, 'Ultrassonografia Obstétrica', 'Ultrassonografia Obstétrica ', '2026-03-24', '2026-03-25', 'RESULTADO_DISPONIVEL', 'Gestação única com feto vivo, biometria discretamente inferior ao esperado para a idade gestacional, sugerindo acompanhamento evolutivo.', 'Exame ultrassonográfico obstétrico realizado por via abdominal, evidenciando gestação única tópica.\r\n\r\nObserva-se feto único, com atividade cardíaca presente e movimentos fetais ativos.\r\n\r\nA biometria fetal encontra-se discretamente inferior ao esperado para a idade gestacional estimada, recomendando-se acompanhamento evolutivo para avaliação do crescimento fetal.\r\n\r\nLíquido amniótico em quantidade adequada.\r\n\r\nPlacenta localizada em parede anterior, com grau de maturidade compatível com a idade gestacional.\r\n\r\nNão foram identificadas alterações estruturais evidentes ao exame no momento.\r\n\r\nConclusão: Gestação única evolutiva, com biometria discretamente inferior ao esperado para a idade gestacional, recomendando seguimento clínico e ultrassonográfico.', NULL, '2026-03-25 15:18:22', NULL),
(7, 1, 1, 8, 'Hemograma Completo', 'Laboratório Higia Análises Clínicas', '2026-06-25', NULL, 'SOLICITADO', NULL, NULL, NULL, '2026-03-25 15:22:49', '2026-05-06 12:25:48'),
(8, 1, 1, 9, 'Hemoglobina glicada (HbA1c)', 'Laboratório Unidos Análises Clínicas', '2026-02-24', '2026-02-25', 'RESULTADO_DISPONIVEL', 'Hemoglobina glicada (HbA1c): 5,3%, dentro da faixa de normalidade, sem critérios diagnósticos para pré-diabetes ou diabetes mellitus.', 'Exame de hemoglobina glicada (HbA1c) realizado para avaliação do controle glicêmico médio dos últimos meses.\n\nResultado: 5,3%.\nGlicemia média estimada: 105 mg/dL.\n\nO valor obtido encontra-se dentro da faixa de normalidade, conforme critérios estabelecidos pela Sociedade Brasileira de Diabetes e pela American Diabetes Association.\n\nNão há evidências laboratoriais de pré-diabetes ou diabetes mellitus com base neste exame.\n\nA HbA1c reflete a média da glicemia nos últimos 2 a 3 meses, sendo um parâmetro útil para avaliação do estado glicêmico crônico.\n\nRecomenda-se manutenção de hábitos de vida saudáveis e acompanhamento clínico conforme orientação médica.\n\nConclusão: Resultado dentro dos padrões de normalidade, sem alterações glicêmicas sugestivas de diabetes.', 'https://chat.josetmneto.com.br/exameMaria.pdf', '2026-03-25 15:30:46', '2026-03-30 01:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(160) NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `cargo` enum('ATENDENTE','ADMIN') NOT NULL DEFAULT 'ATENDENTE',
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `cargo`, `telefone`, `email`, `ativo`, `created_at`, `updated_at`) VALUES
(1, 'Carla Menezes', '55566677788', 'ATENDENTE', '8334001000', 'recepcao@higia.com.br', 1, '2026-01-14 12:21:29', NULL),
(2, 'Rafael Alves', '11199988877', 'ATENDENTE', '8334001001', 'atendimento2@higia.com.br', 1, '2026-01-14 12:21:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicos`
--

CREATE TABLE `medicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(160) NOT NULL,
  `crm` varchar(30) NOT NULL,
  `uf_crm` char(2) NOT NULL DEFAULT 'PB',
  `especialidade` varchar(120) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicos`
--

INSERT INTO `medicos` (`id`, `nome`, `crm`, `uf_crm`, `especialidade`, `telefone`, `email`, `ativo`, `created_at`, `updated_at`) VALUES
(1, 'Dra. Ana Valéria Costa', '12345', 'PB', 'Ginecologia e Obstetrícia', '8334002000', 'dra.ana@higia.com.br', 1, '2026-01-14 12:21:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(160) NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `cpf`, `data_nascimento`, `telefone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Maria Fernanda Silva', '12345678901', '1994-05-20', '83999990001', 'maria.silva@email.com', '2026-01-14 12:21:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resumos_clinicos`
--

CREATE TABLE `resumos_clinicos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `consulta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `medico_id` bigint(20) UNSIGNED DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `resumo` mediumtext NOT NULL,
  `data_resumo` datetime NOT NULL DEFAULT current_timestamp(),
  `tipo` enum('CONSULTA','RETORNO','EVOLUCAO','ALTA','OBSERVACAO') NOT NULL DEFAULT 'CONSULTA',
  `origem` enum('MANUAL','AUTOMATICO','IA') NOT NULL DEFAULT 'MANUAL',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resumos_clinicos`
--

INSERT INTO `resumos_clinicos` (`id`, `paciente_id`, `consulta_id`, `medico_id`, `titulo`, `resumo`, `data_resumo`, `tipo`, `origem`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 1, 'Resumo da consulta pré-natal', 'Paciente gestante com evolução satisfatória, referindo dor lombar leve de provável origem postural. Mantidas orientações posturais, repouso relativo e seguimento pré-natal.', '2026-05-12 10:35:00', 'CONSULTA', 'MANUAL', '2026-05-12 13:16:55', '2026-05-12 13:02:50');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_consultas_proximas`
-- (See below for the actual view)
--
CREATE TABLE `vw_consultas_proximas` (
`consulta_id` bigint(20) unsigned
,`inicio` datetime
,`status` enum('AGENDADA','CONFIRMADA','EM_ATENDIMENTO','CONCLUIDA','CANCELADA','FALTOU')
,`paciente_id` bigint(20) unsigned
,`paciente_nome` varchar(160)
,`medico_id` bigint(20) unsigned
,`medico_nome` varchar(160)
,`especialidade` varchar(120)
,`atendente_nome` varchar(160)
,`motivo` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_exames_paciente`
-- (See below for the actual view)
--
CREATE TABLE `vw_exames_paciente` (
`exame_id` bigint(20) unsigned
,`status` enum('SOLICITADO','AGENDADO','REALIZADO','RESULTADO_DISPONIVEL','CANCELADO')
,`nome_exame` varchar(200)
,`laboratorio` varchar(160)
,`data_solicitacao` date
,`data_realizacao` date
,`resultado_resumo` text
,`paciente_id` bigint(20) unsigned
,`paciente_nome` varchar(160)
,`paciente_cpf` char(11)
,`medico_nome` varchar(160)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_consultas_paciente` (`paciente_id`),
  ADD KEY `idx_consultas_medico` (`medico_id`),
  ADD KEY `idx_consultas_inicio` (`inicio`),
  ADD KEY `idx_consultas_status` (`status`),
  ADD KEY `fk_consultas_atendente` (`atendente_id`);

--
-- Indexes for table `exames_paciente`
--
ALTER TABLE `exames_paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_exames_paciente` (`paciente_id`),
  ADD KEY `idx_exames_medico` (`medico_id`),
  ADD KEY `idx_exames_consulta` (`consulta_id`),
  ADD KEY `idx_exames_nome` (`nome_exame`),
  ADD KEY `idx_exames_status` (`status`),
  ADD KEY `idx_exames_data` (`data_realizacao`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_funcionarios_cpf` (`cpf`),
  ADD KEY `idx_funcionarios_nome` (`nome`),
  ADD KEY `idx_funcionarios_cargo` (`cargo`);

--
-- Indexes for table `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_medicos_crm` (`crm`,`uf_crm`),
  ADD KEY `idx_medicos_nome` (`nome`),
  ADD KEY `idx_medicos_especialidade` (`especialidade`);

--
-- Indexes for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_pacientes_cpf` (`cpf`),
  ADD KEY `idx_pacientes_nome` (`nome`);

--
-- Indexes for table `resumos_clinicos`
--
ALTER TABLE `resumos_clinicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_resumos_paciente` (`paciente_id`),
  ADD KEY `idx_resumos_consulta` (`consulta_id`),
  ADD KEY `idx_resumos_medico` (`medico_id`),
  ADD KEY `idx_resumos_data` (`data_resumo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exames_paciente`
--
ALTER TABLE `exames_paciente`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resumos_clinicos`
--
ALTER TABLE `resumos_clinicos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- --------------------------------------------------------

--
-- Structure for view `vw_consultas_proximas`
--
DROP TABLE IF EXISTS `vw_consultas_proximas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u211421087_higia`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_consultas_proximas`  AS SELECT `c`.`id` AS `consulta_id`, `c`.`inicio` AS `inicio`, `c`.`status` AS `status`, `p`.`id` AS `paciente_id`, `p`.`nome` AS `paciente_nome`, `m`.`id` AS `medico_id`, `m`.`nome` AS `medico_nome`, `m`.`especialidade` AS `especialidade`, `f`.`nome` AS `atendente_nome`, `c`.`motivo` AS `motivo` FROM (((`consultas` `c` join `pacientes` `p` on(`p`.`id` = `c`.`paciente_id`)) join `medicos` `m` on(`m`.`id` = `c`.`medico_id`)) left join `funcionarios` `f` on(`f`.`id` = `c`.`atendente_id`)) WHERE `c`.`inicio` >= current_timestamp() ORDER BY `c`.`inicio` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `vw_exames_paciente`
--
DROP TABLE IF EXISTS `vw_exames_paciente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u211421087_higia`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vw_exames_paciente`  AS SELECT `e`.`id` AS `exame_id`, `e`.`status` AS `status`, `e`.`nome_exame` AS `nome_exame`, `e`.`laboratorio` AS `laboratorio`, `e`.`data_solicitacao` AS `data_solicitacao`, `e`.`data_realizacao` AS `data_realizacao`, `e`.`resultado_resumo` AS `resultado_resumo`, `p`.`id` AS `paciente_id`, `p`.`nome` AS `paciente_nome`, `p`.`cpf` AS `paciente_cpf`, `m`.`nome` AS `medico_nome` FROM ((`exames_paciente` `e` join `pacientes` `p` on(`p`.`id` = `e`.`paciente_id`)) left join `medicos` `m` on(`m`.`id` = `e`.`medico_id`)) ORDER BY `e`.`data_realizacao` DESC, `e`.`id` DESC ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `fk_consultas_atendente` FOREIGN KEY (`atendente_id`) REFERENCES `funcionarios` (`id`),
  ADD CONSTRAINT `fk_consultas_medico` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`),
  ADD CONSTRAINT `fk_consultas_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Constraints for table `exames_paciente`
--
ALTER TABLE `exames_paciente`
  ADD CONSTRAINT `fk_exames_consulta` FOREIGN KEY (`consulta_id`) REFERENCES `consultas` (`id`),
  ADD CONSTRAINT `fk_exames_medico` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`),
  ADD CONSTRAINT `fk_exames_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Constraints for table `resumos_clinicos`
--
ALTER TABLE `resumos_clinicos`
  ADD CONSTRAINT `fk_resumos_consulta` FOREIGN KEY (`consulta_id`) REFERENCES `consultas` (`id`),
  ADD CONSTRAINT `fk_resumos_medico` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`),
  ADD CONSTRAINT `fk_resumos_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
