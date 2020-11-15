

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Municipalidad.Models;

namespace Municipalidad.Controllers
{
   
    public class InicioSesionController : Controller
    {
        readonly InicioSesionDataAccessLayer IS = new InicioSesionDataAccessLayer();
        // GET: HomeController1

        public ActionResult Index(string nombre, string pass) {
            
          
            if (IS.IniciarSesion(nombre, pass))
            {
                Response.Redirect("/Home/Index");
               
            }
            return View("Index", "_Layout_InicioSeseion");
        }

        // GET: HomeController1/Details/5
    }
    }

