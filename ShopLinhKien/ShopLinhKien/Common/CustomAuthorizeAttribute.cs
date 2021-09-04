using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ShopLinhKien.Common
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        public string RoleID { set; get; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var session = new Userlogin();
            try
            {
                session = (Userlogin)HttpContext.Current.Session[Common.CommonConstants.USER_SESSION];

            }
            catch
            {
                return false;
            }
            if (session == null)
            {
                return false;
            }

            if (session.AccessName.Contains(this.RoleID) || session.GroupID == CommonConstants.ADMIN_GROUP)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new ViewResult
            {
                ViewName = "~/Areas/Admin/Views/Shared/401.cshtml"
            };
        }

    }
}