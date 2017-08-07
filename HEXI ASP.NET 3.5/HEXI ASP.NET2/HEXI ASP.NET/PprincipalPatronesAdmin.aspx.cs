using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEXI_ASP.NET
{
    public partial class PprincipalPatronesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            switch (Convert.ToString(Session["rol"]))
            {
                case "SuperAdministrador":
                    usuarios.Visible = true;
                    historial.Visible = true;
                    cohorte.Visible = true;
                    programa.Visible = true;
                    destrezas.Visible = true;
                    resultados.Visible = true;
                    diseños.Visible = true;
                    visualizar.Visible = true;
                    calificar.Visible = true;
                    break;
                case "Administrador":
                    usuarios.Visible = true;
                    historial.Visible = true;
                    cohorte.Visible = true;
                    programa.Visible = true;
                    destrezas.Visible = true;
                    resultados.Visible = true;
                    diseños.Visible = true;
                    visualizar.Visible = true;
                    calificar.Visible = true;
                    break;
                case "Aprendiz":
                    usuarios.Visible = false;
                    historial.Visible = false;
                    cohorte.Visible = false;
                    programa.Visible = false;
                    destrezas.Visible = false;
                    resultados.Visible = false;
                    diseños.Visible = true;
                    visualizar.Visible = false;
                    calificar.Visible = false;
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