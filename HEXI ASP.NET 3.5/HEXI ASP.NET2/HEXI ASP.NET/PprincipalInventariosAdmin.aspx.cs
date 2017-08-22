using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEXI_ASP.NET
{
    public partial class PproncipalInventariosAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                        usuarios.Visible = true;
                        productos.Visible = true;
                        consumos.Visible = true;
                        pedidos.Visible = true;
                        inventario.Visible = true;
                        hilos.Visible = true;
                        scanner.Visible = true;
                        ingresos.Visible = true;
                        break;
                    case "Administrador":
                        usuarios.Visible = true;
                        productos.Visible = true;
                        consumos.Visible = true;
                        pedidos.Visible = true;
                        inventario.Visible = true;
                        hilos.Visible = true;
                        scanner.Visible = true;
                        ingresos.Visible = true;
                        break;
                    case "Instructor":
                        usuarios.Visible = false;
                        productos.Visible = false;
                        consumos.Visible = true;
                        pedidos.Visible = false;
                        inventario.Visible = false;
                        hilos.Visible = false;
                        scanner.Visible = true;
                        ingresos.Visible = false;
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