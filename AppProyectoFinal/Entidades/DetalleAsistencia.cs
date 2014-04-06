using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class DetalleAsistencia
    {
        #region Atributos

        private int idDetalleAsistencia;
        private int idAsistencia;
        private int idEstudiante;
        private int asistio;
        private int concurrencia_id;

        #endregion

        #region Metodos
        public int IdDetalleAsistencia
        {
            get { return idDetalleAsistencia; }
            set { idDetalleAsistencia = value; }
        }
        public int IdAsistencia
        {
            get { return idAsistencia; }
            set { idAsistencia = value; }
        }
        public int IdEstudiante
        {
            get { return idEstudiante; }
            set { idEstudiante = value; }
        }
        public int Asistio
        {
            get { return asistio; }
            set { asistio = value; }
        }

        public int Concurrencia_id
        {
            get { return concurrencia_id; }
            set { concurrencia_id = value; }
        }
        #endregion

        public DetalleAsistencia()
        {
        }
    }
}
