using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DAl
{
    public interface ICAD
    {
        int EjecutarComando(string sDML);
        DataSet EjecutarConsulta(string sSelect);
    }
}
