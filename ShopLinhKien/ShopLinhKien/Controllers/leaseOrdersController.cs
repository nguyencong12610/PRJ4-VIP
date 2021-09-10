using API_NganLuong;
using ShopLinhKien.Library;
using ShopLinhKien.Models;
using ShopLinhKien.nganluonAPI;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
namespace ShopLinhKien.Controllers
{
    public class leaseOrdersController : BaseController
    {
        ShopLinhKienDbContext db = new ShopLinhKienDbContext();
        // GET: leaseOrders
        public ActionResult leaseOrder(FormCollection fc, int[] listSoftware)
        {
            ViewBag.sumTotalSoftware = 0;
            ViewBag.daystart = fc["daystart"].ToString();
            ViewBag.dayend = fc["dayend"].ToString();
            DateTime daystart = DateTime.ParseExact(fc["daystart"].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
            DateTime dayEnd = DateTime.ParseExact(fc["dayend"].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
            if (daystart > dayEnd)
            {
                Message.set_flash("Chọn sai ngày", "danger");
                return Redirect("~/");
            }
            ViewBag.ngayThue = (dayEnd - daystart).TotalDays + 1;
            if (listSoftware != null)
            {
                var listSoftware1 = db.leaseSoftwaves.Where(m => listSoftware.Contains(m.ID)).ToList();

                foreach (var item in listSoftware1)
                {
                    ViewBag.sumTotalSoftware += item.Price;
                }
                ViewBag.listSoftwareItem = listSoftware1;
                ViewBag.listSoftware = fc["listSoftware"];
            }
            else
            {
                ViewBag.listSoftwareItem = new List<LeaseSoftwave>();     
            }
            ViewBag.listSoftware = string.Join(",", listSoftware).Replace("0,",string.Empty);
            Muser sessionUser = new Muser();
            try
            {
                sessionUser = (Muser)Session[Common.CommonConstants.USER_SESSION];
                if (sessionUser == null)
                {
                    Message.set_flash("Vui lòng đăng nhập", "danger");
                    return Redirect("~/");
                }
            }
            catch
            {
                Message.set_flash("Vui lòng đăng nhập", "danger");
                return Redirect("~/");
            }     
            int Id = int.Parse(fc["LeaseId"].ToString());
            ViewBag.leaseId = Id;
            ViewBag.leaseItem = db.leaseItems.Find(Id);
            return View("leaseOrder",sessionUser);
        }

        public ActionResult Comfirmm(FormCollection fc)
        {

            Muser sessionUser = new Muser();
            try
            {
                sessionUser = (Muser)Session[Common.CommonConstants.USER_SESSION];
                if (sessionUser == null)
                {
                    Message.set_flash("Vui lòng đăng nhập", "danger");
                    return Redirect("~/");
                }
            }
            catch
            {
                Message.set_flash("Vui lòng đăng nhập", "danger");
                return Redirect("~/");
            }
            int Id = int.Parse(fc["Id"].ToString());
            ViewBag.leaseId = Id;
            ViewBag.leaseItem = db.leaseItems.Find(Id);
            return View("Comfirm",sessionUser);
        }

        [AcceptVerbs(HttpVerbs.Post | HttpVerbs.Get)]
        public ActionResult RentSoftware(int id)
        {
            var list = db.leaseSoftwaves.Where(m => m.CatId == id).ToList();
            return View("RentSoftware", list);
        }
        [HttpPost]
        public ActionResult leaseOrderSUBMIT(LeaseOrder leaseOrder, FormCollection fc)
        {

            Muser sessionUser = new Muser();
            try
            {
                sessionUser = (Muser)Session[Common.CommonConstants.USER_SESSION];
                if (sessionUser == null)
                {
                    Message.set_flash("Vui lòng đăng nhập", "danger");
                    return Redirect("~/");
                }
            }
            catch
            {
                Message.set_flash("Vui lòng đăng nhập", "danger");
                return Redirect("~/");
            }
            if (sessionUser == null)
            {
                Message.set_flash("Vui lòng đăng nhập", "danger");
                return Redirect("~/");
            }

            int leaseId = int.Parse(fc["LeaseId"].ToString());
            int sum = int.Parse(fc["sum"].ToString());
            var payment_option = fc["payment_option"];
            DateTime daystart = DateTime.ParseExact(fc["daystart"].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
            DateTime dayEnd = DateTime.ParseExact(fc["dayend"].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);

            if(daystart > dayEnd)
            {
                Message.set_flash("Chọn sai ngày", "danger");
                return Redirect("~/");
            }

            int RentalPeriod = int.Parse(fc["RentalPeriod"].ToString());
            string payment_method = Request["option_payment"];
            string str_bankcode = Request["bankcode"];
            string listSoftware = Request["listSoftware"];
            leaseItem leaseItem = db.leaseItems.Find(leaseId);
            if (payment_method.Equals("COD")){

                leaseOrder.PaymentMethod = "Thanh toán tại quầy";
                leaseOrder.StatusPayment = 2;
                leaseOrder.LeaseItemID = leaseId;
                leaseOrder.UserId = sessionUser.ID;
                leaseOrder.Emal = sessionUser.email;
                leaseOrder.Name = sessionUser.fullname;
                leaseOrder.Phone = sessionUser.phone;
                leaseOrder.created_at = DateTime.Now;
                leaseOrder.status = 0;               
                leaseOrder.Deposits = leaseItem.Deposits;
                leaseOrder.Software = listSoftware;
                ///////
                leaseOrder.DayStart = daystart;
                leaseOrder.RentalPeriod = RentalPeriod;
                leaseOrder.PayableDate = dayEnd; ///////
                leaseOrder.UserId = sessionUser.ID;
                leaseOrder.TotalPrice = sum;
                leaseOrder.Comfirm = 2;
                leaseOrder.ComfirmReturn = 0;

                leaseOrder.ReturnDate = leaseOrder.PayableDate;
                leaseOrder.IsCancel = 1;
                leaseOrder.Comfirm = 2;///////////
                leaseOrder.RentalPeriod = RentalPeriod;
                db.LeaseOrders.Add(leaseOrder);
                db.SaveChanges();
                Session["LeaseId"] = leaseId;
                Session["LeaseOdersId"] = leaseOrder.ID;
                ViewBag.leaseItem = db.leaseItems.Where(m => m.ID == leaseId).FirstOrDefault();
                LeaseOrder lease = db.LeaseOrders.Where(m => m.ID == leaseOrder.ID).FirstOrDefault();
                ViewBag.sumTotalSoftware = 0;
                var listSoftware1 = new List<LeaseSoftwave>();
                string[] ListSoftwareString = lease.Software.Split(',');
                if (!lease.Software.Equals(""))
                {
                    int[] ListSoftwareInt = Array.ConvertAll(ListSoftwareString, int.Parse);
                    listSoftware1 = db.leaseSoftwaves.Where(m => ListSoftwareInt.Contains(m.ID)).ToList();
                    foreach (var item in listSoftware1)
                    {
                        ViewBag.sumTotalSoftware += item.Price;
                    }
                    ViewBag.listSoftwareItem = listSoftware1;
                }
                else
                {
                    ViewBag.listSoftwareItem = listSoftware1;
                }
                string mailBody = renderHtmlEmail(lease, db.leaseItems.Find(leaseId), listSoftware1);
                SendEmail(lease.Emal, mailBody);
                return View("checkOutComfin", lease);
            }

            RequestInfo info = new RequestInfo();
            info.Merchant_id = nganluongInfo.Merchant_id;
            info.Merchant_password = nganluongInfo.Merchant_password;
            info.Receiver_email = ShopLinhKien.nganluonAPI.nganluongInfo.Receiver_email;
            info.cur_code = "vnd";
            info.bank_code = str_bankcode;
            info.Order_code = "KDJF4343";
            info.Total_amount = sum.ToString();
            info.fee_shipping = "0";
            info.Discount_amount = "0";
            info.order_description = "Thanh toán ngân lượng cho đơn hàng";
            info.return_url = nganluongInfo.return_url1;
            info.cancel_url = nganluongInfo.cancel_url1;
            info.Buyer_fullname = sessionUser.fullname;
            info.Buyer_email = sessionUser.email;
            info.Buyer_mobile = sessionUser.phone;
            APICheckoutV3 objNLChecout = new APICheckoutV3();
            ResponseInfo result = objNLChecout.GetUrlCheckout(info, payment_method);
            // neu khong gap loi gi
            if (result.Error_code == "00")
            {              
                leaseOrder.PaymentMethod = "Thanh toán: " + payment_method;
                leaseOrder.StatusPayment = 0;
                leaseOrder.LeaseItemID = leaseId;
                leaseOrder.created_at = DateTime.Now;
                leaseOrder.UserId = sessionUser.ID;
                leaseOrder.Emal = sessionUser.email;
                leaseOrder.Name = sessionUser.fullname;
                leaseOrder.Phone = sessionUser.phone;
                leaseOrder.status = 0;
                leaseOrder.Software = listSoftware;
                leaseOrder.Deposits = leaseItem.Deposits;
                leaseOrder.DayStart = daystart;
                leaseOrder.RentalPeriod = RentalPeriod;
                leaseOrder.PayableDate = dayEnd;
                leaseOrder.UserId = sessionUser.ID;
                leaseOrder.TotalPrice = sum;
                leaseOrder.ComfirmReturn = 0;
                leaseOrder.ReturnDate = leaseOrder.PayableDate;
                leaseOrder.Comfirm = 2;
                leaseOrder.IsCancel = 1;
                leaseOrder.Comfirm = 2;///////////
                leaseOrder.RentalPeriod = RentalPeriod;
                db.LeaseOrders.Add(leaseOrder);
                db.SaveChanges();
                Session["LeaseId"] = leaseId;
                Session["LeaseOdersId"] = leaseOrder.ID;
                // chuyen sang trang ngan luong
                return Redirect(result.Checkout_url);
            }
            else
            {
                ViewBag.errorPaymentOnline = result.Description;
                return View("cancel_order");
            }

        }
        [HttpPost]
        public ActionResult updateDate(FormCollection fc)
        {
            int id = int.Parse(fc["id"]);
            LeaseOrder LeaseOrders = db.LeaseOrders.Find(id);
            DateTime daysAdd = DateTime.ParseExact(fc["ngaythue"].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
            int NgayThue = (int)(daysAdd - LeaseOrders.PayableDate).TotalDays +1; 
            leaseItem leaseItem = db.leaseItems.Find(LeaseOrders.LeaseItemID);
            var sum = leaseItem.Price * NgayThue;
            LeaseOrders.RentalPeriod += NgayThue;
            var payment_option = fc["payment_option"];
            string payment_method = Request["option_payment"];
            string str_bankcode = Request["bankcode"];


            if (LeaseOrders.status == 4)
            {
                Message.set_flash("Không thể thêm ngày khi đơn hàng đã trả máy", "danger");
                return Redirect("~/TrackOrder/RentdetailOrder/" + id);
            }
            if (LeaseOrders.ComfirmReturn == 1)
            {
                Message.set_flash("Không thể thêm ngày khi đơn hàng đã trả máy", "danger");
                return Redirect("~/TrackOrder/RentdetailOrder/" + id);
            }
            if (LeaseOrders.IsCancel == 2)
            {
                Message.set_flash("Không thể thêm ngày khi đơn hàng đã hủy", "danger");
                return Redirect("~/TrackOrder/RentdetailOrder/" + id);
            }

            RequestInfo info = new RequestInfo();
            info.Merchant_id = nganluongInfo.Merchant_id;
            info.Merchant_password = nganluongInfo.Merchant_password;
            info.Receiver_email = ShopLinhKien.nganluonAPI.nganluongInfo.Receiver_email;
            info.cur_code = "vnd";
            info.bank_code = str_bankcode;
            info.Order_code = "KDJF4343-DDD-AAA";
            info.Total_amount = sum.ToString();
            info.fee_shipping = "0";
            info.Discount_amount = "0";
            info.order_description = "Thanh toán ngân lượng cho đơn hàng";
            info.return_url = nganluongInfo.return_url2;
            info.cancel_url = nganluongInfo.cancel_url1;
            info.Buyer_fullname = LeaseOrders.Name;
            info.Buyer_email = LeaseOrders.Emal;
            info.Buyer_mobile = LeaseOrders.Phone;
            APICheckoutV3 objNLChecout = new APICheckoutV3();
            ResponseInfo result = objNLChecout.GetUrlCheckout(info, payment_method);
            // neu khong gap loi gi
            if (result.Error_code == "00")
            {
                Session["LeaseId"] = leaseItem.ID;
                Session["LeaseOdersId"] = LeaseOrders.ID;
                Session["NgayThue"] = NgayThue;
                return Redirect(result.Checkout_url);
            }
            else
            {
                ViewBag.errorPaymentOnline = result.Description;
                return View("cancel_order");
            }
        }

        //Khi huy thanh toán Ngan Luong
        public ActionResult cancel_order()
        {

            return View("cancel_order");
        }
        [HttpGet]
        public ActionResult cannel(int id)
        {


            LeaseOrder LeaseOrders = db.LeaseOrders.Find(id);
            if (LeaseOrders.status == 1)
            {
                Message.set_flash("Không thể hủy đơn hàng khi đơn hàng đã được xác nhận", "danger");
                return Redirect("~/TrackOrder/RentdetailOrder/" + id);
            }
            if (LeaseOrders.status == 4)
            {
                Message.set_flash("Không thể hủy đơn hàng khi đã trả máy", "danger");
                return Redirect("~/TrackOrder/RentdetailOrder/" + id);
            }
            if (DateTime.Now >= LeaseOrders.DayStart)
            {
                Message.set_flash("Không thể hủy đơn hàng khi đang trong thời gian thuê máy", "danger");
                return Redirect("~/TrackOrder/RentdetailOrder/" + id);
            }
            LeaseOrders.IsCancel = 2;
            db.Entry(LeaseOrders).State = EntityState.Modified;
            db.SaveChanges();
            Message.set_flash("Hủy đơn hàng thành công", "success");
            return Redirect("~/TrackOrder/RentdetailOrder/"+id);
        }
        [HttpGet]
        public ActionResult returnN(int id)
        {
            LeaseOrder LeaseOrders = db.LeaseOrders.Find(id);
            leaseItem leaseItem = db.leaseItems.Find(LeaseOrders.LeaseItemID);
            if (LeaseOrders.IsCancel == 2)
            {
                Message.set_flash("Đơn hàng đã hủy không thể thao tác trả máy", "danger");
                return Redirect("~/TrackOrder/RentdetailOrder/" + id);
            }
            if (LeaseOrders.PayableDate < DateTime.Now)
            {
                Message.set_flash("Không thể trả máy(đã quá hạng trả tại quầy)", "danger");
                return Redirect("~/TrackOrder/RentdetailOrder/" + id);
            }
            var days = (LeaseOrders.PayableDate - DateTime.Now).TotalDays;
            int dayss = LeaseOrders.RentalPeriod - (int)Math.Floor(days);
            // Dùng mấy ngày thì trừ mấy ngày
            LeaseOrders.TotalReturn = ((int)(LeaseOrders.TotalPrice - (leaseItem.Price * dayss)));
            LeaseOrders.ReturnDate = DateTime.Now;
            LeaseOrders.ComfirmReturn = 2;
            db.Entry(LeaseOrders).State = EntityState.Modified;
            db.SaveChanges();
            Message.set_flash("Trả máy thành công vui lòng chờ xác nhận", "success");
            return Redirect("~/TrackOrder/RentdetailOrder/" + id);
        }
        // thanh toan add days
        public ActionResult confirm_orderPaymentOnline_AddDays()
        {
            int leaseId = int.Parse(Session["LeaseId"].ToString());
            int LeaseOdersId = int.Parse(Session["LeaseOdersId"].ToString());
            int id = LeaseOdersId;
            int NgayThue = int.Parse(Session["NgayThue"].ToString());
            LeaseOrder LeaseOrders = db.LeaseOrders.Find(id);
            leaseItem leaseItem = db.leaseItems.Find(LeaseOrders.LeaseItemID);
            LeaseOrders.TotalPrice += leaseItem.Price * NgayThue;
            LeaseOrders.RentalPeriod += NgayThue;
            LeaseOrders.PayableDate = LeaseOrders.PayableDate.AddDays(NgayThue);
            db.Entry(LeaseOrders).State = EntityState.Modified;
            db.SaveChanges();
            Message.set_flash("Cập nhật đơn thuê thành công", "success");
            return Redirect("~/TrackOrder/RentdetailOrder/" + id);
        }
        //Khi thanh toán Ngan Luong XOng
        public ActionResult confirm_orderPaymentOnline()
        {
            int leaseId = int.Parse(Session["LeaseId"].ToString());
            int LeaseOdersId = int.Parse(Session["LeaseOdersId"].ToString());
            ViewBag.leaseItem = db.leaseItems.Where(m => m.ID == leaseId).FirstOrDefault();
            LeaseOrder lease = db.LeaseOrders.Where(m => m.ID == LeaseOdersId).FirstOrDefault();
            lease.StatusPayment = 1;
            db.Entry(lease).State = EntityState.Modified;
            db.SaveChanges();
            ViewBag.sumTotalSoftware = 0;
            var listSoftware1 = new List<LeaseSoftwave>();
            string[] ListSoftwareString = lease.Software.Split(',');
            if (!lease.Software.Equals(""))
            {
                int[] ListSoftwareInt = Array.ConvertAll(ListSoftwareString, int.Parse);
                listSoftware1 = db.leaseSoftwaves.Where(m => ListSoftwareInt.Contains(m.ID)).ToList();
                foreach (var item in listSoftware1)
                {
                    ViewBag.sumTotalSoftware += item.Price;
                }
                ViewBag.listSoftwareItem = listSoftware1;
            }
            else
            {
                ViewBag.listSoftwareItem = listSoftware1;
            }

            string mailBody = renderHtmlEmail(lease, db.leaseItems.Find(leaseId), listSoftware1);
            SendEmail(lease.Emal, mailBody);
            return View("checkOutComfin", lease);
        }
        public void SendEmail(string CustomerEmail, string mailBody)
        {

            MailMessage mm = new MailMessage(Util.email, CustomerEmail);
            mm.Subject = "CHI TIẾT ĐƠN THUÊ DỊCH VỤ";
            mm.Body = mailBody;
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            /// Email dùng để gửi đi
            NetworkCredential nc = new NetworkCredential(Util.email, Util.password);
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = nc;
            smtp.Send(mm);
        }
        string renderHtmlEmail(LeaseOrder order, leaseItem leaseItem, List<LeaseSoftwave> softwaves)
        {
            string statusPayemntS = "Chưa thanh toán";
            string mailBody = System.IO.File.ReadAllText(Server.MapPath("~/Views/Shared/mailTemplate.html"));
            mailBody = mailBody.Replace("{{name}}", order.Name);
            mailBody = mailBody.Replace("{{orderCode}}", order.ID.ToString());
            mailBody = mailBody.Replace("{{email}}", order.Emal);
            mailBody = mailBody.Replace("{{phone}}", order.Phone);
            mailBody = mailBody.Replace("{{NgayThue}}", order.RentalPeriod.ToString());
            mailBody = mailBody.Replace("{{NgayTra}}", order.PayableDate.ToString("dd/MM/yyyy"));
            mailBody = mailBody.Replace("{{TienTrenNgay}}", leaseItem.Price.ToString("N0") + "VND");
            mailBody = mailBody.Replace("{{created_ate}}", order.DayStart.ToString("dd-MM-yyyy HH:mm:ss tt"));
            if (order.StatusPayment == 1)
            {
                statusPayemntS = "Đã thanh toán";
            }
            mailBody = mailBody.Replace("{{statuspayment}}", statusPayemntS);
            mailBody = mailBody.Replace("{{Methodpayment}}", order.PaymentMethod);
            mailBody = mailBody.Replace("{{total}}", order.TotalPrice.ToString("N0") + "VND");
            string htmlListItem = @"<div class='card '>
                    <h6 class='bg-cam font-weight-bold text-center border-bottom py-2 text-white'>Dịch vụ</h6>
                    <div class='card'>
                        <div class='card-body'>
                            <div class='card-title text-dark pt-1'><h5 class='font-weight-bold text-info text-center'>" + leaseItem.Name + @"</h5></div>
                            <div class='card-title text-dark pt-1'><h6 class='font-weight-bold text-info text-center'>" + leaseItem.Description + @"</h6></div>
                            <div style = 'height:430px;' class='p-3'>" +
                                leaseItem.Content + @"
                            </div>
                        </div>
                        </div>
                    </div>";
            var swtal = string.Empty;
            var sumSoftware = 0;
            if (softwaves == null || softwaves.Count() == 0)
            {
                mailBody = mailBody.Replace("{{Software}}", "Không có phần mềm nào được chọn.");
                mailBody = mailBody.Replace("{{SoftwareTotal}}", "0 VND");
            }
            else
            {
                string htmlSoftware = string.Empty;
                foreach (var item in softwaves)
                {
                    sumSoftware += item.Price;
                    htmlSoftware += @"<span> " + @item.Name + "@ x</span> <span>" + @item.Price.ToString("N0") + "@ VND</span> <br/> ";
                }
                 swtal = sumSoftware.ToString("N0") + "VND";
                mailBody = mailBody.Replace("{{Software}}", htmlSoftware);
                mailBody = mailBody.Replace("{{SoftwareTotal}}", swtal);
            }
            swtal = sumSoftware.ToString("N0") + "VND";

            string tienCoc = order.Deposits.ToString("N0")+ "VND";


            mailBody = mailBody.Replace("{{TienCoc}}", tienCoc);
            string tienThanhToanTaiQuay = "0";

                tienThanhToanTaiQuay = order.TotalPrice.ToString("N0") +"VND";

            mailBody = mailBody.Replace("{{PhaiThanhToanTaiQuay}}", tienThanhToanTaiQuay);
            mailBody = mailBody.Replace("{{softwareTotal1}}", swtal);
            mailBody = mailBody.Replace("{{OrderDetail}}", htmlListItem);
            return mailBody;
        }
    }
}