USE Fiber3;

--Procedimientos para la gestión de las cohortes--

--PROCEDURE PARA CONSULTAR LAS COHORTES Y CARGARLAS AL GRIDVIEW-------------------------------------------------------------------->
CREATE PROCEDURE prc_consultar_cohorte_gv
AS
BEGIN
SELECT id_cohorte,dni_cohorte,nombre_programa,fecha_inic_cohorte,fecha_fin_cohorte FROM tbl_cohorte,tbl_programa WHERE tbl_cohorte.id_programa=tbl_programa.id_programa AND id_cohorte>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR COHORTE POR DNI Y CARGARLAS AL GRIDVIEW-------------------------------------------------------------------->
CREATE PROCEDURE prc_consultar_cohorte_dni_gv(@dni_coh VARCHAR(15))
AS
BEGIN
SELECT id_cohorte,dni_cohorte,nombre_programa,fecha_inic_cohorte,fecha_fin_cohorte FROM tbl_cohorte,tbl_programa WHERE tbl_cohorte.id_programa=tbl_programa.id_programa AND dni_cohorte=@dni_coh AND id_cohorte>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI EXISTE UNA COHORTE CON UN DNI DETERMINADO------------------------------------------------------------>
CREATE PROCEDURE prc_consultar_cohorte_dni(@dni VARCHAR(15))
AS
BEGIN
SELECT * FROM tbl_cohorte WHERE dni_cohorte=@dni AND id_cohorte>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI EXISTE UNA COHORTE POR UN ID DETERMINADO------------------------------------------------------------->
CREATE PROCEDURE prc_consultar_cohorte_id(@id INT)
AS
BEGIN 
SELECT * FROM tbl_cohorte WHERE id_cohorte=@id;
END

--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR UNA COHORTE--------------------------------------------------------------------------------------------->
CREATE PROCEDURE prc_insertar_cohorte(
@dni_c VARCHAR(15),@id_prog INT,@fecha_i DATE,@fecha_f DATE,@fecha_r DATE)
AS
BEGIN
INSERT INTO tbl_cohorte VALUES(@dni_c,@id_prog,@fecha_i,@fecha_f,@fecha_r);
END

--FIN PROCEDURE--

--PROCEDURE PARA MODIFICAR UNA COHORTE--------------------------------------------------------------------------------------------->
CREATE PROCEDURE prc_modificar_cohorte(@id_c INT,@dni_c VARCHAR(15),@id_prog INT,@fecha_i DATE,@fecha_f DATE)
AS
BEGIN
UPDATE tbl_cohorte SET dni_cohorte=@dni_c,id_programa=@id_prog,fecha_inic_cohorte=@fecha_i,fecha_fin_cohorte=@fecha_f WHERE id_cohorte=@id_c;
END

--FIN PROCEDURE--

--PROCEDURE PARA ASIGNAR INTEGRANTES A COHORTE--------------------------------------------------------->
CREATE PROCEDURE prc_insertar_usuarios_a_cohorte(@id_user INT,@id_cohor INT)
AS
BEGIN
INSERT INTO tbl_cohorte_usuario VALUES(@id_user,@id_cohor);
END


--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI UN USUARIO YA PERTENECE A UNA COHORTE------------------------------------>
CREATE PROCEDURE prc_consultar_usuario_en_cohorte(@id_user INT,@id_cohort INT)
AS
BEGIN
SELECT tbl_cohorte.id_cohorte,tbl_usuario.id_usuario FROM tbl_usuario,tbl_cohorte,tbl_cohorte_usuario WHERE tbl_usuario.id_usuario=tbl_cohorte_usuario.id_usuario AND tbl_cohorte.id_cohorte=tbl_cohorte_usuario.id_cohorte AND tbl_cohorte.id_cohorte=@id_cohort AND tbl_usuario.id_usuario=@id_user;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR LOS INTEGRANTES DE UNA COHORTE A UN Gridview----------------------------------->
CREATE PROCEDURE prc_cargar_integrantes_cohorte_gv
AS
BEGIN
SELECT tbl_cohorte.dni_cohorte,tbl_programa.nombre_programa,tbl_usuario.dni_usuario,tbl_usuario.nombre_usuario,tbl_usuario.apellido_usuario FROM tbl_cohorte,tbl_cohorte_usuario,tbl_programa,tbl_usuario WHERE tbl_cohorte.id_cohorte=tbl_cohorte_usuario.id_cohorte AND tbl_cohorte_usuario.id_usuario=tbl_usuario.id_usuario AND tbl_cohorte.id_programa=tbl_programa.id_programa;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA COHORTE CON EL MAYOR ID-------------------------------------------------->
CREATE PROCEDURE prc_consultar_ultimo_idcohorte
AS
BEGIN
SELECT MAX(id_cohorte) AS 'id_cohorte_mayor' FROM tbl_cohorte;
END

