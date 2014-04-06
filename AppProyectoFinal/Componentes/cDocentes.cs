using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Entidades;

namespace Componentes
{
    public class cDocentes : DAl.CAD
    {
        private DbDataAdapter adaProxy;
        private string mstrDBKEY;

        public cDocentes(string strDBkey)
        {
            mstrDBKEY = strDBkey;
            adaProxy = this.CrearAdaptador("PAR.tblDocentes", strDBkey);
        }

        public DataSet contraseñaDocente(Docentes docente )
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = docente.IdDocente;
            pEvento.ParameterName = "@Usuario";
            pEvento.DbType = DbType.Int32;
            lstParam.Add(pEvento);

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = docente.Contraseña;
            pEvento2.ParameterName = "@contraseña";
            pEvento2.DbType = DbType.String;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("[PAR].[Docente_GetContraseña]", this.mstrDBKEY, lstParam));
        }


        public DataSet idDocente(Docentes docente)
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = docente.IdDocente;
            pEvento.ParameterName = "@nit";
            pEvento.DbType = DbType.Int32;
            lstParam.Add(pEvento);

            return (this.EjecutarConsulta("[PAR].[DocenteGetId_ByNit]", this.mstrDBKEY, lstParam));
        }


        public DataSet actualizarContraseña(Docentes docente)
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = docente.Contraseña;
            pEvento.ParameterName = "@contraseña";
            pEvento.DbType = DbType.String;
            lstParam.Add(pEvento);

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = docente.IdDocente;
            pEvento2.ParameterName = "@idDocente";
            pEvento2.DbType = DbType.Int32;
            lstParam.Add(pEvento2);

            DbParameter pEvento3 = this.CrearParametros();
            pEvento3.Value = docente.Concurrencia_id;
            pEvento3.ParameterName = "@concurrencia_id";
            pEvento3.DbType = DbType.Int16;
            lstParam.Add(pEvento3);

            return (this.EjecutarConsulta("PAR.Docente_ActualizarContraseña", this.mstrDBKEY, lstParam));
        }

        public DataSet DocentesGetAll()
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = 0;
            pEvento.ParameterName = "@id";
            pEvento.DbType = DbType.Int32;
            lstParam.Add(pEvento);

            return (this.EjecutarConsulta("[PAR].[DocentesGetAll]", this.mstrDBKEY, lstParam));
        }
    }
}
