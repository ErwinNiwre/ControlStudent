using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;

namespace DAl
{
    public abstract class CAD
    {
        DbProviderFactory dpfProxy;

        public void Fabricar(string strKEY)
        {
            if (dpfProxy == null)
            {
                string strProvider = ConfigurationManager.ConnectionStrings[strKEY].ProviderName;
                dpfProxy = DbProviderFactories.GetFactory(strProvider);

            }
        }
        private DbConnection Conectar(string strKEY)
        {
            this.Fabricar(strKEY);
            string strConeccion = ConfigurationManager.ConnectionStrings[strKEY].ConnectionString;
            DbConnection conConeccion = dpfProxy.CreateConnection();
            conConeccion.ConnectionString = strConeccion;
            conConeccion.Open();
            return conConeccion;
        }
        private DbCommand CrearComando()
        {
            DbCommand cmdComando = dpfProxy.CreateCommand();
            return cmdComando;
        }
        public DbDataAdapter CrearAdaptador()
        {
            DbDataAdapter datAdaptador = dpfProxy.CreateDataAdapter();
            return datAdaptador;
        }
        public DbDataAdapter CrearAdaptador(string strNomTabla, string strKey)
        {
            DbConnection conProxy = this.Conectar(strKey);
            string strSelect = string.Format("SELECT * FROM {0}", strNomTabla);
            DbCommand cmdProxy = this.CrearComando();
            cmdProxy.CommandText = strSelect;
            cmdProxy.Connection = conProxy;
            DbDataAdapter adaProxy = this.CrearAdaptador();
            adaProxy.SelectCommand = cmdProxy;
            DbCommandBuilder cblProxy = dpfProxy.CreateCommandBuilder();
            cblProxy.DataAdapter = adaProxy;
            cblProxy.ConflictOption = System.Data.ConflictOption.OverwriteChanges;
            adaProxy.InsertCommand = cblProxy.GetInsertCommand(true);
            adaProxy.DeleteCommand = cblProxy.GetDeleteCommand(true);
            adaProxy.UpdateCommand = cblProxy.GetUpdateCommand(true);
            return adaProxy;
        }

        public DataSet EjecutarConsulta(string strSelect, string strDBKey)
        {
            DbConnection conProxy = this.Conectar(strDBKey);
            DbCommand cmdProxy = this.CrearComando();
            cmdProxy.CommandText = strSelect;
            cmdProxy.Connection = conProxy;
            DbDataAdapter adaProxy = this.CrearAdaptador();
            adaProxy.SelectCommand = cmdProxy;
            DataSet dtpProxy = new DataSet();
            adaProxy.Fill(dtpProxy);
            return dtpProxy;
        }
        public DataSet EjecutarConsulta(DbCommand comProxy, string strDBKey)
        {
            DbConnection conProxy = this.Conectar(strDBKey);
            DbCommand cmdProxy = comProxy;
            DbDataAdapter adaProxy = this.CrearAdaptador();
            adaProxy.SelectCommand = cmdProxy;
            DataSet dtpProxy = new DataSet();
            adaProxy.Fill(dtpProxy);
            return dtpProxy;
        }
        public int EjecutarDML(string strDML, string strDBKey)
        {
            DbConnection conProxy = this.Conectar(strDBKey);
            DbCommand cmdProxy = this.CrearComando();
            cmdProxy.CommandText = strDML;
            cmdProxy.Connection = conProxy;

            return cmdProxy.ExecuteNonQuery();
        }
        public int EjecutarDML(DbCommand cmdProxy, string strDBKey)
        {
            DbConnection conProxy = this.Conectar(strDBKey);
            cmdProxy.Connection = conProxy;
            return cmdProxy.ExecuteNonQuery();
        }


        #region StoreProcedureopcional
        public DbParameter CrearParametros()
        {
            DbParameter parParametro = dpfProxy.CreateParameter();
            return parParametro;
        }
        public int EjecutarDML(string strDML, string strDBKey,
            List<DbParameter> lstParametros)
        {
            DbConnection conProxy = this.Conectar(strDBKey);
            DbCommand cmdProxy = this.CrearComando();
            cmdProxy.Connection = conProxy;
            cmdProxy.CommandText = strDML;
            cmdProxy.CommandType = CommandType.StoredProcedure;
            foreach (DbParameter lstParam in lstParametros)
            {
                cmdProxy.Parameters.Add(lstParam);
            }
            return cmdProxy.ExecuteNonQuery();
        }
        public DataSet EjecutarConsulta(string strSelect,
            string strDBKey, List<DbParameter> lstParametro)
        {
            DbConnection conProxy = this.Conectar(strDBKey);
            DbCommand comProxy = this.CrearComando();
            comProxy.CommandText = strSelect;
            comProxy.Connection = conProxy;
            DataSet dtsProxy = new DataSet();
            comProxy.CommandType = CommandType.StoredProcedure;
            DbDataAdapter adaProxy = this.CrearAdaptador();
            adaProxy.SelectCommand = comProxy;
            foreach (DbParameter lstParam in lstParametro)
            {
                comProxy.Parameters.Add(lstParam);
            }
            adaProxy.Fill(dtsProxy);
            return dtsProxy;
        }
        #endregion
    }
}
