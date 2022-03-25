-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 14:27:44
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cine`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `id_actor` int(11) NOT NULL,
  `nom_actor` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actor`
--

INSERT INTO `actor` (`id_actor`, `nom_actor`) VALUES
(13659, 'yasmin ayaska'),
(18437, 'juanes de trivales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id_alquiler` int(11) NOT NULL,
  `fecha_alquiler` date NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`id_alquiler`, `fecha_alquiler`, `cliente_id_cliente`) VALUES
(168432, '2022-02-03', 174392),
(174392, '2021-03-18', 1328439509);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nom_categoria` varchar(25) NOT NULL,
  `premio_id_premio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nom_categoria`, `premio_id_premio`) VALUES
(128447, 'accion-aventura', 154872),
(162951, 'terror-suspenso', 128543);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(25) NOT NULL,
  `dire_cliente` varchar(25) NOT NULL,
  `celu_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nom_cliente`, `dire_cliente`, `celu_cliente`) VALUES
(174392, 'juan david espinoza', 'calle 40', 1313496543),
(1328439509, 'adelaida perez', 'carrera 6', 1678234567);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id_pelicula` int(11) NOT NULL,
  `nom_pelicula` varchar(25) NOT NULL,
  `fecha_estreno` varchar(25) NOT NULL,
  `categoria_id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id_pelicula`, `nom_pelicula`, `fecha_estreno`, `categoria_id_categoria`) VALUES
(16543, 'guerrero de valquirian', '20/10/2019', 128447),
(17432, 'siete dias para morir', '15/05/2020', 162951);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_actor`
--

CREATE TABLE `pelicula_actor` (
  `pelicula_id_pelicula` int(11) NOT NULL,
  `actor_id_actor` int(11) NOT NULL,
  `id_peliculactor` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula_actor`
--

INSERT INTO `pelicula_actor` (`pelicula_id_pelicula`, `actor_id_actor`, `id_peliculactor`) VALUES
(16543, 18437, '184392'),
(17432, 13659, '574329');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_alquiler`
--

CREATE TABLE `pelicula_alquiler` (
  `pelicula_id_pelicula` int(11) NOT NULL,
  `alquiler_id_alquiler` int(11) NOT NULL,
  `precio_alquiler` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pelicula_alquiler`
--

INSERT INTO `pelicula_alquiler` (`pelicula_id_pelicula`, `alquiler_id_alquiler`, `precio_alquiler`) VALUES
(16543, 168432, 20000),
(17432, 174392, 20000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premio`
--

CREATE TABLE `premio` (
  `id_premio` int(11) NOT NULL,
  `nom_premio` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `premio`
--

INSERT INTO `premio` (`id_premio`, `nom_premio`) VALUES
(128543, 'oscar'),
(154872, 'globos de oro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id_actor`);

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id_alquiler`,`cliente_id_cliente`),
  ADD KEY `fk_alquiler_cliente1_idx` (`cliente_id_cliente`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`,`premio_id_premio`),
  ADD KEY `fk_categoria_premio1_idx` (`premio_id_premio`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id_pelicula`,`categoria_id_categoria`),
  ADD KEY `fk_pelicula_categoria_idx` (`categoria_id_categoria`);

--
-- Indices de la tabla `pelicula_actor`
--
ALTER TABLE `pelicula_actor`
  ADD PRIMARY KEY (`pelicula_id_pelicula`,`actor_id_actor`),
  ADD KEY `fk_pelicula_has_actor_actor1_idx` (`actor_id_actor`),
  ADD KEY `fk_pelicula_has_actor_pelicula1_idx` (`pelicula_id_pelicula`);

--
-- Indices de la tabla `pelicula_alquiler`
--
ALTER TABLE `pelicula_alquiler`
  ADD PRIMARY KEY (`pelicula_id_pelicula`,`alquiler_id_alquiler`),
  ADD KEY `fk_pelicula_has_alquiler_alquiler1_idx` (`alquiler_id_alquiler`),
  ADD KEY `fk_pelicula_has_alquiler_pelicula1_idx` (`pelicula_id_pelicula`);

--
-- Indices de la tabla `premio`
--
ALTER TABLE `premio`
  ADD PRIMARY KEY (`id_premio`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `fk_alquiler_cliente1` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_premio1` FOREIGN KEY (`premio_id_premio`) REFERENCES `premio` (`id_premio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `fk_pelicula_categoria` FOREIGN KEY (`categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pelicula_actor`
--
ALTER TABLE `pelicula_actor`
  ADD CONSTRAINT `fk_pelicula_has_actor_actor1` FOREIGN KEY (`actor_id_actor`) REFERENCES `actor` (`id_actor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pelicula_has_actor_pelicula1` FOREIGN KEY (`pelicula_id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pelicula_alquiler`
--
ALTER TABLE `pelicula_alquiler`
  ADD CONSTRAINT `fk_pelicula_has_alquiler_alquiler1` FOREIGN KEY (`alquiler_id_alquiler`) REFERENCES `alquiler` (`id_alquiler`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pelicula_has_alquiler_pelicula1` FOREIGN KEY (`pelicula_id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
