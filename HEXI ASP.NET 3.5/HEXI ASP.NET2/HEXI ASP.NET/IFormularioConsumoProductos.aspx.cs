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
    public partial class IFormularioConsumoProductos : System.Web.UI.Page
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
                        break;
                    case "Administrador":
                        usuarios.Visible = true;
                        break;
                    case "Instructor":
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
                CancelUnexpectedRePost();
            }
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
                Response.Redirect("IFormularioConsumoProductos.aspx");
            }
        }

        protected void fin_consumo_Click(object sender, EventArgs e)
        {
            int id_u = Convert.ToInt32(Session["id_usuario"]);
            DTOInventario datos = new DTOInventario();
            CADInventario procesos = new CADInventario();

            datos.Id_Usuario = id_u;

            if (procesos.InsertarConsumo(datos) == 0)
            {
                datos.Id_Consumo = procesos.consultarMaximoConsumo();
                datos.Id_Inventario = procesos.consultarMaximoInventarioProducto();
                List<DTOInventario> productos = new List<DTOInventario>();
                productos = procesos.consultarPasoParaFinalizarConsumo();
                foreach(var item in productos)
                {
                    datos.Id_Producto = item.Id_Producto;
                    datos.Consumo = item.Consumo;
                    try
                    {
                        procesos.InsertarConsumoProducto(datos);
                        procesos.EliminarPaso();
                    }
                    catch       
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
                        break;
                    }
                }
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
        }
    }
}