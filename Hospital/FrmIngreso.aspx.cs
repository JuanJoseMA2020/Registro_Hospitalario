using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital
{
    public partial class FrmIngreso : System.Web.UI.Page
    {
        int cont;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["ses_cont"] = 0;
                TxtUsuario.Focus();
            }
        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            if (TxtUsuario.Text.Trim() == "" || TxtClave.Text.Trim() == "")
            {
                LblMensaje.Text = "Usuario y clave son obligatorios";
                TxtUsuario.Focus();
            }
            else
                if ( TxtUsuario.Text == "Admin" && TxtClave.Text == "0001")
            {
                Session["ses_ingreso"] = TxtUsuario.Text;
                Response.Redirect("FrmAdmin.aspx");
            }
            if(TxtUsuario.Text == "David.estrada" && TxtClave.Text == "1001" || TxtClave.Text == "1602" && TxtUsuario.Text == "Mazo.JJ")
            {
                Session["ses_ingreso"] = TxtUsuario.Text;
                Response.Redirect("FrmUsuario.aspx");
            }
            else
            {
                cont = Convert.ToInt32(Session["ses_cont"]);
                cont++;
                Session["ses_cont"] = cont;
                if (cont == 3)
                {
                    LblMensaje.Text = "Excedió los 3 intentos, comuníquese con el ADMINISTRADOR";
                    TxtUsuario.Text = "";
                    TxtClave.Text = "";
                    TxtClave.Enabled = false;
                    BtnIngresar.Enabled = false;
                }
                else
                {
                    LblMensaje.Text = "Usuario o clave invalidos";
                    TxtClave.Text = "";
                    TxtUsuario.Focus();
                }
            }
        }
    }
}
