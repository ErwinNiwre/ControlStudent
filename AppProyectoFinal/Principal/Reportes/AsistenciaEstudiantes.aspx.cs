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
    public partial class AsistenciaEstudiantes : System.Web.UI.Page
    {
        CGrupo cGrupo = new CGrupo("SQL");
        Grupo grupo = new Grupo();
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
            boxGrupos.DataSource = cGrupo.ConsultarGrupo();
            boxGrupos.DataValueField = "id_Grupo";
            boxGrupos.DataTextField = "grupo";
            boxGrupos.DataBind();
        }

        public void actualizarIdGrupo()
        {
            grupo.IdGrupo = Convert.ToInt16( boxGrupos.SelectedValue);
            this.cargarReporte(grupo);
        }

        public void cargarReporte(Grupo grupo)
        {
            DataTable datos = cGrupo.AsistenciaEstudiantes(grupo).Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/AsistenciaEstudiantes.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("AsistenciaEstudiantes", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }

        protected void boxGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.actualizarIdGrupo();
        }
    }
}