using BaseTec.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace BaseTec.Controllers
{
    public class Estado_CuentaController : Controller
    {
        private BD1Entities1 db = new BD1Entities1();

        // GET: Estado_Cuenta
        public ActionResult Index()
        {
            var estado_Cuenta = db.Estado_Cuenta.Include(e => e.Cuenta);
            return View(estado_Cuenta.ToList());
        }

        // GET: Estado_Cuenta/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Estado_Cuenta estado_Cuenta = db.Estado_Cuenta.Find(id);
            if (estado_Cuenta == null)
            {
                return HttpNotFound();
            }
            return View(estado_Cuenta);
        }

        // GET: Estado_Cuenta/Create
        public ActionResult Create()
        {
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta");
            return View();
        }

        // POST: Estado_Cuenta/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Estado_Cuenta,Id_Cuenta,Fecha_Inicio,Fecha_Fin,Saldo_Inicial,Saldo_Final,Activo")] Estado_Cuenta estado_Cuenta)
        {
            if (ModelState.IsValid)
            {
                db.Estado_Cuenta.Add(estado_Cuenta);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", estado_Cuenta.Id_Cuenta);
            return View(estado_Cuenta);
        }

        // GET: Estado_Cuenta/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Estado_Cuenta estado_Cuenta = db.Estado_Cuenta.Find(id);
            if (estado_Cuenta == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", estado_Cuenta.Id_Cuenta);
            return View(estado_Cuenta);
        }

        // POST: Estado_Cuenta/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Estado_Cuenta,Id_Cuenta,Fecha_Inicio,Fecha_Fin,Saldo_Inicial,Saldo_Final,Activo")] Estado_Cuenta estado_Cuenta)
        {
            if (ModelState.IsValid)
            {
                db.Entry(estado_Cuenta).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", estado_Cuenta.Id_Cuenta);
            return View(estado_Cuenta);
        }

        // GET: Estado_Cuenta/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Estado_Cuenta estado_Cuenta = db.Estado_Cuenta.Find(id);
            if (estado_Cuenta == null)
            {
                return HttpNotFound();
            }
            return View(estado_Cuenta);
        }

        // POST: Estado_Cuenta/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Estado_Cuenta estado_Cuenta = db.Estado_Cuenta.Find(id);
            // db.Estado_Cuenta.Remove(estado_Cuenta);
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
