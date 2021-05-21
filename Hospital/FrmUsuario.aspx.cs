using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Windows.Forms;

namespace Hospital
{
    public partial class FrmAdmin : System.Web.UI.Page
    {
        ClsReserva objreserva = new ClsReserva();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnConsulta_Click(object sender, EventArgs e)
        {
            if (TxtCodigo.Text.Trim() == "")
            {
                LblMensaje.Text = "El codigo es requerido";
                TxtCodigo.Focus();
            }
            else
            {
                LblMensaje.Text = "";
                DataSet ds = new DataSet();
                ds = objreserva.consultar_reserva(TxtCodigo.Text);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    LblMensaje.Text="Reserva no encontrada";
                    Lblfecha.Text = System.DateTime.Now.ToShortDateString();
                    LblHora.Text= System.DateTime.Now.ToShortTimeString();
                    TxtCodigo.Focus();
                    lblnompersonareserva.Text = "";
                    lblvalor.Text = "";
                    lbltelpersoreserva.Text = "";
                    LblLugar.Text = "";
                    Lblnombre.Text = "";
                }
                else
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["activo"].ToString()) == false)
                    {
                        LblMensaje.Text="Reserva existe pero ha sido anulada";
                    }
                    else
                    {
                        LblMensaje.Text = "Reserva encontrada con exito";
                        Lblfecha.Text = ds.Tables[0].Rows[0]["fecha_reserva"].ToString();
                        LblHora.Text= ds.Tables[0].Rows[0]["hora_reserva"].ToString();
                        lblvalor.Text = ds.Tables[0].Rows[0]["valor_reserva"].ToString();
                        Lblnombre.Text = ds.Tables[0].Rows[0]["nom_cancha"].ToString();
                        lblnompersonareserva.Text= ds.Tables[0].Rows[0]["nom_user"].ToString();
                        lbltelpersoreserva.Text= ds.Tables[0].Rows[0]["telefono"].ToString();
                        LblLugar.Text = ds.Tables[0].Rows[0]["lugar"].ToString();
                    } 
                }
                
            }
        }
    }
}