--FIN PROCEDURE--

======================================================================
======================================================================

--Procedimientos para la gestión de los programas--

--PROCEDURE PARA CONSULTAR EL ULTIMO PROGRAMA------------------------------------------------------------>
CREATE PROCEDURE prc_consultar_ultimo_idprograma
AS
BEGIN
SELECT MAX(id_programa) AS 'id_programa_mayor' FROM tbl_programa;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR PROGRAMAS AL GRIDVIEW------------------------------------------------------------->
CREATE PROCEDURE prc_cargar_programa_GV
AS
BEGIN
SELECT id_programa,dni_programa,nombre_programa,cantid_horas_programa FROM tbl_programa WHERE id_programa>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA EXISTENCIA DE UN PROGRAMA POR ID DETERMIDANO-------------------------------->
CREATE PROCEDURE prc_consultar_programa_por_ID(@id_prog INT)
AS
BEGIN
SELECT * FROM tbl_programa WHERE id_programa=@id_prog;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA EXISTENCIA DE UN PROGRAMA POR DNI DETERMINADO-------------------------------->
CREATE PROCEDURE prc_consultar_programa_por_DNI(@dni_prog VARCHAR(30))
AS
BEGIN 
SELECT * FROM tbl_programa WHERE dni_programa=@dni_prog AND id_programa>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA EXISTENCIA DE UN PROGRAMA POR UN NOMBRE DETERMINADO-------------------------->
CREATE PROCEDURE prc_consultar_programa_por_NOMBRE(@nom_prog VARCHAR(30))
AS
BEGIN
SELECT * FROM tbl_programa WHERE nombre_programa=@nom_prog;
END

--FIN PROCEDURE--

--PROCEDURE PARA INSERTAR UN PROGRAMA---------------------------------------------------------------------->
CREATE PROCEDURE prc_insertar_programa(@dni_prog VARCHAR(30),@nomb_prog VARCHAR(30),@horas INT,@fecha_reg DATE)
AS
BEGIN
INSERT INTO tbl_programa VALUES(@dni_prog,@nomb_prog,@horas,@fecha_reg);
END

--FIN PROCEDURE--

--PROCEDURE PARA ASIGNAR COMPETENCIAS AL PROGRAMA---------------------------------------------------------->
CREATE PROCEDURE prc_asignar_competencia_al_programa(@id_prog INT,@id_comp INT)
AS
BEGIN
INSERT INTO tbl_programa_competencia VALUES(@id_prog,@id_comp);
END

--FIN PROCEDURE--

