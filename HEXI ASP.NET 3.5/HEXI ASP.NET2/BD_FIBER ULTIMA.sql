CREATE DATABASE Fiber;
USE Fiber;
drop database Fiber
--TBL USUARIO-------------------------------------------------------------------------------------------->


ALTER TABLE tbl_usuario ALTER COLUMN tel_usuario VARCHAR(10) NOT NULL;  

CREATE PROCEDURE prc_cargar_productos_al_GV
AS
BEGIN
SELECT * FROM tbl_productos;
END




drop procedure prc_cargar_resultados_gridview

drop procedure prc_consultar_resultado_por_DNI_yCargarlo_gridview

EXEC prc_cargar_info_perfil_usuario '1'


EXEC prc_consultar_usuario_para_modificar '18'

SELECT  id_rol FROM tbl_rol WHERE nombre_rol = 'SuperAdministrador'
delete from tbl_usuario WHERE id_usuario=6

INSERT INTO tbl_usuario VALUES('1020488475','Johan','Zapata Herrera','johanzahe@outlook.com','johanzahe','4576172','Habilitado','dfg'),
('43789654','Valeria','Montoya Gutierrez','valeria@hotmail.com','vale123','45678976','Deshabilitado','sdf'),
('43344707','Santiago','Mar�n','smarin@gmail.com','smarin1234','4576172','Habilitado','sdf'),
('65432456','David','Builes','dbuiles@gmail.com','builes0987','9876545','Deshabilitado','543'),
('76543289','Alejandra','Parra','aparra@gmail.com','Aleparr987','2345676','Deshabilitado','s9876'),
('76598706','Maribel','Carmona','mc@gmail.com','mc765','5764321','Deshabilitado','s98jh76'),
('78675437','Miguel','Ruiz','mrz@gmail.com','miguer765','7869876','Deshabilitado','s98ng76'),
('67895435','Tomas','Valencia','tmv@gmail.com','valen456','9875432','Deshabilitado','s98mb76'),
('56432124','Andres','Villa','villaa@gmail.com','andresv876','3142365','Deshabilitado','s9mm876'),
('87654323','Claudia','Garcia','claugarcia@gmail.com','graciacla7896','7564323','Deshabilitado','s9kjj876'),
('1017140549','Isabel','Lora Mar�n','ilora@misena.edu.co','1017140549','7564323','Habilitado','Photo');
select * from tbl_usuario
INSERT INTO tbl_rol VALUES('Seleccione un rol',' '),
('Administrador','Posee todos los permisos'),
('Instructor','Acesso a consumos, productos y su perfil'),
('Aprendiz','Acesso unicamente a dise�os y su perfil');
select R.nombre_rol, U.nombre_usuario from tbl_usuario as U Inner Join tbl_usuario_rol as UR On U.id_usuario = UR.id_usuario Inner Join tbl_rol as R On
UR.id_rol = R.id_rol;
select * from tbl_rol;
INSERT INTO tbl_usuario_rol VALUES('1','1'),
('1','2'),
('1','3'),
('1','4'),
('7','2'),
('8','3'),
('9','4'),
('10','2'),
('11','3');

delete from tbl_usuario_rol WHERE id_usuario=12
select * from tbl_usuario

--COMANDO PARA CONSULTAR EL REGISTRO CON MAYOR ID(ULTIMO ID CON RESPECTO AL REGISTRO AUTOINCEREMENTO)-->
SELECT MAX(id_usuario) AS 'id_mayor' FROM tbl_usuario


select * from tbl_usuario_rol
UPDATE tbl_usuario_rol SET id_rol='4' where id_rol=5
UPDATE tbl_rol SET nombre_rol='Aprendiz' where id_rol=4
DELETE FROM tbl_rol where id_rol=5


UPDATE tbl_usuario SET estado_usuario='Habilitado' WHERE id_usuario=18;

EXEC prc_ingresar_al_sistema 'johanzahe@outlook.com'
EXEC prc_ingresar_al_sistema 'smarin@gmail.com'
EXEC prc_ingresar_al_sistema 'valeria@hotmail.com'
EXEC prc_ingresar_al_sistema 'jezapata506@misena.edu.co'

select * from tbl_usuario

drop procedure prc_consultar_usuario_por_dni
exec prc_consultar_usuario_por_dni '0'

drop procedure prc_consultar_usuario_dgv

DROP PROCEDURE prc_modificar_usuario

drop procedure prc_Dar_de_baja

EXEC prc_consultar_usuarios_select

exec prc_insertar_usuarios_a_cohorte '1',

delete from tbl_cohorte where id_cohorte=1

select * from tbl_cohorte_usuario
update tbl_cohorte set fecha_registro='2017-01-07' where id_cohorte=2

insert into tbl_programa values('0','0','Seleccione un programa','');
insert into tbl_programa values('1','4545','Dise�o Gr�fico','4500');

select * from tbl_programa_competencia

EXEC prc_consultar_competencia_en_programa '1','1'

INSERT INTO tbl_competencia VALUES(0,0,'Seleccione una opci�n','','','')
select * from tbl_competencia

drop procedure prc_cargar_competencia_al_gv







