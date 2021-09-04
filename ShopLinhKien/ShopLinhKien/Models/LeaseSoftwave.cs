﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ShopLinhKien.Models
{

    [Table("LeaseSoftware")]
    public partial class LeaseSoftwave
    {
        [Key]
        public int ID { get; set; }

        public int CatId { get; set; }
        public string Description { get; set; }

        public string Name { get; set; }
        public int Price { get; set; }
    }
}