--PROCEDURE PARA MODIFICAR PROGRAMA-------------------------------------------------------------------------------->
CREATE PROCEDURE prc_modificar_programa(@id_prog INT,@dni_prog VARCHAR(30),@nomb_prog VARCHAR(30),@horas INT)
AS
BEGIN
UPDATE tbl_programa SET dni_programa=@dni_prog,nombre_programa=@nomb_prog,cantid_horas_programa=@horas WHERE id_programa=@id_prog;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR PROGRAMAS AL GRIDVIEW------------------------------------------------------------->
CREATE PROCEDURE prc_buscar_por_DNI_Ycargar_programa_GV(@dni_prog VARCHAR(30))
AS
BEGIN
SELECT id_programa,dni_programa,nombre_programa,cantid_horas_programa FROM tbl_programa WHERE id_programa>0 AND dni_programa=@dni_prog;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR PROGRAMAS Y COMPETENCIAS AL GRIDVIEW------------------------------------------------------------->
CREATE PROCEDURE prc_cargar_programa_Y_CompetenciasGV
AS
BEGIN
SELECT tbl_programa.dni_programa,tbl_programa.nombre_programa,tbl_competencia.dni_competencia,tbl_competencia.nombre_competencia FROM tbl_programa,tbl_competencia,tbl_programa_competencia WHERE tbl_competencia.id_competencia=tbl_programa_competencia.id_competencia AND tbl_programa.id_programa=tbl_programa_competencia.id_programa AND tbl_programa.id_programa>0 AND tbl_competencia.id_competencia>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI UNA COMPETENCIA YA EST� ASIGNADA A UN PROGRAMA--------------------------------------->
CREATE PROCEDURE prc_consultar_competencia_en_programa(@id_prog INT,@id_comp INT)
AS
BEGIN
SELECT tbl_competencia.nombre_competencia FROM tbl_competencia,tbl_programa,tbl_programa_competencia WHERE tbl_competencia.id_competencia=tbl_programa_competencia.id_competencia AND tbl_programa.id_programa=tbl_programa_competencia.id_programa AND tbl_programa_competencia.id_programa=@id_prog AND tbl_programa_competencia.id_competencia=@id_comp;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LOS PROGRAMAS REGISTRADOS Y CARGARLOS EN DROPDOWNLIST--------------------------------------------------->
CREATE PROCEDURE prc_consultar_programas_select
AS
BEGIN
SELECT id_programa,(CAST(dni_programa AS varchar(30))+'-'+nombre_programa)AS nombre_programa FROM tbl_programa
END

--FIN PROCEDURE--

--PROCEDURE PARA OBTENER LA CANTIDAD DE D�AS TRANSCURRIDOS DESDE LA FECHA DE REGISTRO PARA MODIFICAR O NO CIERTOS CAMPOS------------->
CREATE PROCEDURE prc_calcular_fecha_programa(@fecha_r DATE)
AS
BEGIN
SELECT DATEPART(DAY, getdate()) - DATEPART(DAY, @fecha_r) AS dias_registro_prog;
END

--FIN PROCEDURE--

======================================================================
======================================================================

--Procedimientos para la gestión de las competencias--


--PROCEDURE PARA CARGAR COMPETENCIAS AL DROPDOWNLIST---------------------------------------------------->
CREATE PROCEDURE prc_cargar_competencias_al_dropdownlist
AS
BEGIN
SELECT id_competencia,(CAST(dni_competencia AS varchar(30))+'-'+nombre_competencia)AS nombre_competencia FROM tbl_competencia;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA COMPETENCIA CON EL MAYOR ID-------------------------------------------------->
CREATE PROCEDURE prc_consultar_ultimo_icompetencia
AS
BEGIN
SELECT MAX(id_competencia) AS 'id_competencia_mayor' FROM tbl_competencia;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR COMPETENCIAS AL Gridview----------------------------------------------------------->
CREATE PROCEDURE prc_cargar_competencia_al_gv
AS
BEGIN
SELECT id_competencia,dni_competencia,nombre_competencia,cantid_resultados,cantid_horas FROM tbl_competencia WHERE id_competencia>1;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI EXISTE UNA COMPETENCIA CON UN ID DETERMINADO---------------------------------->
CREATE PROCEDURE prc_consultar_competencia_por_id(@id_comp INT)
AS
BEGIN
SELECT * FROM tbl_competencia WHERE id_competencia=@id_comp;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI EXISTE UNA COMPETENCIA CON UN DNI DETERMINADO--------------------------------->
CREATE PROCEDURE prc_consultar_competencia_por_dni(@dni_comp VARCHAR(30))
AS
BEGIN
SELECT * FROM tbl_competencia WHERE dni_competencia=@dni_comp AND id_competencia>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR SI EXISTE UNA COMPETENCIA CON UN NOMBRE DETERMINADO
CREATE PROCEDURE prc_consultar_competencia_por_nombre(@nomb VARCHAR(30))
AS
BEGIN
SELECT * FROM tbl_competencia WHERE nombre_competencia=@nomb;
END

--FIN PROCEDURE--

