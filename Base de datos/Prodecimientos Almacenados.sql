-- =============================================
-- Autor:			Erwin Justiniano
-- Fecha:			31/10/2013
-- Descripción:		Procedimientos Almacenados
-- Versión:			1.0.0
-- =============================================

USE ProyectoFinalSoftwareII
GO

PRINT 'INICIANDO PROCEDIMIENTOS ALMACENADOS'



PRINT 'CREANDO PROCEDIMIENTO GRUPOS_GETNOMBREGRUPO'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Grupos_GetNombreGrupo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Grupos_GetNombreGrupo]
END
GO

CREATE PROCEDURE [PAR].[Grupos_GetNombreGrupo]
@id	int
AS
BEGIN
	SELECT  id_Grupo, grupo
	FROM	[PAR].[tblGrupos]
	where	id_docente=@id
	and		estado=0
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO GRUPOS_GETNOMBREGRUPO'



PRINT 'CREANDO PROCEDIMIENTO PERSONAS_GETESTUDIANTES'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Personas_GetEstudiantes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Personas_GetEstudiantes]
END
GO

CREATE PROCEDURE [PAR].[Personas_GetEstudiantes]
@fecha	DATE,
@idGrupo int
AS
BEGIN
select P.nit, P.nombre, P.apellido, DA.Asistio
from PAR.tblPersonas P, PAR.tblAsistencias A, PAR.tblDetalle_Asistencias DA
where A.id_grupo = @idGrupo
and A.id_Asistencia=DA.id_Asistencia
and DA.id_Estudiante=P.id_Persona
AND A.fecha = @fecha

END
GO
PRINT 'FINALIZADO PROCEDIMIENTO PERSONAS_GETESTUDIANTES'



PRINT 'CREANDO PROCEDIMIENTO ASISTENCIA_GETALL'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Asistencia_GetAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Asistencia_GetAll]
END
GO

CREATE PROCEDURE [PAR].[Asistencia_GetAll]
AS
BEGIN
select id_Asistencia, id_grupo, fecha
from PAR.tblAsistencias
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO ASISTENCIA_GETALL'



PRINT 'CREANDO PROCEDIMIENTO PERSONAS_GETESTUDIANTESSINFECHA'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Personas_GetEstudiantesSinFecha]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Personas_GetEstudiantesSinFecha]
END
GO

CREATE PROCEDURE [PAR].[Personas_GetEstudiantesSinFecha]
@idGrupo int
AS
BEGIN
select  P.nit, P.nombre, P.apellido
from PAR.tblPersonas P, PAR.tblRegistros R
where R.id_Grupo = @idGrupo
and P.id_Persona=R.id_Estudiante
END
BEGIN
select MAX(id_Asistencia)
from PAR.tblAsistencias
END
BEGIN
select MAX(id_Nota)
from PAR.tblNotas
END
GO
/*select P.nit, P.nombre, P.apellido, DA.Asistio
from PAR.tblPersonas P, PAR.tblAsistencias A, PAR.tblDetalle_Asistencias DA
where A.id_grupo = @idGrupo
and A.id_Asistencia=DA.id_Asistencia
and DA.id_Estudiante=P.id_Persona*/
PRINT 'FINALIZADO PROCEDIMIENTO PERSONAS_GETESTUDIANTESSINFECHA'



PRINT 'CREANDO PROCEDIMIENTO ESTUDIANTES_GETBYNIT'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Estudiantes_GetByNit]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Estudiantes_GetByNit]
END
GO

CREATE PROCEDURE [PAR].[Estudiantes_GetByNit]
@nit int
AS
BEGIN
select E.id_Estudiante
from PAR.tblEstudiantes E, PAR.tblPersonas P
where E.Id_Persona = P.id_Persona
AND	  P.nit = @nit
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO ESTUDIANTES_GETBYNIT'




