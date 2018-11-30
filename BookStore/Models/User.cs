using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace BookStore.Models
{
    public class User
    {
        [Key]
        public int uid { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string name { get; set; }
        public string sex { get; set; }
        public string email { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string phone { get; set; }
        public bool isadmin { get; set; }
       
    }
}