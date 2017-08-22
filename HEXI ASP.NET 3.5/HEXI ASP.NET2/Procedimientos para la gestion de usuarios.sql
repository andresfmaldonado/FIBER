USE Fiber3;

--Procedimientos para la gestión de usuarios--

--PROCEDURE PARA INGRESAR AL SISTEMAS DE INFORMACI�N--------------------------------------------------->
CREATE PROCEDURE prc_ingresar_al_sistema(
@correo VARCHAR(30),@rol VARCHAR(30))
AS
BEGIN
SELECT tbl_usuario.contraseña_usuario,tbl_usuario.estado_usuario FROM tbl_usuario,tbl_rol,tbl_usuario_rol WHERE tbl_usuario.id_usuario=tbl_usuario_rol.id_usuario AND  tbl_rol.id_rol=tbl_usuario_rol.id_rol AND tbl_usuario.email_usuario=@correo AND tbl_rol.nombre_rol=@rol;
END

--FIN PROCEDURE--

--PROCEDURE PARA MODIFICAR EL PERFIL DE USUARIO----------------------------------------------------------->
CREATE PROCEDURE prc_modificar_perfil_usuario(
@id_user INT, 
@contraseña VARCHAR(30)
)
AS
BEGIN
UPDATE tbl_usuario SET contraseña_usuario=@contraseña WHERE id_usuario=@id_user;
END

--FIN PROCEDURE--

--PROCEDURE PARA MODIFICAR EL FOTO PERFIL DE USUARIO----------------------------------------------------------->
CREATE PROCEDURE prc_modificar_foto_perfil_usuario(
@id_user INT, 
@fotop VARCHAR(80)
)
AS
BEGIN
UPDATE tbl_usuario SET foto_usuario=@fotop WHERE id_usuario=@id_user;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR DATOS AL PERFIL DE USUARIO--------------------------------------------------------->
CREATE PROCEDURE prc_cargar_info_perfil_usuario(@id_user INT)
AS
BEGIN
SELECT tbl_usuario.nombre_usuario,tbl_usuario.apellido_usuario,tbl_usuario.email_usuario, tbl_rol.nombre_rol,foto_usuario,(tbl_usuario.nombre_usuario+' '+tbl_usuario.apellido_usuario) AS nombre_completo  FROM tbl_usuario,tbl_usuario_rol,tbl_rol WHERE tbl_usuario.id_usuario=tbl_usuario_rol.id_usuario AND tbl_rol.id_rol=tbl_usuario_rol.id_rol AND tbl_usuario.id_usuario=@id_user;
END

--FIN PROCEDURE--

--PROCEDURE PARA OBTENER LE ID DEL USUARIO CUANDO INGRESA AL SISTEMA PARA PORDER REALIZAR ALGUNOS PROCESOS----->
CREATE PROCEDURE prc_obtener_id_usurio_con_correo(@correo VARCHAR(30))
AS
BEGIN
SELECT id_usuario FROM tbl_usuario WHERE email_usuario=@correo;
END

--FIN PROCEDURE--

--PROCEDURE CONSULTAR DATOS DEL USUARIO PARA AUTOCOMPLETAR REGISTRO PARA MODIFICAR----------------------->
CREATE PROCEDURE prc_consultar_usuario_para_modificar(@id INT)
AS
BEGIN
SELECT tbl_usuario.id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,contraseña_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE id_usuario=@id;
END

--FIN PROCEDURE--

--PROCEDURE PARA SELECCIONAR LOS ROLES ASIGNADO AL USER EN EL CHECKBOXLIST 
CREATE PROCEDURE prc_consultar_roles_user(@id_user INT)
AS
BEGIN
SELECT * FROM tbl_usuario_rol WHERE id_usuario=@id_user;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI EL USER YA TIENE UN ROL ASIGNADO
CREATE PROCEDURE prc_consultar_rol_asignado(@id_user_p INT,@id_rol_p INT)
AS
BEGIN
SELECT id_usuario FROM tbl_usuario_rol WHERE id_rol=@id_rol_p AND id_usuario=@id_user_p;
END

--FIN PROCEDURE--

--PROCEDURE PARA ELIMINAR UN ROL A UN USER
CREATE PROCEDURE prc_eliminar_rol_asignado(@id_user_plaf INT,@id_rol_plaf INT)
AS
BEGIN
DELETE FROM tbl_usuario_rol WHERE id_rol=@id_rol_plaf AND id_usuario=@id_user_plaf;
END

