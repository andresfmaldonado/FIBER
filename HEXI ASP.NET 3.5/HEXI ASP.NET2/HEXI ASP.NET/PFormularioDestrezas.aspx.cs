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
    public partial class PFormularioDestrezas : System.Web.UI.Page
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
                        CADPrograma program = new CADPrograma();
                        program.CargarCompetenciasGV(GVCompetencias);
                        //program.ConsultarUltimaCompetencia(codigocompetencia);
                        Button2.CssClass = "btn btn-default";
                        Button2.Enabled = false;
                        Button3.CssClass = "btn btn-default";
                        Button3.Enabled = false;
                    }
                }else
                {
                    Response.Redirect("default.aspx");
                }
                }

               
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int codigo = 0;
            int dni = 0;
            int resultado = 0;
            int hora = 0;
            int confirmacion = 0;
            DateTime fecha = DateTime.Now;
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            try
            {
               // dni = int.Parse(dnicompetencia.Text);
                resultado = int.Parse(resultados.Text);
                hora = int.Parse(horas.Text);
                confirmacion = 4;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (nombre_competencia.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (confirmacion == 5)
            {
                infor.Id_competencia = codigo;
                infor.Dni_competencia = dnicompetencia.Text;
                infor.Nombre_competencia = nombre_competencia.Text;
                infor.Cantid_resultados_compet = resultado;
                infor.Cantid_horas_compet = hora;
                infor.Fecha_reg_compet = fecha;
                    if (program.ConsultarCompetenciaPorDNI(infor) == 0)
                    {
                        if (program.ConsultarCompetenciaPorNombre(infor) == 0)
                        {
                            if (program.InsertarCompetencia(infor) == 0)
                            {
                                dnicompetencia.Text = "";
                                nombre_competencia.Text = "";
                                resultados.Text = "";
                                horas.Text = "";
                               // program.ConsultarUltimaCompetencia(codigocompetencia);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisnom", "yaexistenombre();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexis", "yaexistedni();", true);
                    }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            GVCompetencias.EditIndex = -1;
            program.CargarCompetenciasGV(GVCompetencias);
        }

        protected void RowEditingEvent(object sender, GridViewEditEventArgs e)
        {
            int codigo = Convert.ToInt32(GVCompetencias.DataKeys[e.NewEditIndex].Values[0]);
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            infor.Id_competencia = codigo;
            ViewState["id_compet"] = codigo;
            if (program.CompletarRegistroCompetenciaParaModificar(infor, dnicompetencia, nombre_competencia, resultados, horas) == 0)
            {
                Button1.CssClass = "btn btn-default";
                Button1.Enabled = false;
                Button2.CssClass = "btn btn-default";
                Button2.Enabled = true;
                Button3.CssClass = "btn btn-default";
                Button3.Enabled = true;
                DateTime fecharegis = program.FechaRegistroCompetencia(infor);
                infor.Fecha_reg_compet = fecharegis;
                if (program.CantidadDiasRegistroCompetencia(infor) > 2)
                {
                    dnicompetencia.CssClass = "form-control";
                    dnicompetencia.Enabled = false;
                }
                else
                {
                    dnicompetencia.CssClass = "form-control";
                    dnicompetencia.Enabled = true;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
            GVCompetencias.EditIndex = -1;
            program.CargarCompetenciasGV(GVCompetencias);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button1.CssClass = "btn btn-default";
            Button1.Enabled = true;
            Button2.CssClass = "btn btn-default";
            Button2.Enabled = false;
            Button3.CssClass = "btn btn-default";
            Button3.Enabled = false;
            dnicompetencia.CssClass = "form-control";
            dnicompetencia.Enabled = true;
            dnicompetencia.Text = "";
            nombre_competencia.Text = "";
            resultados.Text = "";
            horas.Text = "";
            Conexion c = new Conexion();
            GVCompetencias.EditIndex = -1;
            CADPrograma program = new CADPrograma();
            //program.ConsultarUltimaCompetencia(codigocompetencia);
            program.CargarCompetenciasGV(GVCompetencias);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            CADPrograma program = new CADPrograma();
            DTOPrograma infor = new DTOPrograma();
            int codigo = 0;
            int dni = 0;
            int resultado = 0;
            int hora = 0;
            int confirmacion = 0;
            int modifi = 0;
            infor.Id_competencia = int.Parse(ViewState["id_compet"].ToString());
            string dnicomp = program.ConsultarDNICompetencia(infor);
            string nombcomp = program.ConsultarNombreCompetencia(infor);
            if (dnicomp != dnicompetencia.Text && nombcomp!=nombre_competencia.Text)
            {
                modifi = 1;
            }
            if (dnicomp != dnicompetencia.Text && nombcomp == nombre_competencia.Text)
            {
                modifi = 2;
            }
            if (dnicomp == dnicompetencia.Text && nombcomp != nombre_competencia.Text)
            {
                modifi = 3;
            }
            DateTime fecha = DateTime.Now;
            try
            {
               // dni = int.Parse(dnicompetencia.Text);
                resultado = int.Parse(resultados.Text);
                hora = int.Parse(horas.Text);
                confirmacion = 4;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (nombre_competencia.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (confirmacion == 5)
            {
                infor.Dni_competencia = dnicompetencia.Text;
                infor.Nombre_competencia = nombre_competencia.Text;
                infor.Cantid_resultados_compet = resultado;
                infor.Cantid_horas_compet = hora;
                if (modifi == 1)
                {
                    if (program.ConsultarCompetenciaPorDNI(infor) == 0)
                    {
                        if (program.ConsultarCompetenciaPorNombre(infor) == 0)
                        {
                            if (program.ModificarCompetencia(infor) == 0)
                            {
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                dnicompetencia.CssClass = "form-control";
                                dnicompetencia.Enabled = true;
                                dnicompetencia.Text = "";
                                nombre_competencia.Text = "";
                                resultados.Text = "";
                                horas.Text = "";
                               // program.ConsultarUltimaCompetencia(codigocompetencia);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisnom", "yaexistenombre();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexis", "yaexistedni();", true);
                    }

                }

                if (modifi == 2)
                {
                    if (program.ConsultarCompetenciaPorDNI(infor) == 0)
                    {
                            if (program.ModificarCompetencia(infor) == 0)
                            {
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                dnicompetencia.CssClass = "form-control";
                                dnicompetencia.Enabled = true;
                                dnicompetencia.Text = "";
                                nombre_competencia.Text = "";
                                resultados.Text = "";
                                horas.Text = "";
                                //program.ConsultarUltimaCompetencia(codigocompetencia);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexis", "yaexistedni();", true);
                    }

                }

                if (modifi == 3) { 
                    if (program.ConsultarCompetenciaPorNombre(infor) == 0)
                    {
                        if (program.ModificarCompetencia(infor) == 0)
                        {
                            Button1.CssClass = "btn btn-default";
                            Button1.Enabled = true;
                            Button2.CssClass = "btn btn-default";
                            Button2.Enabled = false;
                            Button3.CssClass = "btn btn-default";
                            Button3.Enabled = false;
                            dnicompetencia.CssClass = "form-control";
                            dnicompetencia.Enabled = true;
                            dnicompetencia.Text = "";
                            nombre_competencia.Text = "";
                            resultados.Text = "";
                            horas.Text = "";
                            //program.ConsultarUltimaCompetencia(codigocompetencia);
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "yaexisnom", "yaexistenombre();", true);
                    }
                }

                if (modifi == 0)
                {
                        if (program.ModificarCompetencia(infor) == 0)
                        {
                            Button1.CssClass = "btn btn-default";
                            Button1.Enabled = true;
                            Button2.CssClass = "btn btn-default";
                            Button2.Enabled = false;
                            Button3.CssClass = "btn btn-default";
                            Button3.Enabled = false;
                            dnicompetencia.CssClass = "form-control";
                            dnicompetencia.Enabled = true;
                            dnicompetencia.Text = "";
                            nombre_competencia.Text = "";
                            resultados.Text = "";
                            horas.Text = "";
                           // program.ConsultarUltimaCompetencia(codigocompetencia);
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
            GVCompetencias.EditIndex = -1;
            program.CargarCompetenciasGV(GVCompetencias);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            int dni = 0;
            try
            {
                int dni_compe = int.Parse(busqueda.Text);
                infor.Dni_competencia = busqueda.Text;
                dni = program.ConsultarCompetenciaPorDNI(infor);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (dni > 0)
            {
                program.ConsultarCompetenciaPorDNIyCargarlaAlGV(infor, GVCompetencias);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "noreg", "noregistrado();", true);
            }
            busqueda.Text = "";
            GVCompetencias.EditIndex = -1;
        }
    }
}