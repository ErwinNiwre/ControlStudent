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
    public partial class EstudiantesGetByGrupo : System.Web.UI.Page
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

        protected void boxGrupo_SelectedIndexChanged(object sender, EventArgs e)
        {

            this.actualizarIdGrupo();
        }

        public void actualizarBoxGrupos()
        {
            boxGrupo.DataSource = cGrupo.ConsultarGrupo();
            boxGrupo.DataValueField = "id_Grupo";
            boxGrupo.DataTextField = "grupo";
            boxGrupo.DataBind();
        }


        public void actualizarIdGrupo()
        {
            int idGrupo = Convert.ToInt16(boxGrupo.SelectedValue);
            grupo.IdGrupo = idGrupo;
            this.cargarReporte(grupo);
        }

        public void cargarReporte(Grupo grupo)
        {
            DataTable datos = cGrupo.EstudiantesGetByGrupo(grupo).Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/EstudiantesGetByGrupo.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("EstudiantesGetByGrupo", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }
    }
}