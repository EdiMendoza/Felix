-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-11-2024 a las 23:43:08
-- Versión del servidor: 8.0.40-0ubuntu0.24.04.1
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `MecaYuca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `rol` enum('admin','usuario','guia') NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `rol`, `nombre_usuario`, `correo`, `contrasena`) VALUES
(1, 'admin', 'CarlosAdmin', 'carlos.admin@gmail.com', 'pass1234'),
(2, 'admin', 'AnaAdmin', 'ana.admin@outlook.com', 'adminpass'),
(3, 'usuario', 'JuanPerez', 'juan.perez@gmail.com', 'password1'),
(4, 'usuario', 'MariaLopez', 'maria.lopez@outlook.com', 'password2'),
(5, 'usuario', 'EmilyJohnson', 'emily.johnson@gmail.com', 'password3'),
(6, 'usuario', 'MiguelGarcia', 'miguel.garcia@outlook.com', 'password4'),
(7, 'usuario', 'RobertSmith', 'robert.smith@gmail.com', 'password5'),
(8, 'usuario', 'DiegoHernandez', 'diego.hernandez@gmail.com', 'password6'),
(9, 'guia', 'JoseGuia', 'jose.guia@outlook.com', 'guidpass1'),
(10, 'guia', 'LauraGuia', 'laura.guia@gmail.com', 'guidpass2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `comentario_usuario` text NOT NULL,
  `comentario_admin` text,
  `fecha_comentario` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_cliente`, `comentario_usuario`, `comentario_admin`, `fecha_comentario`) VALUES
(1, 3, 'Excelente viaje, muy recomendado!', 'Gracias por tu comentario, Juan!', '2024-11-13 15:46:32'),
(2, 4, 'El tour estuvo bien, pero el guía se demoró.', 'Gracias por tus comentarios, María. Trabajaremos en mejorar.', '2024-11-13 15:46:32'),
(3, 5, 'El lugar fue increíble, aunque el clima no ayudó mucho.', 'Lamentamos el inconveniente, Emily.', '2024-11-13 15:46:32'),
(4, 6, 'Muy bien organizado, lo disfruté bastante!', 'Nos alegra que te haya gustado, Miguel.', '2024-11-13 15:46:32'),
(5, 7, 'La atención fue excelente, volveré a contratar el servicio.', '¡Gracias, Robert! Esperamos verte pronto.', '2024-11-13 15:46:32'),
(6, 8, 'Buena experiencia, aunque esperaba más lugares.', 'Gracias por tu opinión, Diego. Consideraremos tus sugerencias.', '2024-11-13 15:46:32'),
(7, 3, 'Espectacular! El mejor viaje que he tenido.', 'Gracias, Juan. Nos alegra mucho.', '2024-11-13 15:46:32'),
(8, 6, '¿Podrían agregar otros destinos cercanos?', 'Estamos trabajando en ello, Miguel.', '2024-11-13 15:46:32'),
(9, 7, 'El guía era muy atento y amable.', '¡Gracias por compartir tu experiencia, Robert!', '2024-11-13 15:46:32'),
(10, 5, 'Podría mejorar el transporte.', 'Agradecemos tus comentarios, Emily.', '2024-11-13 15:46:32'),
(11, 3, 'cancelamos el vuelo', NULL, '2024-11-15 15:08:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guias`
--

CREATE TABLE `guias` (
  `id` int NOT NULL,
  `nombre_guia` varchar(100) NOT NULL,
  `numero_identificacion` varchar(20) NOT NULL,
  `longevidad` int DEFAULT NULL,
  `salario` decimal(10,2) NOT NULL,
  `id_cliente` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `guias`
--

INSERT INTO `guias` (`id`, `nombre_guia`, `numero_identificacion`, `longevidad`, `salario`, `id_cliente`) VALUES
(1, 'edi', '3990', 2, 20000.00, 2),
(2, 'Laura Gómez', 'GID002', 3, 14000.00, 10),
(3, 'uri', '2', 2, 2999.00, 3),
(4, 'YOLI', '23332', 2, 30000.00, 4),
(5, 'fredy', '3777', 4, 2888.00, 5),
(7, 'maco', '3394', 3, 2344.00, 2),
(9, 'carlos', '2343', 4, 2345.00, 2),
(10, 'balu', '1232', 23, 3999.00, 3),
(11, 'cas', '2321', 4, 34555.00, 7),
(12, 'pas', '3432', 1, 2344.00, 2),
(14, 'camilo', '4893', 5, 4022.00, 4),
(15, 'felix', '289', 2, 2500.00, 4),
(16, 'Amce', '740', 20, 500.00, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `id` int NOT NULL,
  `nombre_lugar` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `costo_por_persona` decimal(10,2) NOT NULL,
  `descuento` decimal(5,2) DEFAULT '0.00',
  `anticipo` decimal(10,2) DEFAULT NULL,
  `guia_especializado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `lugares`
--

INSERT INTO `lugares` (`id`, `nombre_lugar`, `fecha_inicio`, `fecha_fin`, `costo_por_persona`, `descuento`, `anticipo`, `guia_especializado`) VALUES
(1, 'Chichén Itzá', '2024-01-10', '2024-01-12', 1500.00, 10.00, 300.00, 9),
(2, 'Uxmal', '2024-02-15', '2024-02-17', 1200.00, 5.00, 250.00, 10),
(3, 'Cenote Ik Kil', '2024-03-20', '2024-03-20', 800.00, 0.00, 100.00, 9),
(4, 'Valladolid', '2024-04-05', '2024-04-06', 900.00, 15.00, 150.00, 10),
(5, 'Mérida City Tour', '2024-05-12', '2024-05-12', 500.00, 0.00, 100.00, 9),
(6, 'Isla Holbox', '2024-06-20', '2024-06-22', 2000.00, 20.00, 500.00, 10),
(7, 'Cenote Suytun', '2024-07-10', '2024-07-10', 850.00, 5.00, 150.00, 9),
(8, 'Izamal', '2024-08-15', '2024-08-15', 700.00, 0.00, 100.00, 10),
(9, 'Las Coloradas', '2024-09-05', '2024-09-06', 1300.00, 10.00, 200.00, 9),
(10, 'Ría Celestún', '2024-10-10', '2024-10-11', 1600.00, 0.00, 300.00, 10),
(11, 'cancun', '2024-11-11', '2024-11-04', 700.00, 50.00, 400.00, 2),
(12, 'suiza', '2007-12-23', '2004-03-30', 200.00, 80.00, 2.00, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `guias`
--
ALTER TABLE `guias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_identificacion` (`numero_identificacion`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guia_especializado` (`guia_especializado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `guias`
--
ALTER TABLE `guias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `guias`
--
ALTER TABLE `guias`
  ADD CONSTRAINT `guias_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD CONSTRAINT `lugares_ibfk_1` FOREIGN KEY (`guia_especializado`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
