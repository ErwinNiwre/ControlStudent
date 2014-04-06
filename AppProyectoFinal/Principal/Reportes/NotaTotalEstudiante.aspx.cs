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
    public partial class NotaTotalEstudiante : System.Web.UI.Page
    {
        private CGrupo cGrupo = new CGrupo("SQL");
        private Grupo grupo = new Grupo();
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
            BoxGrupos.DataSource = cGrupo.ConsultarGrupo();
            BoxGrupos.DataValueField = "id_grupo";
            BoxGrupos.DataTextField = "grupo";
            BoxGrupos.DataBind();
        }

        public void cargarReporte(Grupo grupo)
        {
            DataTable datos = cGrupo.NotaTotalEstudiante(grupo).Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/NotaTotalEstudiante.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("NotaTotalEstudiante", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }

        public void actualizarIdGrupo()
        {
            grupo.IdGrupo = Convert.ToInt16(BoxGrupos.SelectedValue);
            this.cargarReporte(grupo);
        }

        protected void BoxGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.actualizarIdGrupo();
        }
    }
}