using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BaseTec.Models;

namespace BaseTec.Controllers
{
    public class Tipo_DocumentoController : Controller
    {
        private BD1Entities db = new BD1Entities();

        // GET: Tipo_Documento
        public ActionResult Index()
        {
            return View(db.Tipo_Documento.ToList());
        }

        // GET: Tipo_Documento/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Documento tipo_Documento = db.Tipo_Documento.Find(id);
            if (tipo_Documento == null)
            {
                return HttpNotFound();
            }
            return View(tipo_Documento);
        }

        // GET: Tipo_Documento/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Tipo_Documento/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_TipoDocumento,Nombre,Activo")] Tipo_Documento tipo_Documento)
        {
            if (ModelState.IsValid)
            {
                db.Tipo_Documento.Add(tipo_Documento);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tipo_Documento);
        }

        // GET: Tipo_Documento/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Documento tipo_Documento = db.Tipo_Documento.Find(id);
            if (tipo_Documento == null)
            {
                return HttpNotFound();
            }
            return View(tipo_Documento);
        }

        // POST: Tipo_Documento/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_TipoDocumento,Nombre,Activo")] Tipo_Documento tipo_Documento)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipo_Documento).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tipo_Documento);
        }

        // GET: Tipo_Documento/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Documento tipo_Documento = db.Tipo_Documento.Find(id);
            if (tipo_Documento == null)
            {
                return HttpNotFound();
            }
            return View(tipo_Documento);
        }

        // POST: Tipo_Documento/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tipo_Documento tipo_Documento = db.Tipo_Documento.Find(id);
            db.Tipo_Documento.Remove(tipo_Documento);
            db.SaveChanges();
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
