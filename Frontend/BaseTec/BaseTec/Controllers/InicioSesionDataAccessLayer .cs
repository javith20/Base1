using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace BaseTec.Models
{
    public class InicioSesionDataAccessLayer
    {
        string connectionString = cone.connectionString;
        //To View all InicioSesionistradors details  
        public bool IniciarSesion(string user, string pass)
        {


            using (SqlConnection con = new SqlConnection(connectionString))
            {


                string inicio = "Select Nombre FROM Administrador where ( Nombre ='" + user + "' and Activo = '1' and Contrasegna = '" + pass + "')";
                SqlCommand cmd = new SqlCommand(inicio, con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    con.Close();
                    return true;
                } 
                return false;
                //inicio = "Select Nombre FROM Usuario where ( Nombre ='" + user + "' and Activo = '1' and Contrasegna = '" + pass + "')";

            }
        }

    }

}
