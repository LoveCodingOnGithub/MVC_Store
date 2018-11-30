using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace BookStore.Models
{
    public class BookContext:DbContext
    {
        public  BookContext()
        {
             this.Database.Connection.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BookContext"].ConnectionString;
        }
        public DbSet<Category> Category { get; set; }
        public DbSet<User> User{ get; set; }
        public DbSet<Admin> Admin { get; set; }
        public DbSet<Products> Products { get; set; }

    }
}