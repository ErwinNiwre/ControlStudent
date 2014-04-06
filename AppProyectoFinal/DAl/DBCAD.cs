using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;

namespace DAl
{
    public class DBCAD : ICAD
    {
        string sDbKey = string.Empty;
        string sTable = string.Empty;
        string sColum = string.Empty;
        DbDataAdapter adaProxy = null;
        DbProviderFactory dpfProxy = null;

        public DbDataAdapter Adapter
        {
            get
            {
                return adaProxy;
            }
        }
        public DBCAD(string sDBKey, string sTable, string sColum)
        {
            this.sDbKey = sDBKey;
            this.sTable = sTable;
            this.sColum = sColum;
            this.adaProxy = this.CrearAdaptador(this.sTable, this.sColum);
        }

        private string TablaSinEsquema()
        {
            string[] aux = this.sTable.Split(".".ToCharArray());
            if (aux.Length > 1)
            {
                return aux[aux.Length - 1];
            }
            else
            {
                return this.sTable;
            }
        }
        private void Factory()
        {
            if (dpfProxy == null)
            {
                string strProvider = ConfigurationManager.ConnectionStrings[sDbKey].ProviderName;
                dpfProxy = DbProviderFactories.GetFactory(strProvider);
            }
        }

        private DbDataAdapter CrearAdaptador(string strNombreTable, string strColumnas)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                string strSelect = string.Format("SELECT {0} FROM {1}", strColumnas, strNombreTable);
                DbCommand cmdProxy = CrearCommando();
                cmdProxy.CommandText = strSelect;
                cmdProxy.Connection = conProxy;

                DbDataAdapter adaProxy = CrearAdaptador();
                adaProxy.SelectCommand = cmdProxy;

                DbCommandBuilder cblProxy = dpfProxy.CreateCommandBuilder();
                cblProxy.DataAdapter = adaProxy;
                cblProxy.ConflictOption = ConflictOption.OverwriteChanges;
                adaProxy.InsertCommand = cblProxy.GetInsertCommand(true);
                adaProxy.DeleteCommand = cblProxy.GetDeleteCommand(true);
                adaProxy.UpdateCommand = cblProxy.GetUpdateCommand(true);

