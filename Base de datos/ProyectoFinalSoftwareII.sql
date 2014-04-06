-- =================================================
-- Autor:			Erwin Justiniano
-- Fecha:			20/10/2013
-- Descripción:		Base de datos Proyecto Final
-- Versión:			1.0.0
-- =================================================

PRINT 'INICIANDO CREACION DE LA BASE DE DATOS'

USE master;
GO

IF EXISTS(SELECT name FROM sys.databases WHERE name = 'ProyectoFinalSoftwareII')
	DROP DATABASE ProyectoFinalSoftwareII
GO

IF NOT EXISTS(SELECT name FROM sys.databases WHERE name = 'ProyectoFinalSoftwareII')
	CREATE DATABASE ProyectoFinalSoftwareII;
GO

USE ProyectoFinalSoftwareII
GO

PRINT 'FIN CREACION BASE DE DATOS'
GO
-----------------------------------------------------------------------------

PRINT 'INICIANDO CREACION DE ESQUEMAS'


-- Esquema para tablas de parámetros
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'PAR')
	Exec('CREATE SCHEMA PAR')
GO

PRINT 'FIN CREACION DE ESQUEMAS'
GO
-----------------------------------------------------------------------------

PRINT 'INICIANDO CREACION DE TABLAS'

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblPersonas' AND xtype='U')
	DROP TABLE [PAR].[tblPersonas]
	GO
CREATE TABLE [PAR].[tblPersonas]
(
	id_Persona				int IDENTITY(1,1) NOT NULL,
	nit						int NOT NULL,
	nombre					varchar(50) NOT NULL,
	apellido				varchar(50) NOT NULL,
	direccion				varchar(50) NULL,
	correo					varchar(50) NOT NULL,
	foto					varchar(50) NULL,  -- CORREGIR EL TIPO DE DAT DE LA FOTO
	concurrencia_id			int NULL,
	CONSTRAINT pk_tblPersona PRIMARY KEY (id_Persona),	
	CONSTRAINT un_tblPersona_Nit UNIQUE (nit)
) 
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblEstudiantes' AND xtype='U')
	DROP TABLE [PAR].[tblEstudiantes]
GO

