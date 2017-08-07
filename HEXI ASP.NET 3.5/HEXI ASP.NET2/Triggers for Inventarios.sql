--TRIGGERS INVENTARIO--

CREATE TRIGGER insertar_productos_necesarios
On tbl_productos 
AFTER INSERT
AS
BEGIN
declare @id INT;
declare @ref VARCHAR(10), @nombre VARCHAR(20), @descripcion VARCHAR(50);
declare @valor FLOAT;

set @id = (select id_producto from inserted);
set @ref = (select referencia_producto from inserted);
set @nombre = (select nombre_producto from inserted);
set @descripcion = (select descripcion_producto from inserted);
set @valor = (select valorUnitario_producto from inserted);

insert into tbl_productos_necesarios(id_producto,referencia_producto,
nombre_producto, descripcion_producto,valorUnitario)
values
(@id,@ref,@nombre,@descripcion,@valor);
END

CREATE TRIGGER insertar_hilo_necesario
ON tbl_hilos
AFTER INSERT
AS
BEGIN
declare @id INT, @titulo INT;
declare @ref VARCHAR(10), @tipo VARCHAR(10), @color VARCHAR(10);
declare @valor FLOAT, @valor_pedido FLOAT;

set @id = (select id_hilo from inserted);
set @ref = (select referencia_hilo from inserted);
set @tipo = (select tipo_hilo from inserted);
set @titulo = (select titulo_hilo from inserted);
set @color = (select color_hilo from inserted);
set @valor = (select valorMetro from inserted);

insert into tbl_hilos_necesarios values (@id,@ref,@tipo,@titulo,@color,@valor);

END
