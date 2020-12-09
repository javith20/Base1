using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using BaseTec.Models;
using BaseTec.Modelo;

namespace BaseTec.Controlador
{
    public class ControllerGestionBanco
    {
        private DatosGestionBanco objDatosGestionBanco;
        private DatosUsuario objDatosUsuario;
        public string error { get; set; }

        public ControllerGestionBanco()
        {
            objDatosGestionBanco = new DatosGestionBanco();
            objDatosUsuario = new DatosUsuario();
        }
        /// <summary>
        /// Obtener listado de los departamentos
        /// </summary>
        /// <returns>Retorna objeto dataset con los datos</returns>
        public DataSet obtenerDepartamentos()
        {
            this.error = "";
            DataSet departamentos = objDatosGestionBanco.obtenerDepartamentos();
            this.error = objDatosGestionBanco.error;
            return departamentos;
        }
        /// <summary>
        /// Obtener municipios de acuerdo al departamento
        /// </summary>
        /// <param name="idDepartamento">id del departamento</param>
        /// <returns>Dataset con los municipios</returns>
        public DataSet obtenerMunicipiosByIdDepartamento(int idDepartamento)
        {
            this.error = "";
            DataSet municipios = objDatosGestionBanco.obtenerMunicipiosByIdDepartamento(idDepartamento);
            this.error = objDatosGestionBanco.error;
            return municipios;
        }

        /// <summary>
        /// Método que valida el inicio de sesión
        /// </summary>
        /// <param name="unUsuario">Objeto usuario con login y password</param>
        /// <returns>Un usuario si existe de lo contrario null</returns>
        public Usuario iniciarSesion(Usuario unUsuario)
        {
            this.error = "";
            Usuario usuario = objDatosUsuario.iniciarSesion(unUsuario);
            this.error = objDatosUsuario.error;
            return usuario;
        }
        
    }
}