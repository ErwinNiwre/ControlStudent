using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Nota
    {
        private int idNota;
        private int idGrupo;
        private int id_ParametroNota;
        private DateTime fecha;
        private int estado;
        private int nota;
        private int concurrencia_id;
        private List<Nota> agregarNota;
        private List<DetalleNota> agregarDetalleNota;


        public int IdNota
        {
            get { return idNota; }
            set { idNota = value; }
        }

        public int IdGrupo
        {
            get { return idGrupo; }
            set { idGrupo = value; }
        }

        public int Id_ParametroNota
        {
            get { return id_ParametroNota; }
            set { id_ParametroNota = value; }
        }

        public DateTime Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        public int Estado
        {
            get { return estado; }
            set { estado = value; }
        }

        public int Nota1
        {
            get { return nota; }
            set { nota = value; }
        }

        public int Concurrencia_id
        {
            get { return concurrencia_id; }
            set { concurrencia_id = value; }
        }


        public List<Nota> AgregarNota
        {
            get { return agregarNota; }
            set { agregarNota = value; }
        }

        public void AddNota(Nota detalle)
        {
            AgregarNota.Add(detalle);
        }

        public List<DetalleNota> AgregarDetalleNota
        {
            get { return agregarDetalleNota; }
            set { agregarDetalleNota = value; }
        }

        public void AddDetalleNota(DetalleNota detalle)
        {
            AgregarDetalleNota.Add(detalle);
        }

        public Nota()
        {
            agregarNota = new List<Nota>();
            agregarDetalleNota = new List<DetalleNota>();
        }
    }
}