PRINT 'CREANDO PROCEDIMIENTO CORREOESTUDIANTES_GETBYGRUPO'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[CorreoEstudiante_GetByGrupo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[CorreoEstudiante_GetByGrupo]
END
GO

CREATE PROCEDURE [PAR].[CorreoEstudiante_GetByGrupo]
@idGrupo int
AS
BEGIN
select P.correo
from   PAR.tblRegistros R, PAR.tblPersonas P
where  P.id_Persona = R.id_Estudiante
and	   R.id_Grupo=@idGrupo;
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO CORREOESTUDIANTES_GETBYGRUPO'




PRINT 'CREANDO PROCEDIMIENTO PARAMETRONOTA_GETALL'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[ParametroNota_GetAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[ParametroNota_GetAll]
END
GO

CREATE PROCEDURE [PAR].[ParametroNota_GetAll]
@idGrupo int
AS
BEGIN
select	PN.id_ParametroNota,PN.observacion
from	PAR.tblParametros_Notas PN, PAR.tblAgregarNotas AN
where	PN.id_ParametroNota=AN.id_ParametroNota
and		AN.id_Grupo=@idGrupo
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO PARAMETRONOTA_GETALL'



PRINT 'CREANDO PROCEDIMIENTO PARAMETRONOTA_GETALL2'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[ParametroNota_GetAll2]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[ParametroNota_GetAll2]
END
GO

CREATE PROCEDURE [PAR].[ParametroNota_GetAll2]
@id int
AS
BEGIN
select	*
from	PAR.tblParametros_Notas
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO PARAMETRONOTA_GETALL2'





PRINT 'CREANDO PROCEDIMIENTO DOCENTEGETID_BYNIT'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[DocenteGetId_ByNit]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[DocenteGetId_ByNit]
END
GO

CREATE PROCEDURE [PAR].[DocenteGetId_ByNit]
@nit	int
AS
BEGIN
select D.id_Docente
from PAR.tblDocentes D, PAR.tblPersonas P
where D.Id_Persona=P.id_Persona
and P.nit=@nit
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO DOCENTEGETID_BYNIT'




PRINT 'CREANDO PROCEDIMIENTO DOCENTE_GETCONTRASEÑÁ'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Docente_GetContraseña]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Docente_GetContraseña]
END
GO

CREATE PROCEDURE [PAR].[Docente_GetContraseña]
@Usuario	int,
@contraseña varchar(255),
@error		int=0 OUTPUT
AS
BEGIN
if exists( select P.nit,D.contraseña
from   PAR.tblDocentes D, PAR.tblPersonas P
where  D.Id_Persona=P.id_Persona
and P.nit=@Usuario
and 1=PWDCOMPARE(@contraseña,D.contraseña,0))
select 1
else
select 0
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO DOCENTE_GETCONTRASEÑÁ'




PRINT 'CREANDO PROCEDIMIENTO NOTASASIGNADAPORDOCENTE_GETNOTA'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[NotaAsignadaPorDocente_GetNota]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[NotaAsignadaPorDocente_GetNota]
END
GO

CREATE PROCEDURE [PAR].[NotaAsignadaPorDocente_GetNota]
@idParametroNota int,
@idGrupo		 int
AS
BEGIN
select AN.nota
from   PAR.tblAgregarNotas AN
where  AN.id_ParametroNota=@idParametroNota
AND	   AN.id_Grupo=@idGrupo
AND	   AN.estado=0
END
BEGIN
select	AN.nota
from	PAR.tblAgregarNotas AN
where	AN.id_Grupo=@idGrupo
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO NOTASASIGNADAPORDOCENTE_GETNOTA'




PRINT 'CREANDO PROCEDIMIENTO NOTA_GETID'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Nota_GetId]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Nota_GetId]
END
GO

CREATE PROCEDURE [PAR].[Nota_GetId]
@idParametroNota int,
@idGrupo		 int
AS
BEGIN
select id_Nota
from PAR.tblNotas
where id_Grupo=@idGrupo
and id_ParametroNota=@idParametroNota
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO NOTA_GETID'



PRINT 'CREANDO PROCEDIMIENTO MATERIAS_GETALL'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Materias_GetAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Materias_GetAll]
END
GO

CREATE PROCEDURE [PAR].[Materias_GetAll]
@idDocente		 int
AS
BEGIN
select M.id_Materia,M.nombre
from PAR.tblMaterias M,PAR.tblGrupos G
where M.id_Materia=G.id_materia
and G.id_docente=@idDocente
order by M.id_Materia
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO MATERIAS_GETALL'




