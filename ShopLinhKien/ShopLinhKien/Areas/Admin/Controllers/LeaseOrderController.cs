using ShopLinhKien.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace ShopLinhKien.Areas.Admin.Controllers
{
    public class LeaseOrderController : BaseController
    {
        private ShopLinhKienDbContext db = new ShopLinhKienDbContext();

        public ActionResult Index()
        {
            var list = db.LeaseOrders.ToList();
            return View(list);
        }
        public ActionResult returnOrderConfirm()
        {
            var list = db.LeaseOrders.Where(m=>m.ComfirmReturn != 0).ToList();
            return View(list);
        }
        public ActionResult Detail(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var info = db.LeaseOrders.Where(m => m.ID == id).FirstOrDefault();
            ViewBag.sumTotalSoftware = 0;
            var listSoftware1 = new List<LeaseSoftwave>();
            if (info.Software.Equals(""))
            {

            }
            else
            {
                string[] ListSoftwareString = info.Software.Split(',');
                int[] ListSoftwareInt = Array.ConvertAll(ListSoftwareString, int.Parse);

                listSoftware1 = db.leaseSoftwaves.Where(m => ListSoftwareInt.Contains(m.ID)).ToList();
                foreach (var item in listSoftware1)
                {
                    ViewBag.sumTotalSoftware += item.Price;
                }
            }

            ViewBag.listSoftwareItem = listSoftware1;
            ViewBag.leaseItem = db.leaseItems.Where(m => m.ID == info.LeaseItemID).FirstOrDefault();
            return View("Detail", info);
        }
        public ActionResult Status(int id,int status)
        {

            LeaseOrder mcategory = db.LeaseOrders.Find(id);
            if (mcategory.IsCancel == 2 && status == 2)
            {
                Message.set_flash("Đơn hàng đã hủy không thể xác nhận đã trả máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.ComfirmReturn == 2 && status == 2)
            {
                Message.set_flash("Đang yêu cầu trả máy bạn cần duyệt trước", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.ComfirmReturn == 1 && status == 2)
            {
                Message.set_flash("Không thể xác nhận đang giao khi khách đã yêu cầu trả máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.IsCancel == 2 && status == 3)
            {
                Message.set_flash("Đơn hàng đã hủy không thể xác nhận đã giao máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.ComfirmReturn == 2 && status == 3)
            {
                Message.set_flash("Đang yêu cầu trả máy bạn cần duyệt trước giao máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.status == 0 && status == 3)
            {
                Message.set_flash("Đơn hàng đã hủy không thể xác nhận đã giao máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.status == 0 && status == 4)
            {
                Message.set_flash("Đơn hàng đã hủy không thể xác nhận đã giao máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.status > 0 && status  == 0 )
            {
                Message.set_flash("Đơn hàng đang xử lý không thể chuyển về chưa xác nhận", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.status > 1 && status == 1)
            {
                Message.set_flash("Đơn hàng đang xử lý không thể chuyển về đã xác nhận", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.status > 2 && status == 2)
            {
                Message.set_flash("Đơn hàng đang xử lý không thể chuyển về đang giao máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (mcategory.status > 3 && status == 3)
            {
                Message.set_flash("Đơn hàng đang xử lý không thể chuyển về chưa trả máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            mcategory.status = status;
            db.Entry(mcategory).State = EntityState.Modified;
            db.SaveChanges();
            Message.set_flash("Thay đổi trạng thái thành công", "success");
            return Redirect("~/Admin/LeaseOrder/Detail/" + id);
        }
        public ActionResult Comfirm(int id)
        {
            LeaseOrder mcategory = db.LeaseOrders.Find(id);
            mcategory.Comfirm = (mcategory.Comfirm == 1) ? 2 : 1;
            db.Entry(mcategory).State = EntityState.Modified;
            db.SaveChanges();
            Message.set_flash("Thay đổi trang thái thành công", "success");
            return Redirect("~/Admin/LeaseOrder/Detail/" + id);
        }
        public ActionResult ComfirmReturn(int id)
        {
            LeaseOrder mcategory = db.LeaseOrders.Find(id);
            mcategory.ComfirmReturn = (mcategory.ComfirmReturn == 1) ? 2 : 1;
            db.Entry(mcategory).State = EntityState.Modified;
            db.SaveChanges();
            Message.set_flash("Xác nhận thành công", "success");
            return Redirect("~/Admin/LeaseOrder/returnOrderConfirm/" + id);
        }
        public ActionResult isTransport(int id)
        {
            LeaseOrder leaseOrder = db.LeaseOrders.Find(id);
            if (leaseOrder.IsCancel == 2)
            {
                Message.set_flash("Đơn hàng đã hủy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (leaseOrder.ComfirmReturn != 0 )
            {
                Message.set_flash("Đơn hàng đang yêu cầu trả máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (leaseOrder.PayableDate < DateTime.Now)
            {
                Message.set_flash("Đã hết hạn thuê máy không thể xác nhận đang vận chuyển", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }    
            leaseOrder.isTransport = 1;
            db.Entry(leaseOrder).State = EntityState.Modified;
            db.SaveChanges();
            Message.set_flash("Thay đổi trạng thái thành công", "success");
            return Redirect("~/Admin/LeaseOrder/Detail/" + id);
        }
        public ActionResult updateDate(FormCollection fc)
        {
            int id = int.Parse(fc["id"]);
            LeaseOrder LeaseOrders = db.LeaseOrders.Find(id);
            DateTime daysAdd = DateTime.ParseExact(fc["ngaythue"].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
            int NgayThue = (int)(daysAdd - LeaseOrders.PayableDate).TotalDays + 1;          
            leaseItem leaseItem = db.leaseItems.Find(LeaseOrders.LeaseItemID);
            LeaseOrders.TotalPrice += leaseItem.Price * NgayThue;
            LeaseOrders.RentalPeriod += NgayThue;
            LeaseOrders.PayableDate = LeaseOrders.PayableDate.AddDays(NgayThue);
            if (LeaseOrders.ComfirmReturn == 1)
            {
                Message.set_flash("Không thể thêm ngày khi đơn hàng đã trả máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (LeaseOrders.IsCancel == 2)
            {
                Message.set_flash("Không thể thêm ngày khi đơn hàng đã hủy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            if (LeaseOrders.status == 4)
            {
                Message.set_flash("Không thể thêm ngày khi đơn hàng đã trả máy", "danger");
                return Redirect("~/Admin/LeaseOrder/Detail/" + id);
            }
            db.Entry(LeaseOrders).State = EntityState.Modified;
            db.SaveChanges();
            Message.set_flash("Cập nhật đơn thuê thành công", "success");
            return Redirect("~/Admin/LeaseOrder/Detail/"+id);
        }
        public ActionResult deleteTrash(int id)
        {
            LeaseOrder mcategory = db.LeaseOrders.Find(id);
            if(mcategory.ComfirmReturn == 1 || mcategory.status == 4 || mcategory.IsCancel == 2)
            {
                db.LeaseOrders.Remove(mcategory);
                db.SaveChanges();
                Message.set_flash("Đã xóa vĩnh viễn 1 đơn thuê", "success");
            }
            else
            {
                Message.set_flash("Đơn chưa trả máy không được xóa", "danger");
            }
            return RedirectToAction("index");
        }
    }
}