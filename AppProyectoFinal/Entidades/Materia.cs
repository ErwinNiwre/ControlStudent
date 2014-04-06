using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Materia
    {
        private int idMateria;

        public int IdMateria
        {
            get { return idMateria; }
            set { idMateria = value; }
        }
        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private int sigla;

        public int Sigla
        {
            get { return sigla; }
            set { sigla = value; }
        }
        private int concurrenciaId;

        public int ConcurrenciaId
        {
            get { return concurrenciaId; }
            set { concurrenciaId = value; }
        }

    }
}
