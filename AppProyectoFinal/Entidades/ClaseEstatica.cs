using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public  static class ClaseEstatica
    {
        public static int idDocente;

        public static int IdDocente
        {
            get { return ClaseEstatica.idDocente; }
            set { ClaseEstatica.idDocente = value; }
        }

    }
}
