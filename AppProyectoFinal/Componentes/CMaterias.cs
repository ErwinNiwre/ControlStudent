using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Entidades;

namespace Componentes
{
    public class CMaterias: DAl.CAD
    {
        private DbDataAdapter adaProxy;
        private string mstrDBKEY;

        public CMaterias(string strDBkey)
        {
            mstrDBKEY = strDBkey;
            adaProxy = this.CrearAdaptador("PAR.tblMaterias", strDBkey);
        }

        public DataSet materiasGetAll()
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value =ClaseEstatica.IdDocente;
            pEvento2.ParameterName = "@idDocente";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.Materias_GetAll", this.mstrDBKEY, lstParam));
        }

        public DataSet carrerasGetAll()
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = ClaseEstatica.IdDocente;
            pEvento2.ParameterName = "@id";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.CarrerasGetAll", this.mstrDBKEY, lstParam));
        }


        public DataSet materiasGetAll2()
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = ClaseEstatica.IdDocente;
            pEvento2.ParameterName = "@id";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.MateriasGetAll2", this.mstrDBKEY, lstParam));
        }


    }
}
