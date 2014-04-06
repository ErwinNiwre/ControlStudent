using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Componentes;
using Entidades;

namespace Principal.Estudiantes
{
    public partial class AdmNotas : System.Web.UI.Page
    {
        private Nota nota = new Nota();
        private CNotas cNota = new CNotas("SQL");
        private Nota detalleNota = new Nota();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                inicializarComboBox();
                inicializarTabla();
                notasRegistradas();
            }
        }

        public void inicializarComboBox()
        {
            boxGrupos.DataSource = cNota.GrupoGetbyId();
            boxGrupos.DataValueField = "id_Grupo";
            boxGrupos.DataTextField = "Grupo";
            boxGrupos.DataBind();
        }

        public void inicializarTabla()
        {
            gridInsertarNota.DataSource = cNota.tipoEvaluacionGetAll2();
            gridInsertarNota.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            this.sumarNota();
            ShowAlertMessage("Se a guardado corecctamente");
        }

        public void notasRegistradas()
        {
            nota.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue);
            nota.Id_ParametroNota = Convert.ToInt16(boxGrupos.SelectedValue);
            if (cNota.notasAsignadasPorDocente(nota).Tables[1].Rows.Count > 0)
            {
                ShowAlertMessage("Usted ya administro las notas del grupo " + boxGrupos.SelectedItem.Text.ToString());
                btnGuardar.Enabled = false;
                return;
            }
            btnGuardar.Enabled = true;
        }

        public void sumarNota()
        {
            int sumaNotas = 0;
            int aux = 0;
            foreach (GridViewRow item in gridInsertarNota.Rows)
            {
                TextBox txtNota = (TextBox)(item.FindControl("txtNota"));
                if (int.TryParse(txtNota.Text, out aux))
                {
                    if (aux > 0)
                    {
                        detalleNota = new Nota();
                        int nota = Convert.ToInt32(txtNota.Text);
                        sumaNotas += nota;
                        detalleNota.IdGrupo = Convert.ToInt32(boxGrupos.SelectedValue.ToString());
                        detalleNota.Id_ParametroNota = Convert.ToInt32(item.Cells[0].Text.ToString());
                        detalleNota.Nota1 = Convert.ToInt32(txtNota.Text);
                        detalleNota.Estado = 0;
                        detalleNota.Concurrencia_id = 0;
                        this.nota.AddNota(detalleNota);
                    }
                }
                if (!int.TryParse(txtNota.Text, out aux))
                {
                    ShowAlertMessage("Verifique que todos los campos esten correctos");
                    return;
                }

            }
            if (validarNotas(sumaNotas))
            {
                CNotas nota = new CNotas("SQL", this.nota);
                if (nota.Insert() > 0)
                {
                    ShowAlertMessage("El porcentaje de notas que asigno se guardo satisfactoriamente");
                    System.Threading.Thread.Sleep(3000);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }

            }
        }

        public bool validarNotas(int sumaNotas)
        {
            if (sumaNotas > 100)
            {
                ShowAlertMessage("La proposicion de las notas a excedido el limite que es: 100");
                return false;
            }
            if (sumaNotas < 100)
            {
                ShowAlertMessage("La proposicion de las notas es menor a 100");
                return false;
            }
            if (sumaNotas == 100)
            {
                return true;
            }
            return false;
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

        protected void boxGrupos_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.inicializarTabla();
            this.notasRegistradas();
        }
    }
}