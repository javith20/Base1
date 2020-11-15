using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaseTec.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
     
        public ActionResult Index(string nombre, string pass)
        {


            if (true)
            if (true)
            {
                Response.Redirect("/Home/Index");

            }
            return View("Index", "_Layout_InicioSeseion");
        }

    }
}