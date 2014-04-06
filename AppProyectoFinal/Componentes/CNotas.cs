using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Transactions;
using Entidades;

namespace Componentes
{
    public class CNotas : DAl.CAD
    {
        private DbDataAdapter adaProxy;
        private string mstrDBKEY;
        private Nota notass;

        public CNotas(string strDBkey)
        {
            mstrDBKEY = strDBkey;
            adaProxy = this.CrearAdaptador("PAR.tblNotas", strDBkey);
        }

        public CNotas(string strDBkey, Nota notaa)
        {
            this.notass = notaa;
            mstrDBKEY = strDBkey;
            adaProxy = this.CrearAdaptador("PAR.tblNotas", strDBkey);
        }

        #region Insert, Update, Delete
        public int InsertarNota1(Nota nota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter dbpiPK = this.CrearParametros();
            dbpiPK.ParameterName = "@idNota";
            dbpiPK.Direction = ParameterDirection.Output;
            dbpiPK.DbType = DbType.Int16;
            dbpiPK.Size = 10;
            lstParam.Add(dbpiPK);

            DbParameter par = this.CrearParametros();
            par.Value = nota.IdGrupo;
            par.ParameterName = "@idGrupo";
            par.DbType = DbType.Int16;
            par.Size = 20;
            lstParam.Add(par);

            DbParameter par2 = this.CrearParametros();
            par2.Value = nota.Id_ParametroNota;
            par2.ParameterName = "@idParametroNota";
            par2.DbType = DbType.Int16;
            par2.Size = 20;
            lstParam.Add(par2);

            DbParameter par3 = this.CrearParametros();
            par3.Value = nota.Fecha;
            par3.ParameterName = "@fecha";
            par3.DbType = DbType.Date;
            par3.Size = 20;
            lstParam.Add(par3);

            DbParameter par4 = this.CrearParametros();
            par4.Value = nota.Estado;
            par4.ParameterName = "@estado";
            par4.DbType = DbType.Int16;
            par4.Size = 20;
            lstParam.Add(par4);

            DbParameter par5 = this.CrearParametros();
            par5.Value = nota.Concurrencia_id;
            par5.ParameterName = "@concurrencia_id";
            par5.DbType = DbType.Int16;
            par5.Size = 20;
            lstParam.Add(par5);
            return (this.EjecutarDML("[PAR].[NotasAlumnos_Insertar]", this.mstrDBKEY, lstParam));
        }

        public int InsertarDetalle(DetalleNota detalleNota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter dbpiPK = this.CrearParametros();
            dbpiPK.ParameterName = "@idDetalleNota";
            dbpiPK.Direction = ParameterDirection.Output;
            dbpiPK.DbType = DbType.Int16;
            dbpiPK.Size = 10;
            lstParam.Add(dbpiPK);

            DbParameter par = this.CrearParametros();
            par.Value = detalleNota.IdNota;
            par.ParameterName = "@idNota";
            par.DbType = DbType.Int16;
            par.Size = 20;
            lstParam.Add(par);

            DbParameter par2 = this.CrearParametros();
            par2.Value = detalleNota.IdEstudiante;
            par2.ParameterName = "@idEstudiante";
            par2.DbType = DbType.Int16;
            par2.Size = 20;
            lstParam.Add(par2);

            DbParameter par3 = this.CrearParametros();
            par3.Value = detalleNota.Nota;
            par3.ParameterName = "@nota";
            par3.DbType = DbType.Int16;
            lstParam.Add(par3);

            DbParameter par4 = this.CrearParametros();
            par4.Value = detalleNota.Cocurrencia_id;
            par4.ParameterName = "@concurrencia_id";
            par4.DbType = DbType.Int16;
            lstParam.Add(par4);

            return (this.EjecutarDML("[PAR].[DetalleNota_Insertar]", this.mstrDBKEY, lstParam));
        }

        #endregion

        #region INSERTAR NOTAS AUXILIAR
        public int InsertNota()
        {

            Nota maestro = new Nota();
            maestro.IdGrupo = notass.IdGrupo;
            maestro.Id_ParametroNota = notass.Id_ParametroNota;
            maestro.Fecha = notass.Fecha;
            maestro.Estado = notass.Estado;
            maestro.Concurrencia_id = notass.Concurrencia_id;

            List<DetalleNota> lista = new List<DetalleNota>();
            foreach (DetalleNota detalle in notass.AgregarDetalleNota)
            {
                DetalleNota temp = new DetalleNota();
                temp.IdNota = detalle.IdNota + 1;
                temp.IdEstudiante = detalle.IdEstudiante;
                temp.Nota = detalle.Nota;
                temp.Cocurrencia_id = detalle.Cocurrencia_id;
                lista.Add(temp);
            }

            return this.InsertarDetalleNota(maestro, lista);
        }

        public int InsertarDetalleNota(Nota maestro, List<DetalleNota> detalles)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                this.InsertarNota1(maestro);

