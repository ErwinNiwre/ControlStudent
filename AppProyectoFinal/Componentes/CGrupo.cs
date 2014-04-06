using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Entidades;

namespace Componentes
{
    public class CGrupo : DAl.CAD
    {
        private DbDataAdapter adaProxy;
        private string mstrDBKEY;

        public CGrupo(string strDBkey)
        {
            mstrDBKEY = strDBkey;
            adaProxy = this.CrearAdaptador("PAR.tblGrupos", strDBkey);
        }

        #region Insert,Update,Delete
        
        #endregion

        #region MetodosConsular

        public DataSet ConsultarGrupo()
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = Entidades.ClaseEstatica.IdDocente;
            pEvento.ParameterName = "@id";
            pEvento.DbType = DbType.Int16;
            lstParam.Add(pEvento);

            return (this.EjecutarConsulta("PAR.Grupos_GetNombreGrupo", this.mstrDBKEY, lstParam));
        }

        public DataSet ConsultarEstudiantes(Grupo grup, DateTime time)
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = time.ToString("yyy-MM-dd");
            pEvento.ParameterName = "@fecha";
            pEvento.DbType = DbType.Date;
            lstParam.Add(pEvento);

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grup.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.Personas_GetEstudiantes", this.mstrDBKEY, lstParam));
        }

        public DataSet ConsultarEstudiantesSinFecha(Grupo grup)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grup.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.Personas_GetEstudiantesSinFecha", this.mstrDBKEY, lstParam));
        }

        public DataSet CorreosEstudiantes_GetByGrupo(Grupo grupo)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grupo.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.CorreoEstudiante_GetByGrupo", this.mstrDBKEY, lstParam));
        }

        public DataSet EstudiantesGetByGrupo(Grupo grupo)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grupo.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.EstudiantesGetByGrupo", this.mstrDBKEY, lstParam));
        }

        public DataSet TipoEvaluacionEstudiantes(Grupo grupo)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grupo.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.TipoEvaluacionEstudiantes", this.mstrDBKEY, lstParam));
        }

        public DataSet EvaluacionEstudiantes(Grupo grupo)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grupo.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            DbParameter pEvento3 = this.CrearParametros();
            pEvento3.Value = grupo.IdMateria;
            pEvento3.ParameterName = "@idParametroNota";
            pEvento3.DbType = DbType.Int16;
            lstParam.Add(pEvento3);

            return (this.EjecutarConsulta("PAR.EvaluacionEstudiantes", this.mstrDBKEY, lstParam));
        }

        public DataSet AsistenciaEstudiantes(Grupo grupo)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grupo.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.AsistenciaEstudiantes", this.mstrDBKEY, lstParam));
        }

        public DataSet NotaTotalEstudiante(Grupo grupo)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grupo.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.NotaTotalEstudiante", this.mstrDBKEY, lstParam));
        }

        public DataSet NotasAdministradas(Grupo grupo)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grupo.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.NotasAdministradas", this.mstrDBKEY, lstParam));
        }

        public DataSet GruposGetAll()
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = ClaseEstatica.IdDocente;
            pEvento2.ParameterName = "@id";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.GruposGetAll", this.mstrDBKEY, lstParam));
        }
        #endregion
    }
}
