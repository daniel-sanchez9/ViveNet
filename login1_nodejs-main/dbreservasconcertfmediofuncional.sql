-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-05-2024 a las 04:18:37
-- Versión del servidor: 8.0.36-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `login_node_curso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificado_de_residencia`
--

CREATE TABLE `certificado_de_residencia` (
  `id` int NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `torre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartamento` int DEFAULT NULL,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_generacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_bbq`
--

CREATE TABLE `reservas_bbq` (
  `id` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `torre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartamento` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL,
  `mensaje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_generacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reservas_bbq`
--

INSERT INTO `reservas_bbq` (`id`, `nombre`, `torre`, `apartamento`, `email`, `fecha`, `mensaje`, `fecha_generacion`) VALUES
(2, 'Daniel', '4', 101, 'd@d.com', '2002-03-20 15:01:00', 'SSS', '2024-05-28 07:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_piscina`
--

CREATE TABLE `reservas_piscina` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `torre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartamento` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `mensaje` text COLLATE utf8mb4_unicode_ci,
  `fecha_generacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reservas_piscina`
--

INSERT INTO `reservas_piscina` (`id`, `nombre`, `torre`, `apartamento`, `email`, `fecha`, `mensaje`, `fecha_generacion`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 07:15:50'),
(2, 'DaniEl', '3', 101, 'd@d.com', '2000-03-02 15:02:00', 'ddd', '2024-05-28 07:28:46'),
(3, 'f', '1', 101, 'f@gmail.com', '2002-03-02 15:02:00', 'ddd', '2024-05-28 07:30:57'),
(4, 'f', '1', 101, 'f@gmail.com', '2002-03-02 15:02:00', 'ddd', '2024-05-28 07:31:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_salon`
--

CREATE TABLE `reservas_salon` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `torre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartamento` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `mensaje` text COLLATE utf8mb4_unicode_ci,
  `fecha_generacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reservas_salon`
--

INSERT INTO `reservas_salon` (`id`, `nombre`, `torre`, `apartamento`, `email`, `fecha`, `mensaje`, `fecha_generacion`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 07:20:09'),
(2, 'f', '2', 101, 'f@gmail.com', '2022-03-02 15:30:00', 'dddd', '2024-05-28 07:32:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user`, `name`, `rol`, `pass`) VALUES
(1, 'Juan', 'Juan Andres Lopez', 'admin', '$2a$08$/rWNFtnQ7aUI6X254aU5weGDsoksTBOvqZeFW4XNXUlAFoSV5.js.'),
(2, 'daniel', 'daniel', 'admin', '$2a$08$oPclk/.YLH/QTDIOQ9bxKe5.78yEna2LvknmAZ/DYNlK44lqQs.La');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `certificado_de_residencia`
--
ALTER TABLE `certificado_de_residencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas_bbq`
--
ALTER TABLE `reservas_bbq`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas_piscina`
--
ALTER TABLE `reservas_piscina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas_salon`
--
ALTER TABLE `reservas_salon`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `certificado_de_residencia`
--
ALTER TABLE `certificado_de_residencia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas_bbq`
--
ALTER TABLE `reservas_bbq`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reservas_piscina`
--
ALTER TABLE `reservas_piscina`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reservas_salon`
--
ALTER TABLE `reservas_salon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