                return adaProxy;
            }
        }
        public DbDataAdapter CrearAdaptador()
        {
            if (dpfProxy == null) Factory();
            DbDataAdapter adaProxy = dpfProxy.CreateDataAdapter();
            return adaProxy;
        }

        public DbConnection AbrirConexion()
        {
            if (dpfProxy == null) Factory();
            string strCon = ConfigurationManager.ConnectionStrings[sDbKey].ConnectionString;
            DbConnection conProxy = dpfProxy.CreateConnection();
            conProxy.ConnectionString = strCon;
            conProxy.Open();
            return conProxy;
        }
        public DbCommand CrearCommando()
        {
            if (dpfProxy == null) Factory();
            DbCommand cmdProxy = dpfProxy.CreateCommand();
            return cmdProxy;
        }
        public DbParameter CrearParametro()
        {
            if (dpfProxy == null) Factory();
            DbParameter parProxy = dpfProxy.CreateParameter();
            return parProxy;
        }

        public DataSet EjecutarConsulta(string strSelect)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                return EjecutarConsulta(strSelect, conProxy, null);
            }
        }
        public DataSet EjecutarConsulta(string strSelect, DbConnection conProxy, DbTransaction trnProxy)
        {
            DbCommand cmdProxy = CrearCommando();
            cmdProxy.CommandText = strSelect;
            return EjecutarConsulta(cmdProxy, conProxy, trnProxy);
        }
        public DataSet EjecutarConsulta(DbCommand cmdProxy)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                return EjecutarConsulta(cmdProxy, conProxy, null);
            }
        }
        public DataSet EjecutarConsulta(DbCommand cmdProxy, DbConnection conProxy, DbTransaction trnProxy)
        {
            cmdProxy.Connection = conProxy;
            cmdProxy.Transaction = trnProxy;

            DataSet dtsProxy = new DataSet();
            DbDataAdapter adaProxy = CrearAdaptador();
            adaProxy.SelectCommand = cmdProxy;
            adaProxy.Fill(dtsProxy);
            return dtsProxy;
        }

        public DataSet Consultar(string sWhere)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                return Consultar(sWhere, conProxy, null);
            }
        }
        public DataSet Consultar(string sWhere, DbConnection conProxy, DbTransaction trnProxy)
        {
            string strSelect = string.Format("SELECT {0} FROM {1}", this.sColum, this.sTable);
            if (!string.IsNullOrEmpty(sWhere))
            {
                strSelect += string.Format(" WHERE {0}", sWhere);
            }
            DbCommand cmdProxy = CrearCommando();
            cmdProxy.CommandText = strSelect;
            cmdProxy.Connection = conProxy;
            cmdProxy.Transaction = trnProxy;

            DataSet dtsProxy = new DataSet();
            DbDataAdapter adaProxy = CrearAdaptador();
            adaProxy.SelectCommand = cmdProxy;
            adaProxy.Fill(dtsProxy, TablaSinEsquema());
            return dtsProxy;
        }
        public DataSet Consultar(DbParameter[] aParams)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                return Consultar(aParams, conProxy, null);
            }
        }
        public DataSet Consultar(DbParameter[] aParams, DbConnection conProxy, DbTransaction trnProxy)
        {
            DbCommand cmdProxy = CrearCommando();

            string sWhere = string.Empty;
            foreach (DbParameter parProxy in aParams)
            {
                if (string.IsNullOrEmpty(sWhere))
                {
                    sWhere += string.Format("{0} = @{0}", parProxy.SourceColumn);
                }
                else
                {
                    sWhere += string.Format("AND {0} = @{0}", parProxy.SourceColumn);
                }

                cmdProxy.Parameters.Add(parProxy);
            }

            string strSelect = string.Empty;
            if (string.IsNullOrEmpty(sWhere))
                strSelect = string.Format("SELECT {0} FROM {1}", this.sColum, this.sTable);
            else
                strSelect = string.Format("SELECT {0} FROM {1} WHERE {2}", this.sColum, this.sTable, sWhere);

            cmdProxy.CommandText = strSelect;
            cmdProxy.Connection = conProxy;
            cmdProxy.Transaction = trnProxy;
            DataSet dtsProxy = new DataSet();
            DbDataAdapter adaProxy = CrearAdaptador();
            adaProxy.SelectCommand = cmdProxy;
            adaProxy.Fill(dtsProxy);
            return dtsProxy;
        }
        public int EjecutarComando(string strDML)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                return EjecutarComando(strDML, conProxy, null);
            }
        }
        public int EjecutarComando(string strDML, DbConnection conProxy, DbTransaction trnProxy)
        {
            DbCommand cmdProxy = CrearCommando();
            cmdProxy.CommandText = strDML;
            return EjecutarComando(cmdProxy, conProxy, trnProxy);
        }
        public int EjecutarComando(DbCommand cmdProxy)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                return EjecutarComando(cmdProxy, conProxy, null);
            }
        }
        public int EjecutarComando(DbCommand cmdProxy, DbConnection conProxy, DbTransaction trnProxy)
        {
            cmdProxy.Connection = conProxy;
            cmdProxy.Transaction = trnProxy;
            return cmdProxy.ExecuteNonQuery();
        }

        public object EjecutarValor(string strDML)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                return EjecutarValor(strDML, conProxy, null);
            }
        }
        public object EjecutarValor(string strDML, DbConnection conProxy, DbTransaction trnProxy)
        {
            DbCommand cmdProxy = CrearCommando();
            cmdProxy.CommandText = strDML;
            return EjecutarValor(cmdProxy, conProxy, trnProxy);
        }
        public object EjecutarValor(DbCommand cmdProxy)
        {
            using (DbConnection conProxy = AbrirConexion())
            {
                return EjecutarValor(cmdProxy, conProxy, null);
            }
        }
        public object EjecutarValor(DbCommand cmdProxy, DbConnection conProxy, DbTransaction trnProxy)
        {
            cmdProxy.Connection = conProxy;
            cmdProxy.Transaction = trnProxy;
            return cmdProxy.ExecuteScalar();
        }

        #region StoreProcedureopcional
        public int EjecutarDML(string strDML, List<DbParameter> lstParametros)
        {
            DbConnection conProxy = this.AbrirConexion();
            DbCommand comProxy = this.CrearCommando();
            comProxy.Connection = conProxy;
            comProxy.CommandText = strDML;
            comProxy.CommandType = CommandType.StoredProcedure;
            foreach (DbParameter lstParam in lstParametros)
            {
                comProxy.Parameters.Add(lstParam);
            }
            return comProxy.ExecuteNonQuery();
        }
        public DataSet EjecutarConsulta(string strSelect, List<DbParameter> lstParametros)
        {
            DbConnection conProxy = this.AbrirConexion();
            DbCommand comProxy = this.CrearCommando();
            comProxy.CommandText = strSelect;
            comProxy.Connection = conProxy;
            comProxy.CommandType = CommandType.StoredProcedure;
            DataSet dtsProxy = new DataSet();
            DbDataAdapter adaProxy = this.CrearAdaptador();
            adaProxy.SelectCommand = comProxy;
            foreach (DbParameter lstParam in lstParametros)
            {
                comProxy.Parameters.Add(lstParam);
            }
            adaProxy.Fill(dtsProxy);
            return dtsProxy;
        }
        #endregion
    }
}
