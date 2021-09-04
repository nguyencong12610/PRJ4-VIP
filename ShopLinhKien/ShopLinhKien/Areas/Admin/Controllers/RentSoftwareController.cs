using ShopLinhKien.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace ShopLinhKien.Areas.Admin.Controllers
{
    public class RentSoftwareController : BaseController
    {
        private ShopLinhKienDbContext db = new ShopLinhKienDbContext();
        // GET: Admin/LeaseCategory
        public ActionResult Index()
        {
            var list = db.leaseSoftwaves.ToList();
            return View(list);
        }
        public ActionResult Create()
        {
            ViewBag.listCate = db.leaseItems.Where(m => m.Status != 0).ToList();
            return View();
        }
        [HttpPost]
        public ActionResult Create(LeaseSoftwave leaseSoftwave)
        {

            if (ModelState.IsValid)
            {
                db.leaseSoftwaves.Add(leaseSoftwave);
                db.SaveChanges();
                Message.set_flash("Thêm  thành công", "success");
                return RedirectToAction("index");
            }
            ViewBag.listCate = db.leaseItems.Where(m => m.Status != 0).ToList();
            return View(leaseSoftwave);
        }
        public ActionResult Edit(int? id)
        {
            ViewBag.listCate = db.leaseItems.Where(m => m.Status != 0).ToList();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeaseSoftwave leaseCategory = db.leaseSoftwaves.Find(id);
            if (leaseCategory == null)
            {
                return HttpNotFound();
            }
            return View(leaseCategory);
        }

        [HttpPost]
        public ActionResult Edit(LeaseSoftwave leaseSoftwave)
        {
            if (ModelState.IsValid)
            {
               
                db.Entry(leaseSoftwave).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.listCate = db.leaseItems.Where(m => m.Status != 0).ToList();
            Message.set_flash("Sửa thất bại", "success");
            return View(leaseSoftwave);
        }
    }
}