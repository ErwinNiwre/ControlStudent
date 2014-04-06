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
    public partial class TareaEstudiantes : System.Web.UI.Page
    {
        cTarea ctarea = new cTarea("SQL");
        Tarea tarea = new Tarea();
        CGrupo cGrupo = new CGrupo("SQL");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.actualizarBoxGrupos();
                this.actualizarIdGrupo();
            }

        }

        public void actualizarBoxGrupos()
        {
            boxGrupo.DataSource = cGrupo.ConsultarGrupo();
            boxGrupo.DataValueField = "id_Grupo";
            boxGrupo.DataTextField = "grupo";
            boxGrupo.DataBind();
        }

        public void cargarReporte(Tarea tarea)
        {
            DataTable datos = ctarea.tareaEstudiantes(tarea).Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/TareaEstudiantes.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("TareaEstudiantes", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }

        public void actualizarIdGrupo()
        {
            tarea.IdGrupo = Convert.ToInt16(boxGrupo.SelectedValue);
            this.cargarReporte(tarea);
        }

        protected void boxGrupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.actualizarIdGrupo();
        }

    }
}