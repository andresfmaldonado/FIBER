--Usar la base de datos--
USE Fiber3;

-- TABLA INVENTARIOS--

CREATE TABLE tbl_inventarios(
id_inventario INT PRIMARY KEY IDENTITY,
referencia_inventario VARCHAR(10) NOT NULL,
observacion_inventario VARCHAR(50) NOT NULL,
fecha DATETIME NOT NULL
);

--TABLA HILOS--

CREATE TABLE tbl_hilos(
id_hilo INT PRIMARY KEY IDENTITY,
referencia_hilo VARCHAR(10) NOT NULL,
tipo_hilo VARCHAR(10) NOT NULL,
titulo_hilo INT NOT NULL,
color_hilo VARCHAR(10) NOT NULL,
valorMetro FLOAT NOT NULL
);

--TABLA PRODUCTOS--

CREATE TABLE tbl_productos(
id_producto INT PRIMARY KEY IDENTITY,
referencia_producto VARCHAR(10) NOT NULL,
nombre_producto VARCHAR(20) NOT NULL,
descripcion_producto VARCHAR(50) NOT NULL,
novedad_producto VARCHAR(30) NOT NULL,
placa_producto VARCHAR(10) NOT NULL,
serial_producto VARCHAR(10),
marca_producto VARCHAR(20),
modelo_producto VARCHAR(20),
valorUnitario_producto FLOAT,
consumible BIT NOT NULL
);

--TABLA INVENTARIO PRODUCTOS--

CREATE TABLE tbl_inventario_producto(
id_inventario INT,
id_producto INT,
cantidad_producto INT NOT NULL,
FOREIGN KEY (id_inventario) REFERENCES tbl_inventarios (id_inventario),
FOREIGN KEY (id_producto) REFERENCES tbl_productos (id_producto)
);

select * from tbl_consumo_hilo
--TABLA INVENTARIO HILOS--

CREATE TABLE tbl_inventario_hilo(
id_inventario INT,
id_hilo INT,
metros_hilo FLOAT,
FOREIGN KEY (id_inventario) REFERENCES tbl_inventarios (id_inventario),
FOREIGN KEY (id_hilo) REFERENCES tbl_hilos (id_hilo)
);


--TABLA PRODUCTOS PARA HACER PEDIDOS--

CREATE TABLE tbl_productos_necesarios(
id_producto INT PRIMARY KEY,
referencia_producto VARCHAR(10) NOT NULL,
nombre_producto VARCHAR(20) NOT NULL,
descripcion_producto VARCHAR(50) NOT NULL,
valorUnitario FLOAT NOT NULL
);


--TABLA HILOS PARA HACER PEDIDOS--

CREATE TABLE tbl_hilos_necesarios(
id_hilos INT PRIMARY KEY,
referencia_hilo VARCHAR(10) NOT NULL,
tipo_hilo VARCHAR(10) NOT NULL,
titulo_hilo INT NOT NULL,
color_hilo VARCHAR(10) NOT NULL,
valorMetro FLOAT NOT NULL
);


--TABLA PARA REGISTRAR LOS PEDIDOS--

CREATE TABLE tbl_pedidos(
id_pedido INT PRIMARY KEY IDENTITY,
fecha_pedido DATETIME NOT NULL,
valorTotal FLOAT default 0
);



--TABLA DE PEDIDOS DE LOS PRODUCTOS--

CREATE TABLE tbl_pedido_producto(
id_pedido INT,
id_producto INT,
cantidad_producto INT,
valorTotal_producto FLOAT,
FOREIGN KEY (id_pedido) REFERENCES tbl_pedidos (id_pedido),
FOREIGN KEY (id_producto) REFERENCES tbl_productos_necesarios (id_producto)
);

--TABLA DE PEDIDOS PARA LOS HILOS--

CREATE TABLE tbl_pedido_hilo(
id_pedido INT,
id_hilos INT,
metros_hilo FLOAT,
valorTotal_hilo FLOAT,
FOREIGN KEY (id_pedido) REFERENCES tbl_pedidos (id_pedido),
FOREIGN KEY (id_hilos) REFERENCES tbl_hilos_necesarios (id_hilos),
);



--TABLA DE CONSUMOS--

CREATE TABLE tbl_consumos(
id_consumo INT PRIMARY KEY IDENTITY,
fecha DATETIME NOT NULL,
id_usuario INT NOT NULL,
FOREIGN KEY(id_usuario) REFERENCES tbl_usuario(id_usuario)
);


--TABLA DE CONSUMO DE LOS PRODUCTOS--

CREATE TABLE tbl_consumo_producto(
id_consumo INT NOT NULL,
id_inventario INT NOT NULL,
id_producto INT NOT NULL,
cantidad FLOAT NOT NULL,
FOREIGN KEY(id_consumo) REFERENCES tbl_consumos(id_consumo),
FOREIGN KEY(id_inventario) REFERENCES tbl_inventarios(id_inventario)
);


--TABLA DE CONSUMO DE LOS HILOS--

CREATE TABLE tbl_consumo_hilo(
id_consumo INT NOT NULL,
id_inventario INT NOT NULL,
id_hilo INT NOT NULL,
metros_hilos FLOAT NOT NULL,
FOREIGN KEY(id_consumo) REFERENCES tbl_consumos(id_consumo),
FOREIGN KEY(id_inventario) REFERENCES tbl_inventarios(id_inventario)
);

--TABLA DE PASO PARA EL REGISTRO--

CREATE TABLE tbl_paso(
id INT,
referencia VARCHAR(20),
cantidad float,
consumo float, 
resta float
);







