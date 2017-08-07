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
    public partial class PFormularioResultados : System.Web.UI.Page
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
                        //program.ConsultarUltimoResultadoEIncrementarlo(codigo_resultado);
                        program.CargarCompetencia(competencias);
                        program.CargarResultadosAlGV(GVResultados);
                        Button2.CssClass = "btn btn-default";
                        Button2.Enabled = false;
                        Button3.CssClass = "btn btn-default";
                        Button3.Enabled = false;
                    }
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int dni = 0;
            int compet = 0;
            int h = 0;
            int confirmacion = 0;
            DateTime fecha = DateTime.Now;
            CADPrograma program = new CADPrograma();
            DTOPrograma infor = new DTOPrograma();
            try
            {
                //dni = int.Parse(dni_resultado.Text);
                compet = int.Parse(competencias.SelectedValue);
                h = int.Parse(cantidad_horas.Text);
                confirmacion = 2;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (compet > 0)
            {
                confirmacion = confirmacion + 1;
            }
            if (nombre_resultado.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (confirmacion == 4)
            {
                infor.Dni_result = dni_resultado.Text;
                infor.Nombre_result = nombre_resultado.Text;
                infor.Id_competencia = compet;
                infor.Cantid_horas_result = int.Parse(cantidad_horas.Text);
                infor.Fecha_reg_result = fecha;
                    if (program.ConsultarResultadoPorDNI(infor) == 0)
                    {
                        if (program.ConsultarResultadoPorNOMBRE(infor) == 0)
                        {
                            if (program.InsertarUnResultado(infor) == 0)
                            {
                                program.CargarCompetencia(competencias);
                                //program.ConsultarUltimoResultadoEIncrementarlo(codigo_resultado);
                                dni_resultado.Text = "";
                                nombre_resultado.Text = "";
                                cantidad_horas.Text = "";
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
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitcamp", "campos();", true);
            }
        }

        protected void RowEditingEvent(object sender, GridViewEditEventArgs e)
        {
            int codigo = Convert.ToInt32(GVResultados.DataKeys[e.NewEditIndex].Values[0]);
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            infor.Id_result = codigo;
            ViewState["id_result"]=codigo;
            if (program.AutocompletarRegistroResultadoParaModificar(infor, dni_resultado, competencias,nombre_resultado, cantidad_horas) == 0)
            {
                Button1.CssClass = "btn btn-default";
                Button1.Enabled = false;
                Button2.CssClass = "btn btn-default";
                Button2.Enabled = true;
                Button3.CssClass = "btn btn-default";
                Button3.Enabled = true;
                DateTime fecharegis = program.ObtenerfechaRegistroResultado(infor);
                infor.Fecha_reg_result = fecharegis;
                if (program.ObtenerCantidadDiasResultado(infor) > 2 || program.ObtenerCantidadDiasResultado(infor)<0)
                {
                    dni_resultado.CssClass = "form-control";
                    dni_resultado.Enabled = false;
                    competencias.CssClass = "form-control col-sm-12";
                    competencias.Enabled = false;
                }
                else
                {
                    dni_resultado.CssClass = "form-control";
                    dni_resultado.Enabled = true;
                    competencias.CssClass = "form-control col-sm-12";
                    competencias.Enabled = true;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
            GVResultados.EditIndex = -1;
            program.CargarResultadosAlGV(GVResultados);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button1.CssClass = "btn btn-default";
            Button1.Enabled = true;
            Button2.CssClass = "btn btn-default";
            Button2.Enabled = false;
            Button3.CssClass = "btn btn-default";
            Button3.Enabled = false;
            dni_resultado.Text = "";
            cantidad_horas.Text = "";
            nombre_resultado.Text = "";
            dni_resultado.CssClass = "form-control";
            dni_resultado.Enabled = true;
            competencias.CssClass = "form-control col-sm-12";
            competencias.Enabled = true;
            CADPrograma program = new CADPrograma();
            program.CargarCompetencia(competencias);
            //program.ConsultarUltimoResultadoEIncrementarlo(codigo_resultado);
            GVResultados.EditIndex = -1;
            program.CargarResultadosAlGV(GVResultados);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int dni = 0;
            int compet = 0;
            int h = 0;
            int confirmacion = 0;
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            int modifi = 0;
            infor.Id_result = int.Parse(ViewState["id_result"].ToString()); ;
            string dnire = program.ObtenerDNIResultado(infor);
            string nombre = program.ObtenerNombreResultado(infor);
            if (dni_resultado.Text != dnire && nombre_resultado.Text!=nombre)
            {
                modifi = 1;
            }
            if (dni_resultado.Text != dnire && nombre_resultado.Text == nombre)
            {
                modifi = 2;
            }
            if (dni_resultado.Text == dnire && nombre_resultado.Text != nombre)
            {
                modifi = 3;
            }
            try
            {
                //dni = int.Parse(dni_resultado.Text);
                compet = int.Parse(competencias.SelectedValue);
                h = int.Parse(cantidad_horas.Text);
                confirmacion = 2;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (compet > 0)
            {
                confirmacion = confirmacion + 1;
            }
            if (nombre_resultado.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (confirmacion == 4)
            {
                infor.Dni_result = dni_resultado.Text;
                infor.Nombre_result = nombre_resultado.Text;
                infor.Id_competencia = compet;
                infor.Cantid_horas_result = int.Parse(cantidad_horas.Text);
                if (modifi==1)
                {
                    if (program.ConsultarResultadoPorDNI(infor) == 0)
                    {
                        if (program.ConsultarResultadoPorNOMBRE(infor) == 0)
                        {
                            if (program.ModificarResultado(infor) == 0)
                            {
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                dni_resultado.Text = "";
                                cantidad_horas.Text = "";
                                nombre_resultado.Text = "";
                                dni_resultado.CssClass = "form-control";
                                dni_resultado.Enabled = true;
                                competencias.CssClass = "form-control col-sm-12";
                                competencias.Enabled = true;
                                program.CargarCompetencia(competencias);
                                //program.ConsultarUltimoResultadoEIncrementarlo(codigo_resultado);
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
                    if (program.ConsultarResultadoPorDNI(infor) == 0)
                    {
                            if (program.ModificarResultado(infor) == 0)
                            {
                            Button1.CssClass = "btn btn-default";
                            Button1.Enabled = true;
                            Button2.CssClass = "btn btn-default";
                            Button2.Enabled = false;
                            Button3.CssClass = "btn btn-default";
                            Button3.Enabled = false;
                            dni_resultado.Text = "";
                            cantidad_horas.Text = "";
                            nombre_resultado.Text = "";
                            dni_resultado.CssClass = "form-control";
                            dni_resultado.Enabled = true;
                            competencias.CssClass = "form-control col-sm-12";
                            competencias.Enabled = true;
                            program.CargarCompetencia(competencias);
                            //program.ConsultarUltimoResultadoEIncrementarlo(codigo_resultado);
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


                if (modifi == 3)
                {

                    if (program.ConsultarResultadoPorNOMBRE(infor) == 0)
                    {
                        if (program.ModificarResultado(infor) == 0)
                        {
                            Button1.CssClass = "btn btn-default";
                            Button1.Enabled = true;
                            Button2.CssClass = "btn btn-default";
                            Button2.Enabled = false;
                            Button3.CssClass = "btn btn-default";
                            Button3.Enabled = false;
                            dni_resultado.Text = "";
                            cantidad_horas.Text = "";
                            nombre_resultado.Text = "";
                            dni_resultado.CssClass = "form-control";
                            dni_resultado.Enabled = true;
                            competencias.CssClass = "form-control col-sm-12";
                            competencias.Enabled = true;
                            program.CargarCompetencia(competencias);
                            //program.ConsultarUltimoResultadoEIncrementarlo(codigo_resultado);
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
                    if (program.ModificarResultado(infor) == 0)
                    {
                        Button1.CssClass = "btn btn-default";
                        Button1.Enabled = true;
                        Button2.CssClass = "btn btn-default";
                        Button2.Enabled = false;
                        Button3.CssClass = "btn btn-default";
                        Button3.Enabled = false;
                        dni_resultado.Text = "";
                        cantidad_horas.Text = "";
                        nombre_resultado.Text = "";
                        dni_resultado.CssClass = "form-control";
                        dni_resultado.Enabled = true;
                        competencias.CssClass = "form-control col-sm-12";
                        competencias.Enabled = true;
                        program.CargarCompetencia(competencias);
                        //program.ConsultarUltimoResultadoEIncrementarlo(codigo_resultado);
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
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitcamp", "campos();", true);
            }

            GVResultados.EditIndex = -1;
            program.CargarResultadosAlGV(GVResultados);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            int dni = 0;
            try
            {
                int dni_res = int.Parse(busqueda.Text);
                infor.Dni_result =busqueda.Text;
                dni = program.ConsultarResultadoPorDNI(infor);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (dni > 0)
            {
                program.ConsultarResultadoPorDNIyCargarloAlGV(infor, GVResultados);
            }
            else
            {
                program.CargarResultadosAlGV(GVResultados);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "noreg", "noregistrado();", true);
            }
            busqueda.Text = "";
            GVResultados.EditIndex = -1;
        }
    }
}