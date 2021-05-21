using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; //libreria del DataSet

namespace Hospital
{
    public partial class FrmCita : System.Web.UI.Page
    {
        ClsReserva objreserva = new ClsReserva();
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (objreserva.guardar_reserva(TxtCodigo.Text, TxtHora.Text, TxtFecha.Text, txtnom_usuario.Text,txtel_usuario.Text ,txtnombre.Text, Txtvalor_reserva.Text, Txtlugar_cancha.Text))
                {
                 LblMensaje.Text = "Guardado con exito ";
                }
            else
            {
                LblMensaje.Text = "Rayos ha habido un error al guardar la reserva";
            }
        }
    }
}