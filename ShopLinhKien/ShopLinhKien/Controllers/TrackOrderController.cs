using ShopLinhKien.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopLinhKien.Controllers
{
    public class TrackOrderController : Controller
    {
        private ShopLinhKienDbContext db = new ShopLinhKienDbContext();
        // GET: TrackOrder
        public ActionResult ListOrders(string phoneNumber)
        {
            var listOrder = db.Orders.Where(m => m.deliveryphone.Equals(phoneNumber)).OrderByDescending(m => m.ID).ToList();
            return View("listOrders", listOrder);
        }
        public ActionResult DetailOrder(int id)
        {

            var listOrder = db.Orders.Find(id);
            return View("DetailOrder", listOrder);
        }
        public ActionResult productDetailCheckOut(int orderId)
        {
            var list = db.Orderdetails.Where(m => m.orderid == orderId).ToList();
            return View("_productDetailCheckOut", list);

        }
        public ActionResult subnameProduct(int id)
        {
            var list = db.Products.Find(id);
            return View("_subproductOrdersuccess", list);
        }

        public ActionResult RentListOrders(string phoneNumber)
        {
            var listOrder = db.LeaseOrders.Where(m => m.Phone.Equals(phoneNumber)).OrderByDescending(m => m.ID).ToList();
            return View("RentListOrders", listOrder);
        }
        public ActionResult RentDetailOrder(int id)
        {
            LeaseOrder lease = db.LeaseOrders.Where(m => m.ID == id).FirstOrDefault();
            ViewBag.leaseItem = db.leaseItems.Where(m => m.ID == lease.LeaseItemID).FirstOrDefault();

            
            ViewBag.sumTotalSoftware = 0;
            var listSoftware1 = new List<LeaseSoftwave>();
            if (lease.Software.Equals(""))
            {
              
            }
            else
            {
                string[] ListSoftwareString = lease.Software.Split(',');
                int[] ListSoftwareInt = Array.ConvertAll(ListSoftwareString, int.Parse);

                listSoftware1 = db.leaseSoftwaves.Where(m => ListSoftwareInt.Contains(m.ID)).ToList();
                foreach (var item in listSoftware1)
                {
                    ViewBag.sumTotalSoftware += item.Price;
                }
            }
     
            ViewBag.listSoftwareItem = listSoftware1;
            return View("RentDetailOrder", lease);
        }
        public ActionResult RentproductDetailCheckOut(int orderId)
        {
            var list = db.Orderdetails.Where(m => m.orderid == orderId).ToList();
            return View("_productDetailCheckOut", list);

        }
    }
}