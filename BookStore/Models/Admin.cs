using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace BookStore.Models
{
    public class Admin
    {
        [Key]
        public int adminid { get; set; }
        public string adminame { get; set; }
        public string adminpwd { get; set; }
        public int status { get; set; }
        public string remark { get; set; }
        public DateTime admindate { get; set; }
    }
}