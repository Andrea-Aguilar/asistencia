-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-03-2020 a las 21:10:48
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asistencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `Id_Alumno` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `FechaNa` date NOT NULL,
  `Id_Grado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Id_Alumno`, `Nombre`, `FechaNa`, `Id_Grado`) VALUES
(2, 'Andrea Aguilar', '2000-03-04', 2),
(3, 'Marina Sandoval', '2001-03-21', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `Id_Asistencia` int(11) NOT NULL,
  `Asistencia` tinyint(1) NOT NULL,
  `Fecha` date NOT NULL,
  `Id_TipoPermiso` int(11) DEFAULT NULL,
  `Id_Alumno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`Id_Asistencia`, `Asistencia`, `Fecha`, `Id_TipoPermiso`, `Id_Alumno`) VALUES
(1, 1, '2020-03-03', 3, NULL),
(2, 0, '2020-03-04', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `Id_Grado` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Id_Materia` int(11) NOT NULL,
  `Id_Seccion` int(11) NOT NULL,
  `Id_Maestro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`Id_Grado`, `Nombre`, `Id_Materia`, `Id_Seccion`, `Id_Maestro`) VALUES
(1, 'Primero Basico', 1, 2, 2),
(2, 'Segundo Primaria', 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro`
--

CREATE TABLE `maestro` (
  `Id_Maestro` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `DPI` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `maestro`
--

INSERT INTO `maestro` (`Id_Maestro`, `Nombre`, `Direccion`, `Telefono`, `DPI`) VALUES
(1, 'Juan Archila', 'Valle Maria', '43534353', '3384 4556 4520'),
(2, 'Mario Aguilar', 'Colonia Los Pinos', '45564585', '33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `Id_Materia` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Id_Asistencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`Id_Materia`, `Nombre`, `Id_Asistencia`) VALUES
(1, 'Matematicas', 1),
(2, 'Ciencias Naturales', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `Id_Seccion` int(11) NOT NULL,
  `Nombre` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`Id_Seccion`, `Nombre`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopermiso`
--

CREATE TABLE `tipopermiso` (
  `Id_TipoPermiso` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipopermiso`
--

INSERT INTO `tipopermiso` (`Id_TipoPermiso`, `Descripcion`) VALUES
(1, 'Ninguno'),
(2, 'Enfermedad'),
(3, 'Fallecimiento');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Id_Alumno`),
  ADD KEY `FK_alumno_grado` (`Id_Grado`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`Id_Asistencia`),
  ADD KEY `FK_Asistencia_TipoPermiso` (`Id_TipoPermiso`),
  ADD KEY `FK_Asistencia_Alumno` (`Id_Alumno`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`Id_Grado`),
  ADD KEY `FK_Grado_Materia` (`Id_Materia`),
  ADD KEY `FK_Grado_Seccion` (`Id_Seccion`),
  ADD KEY `FK_Grado_Maestro` (`Id_Maestro`);

--
-- Indices de la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`Id_Maestro`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`Id_Materia`),
  ADD KEY `FK_Materia_Asistencia` (`Id_Asistencia`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`Id_Seccion`);

--
-- Indices de la tabla `tipopermiso`
--
ALTER TABLE `tipopermiso`
  ADD PRIMARY KEY (`Id_TipoPermiso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `Id_Alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `Id_Asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `Id_Grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `maestro`
--
ALTER TABLE `maestro`
  MODIFY `Id_Maestro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `Id_Materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `Id_Seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipopermiso`
--
ALTER TABLE `tipopermiso`
  MODIFY `Id_TipoPermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_alumno_grado` FOREIGN KEY (`Id_Grado`) REFERENCES `grado` (`Id_Grado`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `FK_Asistencia_Alumno` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumno` (`Id_Alumno`),
  ADD CONSTRAINT `FK_Asistencia_TipoPermiso` FOREIGN KEY (`Id_TipoPermiso`) REFERENCES `tipopermiso` (`Id_TipoPermiso`);

--
-- Filtros para la tabla `grado`
--
ALTER TABLE `grado`
  ADD CONSTRAINT `FK_Grado_Maestro` FOREIGN KEY (`Id_Maestro`) REFERENCES `maestro` (`Id_Maestro`),
  ADD CONSTRAINT `FK_Grado_Materia` FOREIGN KEY (`Id_Materia`) REFERENCES `materia` (`Id_Materia`),
  ADD CONSTRAINT `FK_Grado_Seccion` FOREIGN KEY (`Id_Seccion`) REFERENCES `seccion` (`Id_Seccion`);

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `FK_Materia_Asistencia` FOREIGN KEY (`Id_Asistencia`) REFERENCES `asistencia` (`Id_Asistencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
