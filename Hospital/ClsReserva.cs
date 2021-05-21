using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Hospital
{
    public class ClsReserva
    {
        ClsConexion objconeccion = new ClsConexion();
        SqlCommand cmd = new SqlCommand();

        public DataSet consultar_reserva(string pcod_reserva)
        {
            try
            {
                cmd.Connection = objconeccion.abrir_base();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_consultar_reserva";
                cmd.Parameters.Add("@pcod_reserva", pcod_reserva);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
            
        }
          public bool guardar_reserva(string pcod_reserva,string phora_reserva, string pfecha_reserva, string pnom_user,
                                        string ptelefono ,string pnom_cancha, string pvalor_reserva, string plugar )
        {
            try
            {
                cmd.Connection = objconeccion.abrir_base();
                cmd.CommandType= CommandType.StoredProcedure;
                cmd.CommandText = "sp_guardar_reserva";
                cmd.Parameters.Add("pcod_reserva", pcod_reserva);
                cmd.Parameters.Add("phora_reserva", phora_reserva);         
                cmd.Parameters.Add("pfecha_reserva", pfecha_reserva);
                cmd.Parameters.Add("pnom_user", pnom_user);
                cmd.Parameters.Add("telefono", ptelefono);
                cmd.Parameters.Add("pnom_cancha", pnom_cancha);
                cmd.Parameters.Add("pvalor_reserva", pvalor_reserva);
                cmd.Parameters.Add("plugar", plugar);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }



    }
}