--PROCEDURE PARA INSERTAR UNA COMPETENCIA------------------------------------------------------------------->
CREATE PROCEDURE prc_insertar_competencia(@dni_com VARCHAR(30),@nomb_com VARCHAR(30),@canti_re INT,@cantid_h INT,@fecha_re DATE)
AS
BEGIN
INSERT INTO tbl_competencia VALUES (@dni_com,@nomb_com,@canti_re,@cantid_h,@fecha_re);
END

--FIN PROCEDURE--

--PROCEDURE PARA OBTENER LA CANTIDAD DE D�AS QUE HAN PASADO DESDE EL REGISTRO PARA MODIFICAR O NO CIERTOS CAMPOS---------->
CREATE PROCEDURE prc_calcular_fecha_competencia(@fecha_r DATE)
AS
BEGIN
SELECT DATEPART(DAY, getdate()) - DATEPART(DAY, @fecha_r) AS dias_registro_comp;
END

--FIN PROCEDURE--

--PROCEDURE PARA MODIFICAR LA COMPETENCIA---------------------------------------------------------------------------------->
CREATE PROCEDURE prc_modificar_competencia(@id_com INT,@dni_com VARCHAR(30),@nomb_com VARCHAR(30),@canti_re INT,@cantid_h INT)
AS
BEGIN
UPDATE tbl_competencia SET dni_competencia=@dni_com,nombre_competencia=@nomb_com,cantid_resultados=@canti_re,cantid_horas=@cantid_h WHERE id_competencia=@id_com;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR COMPETENCIA POR DNI Y CARGARLO AL GRIDVIEW------------------------------------------------------->
CREATE PROCEDURE prc_consultar_competencia_por_dni_ycargarh_gv(@dni_compe VARCHAR(30))
AS
BEGIN
SELECT id_competencia,dni_competencia,nombre_competencia,cantid_resultados,cantid_horas FROM tbl_competencia WHERE dni_competencia=@dni_compe AND id_competencia>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR LAS COMPETENCIAS AL DROPDOWNLIST------------------------------------------------------------------------------>
CREATE PROCEDURE prc_cargar_competencias_select
AS
BEGIN
SELECT id_competencia,(CAST(dni_competencia AS varchar(30))+'-'+nombre_competencia)AS nombre_competencia FROM tbl_competencia;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA COMPETENCIA CON EL MAYOR ID-------------------------------------------------->
CREATE PROCEDURE prc_consultar_ultimo_idresultado
AS
BEGIN
SELECT MAX(id_resultado) AS 'id_resultado_mayor' FROM tbl_resultados;
END

--FIN PROCEDURE--


======================================================================
======================================================================

--Procedimientos para la gestión de los resultados--

--PROCEDURE PARA CARGAR LOS RESULTADOS AL GRIDVIEW---------------------------------------------------------------------------------->
CREATE PROCEDURE prc_cargar_resultados_gridview
AS
BEGIN
SELECT tbl_resultados.id_resultado,dni_resultado,nombre_competencia,nombre_resultado,tbl_resultados.cantid_horas FROM tbl_resultados,tbl_competencia WHERE tbl_competencia.id_competencia=tbl_resultados.id_competencia;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA EXISTENCIA DE UN RESULTADO POR UN ID DETERMINADO------------------------------------------------------->
CREATE PROCEDURE prc_consultar_resultado_por_ID(@id_result INT)
AS
BEGIN
SELECT * FROM tbl_resultados WHERE id_resultado=@id_result;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA EXISTENCIA DE UN RESULTADO POR UN DNI DETERMINADO------------------------------------------------------>
CREATE PROCEDURE prc_consultar_resultado_por_DNI(@dni_result VARCHAR(30))
AS
BEGIN
SELECT * FROM tbl_resultados WHERE dni_resultado=@dni_result AND id_resultado>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR LA EXISTENCIA DE UN RESULTADO POR UN NOMBRE DTERMINADO---------------------------------------------------->
CREATE PROCEDURE prc_consultar_resultado_por_NOMBRE(@nomb_result VARCHAR(30))
AS
BEGIN
SELECT * FROM tbl_resultados WHERE nombre_resultado=@nomb_result;
END

