using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Componentes;
using Entidades;

namespace Principal.Estudiantes
{
    public partial class Notas : System.Web.UI.Page
    {
        private CNotas cNotas = new CNotas("SQL");
        private Nota notas = new Nota();
        private DetalleNota detalleNota = new DetalleNota();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.actualizarBoxGrupo();
                this.actualizarBoxEvaluacion();
                this.actualizarTabla();
                this.notasAlmacenadas();
            }
        }

        #region Metodos

        public void actualizarTabla()
        {
            notas.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue.ToString());
            this.gridNotas.DataSource = cNotas.estudiantesGetById(notas).Tables[0];
            this.gridNotas.DataBind();
        }

        public void actualizarBoxGrupo()
        {
            boxGrupos.DataSource = cNotas.GrupoGetbyId();
            boxGrupos.DataValueField = "id_Grupo";
            boxGrupos.DataTextField = "Grupo";
            boxGrupos.DataBind();
        }

        public void actualizarBoxEvaluacion()
        {
            int idGrupo = Convert.ToInt16(boxGrupos.SelectedValue);
            notas.IdGrupo = idGrupo;
            if (cNotas.tipoEvaluacionGetAll(notas).Tables[0].Rows.Count < 1)
            {
                boxEvaluacion.Enabled = false;
                btnAceptar.Enabled = false;
                ShowAlertMessage("Debe administrar las notas");
                return;
            } 
            boxEvaluacion.Enabled = true;
            btnAceptar.Enabled = true;
            boxEvaluacion.DataSource = cNotas.tipoEvaluacionGetAll(notas);
            boxEvaluacion.DataValueField = "id_ParametroNota";
            boxEvaluacion.DataTextField = "observacion";
            boxEvaluacion.DataBind();
        }

        public void guardarNotas()
        {
            notas = new Nota();
            notas.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue.ToString());
            notas.Id_ParametroNota = Convert.ToInt16(boxEvaluacion.SelectedValue.ToString());
            notas.Fecha = Convert.ToDateTime(DateTime.Today.ToString("yyy-MM-dd"));
            notas.IdNota = Convert.ToInt16(cNotas.ConsultarEstudiantesSinFecha(notas).Tables[2].Rows[0][0]);
            notas.Estado = 0;
            notas.Concurrencia_id = 0;
            foreach (GridViewRow gvr in gridNotas.Rows)
            {
                detalleNota = new DetalleNota();
                int nitEstudiante = Convert.ToInt32(gvr.Cells[0].Text.ToString());
                detalleNota.IdEstudiante = Convert.ToInt32(cNotas.ConsultarNitEstudiante(nitEstudiante).Tables[0].Rows[0][0].ToString());
                detalleNota.IdNota = notas.IdNota;
                TextBox txtNotas = (TextBox)(gvr.FindControl("txtNota"));
                detalleNota.Nota = (Convert.ToInt16(txtNotas.Text) * notaAsignadaPorDocente(notas)) / 100;
                detalleNota.Cocurrencia_id = notas.Concurrencia_id;
                notas.AddDetalleNota(detalleNota);
            }
            notas.Estado = 1;
            cNotas.actualizarEstadoNota(notas);
        }

        public int notaAsignadaPorDocente(Nota notas)
        {
            if (cNotas.notasAsignadasPorDocente(notas).Tables[0].Rows.Count < 1)
            {
                return 0;
            }
            int nota = Convert.ToInt16(cNotas.notasAsignadasPorDocente(notas).Tables[0].Rows[0][0]);
            return nota;
        }

        public int notaAlumons(Nota notas)
        {
            if (cNotas.notasGetById(notas).Tables[0].Rows.Count < 1)
            {
                return 0;
            }
            return 1;
        }
        #endregion

        protected void boxGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.actualizarTabla();
            this.actualizarBoxEvaluacion();
            this.notasAlmacenadas();

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (validarTextBoxNota())
            {
                guardarNotas();
                CNotas nota = new CNotas("SQL", this.notas);
                nota.InsertNota();
                ShowAlertMessage("Las notas se han guardado satisfactoriamente");
                this.notasAlmacenadas();
                //Response.Redirect(Request.Url.AbsoluteUri);
                //System.Threading.Thread.Sleep(3000);
            }           
        }

        #region Validaciones

        public static void ShowAlertMessage(string error)
        {
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                error = error.Replace("'", "\'");
                ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + error + "');", true);
            }
        }

        public bool validarTextBoxNota()
        {
            bool estado = false;
            int error = 0;
            int numero = 0;
            foreach (GridViewRow item in gridNotas.Rows)
            {

                TextBox txtNotas = (TextBox)item.FindControl("txtNota");
                if (!int.TryParse(txtNotas.Text, out error))
                {
                    ShowAlertMessage("Error en los campos porfavor verifique");
                    return false;
                }
                numero = Convert.ToInt16(txtNotas.Text);
                if (txtNotas.Text == string.Empty)
                {
                    ShowAlertMessage("Campos vacios porfavor verifique");
                    return false;
                }
                if (numero < 0 || numero > 100)
                {
                    ShowAlertMessage("Error al ingresar las notas porfavor verifique");
                    return false;
                }
                estado = true;
            }
            return estado;
        }

        #endregion

        protected void boxEvaluacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            notasAlmacenadas();
        }


        public void notasAlmacenadas()
        {
            if (boxEvaluacion.Enabled)
            {
                notas.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue);
                notas.Id_ParametroNota = Convert.ToInt16(boxEvaluacion.SelectedValue);
                if (notaAlumons(notas) == 1)
                {
                    btnAceptar.Enabled = false; 
                    ShowAlertMessage("Las notas del " + boxEvaluacion.SelectedItem.Text.ToString() + "ya fueron almacenadas");
                    return;
                }
                btnAceptar.Enabled = true;
            }
        }
    }
}