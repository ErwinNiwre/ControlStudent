using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Componentes;
using Entidades;

namespace Principal.Login
{
    public partial class Login : System.Web.UI.Page
    {
        private cDocentes cDocente = new cDocentes("SQL");
        private Docentes docentes = new Docentes();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            this.usuarioCorrecto();
        }

        public void usuarioCorrecto()
        {
            int nitDocente = 0;
            if (int.TryParse(txtUsuario.Text, out nitDocente))
            {
                string textoUsuario = txtUsuario.Text;
                nitDocente = Convert.ToInt32(textoUsuario);
                string textoContraseña = txtContraseña.Text;
                docentes.IdDocente = nitDocente;
                docentes.Contraseña = textoContraseña;
                if (Convert.ToInt32(cDocente.contraseñaDocente(docentes).Tables[0].Rows[0][0]) == 1)
                {
                    Entidades.ClaseEstatica.IdDocente = Convert.ToInt32(cDocente.idDocente(docentes).Tables[0].Rows[0][0]);
                    Response.Redirect("~/Estudiantes/Home.aspx");
                }
                if (Convert.ToInt32(cDocente.contraseñaDocente(docentes).Tables[0].Rows[0][0]) == 0)
                {
                    ShowAlertMessage("USUARIO O CONTRASEÑA ERRONEOS");
                }
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtUsuario.Text = "";
            txtContraseña.Text = "";
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