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

        protected void GVHilos_RowEditing(object sender, GridViewEditEventArgs e)
        {

            CADInventario inventario = new CADInventario();
            DTOInventario inven = new DTOInventario();
            inven.Id_Hilo = int.Parse(GVHilos.DataKeys[e.NewEditIndex].Values[0].ToString());
            if (inventario.CompletarRegistroHilosParaModificar(inven, codigo, referencia, tipo, titulo, color, valor) == 0)
            {
                btn_Registrar.CssClass = "btn btn-default";
                btn_Registrar.Enabled = false;
                btn_Actualizar.CssClass = "btn btn-default";
                btn_Actualizar.Enabled = true;
                btn_Cancelar.CssClass = "btn btn-default";
                btn_Cancelar.Enabled = true;
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
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            try
            {
                titu = Convert.ToInt32(titulo.Text);
                val = Convert.ToInt32(valor.Text);
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
                if (inventario.ConsultarHiloPorRef(inven) == 0)
                {
                    if (inventario.InsertarHilo(inven) == 0)
                    {
                        btn_Registrar.CssClass = "btn btn-default";
                        btn_Registrar.Enabled = true;
                        btn_Actualizar.CssClass = "btn btn-default";
                        btn_Actualizar.Enabled = false;
                        btn_Cancelar.CssClass = "btn btn-default";
                        btn_Cancelar.Enabled = false;
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
            float val = 0;
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
                if (modifi == 1)
                {
                    if (inventario.ModificarHilo(inven) == 0)
                    {
                        codigo.Text = "";
                        referencia.Text = "";
                        tipo.Text = "";
                        titulo.Text = "";
                        color.Text = "";
                        valor.Text = "";

                        btn_Registrar.CssClass = "btn btn-default";
                        btn_Registrar.Enabled = true;
                        btn_Actualizar.CssClass = "btn btn-default";
                        btn_Actualizar.Enabled = false;
                        btn_Cancelar.CssClass = "btn btn-default";
                        btn_Cancelar.Enabled = false;

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
            referencia.Text = "";
            tipo.Text = "";
            titulo.Text = "";
            color.Text = "";
            valor.Text = "";
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