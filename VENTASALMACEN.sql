--SCRIPT DE LA BASE DE DATOS
---------------------------------------------------------
---------------------------------------------------------CREANDO BD VENTASALMACEN
---------------------------------------------------------
use master
go
drop database if exists VENTASALMACEN
go
create database VENTASALMACEN
go
---------------------------------------------------------USANDO BD VENTASALMACEN
use VENTASALMACEN
go
---------------------------------------------------------

---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA CATEGORIA
---------------------------------------------------------
drop table if exists dbo.CLIENTES
go
create table CLIENTES
(
	id        VARCHAR(15) PRIMARY KEY,
	nombre    VARCHAR(50) NOT NULL,
	direccion VARCHAR(100),
	telefono  VARCHAR(10)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA CLIENTES
insert into CLIENTES (id, nombre, direccion, telefono) values 
(),

go
---------------------------------------------------------LISTADO REGISTROS TABLA CLIENTES
select * from CLIENTES
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA ARTICULOS
---------------------------------------------------------
drop table if exists dbo.ARTICULOS
go
create table ARTICULOS
(
	id     INT PRIMARY KEY identity,
	nombre VARCHAR (100) UNIQUE NOT NULL,
	medida VARCHAR (15) NOT NULL,
	stock  INTEGER DEFAULT 0
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA ARTICULOS
insert into ARTICULOS (id, nombre, medida, stock) values
( ),

go
---------------------------------------------------------LISTADO REGISTROS TABLA ARTICULOS
select * from ARTICULOS
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA USUARIOS
---------------------------------------------------------
drop table if exists dbo.USUARIOS
go
create table USUARIOS
(
	id         INT PRIMARY KEY,
	nombre     VARCHAR(50) NOT NULL,
	contrasena VARCHAR(32) NOT NULL,
	rol        VARCHAR(20)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA USUARIOS
insert into USUARIOS (id, nombre, contrasena, rol) values
( ),

go
---------------------------------------------------------LISTADO REGISTROS TABLA USUARIOS
select * from USUARIOS
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA VENTAS
---------------------------------------------------------
drop table if exists dbo.VENTAS
go
create table VENTAS
(
	id          INT PRIMARY KEY identity,
	id_usuario  INT,
	valor_total DECIMAL(10,2),
	estado      VARCHAR(30),
	fecha       DATE NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA VENTAS
insert into VENTAS (id, id_usuario, valor_total, estado, fecha) values
( ),

go
---------------------------------------------------------LISTADO REGISTROS TABLA VENTAS
select * from VENTAS
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA CATEGORIAS
---------------------------------------------------------
drop table if exists dbo.CATEGORIAS
go
create table CATEGORIAS
(
	id     INT PRIMARY KEY identity,
	nombre VARCHAR(50) UNIQUE NOT NULL
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA CATEGORIAS
insert into CATEGORIAS (id, nombre) values
( ),

go
---------------------------------------------------------LISTADO REGISTROS TABLA CATEGORIAS
select * from CATEGORIAS
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA PRODUCTOS
---------------------------------------------------------
drop table if exists dbo.PRODUCTOS
go
create table PRODUCTOS
(
	id           INT PRIMARY KEY identity,
	codigo       VARCHAR(15) UNIQUE NOT NULL,
	nombre       VARCHAR(100) UNIQUE NOT NULL,
	precio       DECIMAL(10,2) NOT NULL,
	id_categoria INT NOT NULL,
	FOREIGN KEY (id_categoria) REFERENCES categorias(id)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA PRODUCTOS
insert into PRODUCTOS (id, codigo, nombre, precio, id_categoria) values
( ),

go
---------------------------------------------------------LISTADO REGISTROS TABLA PRODUCTOS
select * from PRODUCTOS
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA ABONO
---------------------------------------------------------
drop table if exists dbo.ABONO
go
create table ABONO
(
	id          INT PRIMARY KEY identity,
	id_venta    INT NOT NULL,
	tipo_pago   VARCHAR(30) NOT NULL,
	valor_abono DECIMAL(10,2) NOT NULL,
	fecha       DATE NOT NULL,
	FOREIGN KEY (id_venta) REFERENCES ventas(id)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA ABONO
insert into ABONO (id, id_venta, tipo_pago, valor_abono, fecha) values
( ),

go
---------------------------------------------------------LISTADO REGISTROS TABLA ABONO
select * from ABONO
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA VENTASCLIENTES
---------------------------------------------------------
drop table if exists dbo.VENTASCLIENTES
go
create table VENTASCLIENTES
(
	id_venta   INT NOT NULL,
    id_cliente VARCHAR(15) NOT NULL,
    FOREIGN KEY(id_venta) 	REFERENCES ventas(id),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA VENTASCLIENTES
insert into VENTASCLIENTES (id_venta, id_cliente) values
( ),

go
---------------------------------------------------------LISTADO REGISTROS TABLA VENTASCLIENTES
select * from VENTASCLIENTES
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA DETALLEVENTAS
---------------------------------------------------------
drop table if exists dbo.DETALLEVENTAS
go
create table DETALLEVENTAS
(
	id          INT PRIMARY KEY identity,
	precio      DECIMAL(10,2) NOT NULL,
	descuento   INT,
	id_producto INT NOT NULL,
	cantidad    INT NOT NULL,
	id_venta    INT NOT NULL,
	FOREIGN KEY (id_producto) REFERENCES productos(id),
	FOREIGN KEY (id_venta) REFERENCES ventas(id)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA DETALLEVENTAS
insert into DETALLEVENTAS (id, precio, descuento, id_producto, cantidad, id_venta) values
( ),

go
---------------------------------------------------------LISTADO REGISTROS TABLA DETALLEVENTAS
select * from DETALLEVENTAS
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA DETALLEPRODUCTO
---------------------------------------------------------
drop table if exists dbo.DETALLEPRODUCTO
go
create table DETALLEPRODUCTO
(
	id          INT PRIMARY KEY identity,
	cantidad    INT NOT NULL,
	id_producto INT,
	id_articulo INT,
	FOREIGN KEY (id_producto) REFERENCES productos(id),
	FOREIGN KEY (id_articulo) REFERENCES articulos(id)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA DETALLEPRODUCTO
go
insert into DETALLEPRODUCTO (id, precio, id_producto, id_articulo) values
( ),

---------------------------------------------------------LISTADO REGISTROS TABLA DETALLEPRODUCTO
select * from DETALLEPRODUCTO
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA PROVEEDORES
---------------------------------------------------------
drop table if exists dbo.PROVEEDORES
go
create table PROVEEDORES
(
	id             INT PRIMARY KEY identity,
	razon_social   VARCHAR(50) NULL,
	tipo_documento VARCHAR(15) NULL,
	num_documento  VARCHAR(15) UNIQUE NULL,
	telefono       VARCHAR(10) NULL
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA PROVEEDORES
go
insert into PROVEEDORES (id, razon_social, tipo_documento, num_documento, telefono) values
( ),

---------------------------------------------------------LISTADO REGISTROS TABLA PROVEEDORES
select * from PROVEEDORES
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA COMPRAS
---------------------------------------------------------
drop table if exists dbo.COMPRAS
go
create table COMPRAS
(
	id              INT PRIMARY KEY identity,
	comprobante     VARCHAR(15) NOT NULL,
	num_comprobante INT NOT NULL,
	descripcion     VARCHAR(25) NOT NULL,
	fecha           DATE NOT NULL,
	id_proveedor    INT,
	id_usuario      INT,
	FOREIGN KEY (id_proveedor) REFERENCES proveedores(id),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA COMPRAS
go
insert into COMPRAS (id, comprobante, num_comprobante, descripcion, fecha, id_proveedor, id_usuario) values
( ),

---------------------------------------------------------LISTADO REGISTROS TABLA COMPRAS
select * from COMPRAS
go
---------------------------------------------------------
---------------------------------------------------------CREANDO TABLA DETALLECOMPRAS
---------------------------------------------------------
drop table if exists dbo.DETALLECOMPRAS
go
create table DETALLECOMPRAS
(
	id          INT PRIMARY KEY identity,
	cantidad    INT NOT NULL,
	precio      DECIMAL(10,2) NOT NULL,
	id_articulo INT,
	id_compra   INT,
	FOREIGN KEY (id_articulo) REFERENCES articulos(id),
	FOREIGN KEY (id_compra)	REFERENCES compras(id)
)
go
---------------------------------------------------------INSERTANDO REGISTROS TABLA DETALLECOMPRAS
go
insert into DETALLECOMPRAS (id, cantidad, precio, id_articulo, id_compra) values
( ),

---------------------------------------------------------LISTADO REGISTROS TABLA DETALLECOMPRAS
select * from DETALLECOMPRAS
go




























