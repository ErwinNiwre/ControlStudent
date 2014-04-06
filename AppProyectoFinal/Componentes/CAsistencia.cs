using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using Entidades;
using System.Transactions;

namespace Componentes
{
    public class CAsistencia : DAl.CAD
    {
        #region Atributos
        private DbDataAdapter adaProxy;
        private string mstrDBKEY;
        private Asistencias asistencia;
        private int llaveasistencia = 0;

        public int Llaveasistencia
        {
            get { return llaveasistencia; }
            set { llaveasistencia = value; }
        }
        #endregion

        #region Constructor
        public CAsistencia(string strDBkey)
        {
            mstrDBKEY = strDBkey;
            adaProxy = this.CrearAdaptador("PAR.tblAsistencias", strDBkey);
        }

        public CAsistencia(string strDBkey, Asistencias asistencia)
        {
            this.asistencia = asistencia;
            mstrDBKEY = strDBkey;
            adaProxy = this.CrearAdaptador("PAR.tblAsistencias", strDBkey);
        }
        #endregion

        #region Insert,Update,Delete

        public int Insertar(Asistencias asistencia)
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter dbpiPK = this.CrearParametros();
            dbpiPK.ParameterName = "@idAsistencia";
            dbpiPK.Direction = ParameterDirection.Output;
            dbpiPK.DbType = DbType.Int16;
            dbpiPK.Size = 10;
            lstParam.Add(dbpiPK);

            DbParameter par = this.CrearParametros();
            par.Value = asistencia.IdGrupo;
            par.ParameterName = "@idGrupo";
            par.DbType = DbType.Int16;
            par.Size = 20;
            lstParam.Add(par);

            DbParameter par2 = this.CrearParametros();
            par2.Value = asistencia.Fecha;
            par2.ParameterName = "@fecha";
            par2.DbType = DbType.Date;
            par2.Size = 20;
            lstParam.Add(par2);

            DbParameter par3 = this.CrearParametros();
            par3.Value = asistencia.Concurrencia_id;
            par3.ParameterName = "@concurrencia_id";
            par3.DbType = DbType.Int16;
            par3.Size = 20;
            lstParam.Add(par3);
            return (this.EjecutarDML("[PAR].[Asistencia_Insertar]", this.mstrDBKEY, lstParam));
        }

        public int InsertarDetalle(DetalleAsistencia detalleAsistencia)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter dbpiPK = this.CrearParametros();
            dbpiPK.ParameterName = "@idDetalleAsistencia";
            dbpiPK.Direction = ParameterDirection.Output;
            dbpiPK.DbType = DbType.Int16;
            dbpiPK.Size = 10;
            lstParam.Add(dbpiPK);

            DbParameter par = this.CrearParametros();
            par.Value = detalleAsistencia.IdAsistencia;
            par.ParameterName = "@idAsistencia";
            par.DbType = DbType.Int16;
            par.Size = 20;
            lstParam.Add(par);

            DbParameter par2 = this.CrearParametros();
            par2.Value = detalleAsistencia.IdEstudiante;
            par2.ParameterName = "@estudiante";
            par2.DbType = DbType.Int32;
            par2.Size = 20;
            lstParam.Add(par2);

            DbParameter par3 = this.CrearParametros();
            par3.Value = detalleAsistencia.Asistio;
            par3.ParameterName = "@asistio";
            par3.DbType = DbType.Int16;
            lstParam.Add(par3);

            DbParameter par4 = this.CrearParametros();
            par4.Value = detalleAsistencia.Concurrencia_id;
            par4.ParameterName = "@concurrencia_id";
            par4.DbType = DbType.Int16;
            par4.Size = 20;
            lstParam.Add(par4);

            return (this.EjecutarDML("[PAR].[DetalleAsistencia_Insertar]", this.mstrDBKEY, lstParam));
        }
        #endregion

        #region AuxiliarInsertar
        public int Insert()
        {

            Asistencias maestro = new Asistencias();
            maestro.IdGrupo = asistencia.IdGrupo;
            maestro.Fecha = asistencia.Fecha;
            maestro.Concurrencia_id = asistencia.Concurrencia_id;

            List<DetalleAsistencia> lista = new List<DetalleAsistencia>();
            foreach (DetalleAsistencia detalle in asistencia.DetalleAsis)
            {
                DetalleAsistencia temp = new DetalleAsistencia();
                temp.IdEstudiante = detalle.IdEstudiante;
                temp.Asistio = detalle.Asistio;
                llaveasistencia = detalle.IdAsistencia + 1;
                temp.Concurrencia_id = detalle.Concurrencia_id;
                lista.Add(temp);
            }

            return this.InsertarAsistencia(maestro, lista);
        }

        public int InsertarAsistencia(Asistencias maestro, List<DetalleAsistencia> detalles)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                this.Insertar(maestro);

                foreach (DetalleAsistencia detalle in detalles)
                {
                    detalle.IdAsistencia = Llaveasistencia;
                    this.InsertarDetalle(detalle);
                }
                scope.Complete();
            }
            return 1;

        }
        #endregion

        #region Metodos Consular
        public DataSet ConsultarNitEstudiante(int grup)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = grup;
            pEvento2.ParameterName = "@nit";
            pEvento2.DbType = DbType.Int32;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("[PAR].[Estudiantes_GetByNit]", this.mstrDBKEY, lstParam));
        }
        #endregion
    }
}

