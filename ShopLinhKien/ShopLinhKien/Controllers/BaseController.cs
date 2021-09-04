﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ShopLinhKien.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);
            if (Session["id"].Equals(""))
            {
                Message.set_flash("Bạn phải đăng nhập", "danger");
                RouteValueDictionary route = new RouteValueDictionary(new { Controller = "Site", Action = "home" });
                filterContext.Result = new RedirectToRouteResult(route);
                return;
            }
        }
    }
}