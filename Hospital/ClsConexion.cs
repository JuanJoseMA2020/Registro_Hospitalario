using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Hospital
{
    public class ClsConexion
    {
        public SqlConnection abrir_base()
        {
            try
            {
                SqlConnection conec=new SqlConnection();
                conec.ConnectionString = "data source=JUAN-PC\\DAVID;database=Proyecto;user id=sa;pwd=21";
               // conec.ConnectionString = "data source=;database=proyectx;integrated security==true";
                conec.Open();
                return conec;
            }
            catch (Exception error)
            {
                throw new Exception(error.Message);
            }
        }
    }
}