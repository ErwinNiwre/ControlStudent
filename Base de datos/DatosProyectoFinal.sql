-- =============================================
-- Autor:			Erwin Justiniano
-- Fecha:			31/10/2013
-- Descripción:		Carga de datos
-- Versión:			1.0.0
-- =============================================

USE ProyectoFinalSoftwareII
GO

PRINT 'INICIANDO CARGA DE DATOS BASE'

BEGIN TRANSACTION

DELETE FROM [PAR].[tblAsistencias]
DELETE FROM [PAR].[tblCarreras]
DELETE FROM [PAR].[tblDocentes]
DELETE FROM [PAR].[tblEstudiantes]
DELETE FROM [PAR].[tblGrupos]
DELETE FROM [PAR].[tblMaterias]
DELETE FROM [PAR].[tblNotas]
DELETE FROM [PAR].[tblParametros_Notas]
DELETE FROM [PAR].[tblPersonas]
DELETE FROM [PAR].[tblRegistros]


PRINT 'INICIANDO CARGA DATOS TABLA PERSONAS'
SET IDENTITY_INSERT PAR.tblPersonas ON
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(1,1254012,'Erwin','justiniano','Av.santos dumont Nro 70','justinianoerwin@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(2,3625487,'Eduardo','Flores','Av.Banzer, calle 4 Nro 20','eduardofc24@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(3,0124578,'Sergio','Gonzales','4to anillo virgen de cotoca Nro 90','sergio.estenssoro@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(4,3698569,'Melgar','Mendes','Av.Melchor pinto esq. warnes Nro 45','ju@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(5,2501468,'Mateo','Avila','Av.Beni calle 3 Nro 2','justinianoerwin@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(6,9653247,'Danny','Reyes','Av.Roca y coronado Nro 45','justinianoerwin@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(7,8032154,'Juan','Marto','5to anillo canal isuto, calle 5 Nro 40','justinianoerwin@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(8,4102358,'Karlos','Aguilar','Radial 27 5to anillo, calle los vederdes Nro 27','ju@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(9,1111111,'Diana','Cardona','Av.Los penocos Nro 45','ju@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(10,3336528,'David','Chavez','Av.Mutualista calle 5 Nro 60','ju@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(11,1235468,'Ing.Erwin','Justiniano','Av.santos dumont','justinianoerwin@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(12,1002455,'Lic.Jose','Arnkal','Calle Los jairos','mano@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(13,0221356,'Ing.Edson','Castellon','Av.Mexico','edsoncastellon@gmail.com',NULL,0)
INSERT INTO PAR.tblPersonas(id_Persona,nit,nombre, apellido, direccion,correo,foto,concurrencia_id) values(14,6699854,'Lic.Marcos','Zoth','Las Rentas','jut@gmail.com',NULL,0)
SET IDENTITY_INSERT PAR.tblPersonas OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA PERSONAS'



PRINT 'INICIANDO CARGA DATOS TABLA DOCENTES'
SET IDENTITY_INSERT PAR.tblDocentes ON
INSERT INTO PAR.tblDocentes(id_Docente,Id_Persona,contraseña,concurrencia_id) values(1,11,convert(varbinary(255), pwdencrypt ('erwin')),0)
INSERT INTO PAR.tblDocentes(id_Docente,Id_Persona,contraseña,concurrencia_id) values(2,12,convert(varbinary(255), pwdencrypt ('erwin')),0)
INSERT INTO PAR.tblDocentes(id_Docente,Id_Persona,contraseña,concurrencia_id) values(3,13,convert(varbinary(255), pwdencrypt ('erwin')),0)
INSERT INTO PAR.tblDocentes(id_Docente,Id_Persona,contraseña,concurrencia_id) values(4,14,convert(varbinary(255), pwdencrypt ('erwin')),0)
SET IDENTITY_INSERT PAR.tblDocentes OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA DOCENTES'



PRINT 'INICIANDO CARGA DATOS TABLA ESTUDIANTES'
SET IDENTITY_INSERT PAR.tblEstudiantes ON
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(1,1,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(2,2,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(3,3,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(4,4,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(5,5,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(6,6,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(7,7,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(8,8,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(9,9,0)
INSERT INTO PAR.tblEstudiantes(id_Estudiante,Id_Persona,concurrencia_id) values(10,10,0)
SET IDENTITY_INSERT PAR.tblEstudiantes OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA ESTUDIANTES'


PRINT 'INICIANDO CARGA DATOS TABLA MATERIAS'
SET IDENTITY_INSERT PAR.tblMaterias ON
INSERT INTO PAR.tblMaterias(id_Materia,nombre,sigla,concurrencia_id) values(1,'Base de datos I',1,0)
INSERT INTO PAR.tblMaterias(id_Materia,nombre,sigla,concurrencia_id) values(2,'Base de datos II',1,0)
INSERT INTO PAR.tblMaterias(id_Materia,nombre,sigla,concurrencia_id) values(3,'Ingenieria de software II',1,0)
INSERT INTO PAR.tblMaterias(id_Materia,nombre,sigla,concurrencia_id) values(4,'Ingenieria de software III',1,0)
INSERT INTO PAR.tblMaterias(id_Materia,nombre,sigla,concurrencia_id) values(5,'Calculo II',1,0)
INSERT INTO PAR.tblMaterias(id_Materia,nombre,sigla,concurrencia_id) values(6,'Investigacion Operativa',1,0)
SET IDENTITY_INSERT PAR.tblMaterias OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA MATERIAS'


PRINT 'INICIANDO CARGA DATOS TABLA CARRERAS'
SET IDENTITY_INSERT PAR.tblCarreras ON
INSERT INTO PAR.tblCarreras(id_Carrera,nombre,concurrencia_id) values(1,'Ingenieria De Sistemas',1)
SET IDENTITY_INSERT PAR.tblCarreras OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA CARRERAS'


PRINT 'INICIANDO CARGA DATOS TABLA GRUPOS'
SET IDENTITY_INSERT PAR.tblGrupos ON
INSERT INTO PAR.tblGrupos(id_Grupo,id_materia,id_docente,gestion,grupo,estado,concurrencia_id) values(1,3,3,'2013-02-05','Ing.Software II',0,0)
INSERT INTO PAR.tblGrupos(id_Grupo,id_materia,id_docente,gestion,grupo,estado,concurrencia_id) values(2,4,1,'2013-02-05','Ing.Software III',0,0)
INSERT INTO PAR.tblGrupos(id_Grupo,id_materia,id_docente,gestion,grupo,estado,concurrencia_id) values(3,1,3,'2013-02-05','Base de datos I',0,0)
INSERT INTO PAR.tblGrupos(id_Grupo,id_materia,id_docente,gestion,grupo,estado,concurrencia_id) values(4,2,3,'2013-02-05','Base de datos II',0,0)
INSERT INTO PAR.tblGrupos(id_Grupo,id_materia,id_docente,gestion,grupo,estado,concurrencia_id) values(5,6,2,'2013-02-05','Investigacion Operativa',0,0)
INSERT INTO PAR.tblGrupos(id_Grupo,id_materia,id_docente,gestion,grupo,estado,concurrencia_id) values(6,5,4,'2013-02-05','Calculo II',0,0)
SET IDENTITY_INSERT PAR.tblGrupos OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA GRUPOS'


PRINT 'INICIANDO CARGA DATOS TABLA REGISTROS'
SET IDENTITY_INSERT PAR.tblRegistros ON
-- GRUPO ING.SOFTWARE II
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(1,1,1,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(2,1,2,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(3,1,3,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(4,1,4,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(5,1,5,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(6,1,6,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(7,1,7,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(8,1,8,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(9,1,9,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(10,1,10,1,0)
-- GRUPO ING.SOFTWARE III
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(11,2,6,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(12,2,8,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(13,2,10,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(14,2,1,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(15,2,9,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(16,2,7,1,0)
-- GRUPO BASE DE DATOS I
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(17,3,4,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(18,3,2,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(19,3,5,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(20,3,7,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(21,3,3,1,0)
-- GRUPO BASE DE DATOS II
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(22,4,5,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(23,4,7,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(24,4,6,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(25,4,3,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(26,4,1,1,0)
-- GRUPO INVESTIGACION OPERATIVA
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(27,5,10,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(28,5,1,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(29,5,6,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(30,5,7,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(31,5,8,1,0)
-- GRUPO CALCULO II
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(32,6,1,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(33,6,2,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(34,6,3,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(35,6,4,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(36,6,5,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(37,6,6,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(38,6,7,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(39,6,8,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(40,6,9,1,0)
INSERT INTO PAR.tblRegistros(id_Registro,id_Grupo,id_Estudiante,id_Carrera,concurrencia_id) values(41,6,10,1,0)
SET IDENTITY_INSERT PAR.tblRegistros OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA REGISTROS'


PRINT 'INICIANDO CARGA DATOS TABLA PARAMETROS_NOTAS'
SET IDENTITY_INSERT PAR.tblParametros_Notas ON
INSERT INTO PAR.tblParametros_Notas(id_ParametroNota,observacion,concurrencia_id) values(1,'1er Parcial',0)
INSERT INTO PAR.tblParametros_Notas(id_ParametroNota,observacion,concurrencia_id) values(2,'2er Parcial',0)
INSERT INTO PAR.tblParametros_Notas(id_ParametroNota,observacion,concurrencia_id) values(3,'3er Parcial',0)
INSERT INTO PAR.tblParametros_Notas(id_ParametroNota,observacion,concurrencia_id) values(4,'Practicos',0)
INSERT INTO PAR.tblParametros_Notas(id_ParametroNota,observacion,concurrencia_id) values(5,'Investgacion',0)
SET IDENTITY_INSERT PAR.tblParametros_Notas OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA PARAMETROS_NOTAS'


PRINT 'INICIANDO CARGA DATOS TABLA ASISTENCIA'
SET IDENTITY_INSERT PAR.tblAsistencias ON
--GRUPO DE ING.CASTELLON
INSERT INTO PAR.tblAsistencias(id_Asistencia,id_grupo,fecha,concurrencia_id) values (1,1,'2013-11-02',0)
INSERT INTO PAR.tblAsistencias(id_Asistencia,id_grupo,fecha,concurrencia_id) values (2,3,'2013-11-03',0)
INSERT INTO PAR.tblAsistencias(id_Asistencia,id_grupo,fecha,concurrencia_id) values (3,4,'2013-11-04',0)

--GRUPO DE ING.ERWIN
INSERT INTO PAR.tblAsistencias(id_Asistencia,id_grupo,fecha,concurrencia_id) values (4,2,'2013-11-04',0)

--GRUPO DE LIC.MARCOS
INSERT INTO PAR.tblAsistencias(id_Asistencia,id_grupo,fecha,concurrencia_id) values (5,6,'2013-11-03',0)

SET IDENTITY_INSERT PAR.tblAsistencias OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA ASISTENCIA'


PRINT 'INICIANDO CARGA DATOS TABLA DETALLE_ASISTENCIA'
SET IDENTITY_INSERT PAR.tblDetalle_Asistencias ON
--GRUPO DE ING.CASTELLON - ING.SOFTWARE II
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(1,1,1,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(2,1,2,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(3,1,3,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(4,1,4,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(5,1,5,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(6,1,6,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(7,1,7,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(8,1,8,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(9,1,9,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(10,1,10,1,0)
--GRUPO DE ING.CASTELLON - BASE DE DATOS I
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(11,2,4,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(12,2,2,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(13,2,5,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(14,2,7,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(15,2,3,0,0)
--GRUPO DE ING.CASTELLON - BASE DE DATOS I
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(16,3,5,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(17,3,7,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(18,3,6,0,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(19,3,3,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(20,3,1,1,0)
--GRUPO DE ING.ERWIN - ING.SOFTWARE III
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(21,4,6,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(22,4,8,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(23,4,10,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(24,4,1,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(25,4,9,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(26,4,7,1,0)
--GRUPO DE Lic.Marcos - CALCULO II
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(27,5,1,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(28,5,2,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(29,5,3,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(30,5,4,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(31,5,5,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(32,5,6,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(33,5,7,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(34,5,8,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(35,5,9,1,0)
INSERT INTO PAR.tblDetalle_Asistencias(id_Detalle_Asistencia,id_Asistencia,id_Estudiante,Asistio,concurrencia_id)values(36,5,10,1,0)

SET IDENTITY_INSERT PAR.tblDetalle_Asistencias OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA DETALE_ASISTENCIA'


PRINT 'INICIANDO CARGA DATOS TABLA AGREGARNOTAS'
SET IDENTITY_INSERT PAR.tblAgregarNotas ON
INSERT INTO PAR.tblAgregarNotas(id_AgregarNotas,id_Grupo,id_ParametroNota,nota,estado,concurrencia_id) values(1,4,1,20,1,1)
INSERT INTO PAR.tblAgregarNotas(id_AgregarNotas,id_Grupo,id_ParametroNota,nota,estado,concurrencia_id) values(2,4,2,20,0,0)
INSERT INTO PAR.tblAgregarNotas(id_AgregarNotas,id_Grupo,id_ParametroNota,nota,estado,concurrencia_id) values(3,4,3,20,0,0)
INSERT INTO PAR.tblAgregarNotas(id_AgregarNotas,id_Grupo,id_ParametroNota,nota,estado,concurrencia_id) values(4,4,4,20,0,0)
INSERT INTO PAR.tblAgregarNotas(id_AgregarNotas,id_Grupo,id_ParametroNota,nota,estado,concurrencia_id) values(5,4,5,20,0,0)


SET IDENTITY_INSERT PAR.tblAgregarNotas OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA AGREGARNOTAS'



PRINT 'INICIANDO CARGA DATOS TABLA NOTAS'
SET IDENTITY_INSERT PAR.tblNotas ON
INSERT INTO PAR.tblNotas(id_Nota,id_Grupo,id_ParametroNota,fecha,estado,concurrencia_id) values (1,4,1,'2013-11-23',0,0)
SET IDENTITY_INSERT PAR.tblNotas OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA NOTAS'


PRINT 'INICIANDO CARGA DATOS TABLA DETALLE_NOTAS'
SET IDENTITY_INSERT PAR.tblDetalle_Notas ON
INSERT INTO PAR.tblDetalle_Notas(id_DetalleNota,id_Nota,id_Estudiante,nota,concurrencia_id) values(1,1,5,10,0);
INSERT INTO PAR.tblDetalle_Notas(id_DetalleNota,id_Nota,id_Estudiante,nota,concurrencia_id) values(2,1,7,10,0);
INSERT INTO PAR.tblDetalle_Notas(id_DetalleNota,id_Nota,id_Estudiante,nota,concurrencia_id) values(3,1,6,10,0);
INSERT INTO PAR.tblDetalle_Notas(id_DetalleNota,id_Nota,id_Estudiante,nota,concurrencia_id) values(4,1,3,10,0);
INSERT INTO PAR.tblDetalle_Notas(id_DetalleNota,id_Nota,id_Estudiante,nota,concurrencia_id) values(5,1,1,8,0);
SET IDENTITY_INSERT PAR.tblDetalle_Notas OFF
PRINT 'FINALIZANDO CARGA DATOS TABLA DETALE_NOTAS'

COMMIT