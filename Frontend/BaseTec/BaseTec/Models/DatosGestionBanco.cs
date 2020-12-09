using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace BaseTec.Modelo
{
    public class DatosGestionBanco
    {
        public SqlConnection conexion;
        public string error;

        public DatosGestionBanco()
        {
            this.conexion = Conexion.getConexion();
        }
        /// <summary>
        /// Método que obtiene de la base de datos los departamentos
        /// </summary>
        /// <returns>Objeto de tipo Dataset</returns>
        public DataSet obtenerDepartamentos()
        {
            this.error = "";
            SqlCommand comando = new SqlCommand();
            comando.Connection = this.conexion;
            comando.CommandText = "select * from departamentos";
            DataSet registros = new DataSet();
            try
            {
                SqlDataAdapter adaptador = new SqlDataAdapter(comando);
                adaptador.Fill(registros, "Departamentos");
            }
            catch (SqlException ex)
            {
                this.error = ex.Message;
            }
            return registros;         
        }
        /// <summary>
        /// Método que obtiene los municipios de acuerdo al departamento
        /// </summary>
        /// <param name="idDepartamento">Id del departamento</param>
        /// <returns>Dataset con los municipios</returns>
        public DataSet obtenerMunicipiosByIdDepartamento(int idDepartamento)
        {
            this.error = "";
            SqlCommand comando = new SqlCommand();
            comando.Connection = this.conexion;
            comando.CommandText = "select municipios.* from municipios " + 
            " inner join departamentos on municipios.munDepartamento=departamentos.idDepartamento" +
            " where municipios.munDepartamento=@id";
            comando.Parameters.AddWithValue("@id", idDepartamento);
            DataSet registros = new DataSet();
            try
            {
                SqlDataAdapter adaptador = new SqlDataAdapter(comando);
                adaptador.Fill(registros, "municipios");
            }
            catch (SqlException ex)
            {
                this.error = ex.Message;
            }
            return registros;         
        }
    }
}