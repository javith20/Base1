using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using BaseTec.Models;

namespace BaseTec.Modelo
{
    public class DatosUsuario
    {
        private SqlConnection conexion;
        public string error ;

        public DatosUsuario()
        {
            this.conexion = Conexion.getConexion();
        }
        /// <summary>
        /// Método utilizado para el inicio de sesion
        /// </summary>
        /// <param name="unUsuario">Objeto de tipo Usuario</param>
        /// <returns>Objeto de tipo Usuario</returns>
        public Usuario iniciarSesion(Usuario unUsuario)
        {
            this.error = "";
            SqlCommand comando = new SqlCommand();
            Usuario usuRetorno = null;
            try
            {
                comando.Connection = this.conexion;
                comando.CommandText = "select usuarios.*, personas.perNombres, personas.perApellidos, " +
                " roles.rolNombre from usuarios inner join personas on usuarios.usuPersona=personas.idPersona " +
                " inner join usuarioroles on usuarioroles.usuUsuario=usuarios.idUsuario " +
                " inner join roles on usuarioroles.usuRol = roles.idRol " +
                " where usuarios.usuUserName=@login and usuarios.usuPassword=@password " +
                " and usuarios.usuEstado='Activo'";
                comando.Parameters.AddWithValue("@login", unUsuario.Nombre_Usuario);
                comando.Parameters.AddWithValue("@password", unUsuario.Clave);
                SqlDataReader registro = comando.ExecuteReader();
                if (registro.Read())
                {
                    usuRetorno = new Usuario();
                    usuRetorno.Id_Usuario = registro.GetInt32(0);
                    usuRetorno.Id_Persona = registro.GetInt32(4);
                    usuRetorno.Nombre_Usuario = registro.GetString(25);
                    usuRetorno.Es_Admin = registro.GetBoolean(1);
                }
                registro.Close();
            }
            catch (SqlException ex)
            {
                this.error = ex.Message;
            }
            return usuRetorno;
        }
    }
}