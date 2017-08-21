using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEXI_ASP.NET
{
    public partial class PFormularioAsistencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

                string id_usuario = Convert.ToString(Session["id_usuario"]);
                if (id_usuario== null || id_usuario == "")
                {
                    Response.Redirect("default.aspx");
                }else
                {

                switch (Convert.ToString(Session["rol"]))
                {
                    case "SuperAdministrador":
                        usuarios.Visible = true;
                        break;
                    case "Administrador":
                        usuarios.Visible = true;
                        break;
                    case "Aprendiz":
                        usuarios.Visible = false;
                        break;
                    case "Instructor":
                        usuarios.Visible = false;
                        break;
                    default:
                        Response.Redirect("default.aspx");
                        break;
                }
                CancelUnexpectedRePost();
                if (!IsPostBack)
                    {
                    CADUsuario user = new CADUsuario();
                    DTOUsuario infor = new DTOUsuario();
                    infor.Id = Convert.ToInt32(id_usuario);
                        user.CargarReportesDeUsuarioAlGV(infor,GVReporte);
                    }
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

        private void CancelUnexpectedRePost()
        {
            string clientCode = _repostcheckcode.Value;

            //Get Server Code from session (Or Empty if null)
            string serverCode = Session["_repostcheckcode"] as string ?? "";

            if (!IsPostBack || clientCode.Equals(serverCode))
            {
                //Codes are equals - The action was initiated by the user
                //Save new code (Can use simple counter instead Guid)
                string code = Guid.NewGuid().ToString();
                _repostcheckcode.Value = code;
                Session["_repostcheckcode"] = code;
            }
            else
            {
                //Unexpected action - caused by F5 (Refresh) button
                Response.Redirect("PFormularioAsistencia.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CADUsuario user = new CADUsuario();
            DTOUsuario infor = new DTOUsuario();
            int confirmacion = 0;
            DateTime fecha_regis= DateTime.Now;
            string id_user = Session["id_usuario"].ToString();
            string estado = "Reportado";
            if (NombreProblema.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (Observaciones.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (confirmacion == 2)
            {
                infor.Nomb_report = NombreProblema.Text;
                infor.Descript_report = Observaciones.Text;
                infor.Fecha_report = fecha_regis;
                infor.Estado_report = estado;
                infor.Id = Convert.ToInt32(id_user);
                    if (user.InsertarReporteProblema(infor) == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                    }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }

            user.CargarReportesDeUsuarioAlGV(infor, GVReporte);
        }
    }
}