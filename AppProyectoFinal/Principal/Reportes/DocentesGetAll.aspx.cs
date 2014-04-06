using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Componentes;
using Entidades;
using Microsoft.Reporting.WebForms;

namespace Principal.Reportes
{
    public partial class DocentesGetAll : System.Web.UI.Page
    {
        cDocentes cdocentes=new cDocentes("SQL");
        Docentes docente = new Docentes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.cargarReporte();
            }
        }

        public void cargarReporte()
        {
            DataTable datos = cdocentes.DocentesGetAll().Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/DocentesGetAll.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DocentesGetAll", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }
    }
}