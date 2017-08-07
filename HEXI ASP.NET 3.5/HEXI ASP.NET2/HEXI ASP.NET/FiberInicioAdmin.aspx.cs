using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEXI_ASP.NET
{
    public partial class FiberInicioAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["mode"] != null && Request.QueryString["mode"] == "ajax")
            {
                //Saving the variables in session. Variables are posted by ajax.
                Session["id_usuario"] = Request.Form["id_usuario"] ?? "";
                Session["rol"] = Request.Form["rol"] ?? "";
                Session["passw"] = Request.Form["passw"] ?? "";
            }
            string id_usuario = Convert.ToString(Session["id_usuario"]);
            if (id_usuario == null || id_usuario == "")
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                switch (Convert.ToString(Session["rol"]))
                {
                    case "SuperAdministrador":
                        patrones.Visible = true;
                        inventario.Visible = true;
                        usuarios.Visible = true;
                        break;
                    case "Administrador":
                        patrones.Visible = true;
                        inventario.Visible = true;
                        usuarios.Visible = true;
                        break;
                    case "Aprendiz":
                        patrones.Visible = true;
                        inventario.Visible = false;
                        usuarios.Visible = false;
                        break;
                    case "Instructor":
                        patrones.Visible = false;
                        inventario.Visible = true;
                        usuarios.Visible = false;
                        break;
                    default:
                        Response.Redirect("default.aspx");
                        break;
                }
                HttpContext.Current.Response.Cache.SetAllowResponseInBrowserHistory(false);
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoStore();
                // Stop Caching in IE
                Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
                // Stop Caching in Firefox
                Response.Cache.SetNoStore();
                Response.Cache.AppendCacheExtension("no-cache");
                Response.Expires = 0;
                Response.Cache.SetExpires(DateTime.Now);
                Response.Cache.SetValidUntilExpires(true);
            }
        }
    }
}