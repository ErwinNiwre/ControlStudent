using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Componentes;
using Microsoft.Reporting.WebForms;

namespace Principal.Reportes
{
    public partial class EjemploSergio : System.Web.UI.Page {
    
        CMaterias cMateria=new CMaterias("");
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public void cargarReporte()
        {
            DataTable datos = cMateria.materiasGetAll2().Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/Report1.rdlc");
           ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("Report1", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }
    }
}