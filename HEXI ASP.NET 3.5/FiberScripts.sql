USE [Fiber3]
GO
/****** Object:  Table [dbo].[tbl_consumo_hilo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_consumo_hilo](
	[id_consumo] [int] NOT NULL,
	[id_inventario] [int] NOT NULL,
	[id_hilo] [int] NOT NULL,
	[metros_hilos] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_consumo_producto]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_consumo_producto](
	[id_consumo] [int] NOT NULL,
	[id_inventario] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [float] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_consumos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_consumos](
	[id_consumo] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_consumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_hilos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_hilos](
	[id_hilo] [int] IDENTITY(1,1) NOT NULL,
	[referencia_hilo] [varchar](10) NOT NULL,
	[tipo_hilo] [varchar](10) NOT NULL,
	[titulo_hilo] [int] NOT NULL,
	[color_hilo] [varchar](10) NOT NULL,
	[valorMetro] [float] NOT NULL,
	[metros_hilo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_hilo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_hilos_necesarios]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_hilos_necesarios](
	[id_hilos] [int] NOT NULL,
	[referencia_hilo] [varchar](10) NOT NULL,
	[tipo_hilo] [varchar](10) NOT NULL,
	[titulo_hilo] [int] NOT NULL,
	[color_hilo] [varchar](10) NOT NULL,
	[valorMetro] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_hilos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_historial]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_historial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_inventario_hilo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_inventario_hilo](
	[id_inventario] [int] NULL,
	[id_hilo] [int] NULL,
	[metros_hilo] [float] NULL,
	[metros_fecha] [float] NULL,
	[fecha_actualizacion] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_inventario_producto]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_inventario_producto](
	[id_inventario] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad_producto] [int] NOT NULL,
	[cantidad_producto_fecha] [int] NULL,
	[fecha_actualizacion] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_inventarios]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_inventarios](
	[id_inventario] [int] IDENTITY(1,1) NOT NULL,
	[referencia_inventario] [varchar](10) NOT NULL,
	[observacion_inventario] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_paso]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_paso](
	[id] [int] NULL,
	[referencia] [varchar](20) NULL,
	[cantidad] [float] NULL,
	[consumo] [float] NULL,
	[resta] [float] NULL,
	[id_2] [int] NULL,
	[valor] [float] NULL,
	[valor_total] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_pedido_hilo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pedido_hilo](
	[id_pedido] [int] NULL,
	[id_hilos] [int] NULL,
	[metros_hilo] [float] NULL,
	[valorTotal_hilo] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_pedido_producto]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pedido_producto](
	[id_pedido] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad_producto] [int] NULL,
	[valorTotal_producto] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_pedidos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pedidos](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[fecha_pedido] [datetime] NOT NULL,
	[valorTotal] [float] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_productos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[referencia_producto] [varchar](10) NOT NULL,
	[nombre_producto] [varchar](20) NOT NULL,
	[descripcion_producto] [varchar](50) NOT NULL,
	[novedad_producto] [varchar](30) NOT NULL,
	[placa_producto] [varchar](10) NOT NULL,
	[serial_producto] [varchar](10) NULL,
	[marca_producto] [varchar](20) NULL,
	[modelo_producto] [varchar](20) NULL,
	[valorUnitario_producto] [float] NULL,
	[consumible] [bit] NOT NULL,
	[cantidad_producto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_productos_necesarios]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_productos_necesarios](
	[id_producto] [int] NOT NULL,
	[referencia_producto] [varchar](10) NOT NULL,
	[nombre_producto] [varchar](20) NOT NULL,
	[descripcion_producto] [varchar](50) NOT NULL,
	[valorUnitario] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_reportes_problemas]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_reportes_problemas](
	[id_problema] [int] IDENTITY(1,1) NOT NULL,
	[nombre_problema] [varchar](30) NOT NULL,
	[observaciones_problema] [varchar](100) NOT NULL,
	[fecha_registro_problema] [date] NOT NULL,
	[estado_problema] [varchar](30) NOT NULL,
	[id_usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_problema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_rol]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [varchar](30) NOT NULL,
	[descrip_rol] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[dni_usuario] [varchar](15) NOT NULL,
	[nombre_usuario] [varchar](30) NOT NULL,
	[apellido_usuario] [varchar](30) NOT NULL,
	[email_usuario] [varchar](30) NOT NULL,
	[contraseña_usuario] [varchar](30) NOT NULL,
	[tel_usuario] [varchar](10) NOT NULL,
	[estado_usuario] [varchar](30) NOT NULL,
	[foto_usuario] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_usuario_rol]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuario_rol](
	[id_usuario] [int] NOT NULL,
	[id_rol] [int] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbl_paso] ADD  DEFAULT ((0)) FOR [valor_total]
GO
ALTER TABLE [dbo].[tbl_consumo_hilo]  WITH CHECK ADD FOREIGN KEY([id_consumo])
REFERENCES [dbo].[tbl_consumos] ([id_consumo])
GO
ALTER TABLE [dbo].[tbl_consumo_hilo]  WITH CHECK ADD FOREIGN KEY([id_inventario])
REFERENCES [dbo].[tbl_inventarios] ([id_inventario])
GO
ALTER TABLE [dbo].[tbl_consumo_producto]  WITH CHECK ADD FOREIGN KEY([id_consumo])
REFERENCES [dbo].[tbl_consumos] ([id_consumo])
GO
ALTER TABLE [dbo].[tbl_consumo_producto]  WITH CHECK ADD FOREIGN KEY([id_inventario])
REFERENCES [dbo].[tbl_inventarios] ([id_inventario])
GO
ALTER TABLE [dbo].[tbl_consumos]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tbl_historial]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tbl_inventario_hilo]  WITH CHECK ADD FOREIGN KEY([id_hilo])
REFERENCES [dbo].[tbl_hilos] ([id_hilo])
GO
ALTER TABLE [dbo].[tbl_inventario_hilo]  WITH CHECK ADD FOREIGN KEY([id_inventario])
REFERENCES [dbo].[tbl_inventarios] ([id_inventario])
GO
ALTER TABLE [dbo].[tbl_inventario_producto]  WITH CHECK ADD FOREIGN KEY([id_inventario])
REFERENCES [dbo].[tbl_inventarios] ([id_inventario])
GO
ALTER TABLE [dbo].[tbl_inventario_producto]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_productos] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_pedido_hilo]  WITH CHECK ADD FOREIGN KEY([id_hilos])
REFERENCES [dbo].[tbl_hilos_necesarios] ([id_hilos])
GO
ALTER TABLE [dbo].[tbl_pedido_hilo]  WITH CHECK ADD FOREIGN KEY([id_pedido])
REFERENCES [dbo].[tbl_pedidos] ([id_pedido])
GO
ALTER TABLE [dbo].[tbl_pedido_producto]  WITH CHECK ADD FOREIGN KEY([id_pedido])
REFERENCES [dbo].[tbl_pedidos] ([id_pedido])
GO
ALTER TABLE [dbo].[tbl_pedido_producto]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[tbl_productos_necesarios] ([id_producto])
GO
ALTER TABLE [dbo].[tbl_reportes_problemas]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tbl_usuario_rol]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[tbl_rol] ([id_rol])
GO
ALTER TABLE [dbo].[tbl_usuario_rol]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id_usuario])
GO
/****** Object:  StoredProcedure [dbo].[buscarProductoPId]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR UN PRODUCTO POR EL ID PARA EL PEDIDO--
CREATE PROCEDURE [dbo].[buscarProductoPId](@id int)
AS
BEGIN
SELECT * FROM tbl_productos_necesarios WHERE id_producto = @id;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[buscarProductoPRef]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR UN PRODUCTO POR REFERENCIA PARA PEDIDO--
CREATE PROCEDURE [dbo].[buscarProductoPRef](@ref varchar(10))
AS
BEGIN
SELECT * FROM tbl_productos_necesarios WHERE referencia_producto LIKE @ref + '%';
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_actualizar_rol_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA ACTUALIZAR EL ROL DE UN USUARIO---------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_actualizar_rol_usuario](@id_usuario INT, @id_rol_viejo INT, @id_rol_nuevo INT)
AS
BEGIN
UPDATE tbl_usuario_rol SET id_rol=@id_rol_nuevo WHERE id_usuario=@id_usuario AND id_rol=@id_rol_viejo;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_asignar_rol_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA REGISTRAR EL ROL DE UN USUARIO------------------------------------------------------>
CREATE PROCEDURE [dbo].[prc_asignar_rol_usuario](@id_usuario INT,@id_rol INT)
AS
BEGIN
INSERT INTO tbl_usuario_rol VALUES(@id_usuario,@id_rol);
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_buscar_hilo_para_consumo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_buscar_hilo_para_consumo](
@id VARCHAR(10)
)
AS
BEGIN
declare @inven int;
set @inven = (select MAX(id_inventario) from tbl_inventario_hilo);
SELECT H.id_hilo, H.referencia_hilo, H.tipo_hilo, H.titulo_hilo, H.color_hilo, IH.metros_hilo
FROM tbl_hilos as H Inner Join tbl_inventario_hilo as IH On
H.id_hilo = IH.id_hilo and IH.id_inventario = @inven and IH.id_hilo = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[prc_buscar_Producto_Consumo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR PRODUCTO POR REFERENCIA PARA CONSUMO--
CREATE PROCEDURE [dbo].[prc_buscar_Producto_Consumo](
@ref VARCHAR(10)
)
AS
BEGIN
declare @inven int, @id int;
set @inven = (select MAX(id_inventario) from tbl_inventario_producto);
set @id = (select id_producto from tbl_productos where referencia_producto LIKE @ref+'%');
SELECT P.id_producto, P.referencia_producto,P.nombre_producto,P.placa_producto, IP.cantidad_producto from tbl_productos as P Inner Join tbl_inventario_producto as IP On
P.id_producto = IP.id_producto and IP.id_inventario = @inven and IP.id_producto = @id and P.consumible = 1;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_buscar_Producto_Consumo_Id]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR PRODUCTO POR ID PARA CONSUMO--
CREATE PROCEDURE [dbo].[prc_buscar_Producto_Consumo_Id](
@id int
)
AS
BEGIN
declare @inven int;
set @inven = (select MAX(id_inventario) from tbl_inventario_producto);
SELECT P.id_producto, P.referencia_producto, P.nombre_producto, P.descripcion_producto,P.novedad_producto,P.placa_producto,P.serial_producto,P.modelo_producto,P.marca_producto, IP.cantidad_producto from tbl_productos as P Inner Join tbl_inventario_producto as IP On
P.id_producto = IP.id_producto and IP.id_inventario = @inven and IP.id_producto = @id and P.consumible = 1;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_buscar_producto_por_referencia_para_cargarlo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR Y CARGAR UN PRODUCTO------------------------------------------
CREATE PROCEDURE [dbo].[prc_buscar_producto_por_referencia_para_cargarlo](@ref VARCHAR(10))
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto, descripcion_producto, novedad_producto,
placa_producto, serial_producto, marca_producto, modelo_producto, valorUnitario_producto, consumible
FROM tbl_productos WHERE referencia_producto like @ref+'%';
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_buscarHiloPedidoId]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR UN HILO POR ID PARA PEDIDOS--
CREATE PROCEDURE [dbo].[prc_buscarHiloPedidoId](@id int)
AS
BEGIN
SELECT * FROM tbl_hilos_necesarios WHERE id_hilos = @id;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_buscarHiloPedidoRef]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR UN HILO POR REFERENCIA PARA PEDIDOS--
CREATE PROCEDURE [dbo].[prc_buscarHiloPedidoRef](@ref varchar(10))
AS
BEGIN
SELECT * from tbl_hilos_necesarios where referencia_hilo LIKE @ref+'%';
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_buscarTodosHilosP]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDURE PARA BUSCAR TODOS LOS HILOS PARA PEDIDOS--
CREATE PROCEDURE [dbo].[prc_buscarTodosHilosP]
AS
BEGIN
SELECT * FROM tbl_hilos_necesarios
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_buscarTodosProductosP]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR TODOS LOS PRODUCTOS PARA EL PEDIDO--
CREATE PROCEDURE [dbo].[prc_buscarTodosProductosP]
AS
BEGIN
SELECT * FROM tbl_productos_necesarios;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_calcular_fecha]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CALCULAR LA CANTIDAD DE D�AS TRANSCURRIDOS Y AS� PERMITIR O NO LA MODIFICACI�N DE CIERTOS CAMPOS------------------->
CREATE PROCEDURE [dbo].[prc_calcular_fecha](@fecha_f DATE)
AS
BEGIN
SELECT DATEPART(DAY, getdate()) - DATEPART(DAY, @fecha_f) AS dias;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_cargar_hilo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[prc_cargar_hilo]
AS
BEGIN
SELECT *
FROM tbl_hilos;
END
GO
/****** Object:  StoredProcedure [dbo].[prc_cargar_info_perfil_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CARGAR DATOS AL PERFIL DE USUARIO--------------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_cargar_info_perfil_usuario](@id_user INT)
AS
BEGIN
SELECT tbl_usuario.nombre_usuario,tbl_usuario.apellido_usuario,tbl_usuario.email_usuario, tbl_rol.nombre_rol,foto_usuario,(tbl_usuario.nombre_usuario+' '+tbl_usuario.apellido_usuario) AS nombre_completo  FROM tbl_usuario,tbl_usuario_rol,tbl_rol WHERE tbl_usuario.id_usuario=tbl_usuario_rol.id_usuario AND tbl_rol.id_rol=tbl_usuario_rol.id_rol AND tbl_usuario.id_usuario=@id_user;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_cargar_productos_al_GV]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CARGAR LOS PRODUCTOS AL GRIDVIEW---------------------------------------

CREATE PROCEDURE [dbo].[prc_cargar_productos_al_GV]
as
begin
select * from tbl_productos;
end

----FIN PROCEDURE---
GO
/****** Object:  StoredProcedure [dbo].[prc_cargar_reportes_problemas_de_un_usuario_al_GV]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CARGAR LOS REPORTES DE LOS PROBLEMAS DE UN USUARIO A LA GRIDVIEW
CREATE PROCEDURE [dbo].[prc_cargar_reportes_problemas_de_un_usuario_al_GV](@id_user INT)
AS
BEGIN
SELECT id_problema,nombre_problema,observaciones_problema, fecha_registro_problema,estado_problema FROM tbl_reportes_problemas, tbl_usuario WHERE tbl_reportes_problemas.id_usuario=tbl_usuario.id_usuario AND tbl_usuario.id_usuario=@id_user;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_consumos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR CONSUMOS PRODUCTOS--
CREATE PROCEDURE [dbo].[prc_consultar_consumos]
AS
BEGIN
SELECT C.id_consumo, C.fecha, U.nombre_usuario 
FROM tbl_usuario as U INNER JOIN tbl_consumos as C On
U.id_usuario = C.id_usuario; 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_hilo_por_id]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCUEDORE PARA CONSULTAR HILO POR ID-----------------------------------------------
CREATE PROCEDURE [dbo].[prc_consultar_hilo_por_id](@id INT)
AS
BEGIN
SELECT id_hilo, referencia_hilo, tipo_hilo, titulo_hilo, color_hilo, valorMetro 
FROM tbl_hilos WHERE id_hilo = @id;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_hilo_por_id_consumo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR HILO POR EL ID PARA CONSUMO----------------------------------------
CREATE PROCEDURE [dbo].[prc_consultar_hilo_por_id_consumo](
@id INT
)
AS
BEGIN
declare @inven int;
set @inven = (select MAX(id_inventario) from tbl_inventario_hilo);
SELECT H.id_hilo, H.referencia_hilo, H.tipo_hilo, H.titulo_hilo, H.color_hilo, IH.metros_hilo
FROM tbl_hilos as H Inner Join tbl_inventario_hilo as IH On
H.id_hilo = IH.id_hilo and IH.id_inventario = @inven and IH.id_hilo = @id 
END
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_hilo_por_referencia]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR HILO POR LA REFERENCIA----------------------------------------
CREATE PROCEDURE [dbo].[prc_consultar_hilo_por_referencia](@ref VARCHAR(10))
AS
BEGIN
SELECT * FROM tbl_hilos WHERE referencia_hilo = @ref;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_hilo_por_referencia_consumo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR HILO POR LA REFERENCIA PARA CONSUMO----------------------------------------
CREATE PROCEDURE [dbo].[prc_consultar_hilo_por_referencia_consumo](
@ref VARCHAR(10)
)
AS
BEGIN
declare @inven int, @id int;
set @inven = (select MAX(id_inventario) from tbl_inventario_hilo);
set @id = (select id_hilo from tbl_hilos where referencia_hilo LIKE  @ref+'%');
SELECT H.id_hilo, H.referencia_hilo, H.tipo_hilo, H.titulo_hilo, H.color_hilo, IH.metros_hilo
FROM tbl_hilos as H Inner Join tbl_inventario_hilo as IH On
H.id_hilo = IH.id_hilo and IH.id_inventario = @inven and IH.id_hilo = @id 
END


--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_idrol_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONOCER EL ID DEL ROL DE UN USUARIO
CREATE PROCEDURE [dbo].[prc_consultar_idrol_usuario](@id_user INT)
AS
BEGIN
SELECT tbl_rol.id_rol FROM tbl_rol,tbl_usuario, tbl_usuario_rol WHERE tbl_rol.id_rol=tbl_usuario_rol.id_rol AND tbl_usuario.id_usuario=tbl_usuario_rol.id_usuario AND tbl_usuario.id_usuario=@id_user;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_invent_por_referencia]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA BUSCAR UN INVENTARIO POR REFERENCIA--
CREATE PROCEDURE [dbo].[prc_consultar_invent_por_referencia](@refer VARCHAR(10))
AS
BEGIN
SELECT * FROM tbl_inventarios WHERE  referencia_inventario=@refer;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_maximo_consumo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR EL MAXIMO CONSUMO--
CREATE PROCEDURE [dbo].[prc_consultar_maximo_consumo]
AS
BEGIN
SELECT MAX(id_consumo) as id_consumo FROM tbl_consumos;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_maximo_id_inventario_hilo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR EL ULTIMO INVENTARIO DE HILOS--
CREATE PROCEDURE [dbo].[prc_consultar_maximo_id_inventario_hilo]
AS
BEGIN
SELECT MAX(I.id_inventario) as id_inventario FROM tbl_hilos as H INNER JOIN tbl_inventario_hilo as IH ON H.id_hilo = IH.id_hilo INNER JOIN tbl_inventarios as I ON IH.id_inventario = I.id_inventario;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_maximo_id_inventario_producto]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR EL UTLIMO INVENTARIO DE PRODUCTOS--
CREATE PROCEDURE [dbo].[prc_consultar_maximo_id_inventario_producto]
AS
BEGIN
SELECT MAX(I.id_inventario) as id_inventario FROM tbl_productos as P INNER JOIN tbl_inventario_producto as IP ON
P.id_producto = IP.id_producto INNER JOIN tbl_inventarios as I ON IP.id_inventario = I.id_inventario;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_paso_pedido]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR PASO PEDOIDO--
CREATE PROCEDURE [dbo].[prc_consultar_paso_pedido]
AS
BEGIN
SELECT id, cantidad, valor, valor_total FROM tbl_paso;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_producto_por_id]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR PRODUCTO POR ID------------------------------
CREATE PROCEDURE [dbo].[prc_consultar_producto_por_id](@id INT)
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto,
descripcion_producto, novedad_producto, placa_producto, serial_producto, 
marca_producto, modelo_producto, valorUnitario_producto,
consumible FROM tbl_productos WHERE id_producto = @id;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_Consultar_producto_por_placa]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR PRODUCTO POR PLACA--------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_Consultar_producto_por_placa](@placa VARCHAR(10))
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto, descripcion_producto, novedad_producto, placa_producto, serial_producto,
marca_producto, modelo_producto, valorUnitario_producto, consumible FROM tbl_productos WHERE placa_producto = @placa;
END 

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_Consultar_producto_por_referencia]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR PRODUCTO POR REFERENCIA--------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_Consultar_producto_por_referencia](@ref VARCHAR(10))
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto,
descripcion_producto, novedad_producto, placa_producto, serial_producto,
marca_producto, modelo_producto, valorUnitario_producto, consumible FROM tbl_productos WHERE referencia_producto like @ref+'%';
END 

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_Consultar_producto_por_serial]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR PRODUCTO POR SERIAL--------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_Consultar_producto_por_serial](@serial VARCHAR(10))
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto, descripcion_producto, novedad_producto, placa_producto, serial_producto,
marca_producto, modelo_producto, valorUnitario_producto, consumible FROM tbl_productos WHERE serial_producto = @serial;
END 

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_reporte_problema_por_ID]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimientos para la gestión de los reportes--

--PROCEDURE PARA CONSULTAR LA EXISTENCIA DE UN REPORTE DE PROBLEMA POR ID------------------------------->
CREATE PROCEDURE [dbo].[prc_consultar_reporte_problema_por_ID](@id_report_prob INT)
AS
BEGIN
SELECT * FROM tbl_reportes_problemas WHERE id_problema=@id_report_prob;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_rol]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR EL ID DE UN ROL POR SU NOMBRE--------------------------------------------->
CREATE PROCEDURE [dbo].[prc_consultar_rol](@rol VARCHAR(30))
AS
BEGIN
SELECT id_rol FROM tbl_rol WHERE nombre_rol=@rol;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_rol_asignado]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR SI EL USER YA TIENE UN ROL ASIGNADO
CREATE PROCEDURE [dbo].[prc_consultar_rol_asignado](@id_user_p INT,@id_rol_p INT)
AS
BEGIN
SELECT id_usuario FROM tbl_usuario_rol WHERE id_rol=@id_rol_p AND id_usuario=@id_user_p;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_roles]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR TODOS LOS ROLES EXISTENTES Y CARGARLOS EN EL DROPDOWNLIST----------------------------------------------->
CREATE PROCEDURE [dbo].[prc_consultar_roles]
AS
BEGIN
SELECT id_rol,nombre_rol FROM tbl_rol;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_roles_user]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA SELECCIONAR LOS ROLES ASIGNADO AL USER EN EL CHECKBOXLIST 
CREATE PROCEDURE [dbo].[prc_consultar_roles_user](@id_user INT)
AS
BEGIN
SELECT * FROM tbl_usuario_rol WHERE id_usuario=@id_user;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_todos_hilos_inventario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR TODOS LOS HILOS DEL INVENTARIO--
CREATE PROCEDURE [dbo].[prc_consultar_todos_hilos_inventario]
AS
BEGIN
declare @inven int;
set @inven = (select MAX(id_inventario) from tbl_inventario_hilo);
SELECT H.id_hilo, H.referencia_hilo, H.tipo_hilo, H.titulo_hilo, H.color_hilo, IH.metros_hilo
FROM tbl_hilos as H Inner Join tbl_inventario_hilo as IH On
H.id_hilo = IH.id_hilo and IH.id_inventario = @inven;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_Todos_Productos_Consumo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR TODOS LOS PRODUCTOS--
CREATE PROCEDURE [dbo].[prc_consultar_Todos_Productos_Consumo]
AS
BEGIN
declare @inven int;
set @inven = (select MAX(id_inventario) from tbl_inventario_producto);
SELECT P.id_producto, P.referencia_producto, P.nombre_producto, P.descripcion_producto,P.novedad_producto,P.placa_producto,P.serial_producto,P.modelo_producto,P.marca_producto, IP.cantidad_producto from tbl_productos as P Inner Join tbl_inventario_producto as IP On
P.id_producto = IP.id_producto and IP.id_inventario = @inven;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_ultimoregisto_problemas]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR EL ULTIMO ID DE REGISTRO DE REPORTES DE PROBLEMAS PARA GENERAR ID PARA NUEVO REGISTRO----------------->
CREATE PROCEDURE [dbo].[prc_consultar_ultimoregisto_problemas]
AS
BEGIN
SELECT MAX(id_problema) AS id_reporte_problema_mayor FROM tbl_reportes_problemas;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_usuario_dgv]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR UN USUARIOS REGISTRADOS Y CARGARLOS EN EL GRIDVIEW----------->
CREATE PROCEDURE [dbo].[prc_consultar_usuario_dgv]
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE id_usuario>1;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_usuario_dni_dgv]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR UN USUARIO POR UN NUMERO DE DOCUMENTO Y CARGARLO EN EL GRIDVIEW----------->
CREATE PROCEDURE [dbo].[prc_consultar_usuario_dni_dgv](@dni VARCHAR(15))
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE dni_usuario=@dni AND id_usuario>0;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_usuario_en_cohorte]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR SI UN USUARIO YA PERTENECE A UNA COHORTE------------------------------------>
CREATE PROCEDURE [dbo].[prc_consultar_usuario_en_cohorte](@id_user INT,@id_cohort INT)
AS
BEGIN
SELECT tbl_cohorte.id_cohorte,tbl_usuario.id_usuario FROM tbl_usuario,tbl_cohorte,tbl_cohorte_usuario WHERE tbl_usuario.id_usuario=tbl_cohorte_usuario.id_usuario AND tbl_cohorte.id_cohorte=tbl_cohorte_usuario.id_cohorte AND tbl_cohorte.id_cohorte=@id_cohort AND tbl_usuario.id_usuario=@id_user;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_usuario_para_modificar]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE CONSULTAR DATOS DEL USUARIO PARA AUTOCOMPLETAR REGISTRO PARA MODIFICAR----------------------->
CREATE PROCEDURE [dbo].[prc_consultar_usuario_para_modificar](@id INT)
AS
BEGIN
SELECT tbl_usuario.id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,contraseña_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE id_usuario=@id;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_usuario_por_correo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR SI HAY UN USUARIO REGISTRADO CON UN CORREO DETERMINADO-------------------->
CREATE PROCEDURE [dbo].[prc_consultar_usuario_por_correo](@correo VARCHAR(30))
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE email_usuario=@correo;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_usuario_por_dni]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR SI HAY UN USUARIO REGISTRADO CON UN NUMERO DE DOCUMENTO DETERMINADO------->
CREATE PROCEDURE [dbo].[prc_consultar_usuario_por_dni](@dni VARCHAR(15))
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE dni_usuario=@dni AND id_usuario>0;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_usuario_por_id]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR DNI CON ID------------------------>
CREATE PROCEDURE [dbo].[prc_consultar_usuario_por_id](@id INT)
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE id_usuario=@id;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultar_usuarios_select]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR LOS USUARIOS REGISTRADOS Y CARGARLOS EN DROPDOWNLIST---------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_consultar_usuarios_select]
AS
BEGIN
SELECT id_usuario,(CAST(dni_usuario AS varchar(30))+'-'+nombre_usuario+' '+apellido_usuario) AS nombre_usuario FROM tbl_usuario;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultarMaximoPedido]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR MAXIMO PEDIDO--
CREATE PROCEDURE [dbo].[prc_consultarMaximoPedido]
AS
BEGIN
SELECT MAX(id_pedido) as id_pedido FROM tbl_pedidos;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_consultarTodosHilos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA CONSULTAR TODOS LOS HILOS--
CREATE PROCEDURE [dbo].[prc_consultarTodosHilos]
AS
BEGIN
declare @inven int;
set @inven = (select MAX(id_inventario) from tbl_inventario_hilo);
SELECT H.id_hilo, H.referencia_hilo, H.tipo_hilo, H.titulo_hilo, H.color_hilo, IH.metros_hilo
FROM tbl_hilos as H Inner Join tbl_inventario_hilo as IH On
H.id_hilo = IH.id_hilo and IH.id_inventario = @inven;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_Dar_de_alta]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA HABILITAR EL ACCESO AL SISTEMA DE UN USUARIO--------------------------------------->
CREATE PROCEDURE [dbo].[prc_Dar_de_alta](@id int)
AS
BEGIN
UPDATE tbl_usuario SET estado_usuario='Habilitado' WHERE id_usuario=@id;
END

--FIN PROCEDURE--

GO
/****** Object:  StoredProcedure [dbo].[prc_Dar_de_baja]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA DESHABILITAR EL ACCESO AL SISTEMA DE UN USUARIO------------------------------------>
CREATE PROCEDURE [dbo].[prc_Dar_de_baja](@id int)
AS
BEGIN
UPDATE tbl_usuario SET estado_usuario='Deshabilitado' WHERE id_usuario=@id;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_eliminar_rol_asignado]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA ELIMINAR UN ROL A UN USER
CREATE PROCEDURE [dbo].[prc_eliminar_rol_asignado](@id_user_plaf INT,@id_rol_plaf INT)
AS
BEGIN
DELETE FROM tbl_usuario_rol WHERE id_rol=@id_rol_plaf AND id_usuario=@id_user_plaf;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_informe]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE INFORME USUARIOS---------------------------------------------------
CREATE PROCEDURE [dbo].[prc_informe]
AS
BEGIN
SELECT dni_usuario,nombre_usuario,apellido_usuario,email_usuario,estado_usuario FROM tbl_usuario WHERE id_usuario>1;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_ingresar_al_sistema]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimientos para la gestión de usuarios--

--PROCEDURE PARA INGRESAR AL SISTEMAS DE INFORMACI�N--------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_ingresar_al_sistema](
@correo VARCHAR(30),@rol VARCHAR(30))
AS
BEGIN
SELECT tbl_usuario.contraseña_usuario,tbl_usuario.estado_usuario FROM tbl_usuario,tbl_rol,tbl_usuario_rol WHERE tbl_usuario.id_usuario=tbl_usuario_rol.id_usuario AND  tbl_rol.id_rol=tbl_usuario_rol.id_rol AND tbl_usuario.email_usuario=@correo AND tbl_rol.nombre_rol=@rol;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_consumo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimientos para consumos--

--PROCEDURE PARA REGISTRAR UN CONSUMO--
CREATE PROCEDURE [dbo].[prc_insertar_consumo] (
@id_u INT
)
AS
BEGIN
INSERT INTO tbl_consumos(fecha, id_usuario) VALUES (CURRENT_TIMESTAMP,@id_u);
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_consumo_hilos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_insertar_consumo_hilos](
@id_cons INT,
@id_inven INT,
@id_h INT,
@cons FLOAT
)
AS
BEGIN
declare @cantidad_existente FLOAT;

INSERT INTO tbl_consumo_hilo VALUES (@id_cons, @id_inven,@id_h,@cons);

set @cantidad_existente = (select metros_hilo from tbl_inventario_hilo 
where id_inventario = @id_inven and id_hilo = @id_h);
UPDATE tbl_inventario_hilo SET metros_hilo = @cantidad_existente - @cons
where id_inventario = @id_inven and id_hilo = @id_h;
UPDATE tbl_hilos SET metros_hilo = @cantidad_existente - @cons 
where id_hilo = @id_h;
END
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_consumo_producto]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA REGISTRAR EL CONSUMO DE UN PRODUCTO------------------------------------------------

CREATE PROCEDURE [dbo].[prc_insertar_consumo_producto](
@id_cons INT,
@id_inven INT,
@id_prod INT,
@cant INT
)
AS
BEGIN
declare @cantidad_existente INT;
INSERT INTO tbl_consumo_producto VALUES (@id_cons, @id_inven, @id_prod,@cant);
 
set @cantidad_existente = (select cantidad_producto from tbl_inventario_producto
where id_inventario = @id_inven and id_producto = @id_prod);
UPDATE tbl_inventario_producto set cantidad_producto = @cantidad_existente - @cant 
where id_inventario = @id_inven and id_producto = @id_prod;
UPDATE tbl_productos set cantidad_producto = @cantidad_existente - @cant where id_producto = @id_prod;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_hilo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimientos para la gestión de los hilos--

--PROCEDURE PARA REGISTRAR UN HILO------------------------------------------------------
CREATE PROCEDURE [dbo].[prc_insertar_hilo](@ref_hi VARCHAR(10),
@tipo_hi VARCHAR(10),@titulo_hi INT,@color_hi VARCHAR(10),
@valor FLOAT
)
AS
BEGIN
INSERT INTO tbl_hilos 
VALUES 
(@ref_hi,@tipo_hi,@titulo_hi,@color_hi,@valor);
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_inventario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA REGISTRAR UN INVENTARIO--
CREATE PROCEDURE [dbo].[prc_insertar_inventario](@refer_inv VARCHAR(10),@detalles VARCHAR(50))
AS
BEGIN
INSERT INTO tbl_inventarios(referencia_inventario,observacion_inventario,fecha) VALUES(@refer_inv,@detalles,GETDATE());
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_inventario_hilos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA REGISTRAR EN EL INVENTARIO UN HILO------------------------------------
CREATE PROCEDURE [dbo].[prc_insertar_inventario_hilos](@id_inven INT,@id_hilo INT,@m_regis INT,@m_actual INT)
AS
BEGIN
INSERT INTO tbl_inventario_hilo VALUES(@id_inven,@id_hilo,@m_regis,@m_actual,GETDATE());
UPDATE tbl_hilos SET metros_hilo = @m_regis WHERE id_hilo = @id_hilo;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_inventario_productos]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA REGISTRAR EN EL INVENTARIO UN PRODUCTO--------------------------------
CREATE PROCEDURE [dbo].[prc_insertar_inventario_productos](@id_inven INT,@id_prod INT,@cantid_regis INT,@cantid_actual INT)
AS
BEGIN
INSERT INTO tbl_inventario_producto VALUES(@id_inven,@id_prod,@cantid_regis,@cantid_actual,GETDATE());
UPDATE tbl_productos SET cantidad_producto = @cantid_regis WHERE id_producto = @id_prod;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_paso]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA INSERTAR TABLA DE PASO--
CREATE PROCEDURE [dbo].[prc_insertar_paso](
@id int,
@ref varchar(20),
@cant float,
@con float,
@res float
)
AS
BEGIN
INSERT INTO tbl_paso VALUES (@id,@ref,@cant,@con,@res);
END
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_paso_pedido]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA INSERTAR PASO PEDIDO--
CREATE PROCEDURE [dbo].[prc_insertar_paso_pedido]
(
@id int,
@cantidad FLOAT,
@valor FLOAT
) 
AS
BEGIN
declare @valor_t float;
INSERT INTO tbl_paso(id, cantidad, valor) VALUES (@id, @cantidad, @valor);
set @valor_t = (select MAX(valor_total) from tbl_paso);
update tbl_paso set valor_total = @valor_t + @valor where id = @id;
END
--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_Insertar_pedido]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA REGISTRAR UN PEDIDO---------------------------------------------------
CREATE PROCEDURE [dbo].[prc_Insertar_pedido]
AS
BEGIN
INSERT INTO tbl_pedidos(fecha_pedido) 
VALUES (CURRENT_TIMESTAMP);
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_pedido_hilo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA INSERTAR EN EL PEDIDO UN HILO--------------------------------------
CREATE PROCEDURE [dbo].[prc_insertar_pedido_hilo]
(
@id_ped INT,
@id_hi INT,
@metros FLOAT,
@valor FLOAT,
@valor_pedido FLOAT
)
AS
BEGIN

INSERT INTO tbl_pedido_hilo VALUES (@id_ped, @id_hi,@metros, @valor);

UPDATE tbl_pedidos SET valorTotal = @valor_pedido where id_pedido = @id_ped;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_pedido_producto]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA INSERTAR EN EL PEDIDO UN PRODUCTO--------------------------------------
CREATE PROCEDURE [dbo].[prc_insertar_pedido_producto]
(
@id_ped INT,
@id_prod INT,
@cant_prod INT,
@valor FLOAT,
@valor_pedido FLOAT
)
AS
BEGIN

INSERT INTO tbl_pedido_producto VALUES (@id_ped, @id_prod,@cant_prod, @valor);


UPDATE tbl_pedidos SET valorTotal = @valor_pedido where id_pedido = @id_ped;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_producto]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_insertar_producto](
@ref_pro VARCHAR(10),
@nombre VARCHAR(20),
@desc_pro VARCHAR(50),
@nov_pro VARCHAR(30),
@placa_pro VARCHAR(10),
@serial_pro VARCHAR(10),
@marca_pro VARCHAR(20),
@mod_pro VARCHAR(20),
@cantid INT,
@val_pro FLOAT,
@consu_pro BIT
)
AS
BEGIN
INSERT INTO tbl_productos(referencia_producto,
nombre_producto,
descripcion_producto,
novedad_producto,
placa_producto,
serial_producto,
marca_producto,
modelo_producto,
cantidad_producto,
valorUnitario_producto,
consumible) VALUES 
(@ref_pro,@nombre,@desc_pro,@nov_pro,
@placa_pro,@serial_pro,@marca_pro,@mod_pro,@cantid,@val_pro,@consu_pro);
END
GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_reporte_problema]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA REGISTRAR UN REPORTE DE UN PROBLEMA------------------------------------------------------>
CREATE PROCEDURE [dbo].[prc_insertar_reporte_problema](@nomb_pro VARCHAR(30),@descrip_pro VARCHAR(100),@fecha_reg DATE,@estado_repor VARCHAR(30),@id_user INT)
AS
BEGIN
INSERT INTO tbl_reportes_problemas VALUES(@nomb_pro,@descrip_pro,@fecha_reg,@estado_repor,@id_user);
END

--FIN PROCEDURE--

GO
/****** Object:  StoredProcedure [dbo].[prc_insertar_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA REGISTRAR UN USUARIO----------------------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_insertar_usuario](
@dni VARCHAR(15),
@nomb VARCHAR(30),
@apell VARCHAR(30), 
@correo VARCHAR(30),
@contrase VARCHAR(30),
@tel VARCHAR(10),
@estado VARCHAR(30),
@foto VARCHAR(30))
AS
BEGIN
INSERT INTO tbl_usuario VALUES (@dni,@nomb, @apell, @correo,@contrase,@tel,@estado,@foto);
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_modificar_foto_perfil_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA MODIFICAR EL FOTO PERFIL DE USUARIO----------------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_modificar_foto_perfil_usuario](
@id_user INT, 
@fotop VARCHAR(80)
)
AS
BEGIN
UPDATE tbl_usuario SET foto_usuario=@fotop WHERE id_usuario=@id_user;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_modificar_perfil_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA MODIFICAR EL PERFIL DE USUARIO----------------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_modificar_perfil_usuario](
@id_user INT, 
@contraseña VARCHAR(30)
)
AS
BEGIN
UPDATE tbl_usuario SET contraseña_usuario=@contraseña WHERE id_usuario=@id_user;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_modificar_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA MODIFICAR EL REGISTRO DE UN USUARIO------------------------------------------------->
CREATE PROCEDURE [dbo].[prc_modificar_usuario](
@id int,
@dni VARCHAR(15),
@nomb VARCHAR(30),
@apell VARCHAR(30), 
@correo VARCHAR(30),
@contrase VARCHAR(30),
@tel VARCHAR(10))
AS
BEGIN
UPDATE tbl_usuario SET dni_usuario=@dni,nombre_usuario=@nomb,apellido_usuario=@apell,email_usuario=@correo,contraseña_usuario=@contrase,tel_usuario=@tel WHERE id_usuario=@id;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_nueva_contraseña_usuario]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA ACTUALIZAR LA CONTRASE�A DE RESTABLECIMIENTO CUANDO SE �LVIDA LA MISMA
CREATE PROCEDURE [dbo].[prc_nueva_contraseña_usuario](@correo_user VARCHAR(30),@nuevapass VARCHAR(30))
AS
BEGIN
UPDATE tbl_usuario SET contraseña_usuario=@nuevapass WHERE email_usuario=@correo_user;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_obtener_id_usurio_con_correo]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE PARA OBTENER LE ID DEL USUARIO CUANDO INGRESA AL SISTEMA PARA PORDER REALIZAR ALGUNOS PROCESOS----->
CREATE PROCEDURE [dbo].[prc_obtener_id_usurio_con_correo](@correo VARCHAR(30))
AS
BEGIN
SELECT id_usuario FROM tbl_usuario WHERE email_usuario=@correo;
END

--FIN PROCEDURE--
GO
/****** Object:  StoredProcedure [dbo].[prc_olvidar_registro_paso]    Script Date: 11/09/2017 15:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDURE OlVIDAR HILO DE TABLA PASO--
CREATE PROCEDURE [dbo].[prc_olvidar_registro_paso](
@id int
)
AS
BEGIN
DELETE FROM tbl_paso WHERE id = @id;
END
--FIN PROCEDURE--
GO