PRINT 'CREANDO PROCEDIMIENTO ESTUDIANTESGETBYGRUPO'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[EstudiantesGetByGrupo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[EstudiantesGetByGrupo]
END
GO

CREATE PROCEDURE [PAR].[EstudiantesGetByGrupo]
@idGrupo		 int
AS
BEGIN
select P.nit , P.nombre, P.apellido, P.correo, P.direccion
from PAR.tblEstudiantes E, PAR.tblPersonas P, PAR.tblRegistros R
where E.Id_Persona=P.id_Persona
and E.id_Estudiante=R.id_Estudiante
and R.id_Grupo=@idGrupo
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO ESTUDIANTESGETBYGRUPO'




PRINT 'CREANDO PROCEDIMIENTO EVALUACIONESTUDIANTES'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[EvaluacionEstudiantes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[EvaluacionEstudiantes]
END
GO

CREATE PROCEDURE [PAR].[EvaluacionEstudiantes]
@idGrupo		 int,
@idParametroNota int
AS
BEGIN
select P.nit,P.nombre,P.apellido,DN.nota,AN.nota
from PAR.tblEstudiantes E, PAR.tblPersonas P, PAR.tblDetalle_Notas DN, PAR.tblNotas N,PAR.tblParametros_Notas PN, par.tblAgregarNotas AN
where E.Id_Persona=P.id_Persona
and   E.id_Estudiante=DN.id_Estudiante
and	  N.id_Nota=DN.id_Nota
and	  N.id_ParametroNota=PN.id_ParametroNota
and   PN.id_ParametroNota=@idParametroNota
and   N.id_Grupo=@idGrupo
and	  AN.id_Grupo=@idGrupo
and	  AN.id_ParametroNota=@idParametroNota
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO EVALUACIONESTUDIANTES'




PRINT 'CREANDO PROCEDIMIENTO TAREAESTUDIANTES'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[TareaEstudiantes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[TareaEstudiantes]
END
GO

CREATE PROCEDURE [PAR].[TareaEstudiantes]
@idGrupo		 int
AS
BEGIN
select PE.id_grupo, PE.nombreArchivo, PE.tamaño, PE.fecha
from PAR.tblParametros_Estudiantes PE
where PE.id_grupo=@idGrupo
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO TAREAESTUDIANTES'



PRINT 'CREANDO PROCEDIMIENTO NOTATOTALESTUDIANTE'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[NotaTotalEstudiante]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[NotaTotalEstudiante]
END
GO

CREATE PROCEDURE [PAR].[NotaTotalEstudiante]
@idGrupo		 int
AS
BEGIN
select P.nit, P.nombre, P.apellido, sum(DN.nota) as Nota
from PAR.tblNotas N, PAR.tblDetalle_Notas DN, PAR.tblEstudiantes E, PAR.tblPersonas p
where N.id_Nota=DN.id_Nota
and E.Id_Persona=p.id_Persona
and E.id_Estudiante=DN.id_Estudiante
and N.id_Grupo=@idGrupo
group by P.nit, P.nombre, P.apellido
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO NOTATOTALESTUDIANTE'



PRINT 'CREANDO PROCEDIMIENTO DOCENTESGETALL'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[DocentesGetAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[DocentesGetAll]
END
GO

CREATE PROCEDURE [PAR].[DocentesGetAll]
@id		 int
AS
BEGIN
select P.nit,P.nombre,P.apellido
from PAR.tblDocentes D, PAR.tblPersonas P
where D.Id_Persona=P.id_Persona
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO DOCENTESGETALL'



PRINT 'CREANDO PROCEDIMIENTO CARRERASGETALL'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[CarrerasGetAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[CarrerasGetAll]
END
GO

CREATE PROCEDURE [PAR].[CarrerasGetAll]
@id		 int
AS
BEGIN
select C.id_Carrera,C.nombre
from PAR.tblCarreras C

END
GO
PRINT 'FINALIZADO PROCEDIMIENTO CARRERASGETALL'



PRINT 'CREANDO PROCEDIMIENTO MATERIASGETALL2'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[MateriasGetAll2]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[MateriasGetAll2]
END
GO

CREATE PROCEDURE [PAR].[MateriasGetAll2]
@id		 int
AS
BEGIN
select M.id_Materia, M.nombre
from PAR.tblMaterias M

END
GO
PRINT 'FINALIZADO PROCEDIMIENTO MATERIASGETALL2'


PRINT 'CREANDO PROCEDIMIENTO NOTASADMINISTRADAS'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[NotasAdministradas]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[NotasAdministradas]
END
GO

CREATE PROCEDURE [PAR].[NotasAdministradas]
@idGrupo		 int
AS
BEGIN
select PN.id_ParametroNota, PN.observacion, AN.nota
from PAR.tblAgregarNotas AN, PAR.tblParametros_Notas PN
WHERE AN.id_Grupo=@idGrupo
AND AN.id_ParametroNota=PN.id_ParametroNota
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO NOTASADMINISTRADAS'




PRINT 'CREANDO PROCEDIMIENTO TIPOEVALUACIONESTUDIANTES'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[TipoEvaluacionEstudiantes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[TipoEvaluacionEstudiantes]
END
GO

CREATE PROCEDURE [PAR].[TipoEvaluacionEstudiantes]
@idGrupo		 int
AS
BEGIN
select PN.id_ParametroNota, Pn.observacion
from PAR.tblAgregarNotas AN, par.tblParametros_Notas PN
where AN.id_ParametroNota=PN.id_ParametroNota
and AN.estado=1
AND AN.id_Grupo=@idGrupo
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO TIPOEVALUACIONESTUDIANTES'



PRINT 'CREANDO PROCEDIMIENTO GRUPOSGETALL'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[GruposGetAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[GruposGetAll]
END
GO

CREATE PROCEDURE [PAR].[GruposGetAll]
@id		 int
AS
BEGIN
select G.id_Grupo, G.grupo
from PAR.tblGrupos G
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO GRUPOSGETALL'



PRINT 'CREANDO PROCEDIMIENTO ASISTENCIAESTUDIANTES'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[AsistenciaEstudiantes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[AsistenciaEstudiantes]
END
GO

CREATE PROCEDURE [PAR].[AsistenciaEstudiantes]
@idGrupo		 int
AS
BEGIN
select P.nit, P.nombre, P.apellido, COUNT(P.nombre) as faltas
from PAR.tblDetalle_Asistencias DA, PAR.tblAsistencias A,PAR.tblEstudiantes E, PAR.tblPersonas P
where DA.id_Asistencia=A.id_Asistencia
and E.Id_Persona=P.id_Persona
and E.id_Estudiante=DA.id_Estudiante
and A.id_grupo=@idGrupo
and DA.Asistio=0
group by P.nit, P.nombre, P.apellido
order by P.nombre asc
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO ASISTENCIAESTUDIANTES'



PRINT 'CREANDO PROCEDIMIENTO DOCENTE_ACTUALIZARCONTRASEÑA'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Docente_ActualizarContraseña]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Docente_ActualizarContraseña]
END
GO

CREATE PROCEDURE [PAR].[Docente_ActualizarContraseña]
@contraseña			varchar(255),
@idDocente			int,
@concurrencia_id	int
AS
DECLARE @concurrencia int
BEGIN
SET @concurrencia=(SELECT concurrencia_id from PAR.tblDocentes WHERE id_Docente=@idDocente);
IF (@concurrencia=@concurrencia_id)
	BEGIN
	SET @concurrencia=@concurrencia+1;
	update PAR.tblDocentes 
	set contraseña=convert(varbinary(255), pwdencrypt (@contraseña)) 
	where id_Docente=@idDocente;
	END
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO DOCENTE_ACTUALIZARCONTRASEÑA'



PRINT 'CREANDO PROCEDIMIENTO ACTUALIZARESTADONOTA'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[ActualizarEstadoNota]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[ActualizarEstadoNota]
END
GO

CREATE PROCEDURE [PAR].[ActualizarEstadoNota]
@idParametroNota int,
@idGrupo		 int,
@concurrencia_id int
AS
DECLARE @concurrencia int
BEGIN
SET @concurrencia=(SELECT concurrencia_id from PAR.tblAgregarNotas WHERE id_ParametroNota=@idParametroNota and id_Grupo=@idGrupo);
IF (@concurrencia=@concurrencia_id)
	BEGIN
	SET @concurrencia=@concurrencia+1;
	Update PAR.tblAgregarNotas set estado=1 
	where id_ParametroNota=@idParametroNota 
	and id_Grupo=@idGrupo
	END
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO ACTUALIZARESTADONOTA'



PRINT 'CREANDO PROCEDIMIENTO ASISTENCIA_INSERTAR'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Asistencia_Insertar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Asistencia_Insertar]
END
GO

CREATE PROCEDURE [PAR].[Asistencia_Insertar]
@idAsistencia			int OUTPUT,
@idGrupo				int,
@fecha					DATE,
@concurrencia_id		int
AS
BEGIN
INSERT INTO [PAR].[tblAsistencias](id_grupo,fecha,concurrencia_id) values (@idGrupo,@fecha,@concurrencia_id)
SET @idAsistencia = SCOPE_IDENTITY() 
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO ASISTENCIA_INSERTAR'



PRINT 'CREANDO PROCEDIMIENTO DETALLEASISTENCIA_INSERTAR'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[DetalleAsistencia_Insertar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[DetalleAsistencia_Insertar]
END
GO

CREATE PROCEDURE [PAR].[DetalleAsistencia_Insertar]
@idDetalleAsistencia	int OUTPUT,
@idAsistencia			int,
@estudiante				int,
@asistio				bit,
@concurrencia_id		int
AS
BEGIN
INSERT INTO [PAR].[tblDetalle_Asistencias](id_Asistencia,id_Estudiante,Asistio,concurrencia_id) values (@idAsistencia,@estudiante,@asistio,@concurrencia_id)
SET @idDetalleAsistencia = SCOPE_IDENTITY() 
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO DETALLEASISTENCIA_INSERTAR'


PRINT 'CREANDO PROCEDIMIENTO TAREAS_INSERTAR'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[Tareas_Insertar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[Tareas_Insertar]
END
GO

CREATE PROCEDURE [PAR].[Tareas_Insertar]
@idParametroAlumno	int OUTPUT,
@idGrupo			int,
@nombreArchivo		nvarchar(100),
@tipoContenido		varchar(50),
@tamaño				varchar(50),
@dato				varbinary(max),
@fecha				DATE,
@concurrencia_id	int=0
AS
DECLARE @Concurrencia int
BEGIN
INSERT INTO [PAR].[tblParametros_Estudiantes](id_grupo,nombreArchivo,tipoContenido,tamaño,Dato,fecha,concurrencia_ID) values (@idGrupo,@nombreArchivo,@tipoContenido,@tamaño,@dato,@fecha,@concurrencia_id)
SET @idParametroAlumno = SCOPE_IDENTITY() 
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO TAREAS_INSERTAR'




PRINT 'CREANDO PROCEDIMIENTO AgregarNotas_INSERTAR'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[AgregarNotas_Insertar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[AgregarNotas_Insertar]
END
GO

CREATE PROCEDURE [PAR].[AgregarNotas_Insertar]
@idAgregarNotas		int output,
@idGrupo			int,
@idParametroNota	int,
@nota				int,
@estado				int,
@concurrencia_id	int
AS
BEGIN
INSERT INTO [PAR].[tblAgregarNotas](id_grupo,id_parametroNota,nota,estado,concurrencia_id) values (@idGrupo,@idParametroNota,@nota,@estado,@concurrencia_id)
SET @idAgregarNotas = SCOPE_IDENTITY() 
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO AgregarNotas_INSERTAR'



PRINT 'CREANDO PROCEDIMIENTO NOTASALUMNOS_INSERTAR'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[NotasAlumnos_Insertar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[NotasAlumnos_Insertar]
END
GO

CREATE PROCEDURE [PAR].[NotasAlumnos_Insertar]
@idNota				int output,
@idGrupo			int,
@idParametroNota	int,
@fecha				Date,
@estado				int,
@concurrencia_id	int
AS
BEGIN
INSERT INTO [PAR].[tblNotas](id_Grupo,id_ParametroNota,fecha, estado, concurrencia_id) values (@idGrupo,@idParametroNota,@fecha,@estado,@concurrencia_id)
SET @idNota = SCOPE_IDENTITY() 
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO NOTASALUMNOS_INSERTAR'




PRINT 'CREANDO PROCEDIMIENTO DETALLEANOTA_INSERTAR'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[PAR].[DetalleNota_Insertar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [PAR].[DetalleNota_Insertar]
END
GO

CREATE PROCEDURE [PAR].[DetalleNota_Insertar]
@idDetalleNota				int OUTPUT,
@idNota						int,
@idEstudiante				int,
@nota						int,
@concurrencia_id			int
AS
BEGIN
INSERT INTO [PAR].[tblDetalle_Notas](id_Nota,id_Estudiante,nota,concurrencia_id) values (@idNota,@idEstudiante,@nota,@concurrencia_id)
SET @idDetalleNota = SCOPE_IDENTITY() 
END
GO
PRINT 'FINALIZADO PROCEDIMIENTO DETALLENOTA_INSERTAR'




PRINT 'FINALIZANDO PROCEDIMIENTOS ALMACENADOS'

