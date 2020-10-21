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
    public class ParentezcoesController : Controller
    {
        private BD1Entities db = new BD1Entities();

        // GET: Parentezcoes
        public ActionResult Index()
        {
            return View(db.Parentezco.ToList());
        }

        // GET: Parentezcoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Parentezco parentezco = db.Parentezco.Find(id);
            if (parentezco == null)
            {
                return HttpNotFound();
            }
            return View(parentezco);
        }

        // GET: Parentezcoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Parentezcoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Parentezco,Nombre,Activo")] Parentezco parentezco)
        {
            if (ModelState.IsValid)
            {
                db.Parentezco.Add(parentezco);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(parentezco);
        }

        // GET: Parentezcoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Parentezco parentezco = db.Parentezco.Find(id);
            if (parentezco == null)
            {
                return HttpNotFound();
            }
            return View(parentezco);
        }

        // POST: Parentezcoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Parentezco,Nombre,Activo")] Parentezco parentezco)
        {
            if (ModelState.IsValid)
            {
                db.Entry(parentezco).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(parentezco);
        }

        // GET: Parentezcoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Parentezco parentezco = db.Parentezco.Find(id);
            if (parentezco == null)
            {
                return HttpNotFound();
            }
            return View(parentezco);
        }

        // POST: Parentezcoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Parentezco parentezco = db.Parentezco.Find(id);
            db.Parentezco.Remove(parentezco);
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
