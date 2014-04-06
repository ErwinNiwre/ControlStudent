using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Componentes;
using Entidades;

namespace Principal.Estudiantes
{
    public partial class Asistencia : System.Web.UI.Page
    {
        CGrupo cgrupo = new CGrupo("SQL");
        Grupo grupo = new Grupo();
        Asistencias asistencia = new Asistencias();
        CAsistencia cAsistencia = new CAsistencia("SQL");
        DetalleAsistencia detalle = new DetalleAsistencia();
        cDetalleAsistencia cDetalle = new cDetalleAsistencia("SQL");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFecha.Text = DateTime.Today.ToString("dd-MM-yyy");
                inicializarCombo();
                actualizarTabla();
            }

        }

        #region Eventos Pagina
        protected void btnFecha_Click(object sender, EventArgs e)
        {
            calendario.Visible = true;
        }

        protected void calendario_SelectionChanged(object sender, EventArgs e)
        {
            txtFecha.Text = calendario.SelectedDate.ToString("dd-MM-yyy");
            calendario.Visible = false;
            actualizarTabla();
        }

        protected void ckBoxAsistio_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void boxGrupos_TextChanged(object sender, EventArgs e)
        {
            actualizarTabla();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            guardarAsistencia();
            CAsistencia asistencia = new CAsistencia("SQL", this.asistencia);
            if (asistencia.Insert() > 0)
            {
                ShowAlertMessage("Se ha guardado satisfactoriamente");
                this.actualizarTabla(); ;
            }

        }
        #endregion

        #region Metodos
        public void inicializarCombo()
        {
            boxGrupos.DataSource = cgrupo.ConsultarGrupo().Tables[0];
            boxGrupos.DataValueField = "id_Grupo";
            boxGrupos.DataTextField = "Grupo";
            boxGrupos.DataBind();
        }

        public void actualizarTabla()
        {
            grupo.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue.ToString());
            this.gridAsistencia.DataSource = cgrupo.ConsultarEstudiantes(grupo, Convert.ToDateTime(txtFecha.Text)).Tables[0];
            this.gridAsistencia.DataBind();
            this.actualizarCheckBox();
            this.btnGuardar.Enabled = false;
            if (this.gridAsistencia.Rows.Count < 1)
            {
                this.gridAsistencia.DataSource = cgrupo.ConsultarEstudiantesSinFecha(grupo).Tables[0];
                this.gridAsistencia.DataBind();
                this.btnGuardar.Enabled = true;
            }

        }

        public void actualizarCheckBox()
        {
            foreach (GridViewRow gvr in gridAsistencia.Rows)
            {
                if (!Convert.ToBoolean(cgrupo.ConsultarEstudiantes(grupo, Convert.ToDateTime(txtFecha.Text)).Tables[0].Rows[gvr.RowIndex][3].ToString())) //ALUMNOS QUE NO ESTAN EN CLASES
                {
                    CheckBox ckbox = (CheckBox)(gvr.FindControl("ckBoxAsistio"));
                    ckbox.Checked = true;
                }
            }

        }

        public void guardarAsistencia()
        {
            asistencia = new Asistencias();
            asistencia.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue.ToString());
            asistencia.Fecha = Convert.ToDateTime(txtFecha.Text.ToString());
            asistencia.IdAsistencia = Convert.ToInt16(cgrupo.ConsultarEstudiantesSinFecha(grupo).Tables[1].Rows[0][0]);
            asistencia.Concurrencia_id = 0;

            foreach (GridViewRow gvr in gridAsistencia.Rows)
            {
                detalle = new DetalleAsistencia();
                int nitEstudiante = Convert.ToInt32(gvr.Cells[0].Text.ToString());
                detalle.IdEstudiante = Convert.ToInt32(cAsistencia.ConsultarNitEstudiante(nitEstudiante).Tables[0].Rows[0][0].ToString());
                detalle.IdAsistencia = asistencia.IdAsistencia;
                detalle.Concurrencia_id = asistencia.Concurrencia_id;
                CheckBox ckbox = (CheckBox)(gvr.FindControl("ckBoxAsistio"));
                if (ckbox.Checked)
                {
                    detalle.Asistio = 0;
                }
                else
                {
                    detalle.Asistio = 1;
                }
                asistencia.AddDetalle(detalle);
            }
        }

        public static void ShowAlertMessage(string error)
        {
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                error = error.Replace("'", "\'");
                ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + error + "');", true);
            }
        }
        #endregion
    }
}