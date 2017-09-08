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
    public partial class IFormularioPedidos : System.Web.UI.Page
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
                if ((Convert.ToString(Session["rol"])) == "SuperAdministrador" || (Convert.ToString(Session["rol"])) == "Administrador")
                {
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
                    if (!IsPostBack)
                    {
                       
                        /*btn_ACtualizar.CssClass = "btn btn-default";
                        btn_ACtualizar.Enabled = false;
                        btn_Cancelar.CssClass = "btn btn-default";
                        btn_Cancelar.Enabled = false;*/
                    }
                }
                else
                {
                    Response.Redirect("default.aspx");
                }

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
                Response.Redirect("IFormularioPedidosProductos.aspx");
            }
        }


        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {

        }

        protected void fin_consumo_Click(object sender, EventArgs e)
        {
            //Instanciar objetos
            DTOInventario datos = new DTOInventario();
            CADInventario procesos = new CADInventario();
            List<DTOInventario> productos = new List<DTOInventario>();

            //Si crear un nuevo pedido es exitoso entonces...
            if (procesos.InsertarPedido())
            {
                //Consultar el id del pedido recien creado
                datos.Id_Pedido = procesos.consultarMaximoPedido();

                //Consultar los productos registrados en la tabla paso
                productos = procesos.consultarPasoParaFinalizarPedido();

                //Recorrer list
                foreach(var item in productos)
                {
                    //Dar valores al DTO
                    datos.Id_Producto = item.Id_Producto;
                    datos.Cantidad_Producto = item.Cantidad_Producto;
                    datos.ValorTotal_Producto = item.ValorTotal_Producto;
                    datos.ValorTotal = item.ValorTotal;

                    //Intentar ejecutar la inserción de los productos y la elimináción de tabla Paso
                    try
                    {
                        procesos.InsertarPedidoP(datos);
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