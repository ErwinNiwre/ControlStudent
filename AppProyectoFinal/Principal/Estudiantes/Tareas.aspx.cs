using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using Componentes;
using Entidades;
using System.Data;
namespace Principal.Estudiantes
{
    public partial class Tareas : System.Web.UI.Page
    {
        private CGrupo cGrupo = new CGrupo("SQL");
        private Grupo grupo = new Grupo();
        private cTarea cTarea = new cTarea("SQL");
        private Tarea tareas = new Tarea();
        private bool unMensaje = false;
        private List<Attachment> archiv = new List<Attachment>();
        private List<HttpPostedFile> posted = new List<HttpPostedFile>();

        public List<HttpPostedFile> Posted
        {
            get { return posted; }
            set { posted = value; }
        }

        public List<Attachment> Archiv
        {
            get { return archiv; }
            set { archiv = value; }
        }

        public bool UnMensaje
        {
            get { return unMensaje; }
            set { unMensaje = value; }
        }

        #region Eventos Pagina

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                inicializarComboBox();
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(4000);
            this.adjuntarArchivos();
            if (txtPara.Enabled)
            {
                if (camposVacios())
                {
                    this.crearMensaje();
                    return;
                }
            }

            if (!txtPara.Enabled)
            {
                this.crearMensajeVarios();
                this.ejecutarGuardarEnBaseDeDatos();
            }

        }

        protected void checkTodos_CheckedChanged(object sender, EventArgs e)
        {
            if (checkTodos.Checked)
            {
                txtPara.Text = "";
                txtPara.Enabled = false;
            }
            if (!checkTodos.Checked)
            {
                txtPara.Enabled = true;
            }
        }

        #endregion

        #region Metodos

        public void inicializarComboBox()
        {
            boxGrupos.DataSource = cGrupo.ConsultarGrupo().Tables[0];
            boxGrupos.DataValueField = "id_grupo";
            boxGrupos.DataTextField = "Grupo";
            boxGrupos.DataBind();
        }

        #region Envio de mensaje
        public void crearMensaje()
        {
            unMensaje = true;
            string correoDocente = txtCorreoDocente.Text;
            string correoPara = txtPara.Text;
            string asunto = txtAsunto.Text;
            string mensajeEnviar = txtMensaje.Text;
            MailPriority prioridadMensaje = MailPriority.Normal;

            MailMessage mensaje = new MailMessage();
            mensaje.From = new MailAddress(correoDocente);
            mensaje.To.Add(new MailAddress(correoPara));
            mensaje.Subject = asunto;
            mensaje.Body = mensajeEnviar;
            mensaje.IsBodyHtml = true;
            mensaje.Priority = prioridadMensaje;
        }

        public void crearMensajeVarios()
        {
            unMensaje = false;
            int contador = 0;
            string comboIdGrupo = boxGrupos.SelectedValue;
            int idGrupo = Convert.ToInt16(comboIdGrupo);
            grupo.IdGrupo = idGrupo;
            DataSet correos = new DataSet();
            correos = cGrupo.CorreosEstudiantes_GetByGrupo(grupo);

            foreach (DataRow item in correos.Tables[0].Rows)
            {
                string correoDocente = txtCorreoDocente.Text;
                string correoPara = item.Table.Rows[contador][0].ToString();
                string asunto = txtAsunto.Text;
                string mensajeEnviar = txtMensaje.Text;
                MailPriority prioridadMensaje = MailPriority.Normal;

                MailMessage mensaje = new MailMessage();
                mensaje.From = new MailAddress(correoDocente);
                mensaje.To.Add(new MailAddress(correoPara));
                mensaje.Subject = asunto;
                mensaje.Body = mensajeEnviar;
                mensaje.IsBodyHtml = true;
                mensaje.Priority = prioridadMensaje;
                if (this.Archiv.Count > 0)
                {
                    for (int i = 0; i < Archiv.Count; i++)
                    {
                        mensaje.Attachments.Add(Archiv[i]);
                    }

                }
                contador++;
                this.EnviarMensaje(mensaje);
            }


        }

