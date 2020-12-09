using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BaseTec.Models;
using BaseTec.Controllers;
using BaseTec.Controlador;

namespace BaseTec
{
    public partial class FrmIniciarSesion : System.Web.UI.Page
    {
        ControllerGestionBanco objControllerGestionBanco = new ControllerGestionBanco();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["x"] != null)
            {
                int valor = Convert.ToInt32(Request.QueryString["x"]);
                switch (valor)
                {
                    case 1: 
                        lblMensaje.Text = "Debe Iniciar primero con su usuario y contraseña";
                        break;
                    case 2: 
                        lblMensaje.Text = "Ha cerrado la sesión. Hasta pronto";
                        break;
                }
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario unUsuario = new Usuario();
            unUsuario.Nombre_Usuario = txtUsuario.Text;
            unUsuario.Clave = txtPassword.Text;
            unUsuario = objControllerGestionBanco.iniciarSesion(unUsuario);
            if (unUsuario!=null)
            {
                switch (unUsuario.Es_Admin){
                    case true:
                        Session["Nombre_Usuario"] = unUsuario.Nombre_Usuario;
                        Response.Redirect("Vista/Administrador/default.aspx");
                        break;
                    /* case "Cajero":
                         Session["Nombre_Usuario"] = unUsuario.Nombre_Usuario;
                         Response.Redirect("Vista/Cajero/default.aspx");
                         break;*/
                    case false:
                        Session["idUsuaNombre_Usuariorio"] = unUsuario.Nombre_Usuario;
                        Response.Redirect("Vista/Clientes/default.aspx");
                        break;
                }
            }
            else
            {
                lblMensaje.Text= "Usuario no registrado, verifique";
            }
        }
    }
}