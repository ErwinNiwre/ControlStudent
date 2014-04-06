using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;

namespace Componentes
{
    public class cDetalleAsistencia : DAl.CAD
    {

        #region Atributos
        private DbDataAdapter adaProxy;
        private string mstrDBKEY;
        #endregion

       public cDetalleAsistencia(string strDBkey)
       {
           mstrDBKEY = strDBkey;
           adaProxy = this.CrearAdaptador("PAR.tblDetalle_Asistencias", strDBkey);
       }

    }
}
