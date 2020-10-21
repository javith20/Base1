using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BancoTEC.Controllers
{
    public class Type_Doc_Controller : Controller
    {
        // GET: TipoDocId
        public ActionResult Index()
        {
            return View();
        }

        // GET: TipoDocId/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: TipoDocId/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TipoDocId/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TipoDocId/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: TipoDocId/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TipoDocId/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TipoDocId/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