        public void EnviarMensaje(MailMessage mensaje)
        {

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            string correoDocente = txtCorreoDocente.Text;
            string contraseñaCorreoDocente = txtContraseña.Text;
            smtp.Credentials = new NetworkCredential(correoDocente, contraseñaCorreoDocente);
            smtp.Port = 587;
            smtp.EnableSsl = true;
            try
            {
                smtp.Send(mensaje);
                ShowAlertMessage("EL MENSAJE FUE ENVIADO CORRECTAMENTE");
            }
            catch (Exception e)
            {
                ShowAlertMessage(e.Message + " " + " CONTRASEÑA O USUARIO INCORRECTOS");

                ShowAlertMessage("EL MENSAJE NO FUE ENVIADO CORRECTAMENTE" + "\n" + "COMPRUEBE QUE TODOS LOS CAMPOS ESTEN CORRECTOS");
            }
        }

        public void adjuntarArchivos()
        {
            if (adjuntar1.PostedFile.ContentLength < 5000000 && adjuntar2.PostedFile.ContentLength < 5000000 && adjuntar3.PostedFile.ContentLength < 5000000) // 3MEGAS son 3.000.000 esta en bytes
            {
                if (adjuntar1.HasFile)
                {
                    HttpPostedFile archivoSubido = adjuntar1.PostedFile;
                    Stream leerArchivo = archivoSubido.InputStream;
                    string leerOringenArchivo = adjuntar1.FileName;
                    Attachment attachment = new Attachment(leerArchivo, leerOringenArchivo);
                    archiv.Add(attachment);
                    posted.Add(archivoSubido);
                }
                if (adjuntar2.HasFile)
                {
                    HttpPostedFile archivoSubido = adjuntar2.PostedFile;
                    Stream leerArchivo = archivoSubido.InputStream;
                    string leerOringenArchivo = adjuntar2.FileName;
                    Attachment attachment = new Attachment(leerArchivo, leerOringenArchivo);
                    archiv.Add(attachment);
                    posted.Add(archivoSubido);
                }
                if (adjuntar3.HasFile)
                {
                    HttpPostedFile archivoSubido = adjuntar3.PostedFile;
                    HttpPostedFile archivoSubido2 = adjuntar3.PostedFile;
                    Stream leerArchivo = archivoSubido.InputStream;
                    string leerOringenArchivo = adjuntar3.FileName;
                    Attachment attachment = new Attachment(leerArchivo, leerOringenArchivo);
                    archiv.Add(attachment);
                    posted.Add(archivoSubido2);
                }
            }
            else
            {
                ShowAlertMessage("El tamaño de los archivos no pueden pasar de 5 megas por favor verifique ");
            }
        }

        public void ejecutarGuardarEnBaseDeDatos()
        {
            for (int i = 0; i < Posted.Count; i++)
            {
                int tamaño = Posted[i].ContentLength;
                string nombre = Posted[i].FileName;
                int posicion = nombre.LastIndexOf("\\");
                string contentType = Posted[i].ContentType;
                byte[] fileData = new byte[tamaño];
                Posted[i].InputStream.BeginRead(fileData, 0, tamaño, null, null);
                nombre = nombre.Substring(posicion + 1);
                SaveFile(nombre, contentType, tamaño, fileData);
            }

        }

        public void SaveFile(string name, string contentType, int size, byte[] data)
        {
            tareas.IdGrupo = Convert.ToInt16(boxGrupos.SelectedValue.ToString());
            tareas.NombreArchivo = name;
            tareas.TipoContenido = contentType;
            tareas.Tamaño = size;
            tareas.Dato = data;
            tareas.Fecha = DateTime.Today;
            tareas.Concurrencia_id = 1;
            cTarea.Insertar(tareas);
        }


        #endregion

        #endregion

        #region Validaciones

        public bool camposVacios()
        {
            if (txtCorreoDocente.Text.Length < 1 || txtContraseña.Text.Length < 1 || txtPara.Text.Length < 1)
            {
                ShowAlertMessage("Campos Vacios, porfavor revise");
                return false;
            }

            return true;
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