--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR UN RESULTADO---------------------------------------------------------------------------------------------->
CREATE PROCEDURE prc_insertar_resultado(@id_comp INT,@dni_result VARCHAR(30),@nomb_result VARCHAR(30),@horas INT,@fecha_reg DATE)
AS
BEGIN
INSERT INTO tbl_resultados VALUES(@id_comp,@dni_result,@nomb_result,@horas,@fecha_reg);
END

--FIN PROCEDURE--

--PROCEDURE PARA MODIFICAR UN RESULTADO--------------------------------------------------------------------------------------------->
CREATE PROCEDURE prc_modificar_resultado(@id_result INT,@id_comp INT,@dni_result VARCHAR(30),@nomb_result VARCHAR(30),@horas INT)
AS
BEGIN
UPDATE tbl_resultados SET dni_resultado=@dni_result,id_competencia=@id_comp,nombre_resultado=@nomb_result,cantid_horas=@horas WHERE id_resultado=@id_result;
END

--FIN PROCEDURE--

--PROCEDURE PARA BUSCAR UN RESULTADO POR DNI Y CARGARLO AL GRIDVIEW------------------------------------------------------------------>
CREATE PROCEDURE prc_consultar_resultado_por_DNI_yCargarlo_gridview(@dni_result VARCHAR(30))
AS
BEGIN
SELECT tbl_resultados.id_competencia,dni_resultado,nombre_competencia,nombre_resultado,tbl_resultados.cantid_horas FROM tbl_resultados,tbl_competencia WHERE tbl_competencia.id_competencia=tbl_resultados.id_competencia AND dni_resultado=@dni_result AND id_resultado>0;
END

--FIN PROCEDURE--

--PROCEDURE PARA CALCULAR LOS D�AS QUE HAN PASADO  DESDE EL REGISTRO
CREATE PROCEDURE prc_calcular_fecha_resultado(@fecha_r DATE)
AS
BEGIN
SELECT DATEPART(DAY, getdate()) - DATEPART(DAY, @fecha_r) AS dias_registro_result;
END

--FIN PROCEDURE--

======================================================================
======================================================================

--Procedimientos para la gestión de los reportes--

--PROCEDURE PARA CONSULTAR LA EXISTENCIA DE UN REPORTE DE PROBLEMA POR ID------------------------------->
CREATE PROCEDURE prc_consultar_reporte_problema_por_ID(@id_report_prob INT)
AS
BEGIN
SELECT * FROM tbl_reportes_problemas WHERE id_problema=@id_report_prob;
END

--FIN PROCEDURE--

--PROCEDURE PARA CARGAR LOS REPORTES DE LOS PROBLEMAS DE UN USUARIO A LA GRIDVIEW
CREATE PROCEDURE prc_cargar_reportes_problemas_de_un_usuario_al_GV(@id_user INT)
AS
BEGIN
SELECT id_problema,nombre_problema,observaciones_problema, fecha_registro_problema,estado_problema FROM tbl_reportes_problemas, tbl_usuario WHERE tbl_reportes_problemas.id_usuario=tbl_usuario.id_usuario AND tbl_usuario.id_usuario=@id_user;
END

--FIN PROCEDURE--

--PROCEDURE PARA CONSULTAR EL ULTIMO ID DE REGISTRO DE REPORTES DE PROBLEMAS PARA GENERAR ID PARA NUEVO REGISTRO----------------->
CREATE PROCEDURE prc_consultar_ultimoregisto_problemas
AS
BEGIN
SELECT MAX(id_problema) AS id_reporte_problema_mayor FROM tbl_reportes_problemas;
END

--FIN PROCEDURE--

--PROCEDURE PARA REGISTRAR UN REPORTE DE UN PROBLEMA------------------------------------------------------>
CREATE PROCEDURE prc_insertar_reporte_problema(@nomb_pro VARCHAR(30),@descrip_pro VARCHAR(100),@fecha_reg DATE,@estado_repor VARCHAR(30),@id_user INT)
AS
BEGIN
INSERT INTO tbl_reportes_problemas VALUES(@nomb_pro,@descrip_pro,@fecha_reg,@estado_repor,@id_user);
END

--FIN PROCEDURE--

