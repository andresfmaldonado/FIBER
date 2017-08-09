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

        protected void registrar_Click(object sender, EventArgs e)
        {
            Dictionary<string, object> list_consumos = new Dictionary<string, object>();
            list_consumos.Add("id", id.Text);
            list_consumos.Add("metros", metros.Text);
            id.Text = "";
            referencia.Text = "";
            color.Text = "";
            tipo.Text = "";
            titulo.Text = "";
            metros.Text = "";
            consumo.Text = Convert.ToString(list_consumos["metros"]);
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