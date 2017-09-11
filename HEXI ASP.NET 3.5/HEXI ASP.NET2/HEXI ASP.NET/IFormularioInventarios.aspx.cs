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
    public partial class IFormularioInventarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CADInventario process = new CADInventario();
                process.CargarHilos(GridView2);
                process.CargarProductos(GridView1);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CADInventario process = new CADInventario();
            DTOInventario invent = new DTOInventario();

            if (referencia.Text != "" && observaciones.Text != "")
            {
                invent.Referencia_Inventario = referencia.Text;
                invent.Observacion_Inventario = observaciones.Text;
                //validar que el inventario no exista
                if (process.ConsultarInventarioPorReferencia(invent) == 0)
                {
                    //Registrar inventario
                    //Validar proceso exitoso
                    if (process.RegistrarInventario(invent) == 0)
                    {
                        //Obtener id del inventario registrado
                        invent.Id_Inventario = process.ObtenerIdInventarioPorReferencia(invent);

                        int resultp = 0;
                        //Recorrer gridview productos para registrarlos  en el inventario
                        foreach (GridViewRow row in GridView1.Rows)
                        {

                            invent.Id_Producto = int.Parse((row.FindControl("codigop") as Label).Text);
                            invent.Cantidad_Producto = float.Parse((row.FindControl("cantidadp") as TextBox).Text);
                            invent.Novedad_Producto = (row.FindControl("novedadp") as TextBox).Text;
                            if (process.RegistrarInventarioProducto(invent) == 0)
                            {
                                resultp++;
                            }
                        }

                        int resulth = 0;
                        //Recorrer gridiview hilos para registralos en el inventario
                        if (resultp > 0)
                        {
                            foreach (GridViewRow row in GridView2.Rows)
                            {

                                invent.Id_Hilo = int.Parse((row.FindControl("codigoh") as Label).Text);
                                invent.Metros_Hilo = float.Parse((row.FindControl("metrosh") as TextBox).Text);
                                if (process.RegistrarInventarioHilo(invent) == 0)
                                {
                                    resulth++;
                                }
                            }
                        }

                        //Validar que se hayan registrado los hilos y productos en el inventario
                        if (resultp > 0 && resulth > 0)
                        {
                            referencia.Text = "";
                            observaciones.Text = "";
                            //alerta resultado exitoso
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "correcto", "registro();", true);

                        }
                        else
                        {
                            //alerta error inesperado
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "errorinesp", "problema();", true);
                        }
                    }
                    else
                    {
                        //Aletar error inesperado
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "errorines", "problema();", true);
                    }
                }
                else
                {
                    //ALERTA: Ya existe inventario con esa referencia
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "ya", "yaexiste();", true);
                }
            }
            else
            {
                //alerta complete los campos
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
        }
    }
}