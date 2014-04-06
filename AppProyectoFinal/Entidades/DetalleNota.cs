using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class DetalleNota
    {
        private int idNota;
        private int idEstudiante;
        private int nota;
        private int cocurrencia_id;

        public int IdNota
        {
            get { return idNota; }
            set { idNota = value; }
        }

        public int IdEstudiante
        {
            get { return idEstudiante; }
            set { idEstudiante = value; }
        }

        public int Nota
        {
            get { return nota; }
            set { nota = value; }
        }

        public int Cocurrencia_id
        {
            get { return cocurrencia_id; }
            set { cocurrencia_id = value; }
        }


    }
}
