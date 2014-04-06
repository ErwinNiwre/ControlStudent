using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Tarea
    {
        private int idGrupo;
        private string nombreArchivo;
        private string tipoContenido;
        private int tamaño;
        private byte[] dato;
        private DateTime fecha;
        private int concurrencia_id;


        public int IdGrupo
        {
            get { return idGrupo; }
            set { idGrupo = value; }
        }

        public string NombreArchivo
        {
            get { return nombreArchivo; }
            set { nombreArchivo = value; }
        }

        public string TipoContenido
        {
            get { return tipoContenido; }
            set { tipoContenido = value; }
        }

        public int Tamaño
        {
            get { return tamaño; }
            set { tamaño = value; }
        }


        public byte[] Dato
        {
            get { return dato; }
            set { dato = value; }
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

    }
}
