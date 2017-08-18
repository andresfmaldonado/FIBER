CREATE DATABASE Fiber3;

--Usar la base de datos--
USE Fiber3;

--Tabla usuarios--

CREATE TABLE tbl_usuario(
id_usuario INT PRIMARY KEY IDENTITY,
dni_usuario VARCHAR(15) NOT NULL,
nombre_usuario VARCHAR(30) NOT NULL,
apellido_usuario VARCHAR(30) NOT NULL,
email_usuario VARCHAR(30) NOT NULL,
contraseña_usuario VARCHAR(30) NOT NULL,
tel_usuario VARCHAR(10) NOT NULL,
estado_usuario VARCHAR(30) NOT NULL,
foto_usuario VARCHAR(80) NOT NULL
);
select * from tbl_usuario
INSERT INTO tbl_usuario(dni_usuario,nombre_usuario,apellido_usuario,
email_usuario,contraseña_usuario,tel_usuario,estado_usuario,foto_usuario)
values ('1020488475','Johan','Zapata Herrera','johanzahe@outlook.com','johanzahe','3045984094',
'Habilitado','Fotos/photoperfilpodefecto.jpg');



--NOTA: La tabla de usuarios, interactua tanto con el módulo de patrones
--como con el de inventarios

--Fin tabla usuarios--

--Tabla historial--

CREATE TABLE tbl_historial(
id INT PRIMARY KEY IDENTITY,
id_usuario INT NOT NULL,
descripcion VARCHAR(50) NOT NULL,
fecha_h DATETIME NOT NULL
FOREIGN KEY (id_usuario) REFERENCES tbl_usuario(id_usuario)
);
--Fin tabla historial--


--Tabla rol--

CREATE TABLE tbl_rol(
id_rol INT PRIMARY KEY IDENTITY,
nombre_rol VARCHAR(30) NOT NULL,
descrip_rol VARCHAR(50) NOT NULL
);

--Fin tabla Rol--

select * from tbl_rol
delete from tbl_rol
insert into tbl_rol(nombre_rol,descrip_rol) values ('Seleccione el rol',''),('Administrador','Acceso total'),('Instructor','Acceso limitado'),
('Aprendiz','Solo acceso a Patrones');

--Tabla intermedia entre usuario y rol--

CREATE TABLE tbl_usuario_rol(
id_usuario INT NOT NULL,
id_rol INT NOT NULL,
FOREIGN KEY(id_usuario) REFERENCES tbl_usuario(id_usuario),
FOREIGN KEY(id_rol) REFERENCES tbl_rol(id_rol)
);

select * from tbl_usuario_rol
insert into tbl_usuario_rol values (1,2)

--Fin tabla intermedia usuario_rol--

--Tabla programa--

CREATE TABLE tbl_programa(
id_programa INT PRIMARY KEY IDENTITY,
dni_programa VARCHAR(30) NOT NULL,
nombre_programa VARCHAR(30) NOT NULL,
cantid_horas_programa INT NOT NULL,
fecha_registro_programa DATE NOT NULL
);

--Fin tabla programa--

--Tabla Cohorte--

CREATE TABLE tbl_cohorte(
id_cohorte INT PRIMARY KEY IDENTITY,
dni_cohorte VARCHAR(15) NOT NULL,
id_programa INT NOT NULL,
fecha_inic_cohorte DATE NOT NULL,
fecha_fin_cohorte DATE NOT NULL,
fecha_registro DATE NOT NULL,
FOREIGN KEY(id_programa) REFERENCES tbl_programa(id_programa)
);

--Fin tabla Cohorte--

--Tabla intermedia entre cohorte y usuarios--

CREATE TABLE tbl_cohorte_usuario(
id_usuario INT NOT NULL,
id_cohorte INT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES tbl_usuario (id_usuario),
FOREIGN KEY (id_cohorte) REFERENCES tbl_cohorte (id_cohorte)
);

--Fin tabla intermedia cohorte_usuario--

--Tabla Competencia--

CREATE TABLE tbl_competencia(
id_competencia INT PRIMARY KEY IDENTITY,
dni_competencia VARCHAR(30) NOT NULL,
nombre_competencia VARCHAR(30) NOT NULL,
cantid_resultados INT NOT NULL,
cantid_horas INT NOT NULL,
fecha_registro_competencia DATE NOT NULL
);

--Fin tabla competencia--

--Tabla intermedia entre programa y competencia--

CREATE TABLE tbl_programa_competencia(
id_programa INT NOT NULL,
id_competencia INT NOT NULL,
FOREIGN KEY(id_programa) REFERENCES tbl_programa(id_programa),
FOREIGN KEY(id_competencia) REFERENCES tbl_competencia(id_competencia)
);

--Fin tabla intermedia programa_competencia--

--Tabla resultados--

CREATE TABLE tbl_resultados(
id_resultado INT PRIMARY KEY IDENTITY,
id_competencia INT NOT NULL,
dni_resultado VARCHAR(30) NOT NULL,
nombre_resultado VARCHAR(30) NOT NULL,
cantid_horas INT NOT NULL,
fecha_registro_resultado DATE NOT NULL,
FOREIGN KEY(id_competencia) REFERENCES tbl_competencia(id_competencia)
);

--Fin tabla resultados--

--Tabla de reporte de problemas--

CREATE TABLE tbl_reportes_problemas(
id_problema INT PRIMARY KEY IDENTITY,
nombre_problema VARCHAR(30) NOT NULL,
observaciones_problema VARCHAR(100) NOT NULL,
fecha_registro_problema DATE NOT NULL,
estado_problema VARCHAR(30) NOT NULL,
id_usuario INT NOT NULL,
FOREIGN KEY(id_usuario) REFERENCES tbl_usuario(id_usuario)
);

--Fin tabla reportes_problemas--

