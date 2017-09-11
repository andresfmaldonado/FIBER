using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
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

        public DataTable ConvertToDataTable<DTOInventario>(List<DTOInventario> hilos)
        {
            PropertyDescriptorCollection properties =
               TypeDescriptor.GetProperties(typeof(DTOInventario));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (DTOInventario item in hilos)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;

        }

        protected void fin_consumo_Click(object sender, EventArgs e)
        {
            
            int id_u = Convert.ToInt32(Session["id_usuario"]);
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();

            datos.Id_Usuario = id_u;

            if (proceso.InsertarConsumo(datos) == 0)
            {
                datos.Id_Consumo = proceso.consultarMaximoConsumo();
                datos.Id_Inventario = proceso.consultarMaximoInventarioHilo();
                List<DTOInventario> hilos = new List<DTOInventario>();
                hilos = proceso.consultarPasoParaFinalizarConsumo();
                foreach (var item in hilos)
                {
                    datos.Id_Hilo = item.Id_Hilo;
                    datos.Consumo = item.Consumo;
                    try
                    {
                        proceso.InsertarConsumoHilo(datos);
                        proceso.EliminarPaso();
                    }
                    catch 
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
                        break;
                    }
                    
                }
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);
            }else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
            
                    
                  
                        
              
                
            
            
            
        }
    }
}