-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-04-2023 a las 02:43:24
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Administrador', '1', 1677807726),
('DemoRol', '2', 1677807737);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/debug/*', 2, NULL, NULL, NULL, 1677807204, 1677807204),
('/gii/*', 2, NULL, NULL, NULL, 1677807211, 1677807211),
('/gridview/*', 2, NULL, NULL, NULL, 1677807174, 1677807174),
('/productos/categorias/*', 2, NULL, NULL, NULL, 1682216083, 1682216083),
('/productos/marcas/*', 2, NULL, NULL, NULL, 1681526290, 1681526290),
('/productos/productos/*', 2, NULL, NULL, NULL, 1682216107, 1682216107),
('/productos/sub-categorias/*', 2, NULL, NULL, NULL, 1682216092, 1682216092),
('/rbac/*', 2, NULL, NULL, NULL, 1677807195, 1677807195),
('/site/*', 2, NULL, NULL, NULL, 1677807256, 1677807256),
('/usuarios/*', 2, NULL, NULL, NULL, 1677807263, 1677807263),
('Administrador', 1, 'Rol de Administrador del sistema', NULL, NULL, 1677807604, 1677807684),
('DemoRol', 1, 'Rol para demosntacion', NULL, NULL, 1677807665, 1677807665),
('PermisoAdmin', 2, 'Este es el permiso para el administrador', NULL, NULL, 1677807368, 1677807368),
('PermisoDemo', 2, 'Este es un permiso para DEmostracion', NULL, NULL, 1677807505, 1677807505);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('PermisoAdmin', '/debug/*'),
('PermisoAdmin', '/gii/*'),
('PermisoAdmin', '/gridview/*'),
('PermisoDemo', '/gridview/*'),
('PermisoAdmin', '/productos/categorias/*'),
('PermisoAdmin', '/productos/marcas/*'),
('PermisoDemo', '/productos/marcas/*'),
('PermisoAdmin', '/productos/productos/*'),
('PermisoAdmin', '/productos/sub-categorias/*'),
('PermisoAdmin', '/rbac/*'),
('PermisoAdmin', '/site/*'),
('PermisoDemo', '/site/*'),
('PermisoAdmin', '/usuarios/*'),
('Administrador', 'PermisoAdmin'),
('DemoRol', 'PermisoDemo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bitacora`
--

DROP TABLE IF EXISTS `tbl_bitacora`;
CREATE TABLE IF NOT EXISTS `tbl_bitacora` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `id_registro` int(11) NOT NULL,
  `controlador` varchar(25) NOT NULL,
  `accion` varchar(25) NOT NULL,
  `data_original` json DEFAULT NULL,
  `data_modificada` json DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_bitacora`
--

INSERT INTO `tbl_bitacora` (`id_bitacora`, `id_registro`, `controlador`, `accion`, `data_original`, `data_modificada`, `id_usuario`, `fecha`) VALUES
(1, 1, 'marcas', 'create', '{\"estado\": \"1\", \"imagen\": \"/marcas/paebGYEuxIqSPddKag9jMYRbe-D-V_NW.png\", \"nombre\": \"Nintendo\", \"id_marca\": 1, \"fecha_ing\": \"2023-04-19 19:37:39\", \"fecha_mod\": \"2023-04-19 19:37:39\", \"descripcion\": \"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>\", \"id_usuario_ing\": 1, \"id_usuario_mod\": 1}', NULL, 1, '2023-04-19 19:37:39'),
(2, 2, 'marcas', 'create', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/ZXWjOIfROfoMNn9cyccip660xR-xT5pj.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', NULL, 1, '2023-04-22 14:25:54'),
(3, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 14:43:26\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 14:43:26'),
(4, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/5j1uOPuPZRDC2GKlQBz0m-9bhxG5V-dd.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 15:26:00\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 15:26:00'),
(5, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": null,\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 17:07:01\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 17:07:01'),
(6, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 17:07:23\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 17:07:23'),
(7, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 17:07:30\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 17:07:30'),
(8, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:15:10\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"[]\"', 1, '2023-04-22 19:15:10'),
(9, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:15:10\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"0\\\"\\n}\"', 1, '2023-04-22 19:15:57'),
(10, 2, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 14:43:26\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-22 19:19:24'),
(11, 2, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:19:24\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:19:24'),
(12, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:15:57\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:15:57'),
(13, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:15:57\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 1\\n}\"', '\"{\\n    \\\"estado\\\": 1\\n}\"', 1, '2023-04-22 19:20:00'),
(14, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:20:00\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"{\\n    \\\"estado\\\": 0\\n}\"', 1, '2023-04-22 19:20:03'),
(15, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:20:03\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 19:28:33'),
(16, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:28:38\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:28:38'),
(17, 2, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:19:24\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 19:30:28'),
(18, 2, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 2,\\n    \\\"nombre\\\": \\\"Samsung\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-22 14:25:54\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:30:41\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:30:41'),
(19, 1, 'marcas', 'update', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:28:38\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', '\"{\\n    \\\"estado\\\": \\\"1\\\"\\n}\"', 1, '2023-04-22 19:32:51'),
(20, 1, 'marcas', 'delete', '\"{\\n    \\\"id_marca\\\": 1,\\n    \\\"nombre\\\": \\\"Nintendo\\\",\\n    \\\"descripcion\\\": \\\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><\\\\/p>\\\",\\n    \\\"imagen\\\": \\\"\\\\/marcas\\\\/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png\\\",\\n    \\\"fecha_ing\\\": \\\"2023-04-19 19:37:39\\\",\\n    \\\"id_usuario_ing\\\": 1,\\n    \\\"fecha_mod\\\": \\\"2023-04-22 19:32:51\\\",\\n    \\\"id_usuario_mod\\\": 1,\\n    \\\"estado\\\": 0\\n}\"', '\"[]\"', 1, '2023-04-22 19:33:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categorias`
--

DROP TABLE IF EXISTS `tbl_categorias`;
CREATE TABLE IF NOT EXISTS `tbl_categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `tbl_categoiras_fk_id_usuario_ing` (`id_usuario_ing`),
  KEY `tbl_categoiras_fk_id_usuario_mod` (`id_usuario_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_error_log`
--

DROP TABLE IF EXISTS `tbl_error_log`;
CREATE TABLE IF NOT EXISTS `tbl_error_log` (
  `id_error_log` int(11) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `mensaje` text NOT NULL,
  `us_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_error_log`),
  KEY `us_id` (`us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_marcas`
--

DROP TABLE IF EXISTS `tbl_marcas`;
CREATE TABLE IF NOT EXISTS `tbl_marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_marca`),
  KEY `tbl_marcas_fk_id_usuario_ing` (`id_usuario_ing`),
  KEY `fk_marcas_fk_id_usuario_mod` (`id_usuario_mod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_marcas`
--

INSERT INTO `tbl_marcas` (`id_marca`, `nombre`, `descripcion`, `imagen`, `fecha_ing`, `id_usuario_ing`, `fecha_mod`, `id_usuario_mod`, `estado`) VALUES
(1, 'Nintendo', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>', '/marcas/xMCH5uAFB0vJTs5IbdG2jU446n2ND3Sr.png', '2023-04-19 19:37:39', 1, '2023-04-22 19:33:06', 1, 0),
(2, 'Samsung', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>', '/marcas/FSvIJ01xGwF-k4scStuB0k7380uKXycw.webp', '2023-04-22 14:25:54', 1, '2023-04-22 19:30:41', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

DROP TABLE IF EXISTS `tbl_productos`;
CREATE TABLE IF NOT EXISTS `tbl_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `sku` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `precio` decimal(10,2) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_sub_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `tbl_producto_fk_id_categoria` (`id_categoria`),
  KEY `tbl_producto_fk_id_sub_categoria` (`id_sub_categoria`),
  KEY `tbl_producto_fk_id_marca` (`id_marca`),
  KEY `tbl_producto_fk_id_usuario_ing` (`id_usuario_ing`),
  KEY `tbl_producto_fk_id_usuario_mod` (`id_usuario_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos_imagenes`
--

DROP TABLE IF EXISTS `tbl_productos_imagenes`;
CREATE TABLE IF NOT EXISTS `tbl_productos_imagenes` (
  `id_producto_imagen` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `imagen` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `principal` tinyint(1) NOT NULL,
  `fecha_ing` datetime NOT NULL,
  `id_usuario_ing` int(11) NOT NULL,
  PRIMARY KEY (`id_producto_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sub_categorias`
--

DROP TABLE IF EXISTS `tbl_sub_categorias`;
CREATE TABLE IF NOT EXISTS `tbl_sub_categorias` (
  `id_sub_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `fecha_ing` datetime DEFAULT NULL,
  `id_usuario_ing` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `id_usuario_mod` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_sub_categoria`),
  KEY `tbl_sub_categorias_fk_id_categoria` (`id_categoria`),
  KEY `tbl_sub_categorias_fk_id_usuario_ing` (`id_usuario_ing`),
  KEY `tbl_sub_categorias_fk_id_usuario_mod` (`id_usuario_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id_usuario`, `username`, `nombre`, `apellido`, `auth_key`, `password_hash`, `email`, `imagen`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', 'AxK42pI4nqEvIyBOBUJVfSR9oRTq-chL', '$2y$13$vfsku0ucja/nzCddYYjL3upKL9uDe/gUyNXK0gqTX0eJ7nFTRIrEu', 'admin@outlook.com', '/avatars/6_iFu3jKc-1Qmp51WicY_bb5mzyGBqT5.gif', 1, 1677203598, 1677203598),
(2, 'demo', 'demo', 'demo', '_LDZ2AUvtDDoy36zC6bJhNgJRM9rYO3D', '$2y$13$hGFn5B62kUT0kmTZtQS8We5sIj0vsg1mDH/dyf/j1tZVatVcD4khi', 'demo@outlook.com', '/avatars/default.png', 1, 1677203935, 1677203935);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD CONSTRAINT `tbl_bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD CONSTRAINT `tbl_categoiras_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_categoiras_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_error_log`
--
ALTER TABLE `tbl_error_log`
  ADD CONSTRAINT `tbl_error_log_ibfk_1` FOREIGN KEY (`us_id`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_marcas`
--
ALTER TABLE `tbl_marcas`
  ADD CONSTRAINT `fk_marcas_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_marcas_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD CONSTRAINT `tbl_producto_fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  ADD CONSTRAINT `tbl_producto_fk_id_marca` FOREIGN KEY (`id_marca`) REFERENCES `tbl_marcas` (`id_marca`),
  ADD CONSTRAINT `tbl_producto_fk_id_sub_categoria` FOREIGN KEY (`id_sub_categoria`) REFERENCES `tbl_sub_categorias` (`id_sub_categoria`),
  ADD CONSTRAINT `tbl_producto_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_producto_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `tbl_sub_categorias`
--
ALTER TABLE `tbl_sub_categorias`
  ADD CONSTRAINT `tbl_sub_categorias_fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  ADD CONSTRAINT `tbl_sub_categorias_fk_id_usuario_ing` FOREIGN KEY (`id_usuario_ing`) REFERENCES `tbl_usuarios` (`id_usuario`),
  ADD CONSTRAINT `tbl_sub_categorias_fk_id_usuario_mod` FOREIGN KEY (`id_usuario_mod`) REFERENCES `tbl_usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
