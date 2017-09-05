USE Fiber3;

--Procedimientos para consumos--

--PROCEDURE PARA REGISTRAR UN CONSUMO--
CREATE PROCEDURE prc_insertar_consumo (
@id_u INT
)
AS
BEGIN
INSERT INTO tbl_consumos(fecha, id_usuario) VALUES (CURRENT_TIMESTAMP,@id_u);
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR CONSUMOS PRODUCTOS--
CREATE PROCEDURE prc_consultar_consumos
AS
BEGIN
SELECT C.id_consumo, C.fecha, U.nombre_usuario 
FROM tbl_usuario as U INNER JOIN tbl_consumos as C On
U.id_usuario = C.id_usuario; 
END
--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR EL CONSUMO DE UN PRODUCTO------------------------------------------------

CREATE PROCEDURE prc_insertar_consumo_producto(
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
END

--FIN PROCEDURE--


--PROCEDURE PARA MODIFICAR EL CONSUMO DE UN PRODUCTO------------------------------------------------
CREATE  PROCEDURE prc_modificar_consumo_producto(
@id_consu INT,
@id_inven INT,
@id_produc INT,
@cant INT
)
AS
BEGIN
UPDATE tbl_consumo_producto SET cantidad = @cant WHERE id_consumo=@id_consu
and id_inventario = @id_inven and id_producto = @id_produc;
END
--FIN PROCEDURE--
-------------------

--PROCEDURE PARA REGISTRAR EL CONSUMO DE UN HILO------------------------------------------------
CREATE PROCEDURE prc_insertar_consumo_hilos(
@id_cons INT,
@id_inven INT,
@id_h INT,
@metros FLOAT
)
AS
BEGIN
declare @cantidad_existente INT;

INSERT INTO tbl_consumo_hilo VALUES (@id_cons, @id_inven,@id_h,@metros);

set @cantidad_existente = (select metros_hilo from tbl_inventario_hilo 
where id_inventario = @id_inven and id_hilo = @id_h);
UPDATE tbl_inventario_hilo SET metros_hilo = @cantidad_existente - @metros
where id_inventario = @id_inven and id_hilo = @id_h;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR HILO PARA CONSUMO--
select * from tbl_inventario_hilo
select * from tbl_hilos

CREATE PROCEDURE prc_buscar_hilo_para_consumo(
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

--PROCEDURE PARA BUSCAR HILO POR LA REFERENCIA PARA CONSUMO----------------------------------------
CREATE PROCEDURE prc_consultar_hilo_por_referencia_consumo(
@ref VARCHAR(10)
)
AS
BEGIN
declare @inven int, @id int;
set @inven = (select MAX(id_inventario) from tbl_inventario_hilo);
set @id = (select id_hilo from tbl_hilos where referencia_hilo = @ref);
SELECT H.id_hilo, H.referencia_hilo, H.tipo_hilo, H.titulo_hilo, H.color_hilo, IH.metros_hilo
FROM tbl_hilos as H Inner Join tbl_inventario_hilo as IH On
H.id_hilo = IH.id_hilo and IH.id_inventario = @inven and IH.id_hilo = @id 
END


--FIN PROCEDURE--


--En veremos---
--PROCEDURE PARA MODIFICAR EL CONSUMO DE UN PRODUCTO------------------------------------------------
CREATE PROCEDURE prc_modificar_consumo_hilo(
@id_cons INT,
@id_inven INT,
@metros INT
)
AS
BEGIN
UPDATE tbl_consumo_hilo SET id_consumo = @id_cons,
id_inventario = @id_inven, metros_hilos = @metros;
END

--FIN PROCEDURE--

====================================================================
====================================================================

--Procedures para pedidos--

--PROCEDURE PARA REGISTRAR UN PEDIDO---------------------------------------------------
CREATE PROCEDURE prc_Insertar_pedido
AS
BEGIN
INSERT INTO tbl_pedidos(fecha_pedido) 
VALUES (CURRENT_TIMESTAMP);
END

--FIN PROCEDURE--

--En veremos--
--PROCEDURE PARA MODIFICAR UN PEDIDO----------------------------------------------------
CREATE PROCEDURE prc_modificar_pedidos
(
@id_ped INT,
@fecha_ped DATE

)
AS
BEGIN
UPDATE tbl_pedidos SET 
fecha_pedido = @fecha_ped 

WHERE id_pedido =	@id_ped;
END

--FIN PROCEDURE--

--PROCEDURE PARA INSERTAR EN EL PEDIDO UN PRODUCTO--------------------------------------
CREATE PROCEDURE prc_insertar_pedido_producto
(
@id_ped INT,
@id_prod INT,
@cant_prod INT
)
AS
BEGIN
declare @valor FLOAT, @valor_pedido FLOAT;

set @valor = (select valorUnitario
from tbl_productos_necesarios where id_producto = @id_prod) * @cant_prod;

INSERT INTO tbl_pedido_producto VALUES (@id_ped, @id_prod,@cant_prod, @valor);

set @valor_pedido = (select valorTotal from tbl_pedidos where id_pedido = @id_ped)
+ @valor;

UPDATE tbl_pedidos SET valorTotal = @valor_pedido where id_pedido = @id_ped;
END

--FIN PROCEDURE--

-- En veremos--
--PROCEDURE PARA MODIFICAR UN PEDIDO----------------------------------------------------
CREATE PROCEDURE prc_modificar_pedido_producto
(
@id_ped INT,
@id_prod INT,
@cant_prod INT
)
AS
BEGIN
UPDATE tbl_pedido_producto SET 
id_pedido = @id_ped,
id_producto_necesario = @id_prod,
cantidad_producto = @cant_prod;
END

--FIN PROCEDURE--

--PROCEDURE PARA INSERTAR EN EL PEDIDO UN HILO--------------------------------------
ALTER PROCEDURE prc_insertar_pedido_hilo
(
@id_ped INT,
@id_hi INT,
@metros FLOAT
)
AS
BEGIN
declare @valor FLOAT, @valor_pedido FLOAT;
set @valor = (select valorMetro from tbl_hilos_necesarios where id_hilos = @id_hi)
* @metros;
set @valor_pedido = (select valorTotal from tbl_pedidos where id_pedido = @id_ped)
+ @valor;
INSERT INTO tbl_pedido_hilo VALUES (@id_ped, @id_hi,@metros, @valor);

UPDATE tbl_pedidos SET valorTotal = @valor_pedido where id_pedido = @id_ped;
END

--FIN PROCEDURE--

--En veremos--
--PROCEDURE PARA MODIFICAR UN PEDIDO----------------------------------------------------
CREATE PROCEDURE prc_modificar_pedido_hilo
(
@id_ped INT,
@id_hi INT,
@cant_hi INT
)
AS
BEGIN
UPDATE tbl_pedido_hilo SET 
id_pedido = @id_ped,
id_hilos_necesarios = @id_hi,
cantidad_hilo = @cant_hi;
END

--FIN PROCEDURE--

====================================================================
====================================================================

--Procedures para la gestión de los inventarios--

--PROCEDURE PARA REGISTRAR UN INVENTARIO--
CREATE PROCEDURE prc_insertar_inventario(
@ref VARCHAR(10),
@observacion VARCHAR(50)
)
AS
BEGIN
INSERT INTO tbl_inventarios(referencia_inventario,observacion_inventario,
fecha) VALUES (@ref,@observacion,CURRENT_TIMESTAMP);
END

--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR EN EL INVENTARIO UN PRODUCTO--------------------------------
CREATE PROCEDURE prc_insertar_inventarios_productos
(
@id_inv INT,
@id_prod INT,
@cant_prod INT
)
AS 
BEGIN 
INSERT INTO tbl_inventario_producto VALUES(@id_inv, @id_prod,@cant_prod);
END

--FIN PROCEDURE--

--En veremos--
--PROCEDURE PARA MODIFICAR UN INVENTARIO
CREATE PROCEDURE prc_modificar_inventarios_producto(
@id_inv INT,
@id_prod INT,
@cant_prod INT
)
AS 
BEGIN
UPDATE tbl_inventario_producto SET 
id_inventario = @id_inv,
id_producto = @id_prod,
@cant_prod = @cant_prod;
END

--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR EN EL INVENTARIO UN HILO------------------------------------
CREATE PROCEDURE prc_insertar_inventarios_hilo
(
@id_inv INT,
@id_hi INT,
@cant_hi INT
)
AS 
BEGIN 
INSERT INTO tbl_inventario_hilo VALUES(@id_inv, @id_hi,@cant_hi);
END

--FIN PROCEDURE--

--En veremos--
--PROCEDURE PARA MODIFICAR UN INVENTARIO 
CREATE PROCEDURE prc_modificar_inventarios_hilo(
@id_inv INT,
@id_hi INT,
@cant_hi INT
)
AS 
BEGIN
UPDATE tbl_inventario_hilo SET 
id_inventario = @id_inv,
id_hilo = @id_hi,
cantidad_hilo = @cant_hi;
END

--FIN PROCEDURE--

--En veremos--
--PROCEDURE PARA MODIFICAR UN REGISTRO DE INVENTARIO------------------------------------
CREATE PROCEDURE prc_modificar_inventario(@id_inv INT,@tipoM_inv VARCHAR(30),
@nroT_inv VARCHAR(5),@rati_inv VARCHAR(5),@obser_inv VARCHAR(50),@coho_inv INT,@id_usu INT)
AS
BEGIN
UPDATE tbl_inventarios SET tipoMovimiento_inventario = @tipoM_inv, nroTransaccion_inventario = @nroT_inv,
ratificacion_inventario = @rati_inv, observacion_inventario = @obser_inv, cohorte_inventario = @coho_inv,
id_usuario = @id_usu WHERE id_inventario = @id_inv;
END

--FIN PROCEDURE--


====================================================================
====================================================================


--Procedimientos para la gestión de los hilos--


--PROCEDURE PARA REGISTRAR UN HILO------------------------------------------------------
CREATE PROCEDURE prc_insertar_hilo(@ref_hi VARCHAR(10),
@tipo_hi VARCHAR(10),@titulo_hi INT,@color_hi VARCHAR(10),
@m_hilo FLOAT,@valor FLOAT,@code VARCHAR(50)
)
AS
BEGIN
INSERT INTO tbl_hilos (referencia_hilo,code_hilo,tipo_hilo,titulo_hilo,color_hilo,metros_hilo,valorMetro)
VALUES 
(@ref_hi,@code,@tipo_hi,@titulo_hi,@color_hi,@m_hilo,@valor);
END

--FIN PROCEDURE--

--En veremos--
--PROCEDURE PARA MODIFICAR UN HILO-----------------------------------------------------
CREATE PROCEDURE prc_modificar_hilo(@id_hi INT,@refer_hi VARCHAR(10),@tipo_hi VARCHAR(10),
@titulo_hi INT,@color_hi VARCHAR(10),@m_hilo FLOAT,@valor FLOAT)
AS
BEGIN
UPDATE tbl_hilos SET referencia_hilo=@refer_hi, tipo_hilo = @tipo_hi, titulo_hilo = @titulo_hi, color_hilo = @color_hi,
metros_hilo=@m_hilo, valorMetro = @valor WHERE id_hilo = @id_hi;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR LOS HILOS A LA GV---------------------------------------------
CREATE PROCEDURE  prc_cargar_hilo
AS
BEGIN
SELECT id_hilo, referencia_hilo, code_hilo,
tipo_hilo, titulo_hilo, color_hilo,
metros_hilo, valorMetro
FROM tbl_hilos;
END

--FIN PROCEDURE--

--PROCEDURE PARA BUSCAR HILO POR LA REFERENCIA----------------------------------------
CREATE PROCEDURE prc_consultar_hilo_por_referencia(@ref VARCHAR(10))
AS
BEGIN
SELECT * FROM tbl_hilos WHERE referencia_hilo = @ref;
END

--FIN PROCEDURE--


--PROCEDURE PARA BUSCAR HILO POR LA CODIGO GUID --> QR ----------------------------------------
CREATE PROCEDURE prc_consultar_hilo_por_guid(@guid VARCHAR(50))
AS
BEGIN
SELECT * FROM tbl_hilos WHERE code_hilo = @guid;
END

--FIN PROCEDURE--


--PROCUEDORE PARA CONSULTAR HILO POR ID-----------------------------------------------
CREATE PROCEDURE prc_consultar_hilo_por_id(@id INT)
AS
BEGIN
SELECT id_hilo, referencia_hilo, tipo_hilo, titulo_hilo, color_hilo, metros_hilo, valorMetro 
FROM tbl_hilos WHERE id_hilo = @id;
END

--FIN PROCEDURE--

SELECT * from tbl_inventarios
select * from tbl_inventario_hilo

====================================================================
====================================================================

--Procedimientos para la gestión de los productos--

--PROCEDURE PARA REGISTRAR UN PRODUCTO -------------------------------------------------
CREATE PROCEDURE prc_insertar_producto(@ref_pro VARCHAR(10),@nombre VARCHAR(20),
@desc_pro VARCHAR(50),@nov_pro VARCHAR(30),@placa_pro VARCHAR(10),
@serial_pro VARCHAR(10),@marca_pro VARCHAR(20),@mod_pro VARCHAR(20),
@val_pro FLOAT,@consu_pro BIT,@cantid INT)
AS
BEGIN
INSERT INTO tbl_productos(referencia_producto,
nombre_producto,descripcion_producto,novedad_producto,
placa_producto,serial_producto,marca_producto,modelo_producto,
cantidad_producto,valorUnitario_producto,consumible) VALUES 
(@ref_pro,@nombre,@desc_pro,@nov_pro,
@placa_pro,@serial_pro,@marca_pro,@mod_pro,@cantid,@val_pro,@consu_pro);
END
--FIN PROCEDURE--


--PROCEDURE PARA MODIFICAR UN PRODUCTO--------------------------------------------------
CREATE PROCEDURE prc_modificar_producto(@id_pro INT,
@refe_pro VARCHAR(10),
@nomb_pro VARCHAR(20),
@desc_pro VARCHAR(50),
@nov_pro VARCHAR(30),
@placa_pro VARCHAR(10),
@serial_pro VARCHAR(10),
@marca_pro VARCHAR(20),
@mod_pro VARCHAR(20),
@val_pro FLOAT,
@consu_pro BIT,
@cantid INT)
AS
BEGIN
UPDATE tbl_productos SET referencia_producto=@refe_pro,nombre_producto = @nomb_pro,
descripcion_producto = @desc_pro, novedad_producto = @nov_pro, 
placa_producto = @placa_pro, serial_producto = @serial_pro, 
marca_producto = @marca_pro, modelo_producto = @mod_pro, 
valorUnitario_producto = @val_pro, consumible = @consu_pro, cantidad_producto=@cantid
WHERE id_producto = @id_pro;
END
--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR PRODUCTO POR REFERENCIA--------------------------------------------------->
CREATE PROCEDURE prc_Consultar_producto_por_referencia(@ref VARCHAR(10))
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto,
descripcion_producto, novedad_producto, placa_producto, serial_producto,
marca_producto, modelo_producto, cantidad_producto, valorUnitario_producto, consumible FROM tbl_productos WHERE referencia_producto like @ref+'%';
END 

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR PRODUCTO POR PLACA--------------------------------------------------->
CREATE PROCEDURE prc_Consultar_producto_por_placa(@placa VARCHAR(10))
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto, descripcion_producto, novedad_producto, placa_producto, serial_producto,
marca_producto, modelo_producto, cantidad_producto, valorUnitario_producto, consumible FROM tbl_productos WHERE placa_producto = @placa;
END 

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR PRODUCTO POR SERIAL--------------------------------------------------->
CREATE PROCEDURE prc_Consultar_producto_por_serial(@serial VARCHAR(10))
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto, descripcion_producto, novedad_producto, placa_producto, serial_producto,
marca_producto, modelo_producto, cantidad_producto, valorUnitario_producto, consumible FROM tbl_productos WHERE serial_producto = @serial;
END 

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR PRODUCTO POR ID------------------------------
CREATE PROCEDURE prc_consultar_producto_por_id(@id INT)
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto,
descripcion_producto, novedad_producto, placa_producto, serial_producto, 
marca_producto, modelo_producto, cantidad_producto, valorUnitario_producto,
consumible FROM tbl_productos WHERE id_producto = @id;
END

--FIN PROCEDURE--

--PROCEDURE PARA BUSCAR Y CARGAR UN PRODUCTO------------------------------------------
CREATE PROCEDURE prc_buscar_producto_por_referencia_para_cargarlo(@ref VARCHAR(10))
AS
BEGIN
SELECT id_producto, referencia_producto, nombre_producto, descripcion_producto, novedad_producto,
placa_producto, serial_producto, marca_producto, modelo_producto, cantidad_producto, valorUnitario_producto, consumible
FROM tbl_productos WHERE referencia_producto like @ref+'%';
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR LOS PRODUCTOS AL GRIDVIEW---------------------------------------

CREATE PROCEDURE prc_cargar_productos_al_GV
as
begin
select * from tbl_productos;
end

----FIN PROCEDURE---


--PROCEDURE PARA CALCULAR LA CANTIDAD DE D�AS TRANSCURRIDOS Y AS� PERMITIR O NO LA MODIFICACI�N DE CIERTOS CAMPOS------------------->
CREATE PROCEDURE prc_calcular_fecha(@fecha_f DATE)
AS
BEGIN
SELECT DATEPART(DAY, getdate()) - DATEPART(DAY, @fecha_f) AS dias;
END

--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR UN INGRESO---
CREATE PROCEDURE prc_register_ingreso(@refer_pedido VARCHAR(15))
AS
DECLARE @id_pedido INT;
DECLARE @id_ingreso INT;
BEGIN
IF NOT EXISTS(SELECT id_ingreso FROM tbl_ingresos WHERE id_ingreso=@refer_pedido)
BEGIN
INSERT INTO tbl_ingresos VALUES(@refer_pedido,GETDATE());
END
SET @id_ingreso= (SELECT id_ingreso FROM tbl_ingresos WHERE id_ingreso=@refer_pedido);
SET @id_pedido=(SELECT id_pedido FROM tbl_pedidos WHERE id_pedido=@refer_pedido);
IF OBJECT_ID( N'tempdb..#datospedido_ingreso') IS NOT NULL
DROP TABLE #datospedido_ingreso;
CREATE TABLE #datospedido_ingreso (
	Codigopedido INT,
	Codigoingreso INT
);
INSERT INTO #datospedido_ingreso VALUES(@id_pedido,@id_ingreso);
SELECT * FROM #datospedido_ingreso;
END
--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR EL INGRESO DE UN PRODUCTO--
CREATE PROCEDURE prc_insertar_ingreso_producto(@idiped INT,@idi INT,@idpro INT,@cantid_ingreso INT,@cantid_defectuoso INT,@detalles VARCHAR(50))
AS
DECLARE @cantid_produc INT = (SELECT cantidad_producto FROM tbl_productos WHERE id_producto=@idpro);
DECLARE @cantid_faltante INT =((SELECT cantidad_producto FROM tbl_pedido_producto WHERE id_producto=@idpro AND id_pedido=@idiped)-@cantid_ingreso);
DECLARE @cantid_actual_inventario INT= (SELECT cantidad_producto_a_la_fecha FROM tbl_inventario_producto WHERE id_producto=@idpro AND id_inventario=(SELECT MAX(id_inventario) FROM tbl_inventarios));
BEGIN
INSERT INTO tbl_ingreso_productos VALUES(@idi,@idpro,@cantid_ingreso,@cantid_faltante,@cantid_defectuoso,@detalles,GETDATE());
UPDATE tbl_pedido_producto SET estado='SI' WHERE id_pedido=@idiped AND id_producto=@idpro;
UPDATE tbl_productos SET cantidad_producto=(@cantid_produc+(@cantid_ingreso-@cantid_defectuoso)) WHERE id_producto=@idpro;
UPDATE tbl_inventario_producto SET cantidad_producto_registro=(@cantid_produc+(@cantid_ingreso-@cantid_defectuoso)),cantidad_producto_a_la_fecha=(@cantid_actual_inventario+(@cantid_ingreso-@cantid_defectuoso)),fecha_ultima_actualización=GETDATE() WHERE id_producto=@idpro AND id_inventario=(SELECT MAX(id_inventario) FROM tbl_inventarios);
END
--FIN PROCEDURE--


--PROCEDURE PARA LA VERIFICACIÓN DE COMPRAS DE PRODUCTOS(CARGA DE PEDIDO A VERIFICAR EN LA TABLA)--
CREATE PROCEDURE prc_verifi_pedido(@refer_ped varchar(30))
AS
BEGIN
SELECT tbl_productos.id_producto,tbl_productos.referencia_producto,tbl_productos.nombre_producto,tbl_pedido_producto.cantidad_producto,tbl_pedido_producto.estado FROM tbl_productos,tbl_pedidos,tbl_pedido_producto WHERE tbl_productos.id_producto=tbl_pedido_producto.id_producto and tbl_pedidos.id_pedido=tbl_pedido_producto.id_pedido AND tbl_pedidos.id_pedido=@refer_ped;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR PEDIDOS DE PRODUCTOS AL SELECT PARA LOS INGRESOS--
CREATE PROCEDURE prc_consultar_pedidos_select
AS
BEGIN
SELECT id_pedido,(CAST(fecha_pedido AS VARCHAR(50))+' / '+ CAST(id_pedido AS VARCHAR(15))) AS pedido FROM tbl_pedidos WHERE categoria='Productos';
END
--FIN PROCEDURE--


--PROCEDURE PARA REGISTRAR EL INGRESO DE UN HILO--
CREATE PROCEDURE prc_insertar_ingreso_hilo(@idiped INT,@idi INT,@idhi INT,@cantid_ingreso FLOAT,@cantid_defectuoso FLOAT,@detalles VARCHAR(50))
AS
DECLARE @cantid_h FLOAT = (SELECT metros_hilo FROM tbl_hilos WHERE id_hilo=@idhi);
DECLARE @cantid_faltante FLOAT =((SELECT metros_hilo FROM tbl_pedido_hilo WHERE id_hilos=@idhi AND id_pedido=@idiped)-@cantid_ingreso);
DECLARE @cantid_actual_inventario FLOAT= (SELECT metros_a_la_fecha FROM tbl_inventario_hilo WHERE id_hilo=@idhi AND id_inventario=(SELECT MAX(id_inventario) FROM tbl_inventarios));
BEGIN
INSERT INTO tbl_ingreso_hilos VALUES(@idi,@idhi,@cantid_ingreso,@cantid_faltante,@cantid_defectuoso,@detalles,GETDATE());
UPDATE tbl_pedido_hilo SET estado='SI' WHERE id_pedido=@idiped AND id_hilos=@idhi;
UPDATE tbl_hilos SET metros_hilo=(@cantid_h+(@cantid_ingreso-@cantid_defectuoso)) WHERE id_hilo=@idhi;
UPDATE tbl_inventario_hilo SET metros_hilo=(@cantid_h+(@cantid_ingreso-@cantid_defectuoso)),metros_a_la_fecha=(@cantid_actual_inventario+(@cantid_ingreso-@cantid_defectuoso)),fecha_ultima_actualización=GETDATE() WHERE id_hilo=@idhi AND id_inventario=(SELECT MAX(id_inventario) FROM tbl_inventarios);
END
--FIN PROCEDURE--


--PROCEDURE PARA LA VERIFICACIÓN DE COMPRAS DE HILOS(CARGA DE PEDIDO A VERIFICAR EN LA TABLA)--
CREATE PROCEDURE prc_verifi_pedido_hilo(@refer_ped varchar(30))
AS
BEGIN
SELECT tbl_hilos.id_hilo,tbl_hilos.referencia_hilo,tbl_hilos.titulo_hilo,tbl_hilos.color_hilo,tbl_pedido_hilo.metros_hilo,tbl_pedido_hilo.estado FROM tbl_hilos,tbl_pedido_hilo,tbl_pedidos WHERE tbl_hilos.id_hilo=tbl_pedido_hilo.id_hilos AND tbl_pedido_hilo.id_pedido=tbl_pedidos.id_pedido AND tbl_pedidos.id_pedido=@refer_ped;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR PEDIDOS DE HILOS AL SELECT PARA LOS INGRESOS--
CREATE PROCEDURE prc_consultar_pedidos_hilos_select
AS
BEGIN
SELECT id_pedido,(CAST(fecha_pedido AS VARCHAR(50))+' / '+ CAST(id_pedido AS VARCHAR(15))) AS pedido FROM tbl_pedidos WHERE categoria='Hilos';
END
--FIN PROCEDURE--
