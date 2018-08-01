-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2014 a las 13:01:20
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `daja`
--
CREATE DATABASE IF NOT EXISTS `daja` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `daja`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `codigo` int(25) NOT NULL,
  `comprador` int(25) DEFAULT NULL,
  `fecha` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `valortotalbruto` int(25) NOT NULL,
  `pago` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `comprador` (`comprador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `codigo` int(25) NOT NULL,
  `usuario_cedula` int(25) NOT NULL,
  `productos_codigo` int(25) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(10) NOT NULL,
  `valorunit` int(10) NOT NULL,
  `iva` int(10) NOT NULL,
  `valortotalbruto` int(10) NOT NULL,
  `descuento` int(10) NOT NULL,
  `valorneto` int(10) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`codigo`, `usuario_cedula`, `productos_codigo`, `fecha`, `cantidad`, `valorunit`, `iva`, `valortotalbruto`, `descuento`, `valorneto`) VALUES
(6, 1032444320, 8, '2013-10-08', 6, 777, 78, 78, 67, 77),
(77, 123, 77, '2014-02-16', 9999999, 900000, 0, 9, 9, 999999999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `codigo` int(25) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `precioventa` int(25) NOT NULL,
  `ultprecio` int(25) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `numeroexistencias` int(20) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=11112 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo`, `nombre`, `precioventa`, `ultprecio`, `descripcion`, `numeroexistencias`) VALUES
(9, 'ki', 99999, 9999, '999999', 9999999),
(34, '8', 8, 34, '34', 34),
(888, '999', 888, 88, '8', 8),
(909, '09', 909, 90, '0909', 90),
(8888, 'hilo', 7777, 7777, 'kkkki', 88888),
(11111, '11', 1, 111, '1', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tempcompra`
--

CREATE TABLE IF NOT EXISTS `tempcompra` (
  `codigo` int(20) NOT NULL,
  `producto_codigo` int(20) NOT NULL,
  `producto_nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `precio` int(20) NOT NULL,
  `cantidad` int(20) NOT NULL,
  `usuario_cedula` int(20) NOT NULL,
  `fecha` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tempcompra`
--

INSERT INTO `tempcompra` (`codigo`, `producto_codigo`, `producto_nombre`, `precio`, `cantidad`, `usuario_cedula`, `fecha`) VALUES
(2, 34, '8', 34, 9, 999999, '12/02/2014'),
(6, 11111, '11', 111, 9, 999999, '12/02/2014');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE IF NOT EXISTS `tipousuario` (
  `idusuario` int(20) NOT NULL,
  `descripcion` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idusuario`, `descripcion`) VALUES
(1, '1.empleado'),
(2, '2.cliente'),
(3, '3.administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `cedula` int(25) NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(20) NOT NULL,
  `correo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `tipousuario_idusuario` int(20) NOT NULL,
  `nombreusuario` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `tipousuario_idusuario` (`tipousuario_idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula`, `nombre`, `apellido`, `direccion`, `telefono`, `correo`, `tipousuario_idusuario`, `nombreusuario`, `clave`) VALUES
(999999, 'hjjj', 'hjjj', 'ghj', 678, 'hjk', 1, 'k', 'k'),
(1032444320, 'perra', 'Enciso', 'tranv. 67 No. 98', 206427, 'lmenciso02@misena.edu.co', 3, 'l', 'l');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipousuario_idusuario`) REFERENCES `tipousuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