                foreach (DetalleNota detalle in detalles)
                {
                    this.InsertarDetalle(detalle);
                }
                scope.Complete();
            }
            return 1;

        }
        #endregion

        #region NOTAS QUE ADMINISTRA EL DOCENTE
        public int InsertarNota(Nota nota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter dbpiPK = this.CrearParametros();
            dbpiPK.ParameterName = "@idAgregarNotas";
            dbpiPK.Direction = ParameterDirection.Output;
            dbpiPK.DbType = DbType.Int16;
            dbpiPK.Size = 10;
            lstParam.Add(dbpiPK);

            DbParameter par = this.CrearParametros();
            par.Value = nota.IdGrupo;
            par.ParameterName = "@idGrupo";
            par.DbType = DbType.Int16;
            par.Size = 20;
            lstParam.Add(par);

            DbParameter par2 = this.CrearParametros();
            par2.Value = nota.Id_ParametroNota;
            par2.ParameterName = "@idParametroNota";
            par2.DbType = DbType.Int32;
            par2.Size = 20;
            lstParam.Add(par2);

            DbParameter par3 = this.CrearParametros();
            par3.Value = nota.Nota1;
            par3.ParameterName = "@Nota";
            par3.DbType = DbType.Int16;
            lstParam.Add(par3);

            DbParameter par4 = this.CrearParametros();
            par4.Value = nota.Estado;
            par4.ParameterName = "@estado";
            par4.DbType = DbType.Int16;
            lstParam.Add(par4);

            DbParameter par5 = this.CrearParametros();
            par5.Value = nota.Concurrencia_id;
            par5.ParameterName = "@concurrencia_id";
            par5.DbType = DbType.Int16;
            lstParam.Add(par5);

            return (this.EjecutarDML("PAR.AgregarNotas_Insertar", this.mstrDBKEY, lstParam));
        }

        public int Insert()
        {

            List<Nota> lista = new List<Nota>();
            foreach (Nota detalle in notass.AgregarNota)
            {
                Nota temp = new Nota();
                temp.IdGrupo = detalle.IdGrupo;
                temp.Id_ParametroNota = detalle.Id_ParametroNota;
                temp.Nota1 = detalle.Nota1;
                temp.Estado = detalle.Estado;
                temp.Concurrencia_id = detalle.Concurrencia_id;
                lista.Add(temp);
            }

            return this.InsertarAsistencia(lista);
        }

        public int InsertarAsistencia(List<Nota> detalles)
        {

            foreach (Nota detalle in detalles)
            {
                this.InsertarNota(detalle);
            }
            return 1;

        }
        #endregion

        #region Consultas

        public DataSet estudiantesGetById(Nota nota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = nota.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.Personas_GetEstudiantesSinFecha", this.mstrDBKEY, lstParam));
        }

        public DataSet GrupoGetbyId()
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = Entidades.ClaseEstatica.IdDocente;
            pEvento.ParameterName = "@id";
            pEvento.DbType = DbType.Int16;
            lstParam.Add(pEvento);

            return (this.EjecutarConsulta("PAR.Grupos_GetNombreGrupo", this.mstrDBKEY, lstParam));
        }

        public DataSet tipoEvaluacionGetAll(Nota nota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = nota.IdGrupo;
            pEvento.ParameterName = "@idGrupo";
            pEvento.DbType = DbType.Int16;
            lstParam.Add(pEvento);
            return (this.EjecutarConsulta("[PAR].[ParametroNota_GetAll]", this.mstrDBKEY, lstParam));
        }

        public DataSet tipoEvaluacionGetAll2()
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = 0;
            pEvento.ParameterName = "@id";
            pEvento.DbType = DbType.Int16;
            lstParam.Add(pEvento);
            return (this.EjecutarConsulta("[PAR].[ParametroNota_GetAll2]", this.mstrDBKEY, lstParam));
        }

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

        public DataSet ConsultarEstudiantesSinFecha(Nota nota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = nota.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            return (this.EjecutarConsulta("PAR.Personas_GetEstudiantesSinFecha", this.mstrDBKEY, lstParam));
        }

        public DataSet notasAsignadasPorDocente(Nota nota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = nota.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);
            
            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = nota.Id_ParametroNota;
            pEvento.ParameterName = "@idParametroNota";
            pEvento.DbType = DbType.Int16;
            lstParam.Add(pEvento);
            return (this.EjecutarConsulta("[PAR].[NotaAsignadaPorDocente_GetNota]", this.mstrDBKEY, lstParam));
        }

        public DataSet actualizarEstadoNota(Nota nota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();
            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = nota.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = nota.Id_ParametroNota;
            pEvento.ParameterName = "@idParametroNota";
            pEvento.DbType = DbType.Int16;
            lstParam.Add(pEvento);

            DbParameter pEvento3 = this.CrearParametros();
            pEvento3.Value = nota.Concurrencia_id;
            pEvento3.ParameterName = "@concurrencia_id";
            pEvento3.DbType = DbType.Int16;
            lstParam.Add(pEvento3);



            return (this.EjecutarConsulta("[PAR].[ActualizarEstadoNota]", this.mstrDBKEY, lstParam));
        }

        public DataSet notasGetById(Nota nota)
        {
            List<DbParameter> lstParam = new List<DbParameter>();

            DbParameter pEvento2 = this.CrearParametros();
            pEvento2.Value = nota.IdGrupo;
            pEvento2.ParameterName = "@idGrupo";
            pEvento2.DbType = DbType.Int16;
            lstParam.Add(pEvento2);

            DbParameter pEvento = this.CrearParametros();
            pEvento.Value = nota.Id_ParametroNota;
            pEvento.ParameterName = "@idParametroNota";
            pEvento.DbType = DbType.Int16;
            lstParam.Add(pEvento);
            return (this.EjecutarConsulta("[PAR].[Nota_GetId]", this.mstrDBKEY, lstParam));
        }

        #endregion
    }
}
