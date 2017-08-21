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
    public partial class IFormularioConsumoHilos : System.Web.UI.Page
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
                Response.Redirect("IFormularioConsumoHilos.aspx");
            }
        }

        protected void GVUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CADInventario inventario = new CADInventario();
            DTOInventario inven = new DTOInventario();
            inven.Id_Hilo = int.Parse(GVHilos.DataKeys[e.NewEditIndex].Values[0].ToString());
            if (inventario.CompletarRegistroHilosParaModificar(inven, id, referencia, tipo, titulo, color,metros)== 0)
            {

            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            int refe = 0;
            try
            {
                inven.Referencia_Hilo = buscar.Text;
                refe = inventario.ConsultarHiloPorRefConsumo(inven);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }

            if (refe > 0)
            {
                inventario.BuscarHiloYCargarloAlGVConsumo(inven, GVHilos);
            }else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "noregist", "noregistrado();", true);
            }
            buscar.Text = "";
        }
        Dictionary<string, object> list = new Dictionary<string, object>();
        int cant_prod = 0;
        protected void registrar_Click(object sender, EventArgs e)
        {
            Dictionary<string, object> list_consumos = new Dictionary<string, object>();
            list_consumos.Add("id", id.Text);
            list_consumos.Add("referencia", referencia.Text);
            list_consumos.Add("metros", metros.Text);
            cant_prod += 1;
            list.Add("product" + cant_prod, list_consumos);
            GVHilosTemp.DataSource = list["product"+cant_prod];
            GVHilosTemp.EditIndex = -1;
           // GVHilosTemp.DataBind();
            



        }

        protected void fin_consumo_Click(object sender, EventArgs e)
        {
            
            int id_u = Convert.ToInt32(Session["id_usuario"]);
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            try
            {
               
                inven.Id_Usuario = id_u;
                
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);

            }

            if (inventario.InsertarConsumo(inven) == 0)
            {

            }
        }
    }
}