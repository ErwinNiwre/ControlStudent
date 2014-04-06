using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Docentes
    {
        private int idDocente;
        private int idPersona;
        private string contraseña;
        private int concurrencia_id;


        public int IdDocente
        {
            get { return idDocente; }
            set { idDocente = value; }
        }
       
        public int IdPersona
        {
            get { return idPersona; }
            set { idPersona = value; }
        }
        

        public string Contraseña
        {
            get { return contraseña; }
            set { contraseña = value; }
        }

        public int Concurrencia_id
        {
            get { return concurrencia_id; }
            set { concurrencia_id = value; }
        }
    }
}
