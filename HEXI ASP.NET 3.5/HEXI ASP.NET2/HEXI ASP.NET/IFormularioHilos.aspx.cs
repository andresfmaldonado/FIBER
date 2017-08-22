using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEXI_ASP.NET
{
    public partial class IFormularioHilos : System.Web.UI.Page
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
                        CADInventario inventario = new CADInventario();
                        inventario.CargarHilos(GVHilos);
                        btn_Actualizar.CssClass = "btn btn-default";
                        btn_Actualizar.Enabled = false;
                        btn_Cancelar.CssClass = "btn btn-default";
                        btn_Cancelar.Enabled = false;
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
                Response.Redirect("IFormularioHilos.aspx");
            }
        }

        protected void GVHilos_RowEditing(object sender, GridViewEditEventArgs e)
        {

            CADInventario inventario = new CADInventario();
            DTOInventario inven = new DTOInventario();
            inven.Id_Hilo = int.Parse(GVHilos.DataKeys[e.NewEditIndex].Values[0].ToString());
            if (inventario.CompletarRegistroHilosParaModificar(inven,codigo,referencia,tipo,titulo,color,tmetros,valor) == 0)
            {
                btn_Registrar.CssClass = "btn btn-default";
                btn_Registrar.Enabled = false;
                btn_Actualizar.CssClass = "btn btn-default";
                btn_Actualizar.Enabled = true;
                btn_Cancelar.CssClass = "btn btn-default";
                btn_Cancelar.Enabled = true;
                tmetros.ReadOnly = true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
            inventario.CargarHilos(GVHilos);
        }

        protected void btn_Registrar_Click(object sender, EventArgs e)
        {
            int titu = 0, val = 0, confirma = 0;
            float m = 0;
            var culture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            culture.NumberFormat.NumberDecimalSeparator = ".";
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            try
            {
                titu = Convert.ToInt32(titulo.Text);
                val = Convert.ToInt32(valor.Text);
                m = float.Parse(tmetros.Text,culture);
            }
            catch 
            {

                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);

            }
            if (referencia.Text != "" && tipo.Text != "" && color.Text != "")
            {
                confirma += 1;
            }
            if (titu != 0 && val != 0)
            {
                confirma += 1;
            }
            if(confirma == 2)
            {
                inven.Referencia_Hilo = referencia.Text;
                inven.Tipo_Hilo = tipo.Text;
                inven.Titulo_Hilo = titu;
                inven.Color_Hilo = color.Text;
                inven.ValorMetro = val;
                inven.Metros_Hilo = m;
                if (inventario.ConsultarHiloPorRef(inven) == 0)
                {
                    if (inventario.InsertarHilo(inven) == 0)
                    {
                        DTOUsuario u = new DTOUsuario();
                        CADUsuario process = new CADUsuario();
                        u.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                        u.Descripcion_history = "Registro hilo referencia: " + referencia.Text;
                        process.InsertarHistorial(u);
                        btn_Registrar.CssClass = "btn btn-default";
                        btn_Registrar.Enabled = true;
                        btn_Actualizar.CssClass = "btn btn-default";
                        btn_Actualizar.Enabled = false;
                        btn_Cancelar.CssClass = "btn btn-default";
                        btn_Cancelar.Enabled = false;
                        codigo.Text = "";
                        referencia.Text = "";
                        tipo.Text = "";
                        titulo.Text = "";
                        color.Text = "";
                        valor.Text = "";
                        tmetros.Text = "";
                        inventario.CargarHilos(GVHilos);
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);
                    }else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                    }
                }else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisref", "yaexisteref();", true);
                }
            }else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            inventario.CargarHilos(GVHilos);
        }

        protected void btn_Actualizar_Click(object sender, EventArgs e)
        {
            int titu = 0, modifi = 0, confirm = 0;
            float val = 0, m=0;
            var culture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            culture.NumberFormat.NumberDecimalSeparator = ".";
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            inven.Id_Hilo = Convert.ToInt32(codigo.Text);
            string referencia_h = inventario.ObtenerRefHilo(inven);
            if (referencia_h == referencia.Text)
            {
                modifi = 1;
            }
            try
            {
                titu = int.Parse(titulo.Text);
                val = float.Parse(valor.Text);
                m = float.Parse(tmetros.Text,culture);
                confirm = 2;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (tipo.Text != "" && color.Text != "")
            {
                confirm += 2;
            }
            if (confirm == 4)
            {
                inven.Tipo_Hilo = tipo.Text;
                inven.Titulo_Hilo = titu;
                inven.Color_Hilo = color.Text;
                inven.ValorMetro = val;
                inven.Metros_Hilo = m;
                if (modifi == 1)
                {
                    if (inventario.ModificarHilo(inven) == 0)
                    {
                        DTOUsuario u = new DTOUsuario();
                        CADUsuario process = new CADUsuario();
                        u.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                        u.Descripcion_history = "Actualización hilo referencia: " + referencia.Text;
                        process.InsertarHistorial(u);
                        codigo.Text = "";
                        referencia.Text = "";
                        tipo.Text = "";
                        titulo.Text = "";
                        color.Text = "";
                        valor.Text = "";
                        tmetros.Text = "";

                        btn_Registrar.CssClass = "btn btn-default";
                        btn_Registrar.Enabled = true;
                        btn_Actualizar.CssClass = "btn btn-default";
                        btn_Actualizar.Enabled = false;
                        btn_Cancelar.CssClass = "btn btn-default";
                        btn_Cancelar.Enabled = false;
                        tmetros.ReadOnly = false;
                        inventario.CargarHilos(GVHilos);
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                    }else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                    }
                }
            }else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            GVHilos.EditIndex = -1;
            inventario.CargarHilos(GVHilos);
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            btn_Registrar.CssClass = "btn btn-default";
            btn_Registrar.Enabled = true;
            btn_Actualizar.CssClass = "btn btn-default";
            btn_Actualizar.Enabled = false;
            btn_Cancelar.CssClass = "btn btn-default";
            btn_Cancelar.Enabled = false;
            referencia.CssClass = "form-control";
            referencia.Enabled = true;
            tmetros.ReadOnly = false;
            referencia.Text = "";
            tipo.Text = "";
            titulo.Text = "";
            color.Text = "";
            valor.Text = "";
            tmetros.Text = "";
            CADInventario inventario = new CADInventario();
            GVHilos.EditIndex = -1;
            inventario.CargarHilos(GVHilos);
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            int refe = 0;
            try
            {
                inven.Referencia_Hilo = buscar.Text;
                refe = inventario.ConsultarHiloPorRef(inven);
            }
            catch 
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);

            }
            if (refe > 0)
            {
                inventario.BuscarHiloYCargarloAlGV(inven, GVHilos);
            }else
            {
                inventario.CargarHilos(GVHilos);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "noregist", "noregistrado();", true);
            }
            buscar.Text = "";
        }
    }
}