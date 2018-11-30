using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;

namespace BookStore.Controllers
{
    public class WebIndexController : Controller
    {
        BookContext db = new BookContext();
        public ActionResult Index()
        {

            var count = from p in db.Products orderby p.pcount descending select p;
            
            var date = from p in db.Products orderby p.pdate descending select p;

            ViewBag.count = count;

            ViewBag.date = date;

            return View();



            //ViewBag.Count = string.IsNullOrEmpty(order) ? "count" : "count";
            //ViewBag.Date = string.IsNullOrEmpty(order) ? "date" : "date";
            //var book = from p in db.Products orderby p.pcount descending select p;
            //switch (order)
            //{
            //    case "count":
            //        book = book.OrderByDescending(p => p.pcount);
            //        break;
            //    case "date":
            //        book = book.OrderByDescending(p => p.pdate);
            //        break;
                
            //}
            //return View(book.ToList());

            

        }
        
        //图书删除
      
        public ActionResult Delete(int id)
        {
            var Del = from p in db.Products where p.pid == id select p;
            db.Products.Remove(Del.FirstOrDefault());
            db.SaveChanges();
            return Content("<script>alert('删除图书成功');window.location.href='/WebIndex/AdminIndex'</script>");

        }

        //图书添加

        public ActionResult Add()
        {
            var book = (from p in db.Products select p).FirstOrDefault();
            ViewBag.Cid = new SelectList(db.Category, "cid", "cname");
            return View(book);
        }
        [HttpPost]
        public ActionResult Add(Products book)
        {
            try
            {
                book.pdate = DateTime.Now;
                db.Products.Add(book);
                //db.Entry(book).State = System.Data.EntityState.Added;
                db.SaveChanges();
                return Content("<script>alert('添加图书成功');window.location.href='/WebIndex/AdminIndex'</script>");
            }
            catch (Exception)
            {
                return Content("<script>alert('添加图书失败');window.location.href='/WebIndex/AdminIndex'</script>");
            }

        }

        //图书编辑

        public ActionResult Edit(int id)
        {
            
            var book = (from p in db.Products where p.pid == id select p).FirstOrDefault(); 
            ViewBag.Cid = new SelectList(db.Category, "cid", "cname",book.cid);
            return View(book);
        }
        [HttpPost]
        public ActionResult Edit(Products p)
        {
            try
            {
                 db.Entry(p).State = System.Data.EntityState.Modified;
                 db.SaveChanges();
                 return Content("<script>alert('编辑图书成功');window.location.href='/WebIndex/AdminIndex'</script>");
            }
            catch (Exception)
            {

                return Content("<script>alert('编辑图书失败');window.location.href='/WebIndex/AdminIndex'</script>");
            }

        }

       public ActionResult AdminIndex()
        {
            var pro = from p in db.Products.Include("Category") select p;
            return View(pro);
        }
      
      
        //登录
        
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string username,string password)
        {
           
            try
            {
                var user = from u in db.User where (u.username == username||u.email==username) && u.password == password select u;
                if (user.FirstOrDefault().isadmin)
                {
                    return Content("<script>alert('欢迎登录,管理员');window.location.href='/WebIndex/AdminIndex'</script>");
                }
                else
                {
                    return Content("<script>alert('欢迎登录,普通用户');window.location.href='/WebIndex/Index'</script>");
                }

            }
            catch (Exception)
            {

                  return Content("<script>alert('用户名或密码错误');window.location.href='/WebIndex/Login'</script>");
            }
            
           
        }
       
                             
        
        public ActionResult Product()
        {
            return View();
        }

        //注册
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(User u)
        {
            try
            {
                db.User.Add(u);
                db.SaveChanges();
                return Content("<script>alert('注册成功');window.location.href='/WebIndex/Login'</script>");

            }
            catch (Exception)
            {

                return Content("<script>alert('注册失败');window.location.href='/WebIndex/Register'</script>");
            }        
        }
        public ActionResult Shopping()
        {
            return View();
        }
       
    }
}