CREATE TABLE [PAR].[tblEstudiantes]
(
	id_Estudiante		int IDENTITY(1,1) NOT NULL,
	Id_Persona			int NOT NULL,
	concurrencia_id		int NOT NULL,
	CONSTRAINT pk_tblEstudiantes PRIMARY KEY(id_Estudiante), 
	CONSTRAINT fk_tblEstudiantes_Estudiante FOREIGN KEY (Id_Persona) REFERENCES [PAR].[tblPersonas](id_Persona) ON DELETE CASCADE  
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblDocentes' AND xtype='U')
	DROP TABLE [PAR].[tblDocentes]
GO

CREATE TABLE [PAR].[tblDocentes]
(
	id_Docente			int IDENTITY(1,1) NOT NULL,
	Id_Persona			int NOT NULL,
	contraseña			varbinary(255),
	concurrencia_id		int NOT NULL,
	CONSTRAINT pk_tblDocentes PRIMARY KEY(id_Docente), 
	CONSTRAINT fk_tblDocentes_docente FOREIGN KEY (Id_Persona) REFERENCES [PAR].[tblPersonas](id_Persona) ON DELETE CASCADE  
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblCarreras' AND xtype='U')
	DROP TABLE [PAR].[tblCarreras]
GO

CREATE TABLE [PAR].[tblCarreras]
(
	id_Carrera			int IDENTITY(1,1) NOT NULL,
	nombre				varchar(50) NOT NULL,
	concurrencia_id		int NOT NULL,
	CONSTRAINT pk_tblCarreras PRIMARY KEY(id_Carrera)  
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblMaterias' AND xtype='U')
	DROP TABLE [PAR].[tblMaterias]
GO

CREATE TABLE [PAR].[tblMaterias]
(
	id_Materia			int IDENTITY(1,1) NOT NULL,
	nombre				varchar(50) NOT NULL,
	sigla				varchar(50) NOT NULL,
	concurrencia_id		int NOT NULL,
	CONSTRAINT pk_tblMaterias PRIMARY KEY(id_Materia)  
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblGrupos' AND xtype='U')
	DROP TABLE [PAR].[tblGrupos]
GO

CREATE TABLE [PAR].[tblGrupos]
(
	id_Grupo			int IDENTITY(1,1) NOT NULL,
	id_materia			int NOT NULL,
	id_docente			int NOT NULL,
	gestion				date NOT NULL,
	grupo				varchar(50) NOT NULL,
	estado				int NOT NULL,
	concurrencia_id		int NOT NULL,
	CONSTRAINT pk_tblGrupos PRIMARY KEY(id_Grupo), 
	CONSTRAINT fk_tblGrupos_Materia FOREIGN KEY (Id_Materia) REFERENCES [PAR].[tblMaterias](id_Materia) ON DELETE CASCADE, 
	CONSTRAINT fk_tblGrupos_Docente FOREIGN KEY (Id_Docente) REFERENCES [PAR].[tblDocentes](id_Docente) ON DELETE CASCADE 
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblRegistros' AND xtype='U')
	DROP TABLE [PAR].[tblRegistros]
GO

CREATE TABLE [PAR].[tblRegistros]
(
	id_Registro			int IDENTITY(1,1) NOT NULL,
	id_Grupo			int NOT NULL,
	id_Estudiante		int NOT NULL,
	id_Carrera			int NOT NULL,
	concurrencia_id		int NOT NULL,
	CONSTRAINT pk_tblRegistros PRIMARY KEY(id_Registro),
	CONSTRAINT fk_tblRegistros_Grupo FOREIGN KEY (Id_Grupo) REFERENCES [PAR].[tblGrupos](id_Grupo) ON DELETE CASCADE,
	CONSTRAINT fk_tblRegistros_Estudiante FOREIGN KEY (Id_Estudiante) REFERENCES [PAR].[tblEstudiantes](id_Estudiante)ON DELETE NO ACTION,
	CONSTRAINT fk_tblRegistros_Carrera FOREIGN KEY (Id_Carrera) REFERENCES [PAR].[tblCarreras](id_carrera) ON DELETE CASCADE 
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblParametros_Estudiantes' AND xtype='U')
	DROP TABLE [PAR].[tblParametros_Estudiantes]
GO

CREATE TABLE [PAR].[tblParametros_Estudiantes]
(
	id_ParametroAlumnos int IDENTITY(1,1) NOT NULL,
	id_grupo			int NOT NULL,
	nombreArchivo		nvarchar(200) NOT NULL,
	tipoContenido		varchar(50) NOT NULL,
	tamaño				varchar(50) NOT NULL,
	Dato				varbinary(max)NOT NULL,
	fecha				date NOT NULL,
	concurrencia_id		int  NOT NULL,
	CONSTRAINT pk_tblParametros_Estudiantes PRIMARY KEY(id_ParametroAlumnos),
	CONSTRAINT fk_tblParametros_Estudiantes_Grupo FOREIGN KEY (Id_Grupo) REFERENCES [PAR].[tblGrupos](id_Grupo) ON DELETE NO ACTION,
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblParametros_Notas' AND xtype='U')
	DROP TABLE [PAR].[tblParametros_Notas]
GO

CREATE TABLE [PAR].[tblParametros_Notas]
(
	id_ParametroNota	 int IDENTITY(1,1) NOT NULL,
	observacion			 varchar(50) NOT NULL,
	concurrencia_id		 int NOT NULL,
	CONSTRAINT pk_tblParametros_Notas PRIMARY KEY(id_ParametroNota)
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblAsistencias' AND xtype='U')
	DROP TABLE [PAR].[tblAsistencias]
GO

CREATE TABLE [PAR].[tblAsistencias]
(
	id_Asistencia	int IDENTITY(1,1) NOT NULL,
	id_grupo		int  NOT NULL,
	fecha			date NOT NULL,
	concurrencia_id int  NOT NULL,
	CONSTRAINT pk_tblAsistencias PRIMARY KEY(id_Asistencia),
	CONSTRAINT fk_tblAsistencias_Grupo FOREIGN KEY (Id_Grupo) REFERENCES [PAR].[tblGrupos](id_Grupo) ON DELETE CASCADE,
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblDetalle_Asistencias' AND xtype='U')
	DROP TABLE [PAR].[tblDetalle_Asistencias]
GO

CREATE TABLE [PAR].[tblDetalle_Asistencias]
(
	id_Detalle_Asistencia	int IDENTITY(1,1) NOT NULL,
	id_Asistencia			int  NOT NULL,
	id_Estudiante			int  NOT NULL,
	Asistio					bit  NOT NULL DEFAULT 0,
	concurrencia_id			int	 NOT NULL,
	CONSTRAINT pk_tblDetalle_Asistencias PRIMARY KEY(id_Detalle_Asistencia),
	CONSTRAINT fk_tblDetalle_Asistencias_Asistencia FOREIGN KEY (id_Asistencia) REFERENCES [PAR].[tblAsistencias](id_Asistencia) ON DELETE CASCADE,
    CONSTRAINT fk_tblDetalle_Asistencias_Estudiante FOREIGN KEY (id_Estudiante) REFERENCES [PAR].[tblEstudiantes](id_Estudiante) ON DELETE NO ACTION,
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblNotas' AND xtype='U')
	DROP TABLE [PAR].[tblNotas]
GO

CREATE TABLE [PAR].[tblNotas]
(
	id_Nota				int IDENTITY(1,1) NOT NULL,
	id_Grupo			int  NOT NULL,
	id_ParametroNota	int	 NOT NULL,
	fecha				date NOT NULL,
	estado				int	 NOT NULL,
	concurrencia_id		int  NOT NULL,
	CONSTRAINT pk_tblNotas PRIMARY KEY(id_Nota),
	CONSTRAINT fk_tblNotas_Grupo FOREIGN KEY (Id_Grupo) REFERENCES [PAR].[tblGrupos](id_Grupo) ON DELETE CASCADE,
	CONSTRAINT fk_tblNotas_ParametroNota FOREIGN KEY (Id_ParametroNota) REFERENCES [PAR].[tblParametros_Notas](id_ParametroNota) ON DELETE NO ACTION
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblDetalle_Notas' AND xtype='U')
	DROP TABLE [PAR].[tblDetalle_Notas]
GO

CREATE TABLE [PAR].[tblDetalle_Notas]
(
	id_DetalleNota  int IDENTITY(1,1) NOT NULL,
	id_Nota			int NOT NULL,
	id_Estudiante	int NOT NULL,
    nota			int NOT NULL,
    concurrencia_id	int	NOT NULL,
	CONSTRAINT pk_tblDetalle_Notas PRIMARY KEY(id_DetalleNota),
	CONSTRAINT fk_tblDetalle_Notas_Nota FOREIGN KEY (Id_Nota) REFERENCES [PAR].[tblNotas](id_Nota) ON DELETE CASCADE,
	CONSTRAINT fk_tblDetalle_Notas_Estudiante FOREIGN KEY (Id_Estudiante) REFERENCES [PAR].[tblEstudiantes](id_Estudiante) ON DELETE NO ACTION
)
GO

IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'Version' AND xtype='U')
	DROP TABLE [PAR].[Version]
GO
	
CREATE TABLE [PAR].[Version]
(
	id int identity(1,1) NOT NULL, 
	-- Ejemplo de version: 1.0.0
	version varchar(20) NOT NULL,
	comentario varchar(200) NULL, 
	fecha datetime NOT NULL DEFAULT GETDATE(),
	CONSTRAINT pk_Version PRIMARY KEY(id),
	CONSTRAINT un_version UNIQUE (version)
)
GO


IF EXISTS(SELECT name FROM ProyectoFinalSoftwareII..sysobjects WHERE name = N'tblAgregarNotas' AND xtype='U')
	DROP TABLE [PAR].[tblAgregarNotas]
GO
	
CREATE TABLE [PAR].[tblAgregarNotas]
(
	id_AgregarNotas		int IDENTITY(1,1) NOT NULL, 
	id_Grupo			int NOT NULL,
	id_ParametroNota	int NOT NULL,
	nota				int NOT NULL,
	estado				int NOT NULL,
	concurrencia_id		int NOT NULL,
	CONSTRAINT pk_tblAgregarnotas PRIMARY KEY(id_AgregarNotas),
	CONSTRAINT fk_tblAgregarnotas_Grupo FOREIGN KEY (Id_Grupo) REFERENCES [PAR].[tblGrupos](id_Grupo) ON DELETE CASCADE,
	CONSTRAINT fk_tblAgregarnotas_ParametroNota FOREIGN KEY (Id_ParametroNota) REFERENCES [PAR].[tblParametros_Notas](id_ParametroNota) ON DELETE NO ACTION
)
GO


PRINT 'FIN CREACION DE TABLAS'
GO


PRINT 'INICIANDO CONFIGURACION DE USUARIO'

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'Erwin')
	CREATE LOGIN [Erwin] WITH PASSWORD = '123456*'
GO

CREATE USER [Erwin] FOR LOGIN [Erwin] WITH DEFAULT_SCHEMA=[dbo]
GO

GRANT CONNECT TO [Erwin]
GO

EXEC sp_addrolemember N'db_datareader', N'Erwin'
GO
EXEC sp_addrolemember N'db_datawriter', N'Erwin'
GO

GRANT EXECUTE ON SCHEMA:: DBO TO [Erwin]
GO 

GRANT EXECUTE ON SCHEMA:: PAR TO [Erwin]
GO

ALTER AUTHORIZATION ON DATABASE::ProyectoFinalSoftwareII TO [sa];
GO

PRINT 'FIN CONFIGURACION DE USUARIO'



PRINT 'CONFIGURANDO VERSION DE BASE DE DATOS'
INSERT INTO [PAR].[Version](version, comentario) VALUES('1.0.0', 'Version Inicial')
GO

USE [SegundoExamenSoftwareII]
GO