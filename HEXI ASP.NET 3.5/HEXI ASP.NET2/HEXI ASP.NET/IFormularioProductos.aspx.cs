using CAD;
using DTO;
using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEXI_ASP.NET
{
    public partial class IFormularioProductos : System.Web.UI.Page
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
                        CADInventario inven = new CADInventario();
                        inven.CargarProductos(GVProductos);
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
                Response.Redirect("IFormularioProductos.aspx");
            }
        }

        protected void btn_Registrar_Click(object sender, EventArgs e)
        {
           
            int val = 0;
            int consu = 2;     
            int confirma = 0;
            int cantid_p = 0;
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            try
            {
                
                val = Convert.ToInt32(valorUnitario.Text);
                consu = Convert.ToInt32(consumible.SelectedValue);
                cantid_p = Convert.ToInt32(cantidad.Text);



            }
            catch 
            {

                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (referencia.Text != "" && nombre.Text != "" && descripcion.Text != "" && novedad.Text != "" && placa.Text != "" && serial.Text != "" && marca.Text != "" && modelo.Text != "") 
            {
                confirma += 1 ;
            }
            if (val != 0 && consu >= 0 && consu < 2)
            {
                confirma += 1;
            }
            if (confirma == 2) 
            {
                inven.Referencia_Producto = referencia.Text;
                inven.Nombre_Producto = nombre.Text;
                inven.Descripcion_Producto = descripcion.Text;
                inven.Novedad_Producto = novedad.Text;
                inven.Placa_Producto = placa.Text;
                inven.Serial_Producto = serial.Text;
                inven.Marca_Producto = marca.Text;
                inven.Modelo_Producto = modelo.Text;
                inven.ValorUnitario_Producto = val;
                inven.Consumible = consu;
                inven.Cantidad_Producto = cantid_p;
                    if (inventario.ConsultarProductoPorPlaca(inven) == 0)
                    {
                        if (inventario.ConsultarProductoPorSerial(inven) == 0)
                        {
                            if (inventario.InsertarProducto(inven) == 0)
                            {
                                //Genernado Codigo QR
                                QrEncoder qrencoder = new QrEncoder();
                                QrCode qrcode = new QrCode();
                                //Recolectando referencia producto
                                qrencoder.TryEncode(placa.Text, out qrcode);
                                //Generar dicho datos con cierta estructura y estipular colores
                                GraphicsRenderer renderer = new GraphicsRenderer(new FixedCodeSize(400, QuietZoneModules.Zero),Brushes.Black,Brushes.White);
                                //Memoria de datos
                                MemoryStream ms = new MemoryStream();

                                renderer.WriteToStream(qrcode.Matrix,ImageFormat.Png,ms);
                                var image = new Bitmap(ms);
                                var imagenfinal = new Bitmap(image, new Size(new Point(200, 200)));
                                //Guardar codigoQR en carpeta servidor
                                imagenfinal.Save(Server.MapPath("~/QR/") + placa.Text+".png", ImageFormat.Png);
                                DTOUsuario u = new DTOUsuario();
                                CADUsuario process = new CADUsuario();
                                u.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                                u.Descripcion_history = "Registro producto placa: "+placa.Text;
                                process.InsertarHistorial(u);
                                btn_Registrar.CssClass = "btn btn-default";
                                btn_Registrar.Enabled = true;
                                btn_Actualizar.CssClass = "btn btn-default";
                                btn_Actualizar.Enabled = false;
                                btn_Cancelar.CssClass = "btn btn-default";
                                btn_Cancelar.Enabled = false;
                                codigo.Text = "";
                                referencia.Text = "";
                                nombre.Text = "";
                                descripcion.Text = "";
                                novedad.Text = "";
                                placa.Text = "";
                                serial.Text = "";
                                marca.Text = "";
                                modelo.Text = "";
                                cantidad.Text = "";
                                valorUnitario.Text = "";
                                inventario.CargarProductos(GVProductos);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);
                            }else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                        }else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisserial", "yaexisteserial();", true);
                        }
                    }else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisplaca", "yaexisteplaca();", true);
                    }
            }else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            inventario.CargarProductos(GVProductos);

        }

        protected void GVProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int id = Convert.ToInt32(GVProductos.DataKeys[e.NewEditIndex].Values[0]);
            CADInventario inventario = new CADInventario();
            DTOInventario inven = new DTOInventario();
            inven.Id_Producto = id;
            if (inventario.CompletarRegistroProductoParaModificar(inven, codigo, referencia, nombre, descripcion, novedad, placa, serial, marca, modelo,cantidad,valorUnitario, consumible) == 0)
            {
                btn_Registrar.CssClass = "btn btn-default";
                btn_Registrar.Enabled = false;
                btn_Actualizar.CssClass = "btn btn-default";
                btn_Actualizar.Enabled = true;
                btn_Cancelar.CssClass = "btn btn-default";
                btn_Cancelar.Enabled = true;
                cantidad.ReadOnly = true;
            }else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
            inventario.CargarProductos(GVProductos);
        }

        protected void btn_Actualizar_Click(object sender, EventArgs e)
        {
    
           
            int val = 0, consu = 2, confirma = 0, modifi = 0;
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            inven.Id_Producto = Convert.ToInt32(codigo.Text);
            string placa_p = inventario.ObtenerPlacaProducto(inven);
            string serial_p = inventario.ObtenerSerialProducto(inven);
            if (placa_p != placa.Text && serial_p!=serial.Text)
            {
                modifi = 1;
            }
            if (placa_p != placa.Text && serial_p == serial.Text)
            {
                modifi = 2;
            }
            if (placa_p == placa.Text && serial_p != serial.Text)
            {
                modifi = 3;
            }
            if (placa_p == placa.Text && serial_p == serial.Text)
            {
                modifi = 4;
            }
            try
            {
                
                val = int.Parse(valorUnitario.Text);
                consu = int.Parse(consumible.SelectedValue);

                confirma = 2;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (nombre.Text != "" && descripcion.Text != "" && novedad.Text != "" && placa.Text != "" && serial.Text != "" && marca.Text != "" && modelo.Text != "")
            {
                confirma += 7;
            }
            if (confirma == 9)
            {

                inven.Referencia_Producto = referencia.Text;
                inven.Nombre_Producto = nombre.Text;
                inven.Descripcion_Producto = descripcion.Text;
                inven.Novedad_Producto = novedad.Text;
                inven.Placa_Producto = placa.Text;
                inven.Serial_Producto = serial.Text;
                inven.Marca_Producto = marca.Text;
                inven.Modelo_Producto = modelo.Text;
                inven.ValorUnitario_Producto = val;
                inven.Consumible = consu;
                inven.Cantidad_Producto = int.Parse(cantidad.Text);
                if (modifi == 1)
                {
                    if (inventario.ConsultarProductoPorPlaca(inven) == 0)
                    {
                        if (inventario.ConsultarProductoPorSerial(inven) == 0)
                        {
                            if (inventario.ModificarProducto(inven) == 0)
                            {
                                var filePath = Server.MapPath("~/QR/" + placa_p +".png");
                                if (File.Exists(filePath))
                                {
                                    File.Delete(filePath);
                                }
                                //Genernado Codigo QR
                                QrEncoder qrencoder = new QrEncoder();
                                QrCode qrcode = new QrCode();
                                //Recolectando referencia producto
                                qrencoder.TryEncode(placa.Text, out qrcode);
                                //Generar dicho datos con cierta estructura y estipular colores
                                GraphicsRenderer renderer = new GraphicsRenderer(new FixedCodeSize(400, QuietZoneModules.Zero), Brushes.Black, Brushes.White);
                                //Memoria de datos
                                MemoryStream ms = new MemoryStream();

                                renderer.WriteToStream(qrcode.Matrix, ImageFormat.Png, ms);
                                var image = new Bitmap(ms);
                                var imagenfinal = new Bitmap(image, new Size(new Point(200, 200)));
                                //Guardar codigoQR en carpeta servidor
                                imagenfinal.Save(Server.MapPath("~/QR/") + placa.Text + ".png", ImageFormat.Png);
                                DTOUsuario u = new DTOUsuario();
                                CADUsuario process = new CADUsuario();
                                u.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                                u.Descripcion_history = "Actualización producto placa: " + placa.Text;
                                process.InsertarHistorial(u);
                                codigo.Text = "";
                                referencia.Text = "";
                                nombre.Text = "";
                                descripcion.Text = "";
                                novedad.Text = "";
                                placa.Text = "";
                                serial.Text = "";
                                marca.Text = "";
                                modelo.Text = "";
                                cantidad.Text = "";
                                valorUnitario.Text = "";
                                // consumible.Text = "";
                                btn_Registrar.CssClass = "btn btn-default";
                                btn_Registrar.Enabled = true;
                                btn_Actualizar.CssClass = "btn btn-default";
                                btn_Actualizar.Enabled = false;
                                btn_Cancelar.CssClass = "btn btn-default";
                                btn_Cancelar.Enabled = false;
                                cantidad.ReadOnly = false;
                                // program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                inventario.CargarProductos(GVProductos);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);

                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                        }else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisserial", "yaexisteserial();", true);
                        }
                    }else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisplaca", "yaexisteplaca();", true);
                    }
                    
                }


                if (modifi == 2)
                {
                    if (inventario.ConsultarProductoPorPlaca(inven) == 0)
                    {
                            if (inventario.ModificarProducto(inven) == 0)
                            {
                                var filePath = Server.MapPath("~/QR/" + placa_p + ".png");
                                if (File.Exists(filePath))
                                {
                                    File.Delete(filePath);
                                }
                                //Genernado Codigo QR
                                QrEncoder qrencoder = new QrEncoder();
                                QrCode qrcode = new QrCode();
                                //Recolectando referencia producto
                                qrencoder.TryEncode(placa.Text, out qrcode);
                                //Generar dicho datos con cierta estructura y estipular colores
                                GraphicsRenderer renderer = new GraphicsRenderer(new FixedCodeSize(400, QuietZoneModules.Zero), Brushes.Black, Brushes.White);
                                //Memoria de datos
                                MemoryStream ms = new MemoryStream();

                                renderer.WriteToStream(qrcode.Matrix, ImageFormat.Png, ms);
                                var image = new Bitmap(ms);
                                var imagenfinal = new Bitmap(image, new Size(new Point(200, 200)));
                                //Guardar codigoQR en carpeta servidor
                                imagenfinal.Save(Server.MapPath("~/QR/") + placa.Text + ".png", ImageFormat.Png);
                                DTOUsuario u = new DTOUsuario();
                                CADUsuario process = new CADUsuario();
                                u.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                                u.Descripcion_history = "Actualización producto placa: " + placa.Text;
                                process.InsertarHistorial(u);
                                codigo.Text = "";
                                referencia.Text = "";
                                nombre.Text = "";
                                descripcion.Text = "";
                                novedad.Text = "";
                                placa.Text = "";
                                serial.Text = "";
                                marca.Text = "";
                                modelo.Text = "";
                                cantidad.Text = "";
                                valorUnitario.Text = "";
                                // consumible.Text = "";
                                btn_Registrar.CssClass = "btn btn-default";
                                btn_Registrar.Enabled = true;
                                btn_Actualizar.CssClass = "btn btn-default";
                                btn_Actualizar.Enabled = false;
                                btn_Cancelar.CssClass = "btn btn-default";
                                btn_Cancelar.Enabled = false;
                                cantidad.ReadOnly = false;
                                // program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                inventario.CargarProductos(GVProductos);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);

                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisplaca", "yaexisteplaca();", true);
                    }
                }


                if (modifi == 3)
                {
                        if (inventario.ConsultarProductoPorSerial(inven) == 0)
                        {
                            if (inventario.ModificarProducto(inven) == 0)
                            {
                                DTOUsuario u = new DTOUsuario();
                                CADUsuario process = new CADUsuario();
                                u.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                                u.Descripcion_history = "Actualización producto placa: " + placa.Text;
                                process.InsertarHistorial(u);
                                codigo.Text = "";
                                referencia.Text = "";
                                nombre.Text = "";
                                descripcion.Text = "";
                                novedad.Text = "";
                                placa.Text = "";
                                serial.Text = "";
                                marca.Text = "";
                                modelo.Text = "";
                                cantidad.Text = "";
                                valorUnitario.Text = "";
                                // consumible.Text = "";
                                btn_Registrar.CssClass = "btn btn-default";
                                btn_Registrar.Enabled = true;
                                btn_Actualizar.CssClass = "btn btn-default";
                                btn_Actualizar.Enabled = false;
                                btn_Cancelar.CssClass = "btn btn-default";
                                btn_Cancelar.Enabled = false;
                                cantidad.ReadOnly = false;
                                // program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                inventario.CargarProductos(GVProductos);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);

                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisserial", "yaexisteserial();", true);
                        }
                }

                if (modifi == 4)
                {
                            if (inventario.ModificarProducto(inven) == 0)
                            {
                                DTOUsuario u = new DTOUsuario();
                                CADUsuario process = new CADUsuario();
                                u.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                                u.Descripcion_history = "Actualización producto placa: " + placa.Text;
                                process.InsertarHistorial(u);
                                codigo.Text = "";
                                referencia.Text = "";
                                nombre.Text = "";
                                descripcion.Text = "";
                                novedad.Text = "";
                                placa.Text = "";
                                serial.Text = "";
                                marca.Text = "";
                                modelo.Text = "";
                                cantidad.Text = "";
                                valorUnitario.Text = "";
                                // consumible.Text = "";
                                btn_Registrar.CssClass = "btn btn-default";
                                btn_Registrar.Enabled = true;
                                btn_Actualizar.CssClass = "btn btn-default";
                                btn_Actualizar.Enabled = false;
                                btn_Cancelar.CssClass = "btn btn-default";
                                btn_Cancelar.Enabled = false;
                                cantidad.ReadOnly = false;
                                // program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                inventario.CargarProductos(GVProductos);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);

                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            GVProductos.EditIndex = -1;
            inventario.CargarProductos(GVProductos);
            


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
            nombre.Text = "";
            descripcion.Text = "";
            novedad.Text = "";
            placa.Text = "";
            serial.Text = "";
            marca.Text = "";
            modelo.Text = "";
            valorUnitario.Text = "";
            cantidad.Text = "";
            cantidad.ReadOnly = false;
            CADInventario inventario = new CADInventario();
            GVProductos.EditIndex = -1;
            inventario.CargarProductos(GVProductos);
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            DTOInventario inven = new DTOInventario();
            CADInventario inventario = new CADInventario();
            int refe = 0;
            try
            {
                inven.Referencia_Producto = buscar.Text;
                refe = inventario.ConsultarProductoPorRef(inven);
            }
            catch 
            {

                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);

            }
            if (refe > 0)
            {
                inventario.BuscarProductoYCargarloAlGV(inven, GVProductos);
            }else
            {
                inventario.CargarProductos(GVProductos);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "noregist", "noregistrado();", true);
            }
            opciontabla.SelectedIndex = opciontabla.Items.IndexOf(opciontabla.Items.FindByText("Mostrar"));
            buscar.Text = "";

        }
    }
}