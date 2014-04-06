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
    public partial class MateriasGetAll : System.Web.UI.Page
    {
        CMaterias cMateria = new CMaterias("SQL");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.cargarReporte();
            }
        }

        public void cargarReporte()
        {
            DataTable datos = cMateria.materiasGetAll2().Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/MateriasGetAll.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("MateriasGetAll", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }
    }
}