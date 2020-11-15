using BaseTec.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace BaseTec.Controllers
{
    public class BeneficiariosController : Controller
    {
        private BD1Entities1 db = new BD1Entities1();

        // GET: Beneficiarios
        public ActionResult Index()
        {
            var beneficiario = db.Beneficiario.Include(b => b.Cuenta).Include(b => b.Parentezco).Include(b => b.Persona);
            return View(beneficiario.ToList());
        }

        // GET: Beneficiarios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Beneficiario beneficiario = db.Beneficiario.Find(id);
            if (beneficiario == null)
            {
                return HttpNotFound();
            }
            return View(beneficiario);
        }

        // GET: Beneficiarios/Create
        public ActionResult Create()
        {
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta");
            ViewBag.Id_Parentezco = new SelectList(db.Parentezco, "Id_Parentezco", "Nombre");
            ViewBag.Id_Persona = new SelectList(db.Persona, "Id_Persona", "Nombre");
            return View();
        }

        // POST: Beneficiarios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Beneficiario,Id_Persona,Id_Cuenta,Id_Parentezco,Porcentaje,Activo")] Beneficiario beneficiario)
        {
            if (ModelState.IsValid)
            {
                //db.Beneficiario.Add(beneficiario);
                //db.SaveChanges();
                db.Crear_Beneficiario(beneficiario.Id_Beneficiario + "", beneficiario.Id_Persona + "", beneficiario.Id_Parentezco + "", beneficiario.Porcentaje);
                return RedirectToAction("Index");
            }

            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", beneficiario.Id_Cuenta);
            ViewBag.Id_Parentezco = new SelectList(db.Parentezco, "Id_Parentezco", "Nombre", beneficiario.Id_Parentezco);
            ViewBag.Id_Persona = new SelectList(db.Persona, "Id_Persona", "Nombre", beneficiario.Id_Persona);
            return View(beneficiario);
        }

        // GET: Beneficiarios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Beneficiario beneficiario = db.Beneficiario.Find(id);
            if (beneficiario == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", beneficiario.Id_Cuenta);
            ViewBag.Id_Parentezco = new SelectList(db.Parentezco, "Id_Parentezco", "Nombre", beneficiario.Id_Parentezco);
            ViewBag.Id_Persona = new SelectList(db.Persona, "Id_Persona", "Nombre", beneficiario.Id_Persona);
            return View(beneficiario);
        }

        // POST: Beneficiarios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Beneficiario,Id_Persona,Id_Cuenta,Id_Parentezco,Porcentaje,Activo")] Beneficiario beneficiario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(beneficiario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Cuenta = new SelectList(db.Cuenta, "Id_Cuenta", "Num_Cuenta", beneficiario.Id_Cuenta);
            ViewBag.Id_Parentezco = new SelectList(db.Parentezco, "Id_Parentezco", "Nombre", beneficiario.Id_Parentezco);
            ViewBag.Id_Persona = new SelectList(db.Persona, "Id_Persona", "Nombre", beneficiario.Id_Persona);
            return View(beneficiario);
        }

        // GET: Beneficiarios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Beneficiario beneficiario = db.Beneficiario.Find(id);
            if (beneficiario == null)
            {
                return HttpNotFound();
            }
            return View(beneficiario);
        }

        // POST: Beneficiarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Beneficiario beneficiario = db.Beneficiario.Find(id);
            // db.Beneficiario.Remove(beneficiario);
            // db.SaveChanges();
            db.Eliminar_Beneficiario1(id, Global.usuario + "", Request.UserHostAddress);
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
