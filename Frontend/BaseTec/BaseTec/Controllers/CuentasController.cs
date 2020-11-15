using BaseTec.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace BaseTec.Controllers
{
    public class CuentasController : Controller
    {
        private BD1Entities1 db = new BD1Entities1();

        // GET: Cuentas
        public ActionResult Index()
        {
            var cuenta = db.Cuenta.Include(c => c.Persona).Include(c => c.Tipo_Cuenta_Ahorros);
            return View(cuenta.ToList());
        }

        // GET: Cuentas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cuenta cuenta = db.Cuenta.Find(id);
            if (cuenta == null)
            {
                return HttpNotFound();
            }
            return View(cuenta);
        }

        // GET: Cuentas/Create
        public ActionResult Create()
        {
            ViewBag.Id_Persona = new SelectList(db.Persona, "Id_Persona", "Nombre");
            ViewBag.Id_Tipo_Cuenta_Ahorros = new SelectList(db.Tipo_Cuenta_Ahorros, "Id_Tipo_Cuenta_Ahorros", "Nombre");
            return View();
        }

        // POST: Cuentas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Cuenta,Id_Persona,Id_Tipo_Cuenta_Ahorros,Num_Cuenta,Fecha_Creacion,Saldo,Activo")] Cuenta cuenta)
        {
            if (ModelState.IsValid)
            {
                db.Cuenta.Add(cuenta);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Persona = new SelectList(db.Persona, "Id_Persona", "Nombre", cuenta.Id_Persona);
            ViewBag.Id_Tipo_Cuenta_Ahorros = new SelectList(db.Tipo_Cuenta_Ahorros, "Id_Tipo_Cuenta_Ahorros", "Nombre", cuenta.Id_Tipo_Cuenta_Ahorros);
            return View(cuenta);
        }

        // GET: Cuentas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cuenta cuenta = db.Cuenta.Find(id);
            if (cuenta == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Persona = new SelectList(db.Persona, "Id_Persona", "Nombre", cuenta.Id_Persona);
            ViewBag.Id_Tipo_Cuenta_Ahorros = new SelectList(db.Tipo_Cuenta_Ahorros, "Id_Tipo_Cuenta_Ahorros", "Nombre", cuenta.Id_Tipo_Cuenta_Ahorros);
            return View(cuenta);
        }

        // POST: Cuentas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Cuenta,Id_Persona,Id_Tipo_Cuenta_Ahorros,Num_Cuenta,Fecha_Creacion,Saldo,Activo")] Cuenta cuenta)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cuenta).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Persona = new SelectList(db.Persona, "Id_Persona", "Nombre", cuenta.Id_Persona);
            ViewBag.Id_Tipo_Cuenta_Ahorros = new SelectList(db.Tipo_Cuenta_Ahorros, "Id_Tipo_Cuenta_Ahorros", "Nombre", cuenta.Id_Tipo_Cuenta_Ahorros);
            return View(cuenta);
        }

        // GET: Cuentas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cuenta cuenta = db.Cuenta.Find(id);
            if (cuenta == null)
            {
                return HttpNotFound();
            }
            return View(cuenta);
        }

        // POST: Cuentas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Cuenta cuenta = db.Cuenta.Find(id);
            //db.Cuenta.Remove(cuenta);
            //db.SaveChanges();
            db.Eliminar_Cuenta(id, Global.usuario + "", Request.UserHostAddress);
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
