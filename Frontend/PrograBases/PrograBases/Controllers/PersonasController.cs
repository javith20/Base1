using BaseTec.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace BaseTec.Controllers
{
    public class PersonasController : Controller
    {
        private BD1Entities1 db = new BD1Entities1();

        // GET: Personas
        public ActionResult Index()
        {
            var persona = db.Persona.Include(p => p.Tipo_Documento);
            return View(persona.ToList());
        }

        // GET: Personas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Persona persona = db.Persona.Find(id);
            if (persona == null)
            {
                return HttpNotFound();
            }
            return View(persona);
        }

        // GET: Personas/Create
        public ActionResult Create()
        {
            ViewBag.Id_TipoDocumento = new SelectList(db.Tipo_Documento, "Id_TipoDocumento", "Nombre");
            return View();
        }

        // POST: Personas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Persona,Nombre,Id_TipoDocumento,Documento_Identidad,Fecha_Nacimiento,Email,Telefono1,Telefono2,Activo")] Persona persona)
        {
            if (ModelState.IsValid)
            {
                db.Persona.Add(persona);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_TipoDocumento = new SelectList(db.Tipo_Documento, "Id_TipoDocumento", "Nombre", persona.Id_TipoDocumento);
            return View(persona);
        }

        // GET: Personas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Persona persona = db.Persona.Find(id);
            if (persona == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_TipoDocumento = new SelectList(db.Tipo_Documento, "Id_TipoDocumento", "Nombre", persona.Id_TipoDocumento);
            return View(persona);
        }

        // POST: Personas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Persona,Nombre,Id_TipoDocumento,Documento_Identidad,Fecha_Nacimiento,Email,Telefono1,Telefono2,Activo")] Persona persona)
        {
            if (ModelState.IsValid)
            {
                db.Entry(persona).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_TipoDocumento = new SelectList(db.Tipo_Documento, "Id_TipoDocumento", "Nombre", persona.Id_TipoDocumento);
            return View(persona);
        }

        // GET: Personas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Persona persona = db.Persona.Find(id);
            if (persona == null)
            {
                return HttpNotFound();
            }
            return View(persona);
        }

        // POST: Personas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            // Persona persona = db.Persona.Find(id);
            //db.Persona.Remove(persona);
            //db.SaveChanges();
            db.Eliminar_Persona(id, Global.usuario + "", Request.UserHostAddress);
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
