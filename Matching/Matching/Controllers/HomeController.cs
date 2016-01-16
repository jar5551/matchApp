using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Matching.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult WhoIAm()/*About()*/
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Favourities()/*Contact()*/
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Contact()/*Contact()*/
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult FindYourLove()/*FindYourLove()*/
        {
            ViewBag.Message = "Your finder page.";

            return View();
        }
    }
}