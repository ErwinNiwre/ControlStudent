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
    public partial class Home : System.Web.UI.Page
    {
        private cDocentes cDocente = new cDocentes("SQL");
        private Docentes docentes = new Docentes();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtConfirmarNuevaContraseña.Text = "";
            txtUsuario.Text = "";
            txtNuevaContraseña.Text = "";
            txtContraseñaActual.Text = "";
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            string textBoxUsuario = txtUsuario.Text;
            int nitDocente=Convert.ToInt32(textBoxUsuario);
            docentes.IdDocente = nitDocente;
            docentes.Contraseña = txtContraseñaActual.Text;
            docentes.Concurrencia_id = 0;
            if (Convert.ToInt32(cDocente.contraseñaDocente(docentes).Tables[0].Rows[0][0]) == 1) //si la contraseña es correcta
            {
                if (Entidades.ClaseEstatica.IdDocente == Convert.ToInt32(cDocente.idDocente(docentes).Tables[0].Rows[0][0]))//si la cuenta que quiere cambiar es la misma con la que ingreso puede cambiarla
                {
                    if (txtNuevaContraseña.Text.Equals(txtConfirmarNuevaContraseña.Text))
                    {
                        docentes.Contraseña = txtConfirmarNuevaContraseña.Text;
                        docentes.IdDocente = ClaseEstatica.IdDocente;
                        cDocente.actualizarContraseña(docentes);
                        ShowAlertMessage("La contraseña se ha actualizado correctamente");
                        return;
                    }
                    if (!txtNuevaContraseña.Text.Equals(txtConfirmarNuevaContraseña.Text))
                    {
                        ShowAlertMessage("Confirme que los datos ingresados esten correctos");
                        return;
                    }
                }

                if (Entidades.ClaseEstatica.IdDocente != Convert.ToInt32(cDocente.idDocente(docentes).Tables[0].Rows[0][0]))
                {
                    ShowAlertMessage("No se cambio la contraseña debido a que no esta logueado con esa cuenta");
                    return;
                }
            }
            if (Convert.ToInt32(cDocente.contraseñaDocente(docentes).Tables[0].Rows[0][0]) == 0)
            {
                ShowAlertMessage("El usuario y contraseña son incorrectas");
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
    }
}