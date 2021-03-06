﻿using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEXI_ASP.NET
{
    public partial class IFormularioPedidosHilos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id_usuario = Convert.ToString(Session["id_usuario"]);
            if (id_usuario == null || id_usuario == "")
            {
                Response.Redirect("default.aspx");
            }else
            {
                if ((Convert.ToString(Session["rol"])) ==  "SuperAdministrador" || (Convert.ToString(Session["rol"])) == "Administrador")
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
                    /*if (!IsPostBack)
                    {
                        CADInventario inventario = new CADInventario();
                        inventario.CargarHilos(GVPedidos_H);

                    }*/
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
                Response.Redirect("IFormularioPedidosHilos.aspx");
            }
        }
        
        protected void fin_pedido_Click(object sender, EventArgs e)
        {
            DTOInventario datos = new DTOInventario();
            CADInventario procesos = new CADInventario();

            if (procesos.InsertarPedido())
            {
                datos.Id_Pedido = procesos.consultarMaximoPedido();
                List<DTOInventario> hilos = new List<DTOInventario>();
                hilos = procesos.consultarPasoParaFinalizarPedido();
                foreach(var item in hilos)
                {
                    datos.Id_Hilo = item.Id_Hilo;
                    datos.Metros_Hilo = item.Metros_Hilo;
                    datos.ValorTotal_Hilo = item.ValorTotal_Hilo;
                    datos.ValorTotal = item.ValorTotal;
                    try
                    {
                        procesos.InsertarPedidoH(datos);
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