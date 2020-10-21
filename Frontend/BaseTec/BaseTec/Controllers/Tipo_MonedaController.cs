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
    public class Tipo_MonedaController : Controller
    {
        private BD1Entities db = new BD1Entities();

        // GET: Tipo_Moneda
        public ActionResult Index()
        {
            return View(db.Tipo_Moneda.ToList());
        }

        // GET: Tipo_Moneda/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Moneda tipo_Moneda = db.Tipo_Moneda.Find(id);
            if (tipo_Moneda == null)
            {
                return HttpNotFound();
            }
            return View(tipo_Moneda);
        }

        // GET: Tipo_Moneda/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Tipo_Moneda/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Tipo_Moneda,Nombre,Simbolo,Activo")] Tipo_Moneda tipo_Moneda)
        {
            if (ModelState.IsValid)
            {
                db.Tipo_Moneda.Add(tipo_Moneda);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tipo_Moneda);
        }

        // GET: Tipo_Moneda/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Moneda tipo_Moneda = db.Tipo_Moneda.Find(id);
            if (tipo_Moneda == null)
            {
                return HttpNotFound();
            }
            return View(tipo_Moneda);
        }

        // POST: Tipo_Moneda/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Tipo_Moneda,Nombre,Simbolo,Activo")] Tipo_Moneda tipo_Moneda)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipo_Moneda).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tipo_Moneda);
        }

        // GET: Tipo_Moneda/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Moneda tipo_Moneda = db.Tipo_Moneda.Find(id);
            if (tipo_Moneda == null)
            {
                return HttpNotFound();
            }
            return View(tipo_Moneda);
        }

        // POST: Tipo_Moneda/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tipo_Moneda tipo_Moneda = db.Tipo_Moneda.Find(id);
            db.Tipo_Moneda.Remove(tipo_Moneda);
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