--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR UN USUARIO----------------------------------------------------------------->
CREATE PROCEDURE prc_insertar_usuario(
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

--PROCEDURE PARA CONSULTAR EL ID DE UN ROL POR SU NOMBRE--------------------------------------------->
CREATE PROCEDURE prc_consultar_rol(@rol VARCHAR(30))
AS
BEGIN
SELECT id_rol FROM tbl_rol WHERE nombre_rol=@rol;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI HAY UN USUARIO REGISTRADO CON UN NUMERO DE DOCUMENTO DETERMINADO------->
CREATE PROCEDURE prc_consultar_usuario_por_dni(@dni VARCHAR(15))
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE dni_usuario=@dni AND id_usuario>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR DNI CON ID------------------------>
CREATE PROCEDURE prc_consultar_usuario_por_id(@id INT)
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE id_usuario=@id;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI HAY UN USUARIO REGISTRADO CON UN CORREO DETERMINADO-------------------->
CREATE PROCEDURE prc_consultar_usuario_por_correo(@correo VARCHAR(30))
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE email_usuario=@correo;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONOCER EL ID DEL ROL DE UN USUARIO
CREATE PROCEDURE prc_consultar_idrol_usuario(@id_user INT)
AS
BEGIN
SELECT tbl_rol.id_rol FROM tbl_rol,tbl_usuario, tbl_usuario_rol WHERE tbl_rol.id_rol=tbl_usuario_rol.id_rol AND tbl_usuario.id_usuario=tbl_usuario_rol.id_usuario AND tbl_usuario.id_usuario=@id_user;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR UN USUARIOS REGISTRADOS Y CARGARLOS EN EL GRIDVIEW----------->
CREATE PROCEDURE prc_consultar_usuario_dgv
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR UN USUARIO POR UN NUMERO DE DOCUMENTO Y CARGARLO EN EL GRIDVIEW----------->
CREATE PROCEDURE prc_consultar_usuario_dni_dgv(@dni VARCHAR(15))
AS
BEGIN
SELECT id_usuario,dni_usuario,nombre_usuario,apellido_usuario,email_usuario,tel_usuario,estado_usuario FROM tbl_usuario WHERE dni_usuario=@dni AND id_usuario>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR EL ROL DE UN USUARIO------------------------------------------------------>
CREATE PROCEDURE prc_asignar_rol_usuario(@id_usuario INT,@id_rol INT)
AS
BEGIN
INSERT INTO tbl_usuario_rol VALUES(@id_usuario,@id_rol);
END

--FIN PROCEDURE--

--PROCEDURE PARA MODIFICAR EL REGISTRO DE UN USUARIO------------------------------------------------->
CREATE PROCEDURE prc_modificar_usuario(
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

--PROCEDURE PARA ACTUALIZAR LA CONTRASE�A DE RESTABLECIMIENTO CUANDO SE �LVIDA LA MISMA
CREATE PROCEDURE prc_nueva_contraseña_usuario(@correo_user VARCHAR(30),@nuevapass VARCHAR(30))
AS
BEGIN
UPDATE tbl_usuario SET contraseña_usuario=@nuevapass WHERE email_usuario=@correo_user;
END

--FIN PROCEDURE--

--PROCEDURE PARA ACTUALIZAR EL ROL DE UN USUARIO---------------------------------------------------->
CREATE PROCEDURE prc_actualizar_rol_usuario(@id_usuario INT, @id_rol_viejo INT, @id_rol_nuevo INT)
AS
BEGIN
UPDATE tbl_usuario_rol SET id_rol=@id_rol_nuevo WHERE id_usuario=@id_usuario AND id_rol=@id_rol_viejo;
END

--FIN PROCEDURE--

--PROCEDURE PARA DESHABILITAR EL ACCESO AL SISTEMA DE UN USUARIO------------------------------------>
CREATE PROCEDURE prc_Dar_de_baja(@id int)
AS
BEGIN
UPDATE tbl_usuario SET estado_usuario='Deshabilitado' WHERE id_usuario=@id;
END

--FIN PROCEDURE--

--PROCEDURE PARA HABILITAR EL ACCESO AL SISTEMA DE UN USUARIO--------------------------------------->
CREATE PROCEDURE prc_Dar_de_alta(@id int)
AS
BEGIN
UPDATE tbl_usuario SET estado_usuario='Habilitado' WHERE id_usuario=@id;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR TODOS LOS ROLES EXISTENTES Y CARGARLOS EN EL DROPDOWNLIST----------------------------------------------->
CREATE PROCEDURE prc_consultar_roles
AS
BEGIN
SELECT id_rol,nombre_rol FROM tbl_rol;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LOS USUARIOS REGISTRADOS Y CARGARLOS EN DROPDOWNLIST---------------------------------------------------->
CREATE PROCEDURE prc_consultar_usuarios_select
AS
BEGIN
SELECT id_usuario,(CAST(dni_usuario AS varchar(30))+'-'+nombre_usuario+' '+apellido_usuario) AS nombre_usuario FROM tbl_usuario;
END

--FIN PROCEDURE--

--PROCEDURE INFORME USUARIOS---------------------------------------------------
CREATE PROCEDURE prc_informe
AS
BEGIN
SELECT dni_usuario,nombre_usuario,apellido_usuario,email_usuario,estado_usuario FROM tbl_usuario WHERE id_usuario>1;
END

--FIN PROCEDURE--

--PROCEDURE PARA ESTADISTICAS USERS Y HABILITADOS---UPDATE--------------
CREATE PROCEDURE prc_estadistica_users
AS
DECLARE @cantid_user INT = (SELECT COUNT(id_usuario) FROM tbl_usuario);
DECLARE @cantid_habilit INT = (SELECT COUNT(id_usuario) FROM tbl_usuario WHERE estado_usuario='Habilitado');
IF OBJECT_ID('tempdb..#ReporteUser') IS NOT NULL
DROP TABLE #ReporteUser;
CREATE TABLE #ReporteUser (
	users INT,
	habilit INT
);
INSERT INTO #ReporteUser VALUES(@cantid_user,@cantid_habilit);
BEGIN
SELECT * FROM #ReporteUser;
END
--FIN PROCEDURE--

--PROCEDURE PARA EL REGISTRO DE HISTORIAL--
CREATE PROCEDURE prc_history(@user INT,@description VARCHAR(50))
AS
BEGIN
INSERT INTO tbl_historial(id_usuario,descripcion,fecha_h) VALUES(@user,@description,GETDATE());
END
--FIN PROCEDURE--


--PROCEDURE PARA CARGAR EL HISTORIAL--
CREATE PROCEDURE prc_cargar_history(@idus INT)
AS
BEGIN
SELECT id,(descripcion+' | '+ CAST(fecha_h AS varchar)) as history FROM tbl_historial,tbl_usuario WHERE tbl_historial.id_usuario=tbl_usuario.id_usuario AND tbl_usuario.id_usuario=@idus; 
END
---FIN PROCEDURE--
