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
    public class Tipo_Cuenta_AhorrosController : Controller
    {
        private BD1Entities1 db = new BD1Entities1();

        // GET: Tipo_Cuenta_Ahorros
        public ActionResult Index()
        {
            var tipo_Cuenta_Ahorros = db.Tipo_Cuenta_Ahorros.Include(t => t.Tipo_Moneda);
            return View(tipo_Cuenta_Ahorros.ToList());
        }

        // GET: Tipo_Cuenta_Ahorros/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Cuenta_Ahorros tipo_Cuenta_Ahorros = db.Tipo_Cuenta_Ahorros.Find(id);
            if (tipo_Cuenta_Ahorros == null)
            {
                return HttpNotFound();
            }
            return View(tipo_Cuenta_Ahorros);
        }

        // GET: Tipo_Cuenta_Ahorros/Create
        public ActionResult Create()
        {
            ViewBag.Id_Tipo_Moneda = new SelectList(db.Tipo_Moneda, "Id_Tipo_Moneda", "Nombre");
            return View();
        }

        // POST: Tipo_Cuenta_Ahorros/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Tipo_Cuenta_Ahorros,Nombre,Id_Tipo_Moneda,Saldo_Minimo,Multa_Saldo_Minimo,Cargo_Anual,Num_Retiros_Humano,Num_Retiros_Automatico,Comision_Humano,Comision_Automatico,Interes,Activo")] Tipo_Cuenta_Ahorros tipo_Cuenta_Ahorros)
        {
            if (ModelState.IsValid)
            {
                db.Tipo_Cuenta_Ahorros.Add(tipo_Cuenta_Ahorros);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Tipo_Moneda = new SelectList(db.Tipo_Moneda, "Id_Tipo_Moneda", "Nombre", tipo_Cuenta_Ahorros.Id_Tipo_Moneda);
            return View(tipo_Cuenta_Ahorros);
        }

        // GET: Tipo_Cuenta_Ahorros/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Cuenta_Ahorros tipo_Cuenta_Ahorros = db.Tipo_Cuenta_Ahorros.Find(id);
            if (tipo_Cuenta_Ahorros == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Tipo_Moneda = new SelectList(db.Tipo_Moneda, "Id_Tipo_Moneda", "Nombre", tipo_Cuenta_Ahorros.Id_Tipo_Moneda);
            return View(tipo_Cuenta_Ahorros);
        }

        // POST: Tipo_Cuenta_Ahorros/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Tipo_Cuenta_Ahorros,Nombre,Id_Tipo_Moneda,Saldo_Minimo,Multa_Saldo_Minimo,Cargo_Anual,Num_Retiros_Humano,Num_Retiros_Automatico,Comision_Humano,Comision_Automatico,Interes,Activo")] Tipo_Cuenta_Ahorros tipo_Cuenta_Ahorros)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipo_Cuenta_Ahorros).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Tipo_Moneda = new SelectList(db.Tipo_Moneda, "Id_Tipo_Moneda", "Nombre", tipo_Cuenta_Ahorros.Id_Tipo_Moneda);
            return View(tipo_Cuenta_Ahorros);
        }

        // GET: Tipo_Cuenta_Ahorros/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tipo_Cuenta_Ahorros tipo_Cuenta_Ahorros = db.Tipo_Cuenta_Ahorros.Find(id);
            if (tipo_Cuenta_Ahorros == null)
            {
                return HttpNotFound();
            }
            return View(tipo_Cuenta_Ahorros);
        }

        // POST: Tipo_Cuenta_Ahorros/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tipo_Cuenta_Ahorros tipo_Cuenta_Ahorros = db.Tipo_Cuenta_Ahorros.Find(id);
            db.Tipo_Cuenta_Ahorros.Remove(tipo_Cuenta_Ahorros);
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
