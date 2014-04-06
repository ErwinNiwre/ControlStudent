using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Entidades;

namespace Componentes
{
    public class cTarea : DAl.CAD
    {
        private DbDataAdapter adaProxy;
        private string mstrDBKEY;

        public cTarea(string strDBkey)
        {
            mstrDBKEY = strDBkey;
            adaProxy = this.CrearAdaptador("PAR.tblParametros_Estudiantes", strDBkey);
        }

        public int Insertar(Tarea tarea)
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter dbpiPK = this.CrearParametros();
            dbpiPK.ParameterName = "@idParametroAlumno";
            dbpiPK.Direction = ParameterDirection.Output;
            dbpiPK.DbType = DbType.Int16;
            dbpiPK.Size = 10;
            lstParam.Add(dbpiPK);

            DbParameter par = this.CrearParametros();
            par.Value = tarea.IdGrupo;
            par.ParameterName = "@idGrupo";
            par.DbType = DbType.Int16;
            par.Size = 20;
            lstParam.Add(par);

            DbParameter par2 = this.CrearParametros();
            par2.Value = tarea.NombreArchivo;
            par2.ParameterName = "@nombreArchivo";
            par2.DbType = DbType.String;
            par2.Size = 200;
            lstParam.Add(par2);

            DbParameter par3 = this.CrearParametros();
            par3.Value = tarea.TipoContenido;
            par3.ParameterName = "@tipoContenido";
            par3.DbType = DbType.String;
            par3.Size = 20;
            lstParam.Add(par3);

            DbParameter par4 = this.CrearParametros();
            par4.Value = tarea.Tamaño;
            par4.ParameterName = "@tamaño";
            par4.DbType = DbType.Int64;
            par4.Size = 30;
            lstParam.Add(par4);

            DbParameter par5 = this.CrearParametros();
            par5.Value = tarea.Dato;
            par5.ParameterName = "@Dato";
            par5.DbType = DbType.Binary;
            par5.Size = 20;
            lstParam.Add(par5);

            DbParameter par6 = this.CrearParametros();
            par6.Value = tarea.Fecha;
            par6.ParameterName = "@fecha";
            par6.DbType = DbType.Date;
            par6.Size = 20;
            lstParam.Add(par6);

            DbParameter par7 = this.CrearParametros();
            par7.Value = tarea.Concurrencia_id;
            par7.ParameterName = "@concurrencia_id";
            par7.DbType = DbType.Int64;
            par7.Size = 30;
            lstParam.Add(par7);
            return (this.EjecutarDML("[PAR].[Tareas_Insertar]", this.mstrDBKEY, lstParam));
        }

        public DataSet tareaEstudiantes(Tarea tarea)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = tarea.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.TareaEstudiantes", this.mstrDBKEY, lstParam));
        }
    }
}
