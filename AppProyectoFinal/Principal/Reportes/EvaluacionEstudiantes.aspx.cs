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
    public partial class EvaluacionEstudiantes : System.Web.UI.Page
    {
        private CGrupo cGrupo = new CGrupo("SQL");
        private Grupo grupo = new Grupo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.actualizarBoxGrupos();
                this.actualizarBoxTipoEvaluacion();
                this.cambiarParametros();
            }
        }

        public void actualizarBoxGrupos()
        {
            boxGrupos.DataSource = cGrupo.ConsultarGrupo();
            boxGrupos.DataValueField = "id_grupo";
            boxGrupos.DataTextField = "grupo";
            boxGrupos.DataBind();
        }

        public void actualizarBoxTipoEvaluacion()
        {
            grupo.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue);
            boxParaMetroNota.DataSource = cGrupo.TipoEvaluacionEstudiantes(grupo);
            boxParaMetroNota.DataValueField = "id_parametroNota";
            boxParaMetroNota.DataTextField = "observacion";
            boxParaMetroNota.DataBind();

        }

        public void cambiarParametros()
        {
            int a = 0;
            if (!int.TryParse(boxParaMetroNota.SelectedValue.ToString(),out a))
            {
                return;
            }
            grupo.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue);
            grupo.IdMateria = Convert.ToInt16(boxParaMetroNota.SelectedValue);
            this.cargarReporte(grupo);
        }

        public void cargarReporte(Grupo grupo)
        {
            DataTable datos = cGrupo.EvaluacionEstudiantes(grupo).Tables[0];
            ReportViewer1.Visible = true;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reportes/EvaluacionEstudiantes.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("EvaluacionEstudiantes", datos.AsDataView()));
            ReportViewer1.LocalReport.Refresh();
        }

        protected void boxGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.actualizarBoxTipoEvaluacion();
            this.cambiarParametros();
        }

        protected void boxParaMetroNota_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.cambiarParametros();
        }
    }
}