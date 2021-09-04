namespace ShopLinhKien.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LeaseOrder")]
    public partial class LeaseOrder
    {
        [Key]
        public int ID { get; set; }

        public int LeaseItemID { get; set; }

        public int UserId { get; set; }

        public string Name { get; set; }

        public string Emal { get; set; }

        public string Phone { get; set; }
        public int IsCancel { get; set; }
        public int ComfirmReturn { get; set; }
        public DateTime ReturnDate { get; set; }
        public int TotalReturn { get; set; }
        public DateTime DayStart { get; set; }
        public int isTransport { get; set; }
        public double TotalPrice { get; set; }
        public double Deposits { get; set; }
        public int Comfirm { get; set; }
        public int StatusPayment { get; set; }
        public string PaymentMethod { get; set; }
        public DateTime PayableDate { get; set; }
        public DateTime created_at { get; set; }
        public int RentalPeriod { get; set; }
        public string Software { get; set; }
        public int status { get; set; }
    }
}
