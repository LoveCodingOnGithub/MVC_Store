using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace BookStore.Models
{
    public class Products
    {
        [Key]
        public int pid { get; set; }
        public string pname { get; set; }
        public decimal price { get; set; }
        public string imgurl { get; set; }
        public string pdesc { get; set; }
        public int cid { get; set; }
        public int pcount { get; set; }
        public DateTime pdate { get; set; }
        public Category Category { get; set; }
       
    }
   
}