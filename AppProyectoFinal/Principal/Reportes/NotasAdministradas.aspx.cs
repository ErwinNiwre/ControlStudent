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
    public partial class NotasAdministradas : System.Web.UI.Page
    {
        private CGrupo cGrupo = new CGrupo("SQL");
        private Grupo grupo = new Grupo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.actualizarBoxGrupos();
                this.actualizaIdGrupo();
            }
        }

        public void actualizarBoxGrupos()
        {
            boxGrupos.DataSource = cGrupo.ConsultarGrupo();
            boxGrupos.DataValueField = "id_grupo";
            boxGrupos.DataTextField = "grupo";
            boxGrupos.DataBind();
        }

        public void cargarReporte(Grupo grupo)
        {
            DataTable datos = cGrupo.NotasAdministradas(grupo).Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/NotasAdministradas.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("NotasAdministradas", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }

        public void actualizaIdGrupo()
        {
            grupo.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue);
            this.cargarReporte(grupo);
        }

        protected void boxGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.actualizaIdGrupo();
        }
    }
}