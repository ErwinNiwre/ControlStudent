using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Asistencias
    {

        #region Atributos
        private int idAsistencia;
        private int idGrupo;
        private DateTime fecha;
        private int concurrencia_id;

        private List<DetalleAsistencia> detalleAsis;

        #endregion

        #region Metodos

        public int IdAsistencia
        {
            get { return idAsistencia; }
            set { idAsistencia = value; }
        }
        public int IdGrupo
        {
            get { return idGrupo; }
            set { idGrupo = value; }
        }

        public DateTime Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        public int Concurrencia_id
        {
            get { return concurrencia_id; }
            set { concurrencia_id = value; }
        }

        public List<DetalleAsistencia> DetalleAsis
        {
            get { return detalleAsis; }
            set { detalleAsis = value; }
        }

        public void AddDetalle(DetalleAsistencia detalle)
        {
            DetalleAsis.Add(detalle);
        }
        #endregion

        public Asistencias()
        {
            detalleAsis = new List<DetalleAsistencia>();
        }
                        
    }
}
