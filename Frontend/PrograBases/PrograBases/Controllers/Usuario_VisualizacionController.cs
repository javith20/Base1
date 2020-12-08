using BaseTec.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace BaseTec.Controllers
{
    public class Usuario_VisualizacionController : Controller
    {
        private BD1Entities1 db = new BD1Entities1();

        // GET: Usuario_Visualizacion
        public ActionResult Index()
        {
            var usuario_Visualizacion = db.Usuario_Visualizacion.Include(u => u.Cuenta).Include(u => u.Usuario);
            return View(usuario_Visualizacion.ToList());
        }

        // GET: Usuario_Visualizacion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario_Visualizacion usuario_Visualizacion = db.Usuario_Visualizacion.Find(id);
            if (usuario_Visualizacion == null)
            {
                return HttpNotFound();
            }
            return View(usuario_Visualizacion);
        }

        // GET: Usuario_Visualizacion/Create
        public ActionResult Create()
        {
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta");
            ViewBag.Id_Usuario = new SelectList(db.Usuario, "Id_Usuario", "Nombre_Usuario");
            return View();
        }

        // POST: Usuario_Visualizacion/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Usuario_Visualizacion,Id_Usuario,Id_Cuenta,Activo")] Usuario_Visualizacion usuario_Visualizacion)
        {
            if (ModelState.IsValid)
            {
                db.Usuario_Visualizacion.Add(usuario_Visualizacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", usuario_Visualizacion.Id_Cuenta);
            ViewBag.Id_Usuario = new SelectList(db.Usuario, "Id_Usuario", "Nombre_Usuario", usuario_Visualizacion.Id_Usuario);
            return View(usuario_Visualizacion);
        }

        // GET: Usuario_Visualizacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario_Visualizacion usuario_Visualizacion = db.Usuario_Visualizacion.Find(id);
            if (usuario_Visualizacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", usuario_Visualizacion.Id_Cuenta);
            ViewBag.Id_Usuario = new SelectList(db.Usuario, "Id_Usuario", "Nombre_Usuario", usuario_Visualizacion.Id_Usuario);
            return View(usuario_Visualizacion);
        }

        // POST: Usuario_Visualizacion/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Usuario_Visualizacion,Id_Usuario,Id_Cuenta,Activo")] Usuario_Visualizacion usuario_Visualizacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usuario_Visualizacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", usuario_Visualizacion.Id_Cuenta);
            ViewBag.Id_Usuario = new SelectList(db.Usuario, "Id_Usuario", "Nombre_Usuario", usuario_Visualizacion.Id_Usuario);
            return View(usuario_Visualizacion);
        }

        // GET: Usuario_Visualizacion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario_Visualizacion usuario_Visualizacion = db.Usuario_Visualizacion.Find(id);
            if (usuario_Visualizacion == null)
            {
                return HttpNotFound();
            }
            return View(usuario_Visualizacion);
        }

        // POST: Usuario_Visualizacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Usuario_Visualizacion usuario_Visualizacion = db.Usuario_Visualizacion.Find(id);
            //db.Usuario_Visualizacion.Remove(usuario_Visualizacion);
            //db.SaveChanges();
            db.Eliminar_Usuario_Visualizacion(id, Global.usuario + "", Request.UserHostAddress);
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
