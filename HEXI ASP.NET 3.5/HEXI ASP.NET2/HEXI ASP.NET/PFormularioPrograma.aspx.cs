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
    public partial class PFormularioPrograma : System.Web.UI.Page
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
                        program.CargarCompetenciasAlDropdownList(competencias);
                        //program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                        program.CargarProgramasAlGV(GVProgramas);
                        program.CargarProgramasConCompetenciasAlGV(GVInfoProgramas);
                        Button1.CssClass = "btn btn-default";
                        Button1.Enabled = true;
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
            int comp = 0;
            int hora = 0;
            int confirma = 0;
            string nombre = "";
            DateTime fecha_regis = DateTime.Now;
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            try
            {
                //dni = int.Parse(dni_programa.Text);
                comp = int.Parse(competencias.SelectedValue);
                hora = int.Parse(cantid_horas.Text);
                confirma = 3;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (nombre_programa.Text != ""){

                confirma = confirma + 1;
            }
            if (comp > 0)
            {
                confirma = confirma + 1;
            }
            if (confirma == 5)
            {
                infor.Dni_programa = dni_programa.Text;
                infor.Nombre_programa = nombre_programa.Text;
                infor.Cantid_horas_programa = hora;
                infor.Fecha_reg_programa = fecha_regis;
                    if (program.ConsultarProgramaPorDNI(infor) == 0)
                    {
                        if (program.ConsultarProgramaPorNOMBRE(infor) == 0)
                        {
                            if (program.InsertarPrograma(infor) == 0)
                            {
                                infor.Id_programa = program.ConsultarIDProgramaPorDNI(infor);
                                int aceptar = 0;
                                int veces = 0;
                                int longitud = 0;
                                int signo = 0;
                                string cadena = TextBox7.Text;
                                int compet = 0;
                                string numero = "";
                                while (aceptar == 0)
                                {
                                    longitud = cadena.Length;
                                    signo = cadena.IndexOf(",");
                                    if (signo != -1)
                                    {
                                        numero = cadena.Substring(0, signo);
                                        compet = Convert.ToInt32(numero);
                                        infor.Id_competencia = compet;
                                        cadena = cadena.Substring(signo + 1, (longitud - (signo + 1)));
                                    }
                                    else
                                    {
                                        compet = Convert.ToInt32(cadena);
                                        infor.Id_competencia = compet;
                                        aceptar = 1;
                                    }
                                    if (program.AsignarCompetenciaAPrograma(infor) == 0)
                                    {
                                        veces = veces + 1;
                                    }
                                }
                                if (aceptar == 1 && veces > 0)
                                {
                                    dni_programa.Text = "";
                                    nombre_programa.Text = "";
                                    cantid_horas.Text = "";
                                    Button1.CssClass = "btn btn-default";
                                    Button1.Enabled = true;
                                    Button2.CssClass = "btn btn-default";
                                    Button2.Enabled = false;
                                    Button3.CssClass = "btn btn-default";
                                    Button3.Enabled = false;
                                    //program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                    program.CargarCompetenciasAlDropdownList(competencias);
                                    program.CargarProgramasAlGV(GVProgramas);
                                    program.CargarProgramasConCompetenciasAlGV(GVInfoProgramas);
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                                }
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
            tipogv.SelectedIndex = tipogv.Items.IndexOf(tipogv.Items.FindByText("Programas"));
            GVProgramas.EditIndex = -1;
            program.CargarProgramasAlGV(GVProgramas);
            program.CargarProgramasConCompetenciasAlGV(GVInfoProgramas);
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button1.CssClass = "btn btn-default";
            Button1.Enabled = true;
            Button2.CssClass = "btn btn-default";
            Button2.Enabled = false;
            Button3.CssClass = "btn btn-default";
            Button3.Enabled = false;
            dni_programa.CssClass = "form-control";
            dni_programa.Enabled = true;
            dni_programa.Text = "";
            nombre_programa.Text = "";
            cantid_horas.Text = "";
            CADPrograma program = new CADPrograma();
            tipogv.SelectedIndex = tipogv.Items.IndexOf(tipogv.Items.FindByText("Programas"));
            //program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
            GVProgramas.EditIndex = -1;
            program.CargarProgramasAlGV(GVProgramas);
        }

        protected void RowEditingEvent(object sender, GridViewEditEventArgs e)
        {
            int codigo = Convert.ToInt32(GVProgramas.DataKeys[e.NewEditIndex].Values[0]);
            CADPrograma program = new CADPrograma();
            DTOPrograma infor = new DTOPrograma();
            infor.Id_programa = codigo;
            ViewState["id_prog"] = codigo;
            if (program.CompletarRegistroProgramaParaModificar(infor,dni_programa, nombre_programa, cantid_horas) == 0)
            {
                Button1.CssClass = "btn btn-default";
                Button1.Enabled = false;
                Button2.CssClass = "btn btn-default";
                Button2.Enabled = true;
                Button3.CssClass = "btn btn-default";
                Button3.Enabled = true;
                DateTime fecharegis = program.ObtenerFechaRegistroPrograma(infor);
                infor.Fecha_reg_programa = fecharegis;
                if (program.CalcularDiasDesdeFechaRegistroPrograma(infor) > 2 || program.CalcularDiasDesdeFechaRegistroPrograma(infor) < 0)
                {
                    dni_programa.CssClass = "form-control";
                    dni_programa.Enabled = false;
                }
                else
                {
                    dni_programa.CssClass = "form-control";
                    dni_programa.Enabled = true;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
            tipogv.SelectedIndex = tipogv.Items.IndexOf(tipogv.Items.FindByText("Programas"));
            GVProgramas.EditIndex = -1;
            program.CargarProgramasAlGV(GVProgramas);
            program.CargarProgramasConCompetenciasAlGV(GVInfoProgramas);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int dni = 0;
            int comp = 0;
            int hora = 0;
            int confirma = 0;
            int modifi = 0;
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            infor.Id_programa = int.Parse(ViewState["id_prog"].ToString());
            string dniprograma = program.ObtenerDNIPrograma(infor);
            string nombprograma = program.ObtenerNombrePrograma(infor);
            if(dniprograma != dni_programa.Text && nombprograma != nombre_programa.Text)
            {
                modifi = 1;
            }
            if (dniprograma != dni_programa.Text && nombprograma == nombre_programa.Text)
            {
                modifi = 2;
            }
            if (dniprograma == dni_programa.Text && nombprograma != nombre_programa.Text)
            {
                modifi = 3;
            }
            try
            {
                //dni = int.Parse(dni_programa.Text);
                comp = int.Parse(competencias.SelectedValue);
                if (comp == 1)
                {
                    comp = 0;
                }
                hora = int.Parse(cantid_horas.Text);
                confirma = 3;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (nombre_programa.Text != "")
            {

                confirma = confirma + 1;
            }
            if (confirma == 4)
            {
                infor.Dni_programa= dni_programa.Text;
                infor.Nombre_programa = nombre_programa.Text;
                infor.Cantid_horas_programa = hora;
                if (modifi==1)
                {
                    if (program.ConsultarProgramaPorDNI(infor) == 0)
                    {
                        if (program.ConsultarProgramaPorNOMBRE(infor) == 0)
                        {
                            if (program.ModificarPrograma(infor) == 0)
                            {
                                if (comp > 0)
                                {
                                    int aceptar = 0;
                                    int veces = 0;
                                    int longitud = 0;
                                    int signo = 0;
                                    string cadena = TextBox7.Text;
                                    int compet = 0;
                                    string numero = "";
                                    while (aceptar == 0)
                                    {
                                        longitud = cadena.Length;
                                        signo = cadena.IndexOf(",");
                                        if (signo != -1)
                                        {
                                            numero = cadena.Substring(0, signo);
                                            compet = Convert.ToInt32(numero);
                                            infor.Id_competencia = compet;
                                            cadena = cadena.Substring(signo + 1, (longitud - (signo + 1)));
                                        }
                                        else
                                        {
                                            compet = Convert.ToInt32(cadena);
                                            infor.Id_competencia = compet;
                                            aceptar = 1;
                                        }
                                        if (program.ConsultarSiCompetenciaYaEstáAsignadaAPrograma(infor) == 0)
                                        {
                                            program.AsignarCompetenciaAPrograma(infor);
                                            veces = veces + 1;
                                        }
                                    }
                                    if (aceptar == 1)
                                    {
                                        dni_programa.Text = "";
                                        nombre_programa.Text = "";
                                        cantid_horas.Text = "";
                                        Button1.CssClass = "btn btn-default";
                                        Button1.Enabled = true;
                                        Button2.CssClass = "btn btn-default";
                                        Button2.Enabled = false;
                                        Button3.CssClass = "btn btn-default";
                                        Button3.Enabled = false;
                                       // program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                        program.CargarCompetenciasAlDropdownList(competencias);
                                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                                    }
                                }else
                                {
                                    dni_programa.Text = "";
                                    nombre_programa.Text = "";
                                    cantid_horas.Text = "";
                                    Button1.CssClass = "btn btn-default";
                                    Button1.Enabled = true;
                                    Button2.CssClass = "btn btn-default";
                                    Button2.Enabled = false;
                                    Button3.CssClass = "btn btn-default";
                                    Button3.Enabled = false;
                                    //program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                    program.CargarCompetenciasAlDropdownList(competencias);
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                                }
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
                    if (program.ConsultarProgramaPorDNI(infor) == 0)
                    {
                            if (program.ModificarPrograma(infor) == 0)
                            {
                            if (comp > 0)
                            {
                                int aceptar = 0;
                                int veces = 0;
                                int longitud = 0;
                                int signo = 0;
                                string cadena = TextBox7.Text;
                                int compet = 0;
                                string numero = "";
                                while (aceptar == 0)
                                {
                                    longitud = cadena.Length;
                                    signo = cadena.IndexOf(",");
                                    if (signo != -1)
                                    {
                                        numero = cadena.Substring(0, signo);
                                        compet = Convert.ToInt32(numero);
                                        infor.Id_competencia = compet;
                                        cadena = cadena.Substring(signo + 1, (longitud - (signo + 1)));
                                    }
                                    else
                                    {
                                        compet = Convert.ToInt32(cadena);
                                        infor.Id_competencia = compet;
                                        aceptar = 1;
                                    }
                                    if (program.ConsultarSiCompetenciaYaEstáAsignadaAPrograma(infor) == 0)
                                    {
                                        program.AsignarCompetenciaAPrograma(infor);
                                        veces = veces + 1;
                                    }
                                }
                                if (aceptar == 1)
                                {
                                    dni_programa.Text = "";
                                    nombre_programa.Text = "";
                                    cantid_horas.Text = "";
                                    Button1.CssClass = "btn btn-default";
                                    Button1.Enabled = true;
                                    Button2.CssClass = "btn btn-default";
                                    Button2.Enabled = false;
                                    Button3.CssClass = "btn btn-default";
                                    Button3.Enabled = false;
                                   // program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                    program.CargarCompetenciasAlDropdownList(competencias);
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                                }
                            }
                            else
                            {
                                dni_programa.Text = "";
                                nombre_programa.Text = "";
                                cantid_horas.Text = "";
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                //program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                program.CargarCompetenciasAlDropdownList(competencias);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                            }
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
                        if (program.ConsultarProgramaPorNOMBRE(infor) == 0)
                        {
                            if (program.ModificarPrograma(infor) == 0)
                            {
                            if (comp > 0)
                            {
                                int aceptar = 0;
                                int veces = 0;
                                int longitud = 0;
                                int signo = 0;
                                string cadena = TextBox7.Text;
                                int compet = 0;
                                string numero = "";
                                while (aceptar == 0)
                                {
                                    longitud = cadena.Length;
                                    signo = cadena.IndexOf(",");
                                    if (signo != -1)
                                    {
                                        numero = cadena.Substring(0, signo);
                                        compet = Convert.ToInt32(numero);
                                        infor.Id_competencia = compet;
                                        cadena = cadena.Substring(signo + 1, (longitud - (signo + 1)));
                                    }
                                    else
                                    {
                                        compet = Convert.ToInt32(cadena);
                                        infor.Id_competencia = compet;
                                        aceptar = 1;
                                    }
                                    if (program.ConsultarSiCompetenciaYaEstáAsignadaAPrograma(infor) == 0)
                                    {
                                        program.AsignarCompetenciaAPrograma(infor);
                                        veces = veces + 1;
                                    }
                                }
                                if (aceptar == 1 )
                                {
                                    dni_programa.Text = "";
                                    nombre_programa.Text = "";
                                    cantid_horas.Text = "";
                                    Button1.CssClass = "btn btn-default";
                                    Button1.Enabled = true;
                                    Button2.CssClass = "btn btn-default";
                                    Button2.Enabled = false;
                                    Button3.CssClass = "btn btn-default";
                                    Button3.Enabled = false;
                                    //program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                    program.CargarCompetenciasAlDropdownList(competencias);
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                                }
                            }
                            else
                            {
                                dni_programa.Text = "";
                                nombre_programa.Text = "";
                                cantid_horas.Text = "";
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                               // program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                program.CargarCompetenciasAlDropdownList(competencias);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                            }
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
                            if (program.ModificarPrograma(infor) == 0)
                            {
                        if (comp > 0)
                        {
                            int aceptar = 0;
                            int veces = 0;
                            int longitud = 0;
                            int signo = 0;
                            string cadena = TextBox7.Text;
                            int compet = 0;
                            string numero = "";
                            while (aceptar == 0)
                            {
                                longitud = cadena.Length;
                                signo = cadena.IndexOf(",");
                                if (signo != -1)
                                {
                                    numero = cadena.Substring(0, signo);
                                    compet = Convert.ToInt32(numero);
                                    infor.Id_competencia = compet;
                                    cadena = cadena.Substring(signo + 1, (longitud - (signo + 1)));
                                }
                                else
                                {
                                    compet = Convert.ToInt32(cadena);
                                    infor.Id_competencia = compet;
                                    aceptar = 1;
                                }
                                if (program.ConsultarSiCompetenciaYaEstáAsignadaAPrograma(infor) == 0)
                                {
                                    program.AsignarCompetenciaAPrograma(infor);
                                    veces = veces + 1;
                                }
                            }
                            if (aceptar == 1)
                            {
                                dni_programa.Text = "";
                                nombre_programa.Text = "";
                                cantid_horas.Text = "";
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                //program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                                program.CargarCompetenciasAlDropdownList(competencias);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                        }
                        else
                        {
                            dni_programa.Text = "";
                            nombre_programa.Text = "";
                            cantid_horas.Text = "";
                            Button1.CssClass = "btn btn-default";
                            Button1.Enabled = true;
                            Button2.CssClass = "btn btn-default";
                            Button2.Enabled = false;
                            Button3.CssClass = "btn btn-default";
                            Button3.Enabled = false;
                           // program.ObtenerUltimoIDProgramaEIncrementarlo(codigo_programa);
                            program.CargarCompetenciasAlDropdownList(competencias);
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                        }
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
            GVProgramas.EditIndex = -1;
            program.CargarProgramasAlGV(GVProgramas);
            program.CargarProgramasConCompetenciasAlGV(GVInfoProgramas);
            tipogv.SelectedIndex = tipogv.Items.IndexOf(tipogv.Items.FindByText("Programas"));
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            int dni = 0;
            try
            {
                int dni_prog = int.Parse(busqueda.Text);
                infor.Dni_programa = busqueda.Text;
                dni = program.ConsultarProgramaPorDNI(infor);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if(dni > 0)
            {
                program.BuscarProgramaYCargarloAlGV(infor,GVProgramas);
            }
            else
            {
                program.CargarProgramasAlGV(GVProgramas);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "noregist", "noregistrado();", true);
            }
            busqueda.Text = "";
            tipogv.SelectedIndex = tipogv.Items.IndexOf(tipogv.Items.FindByText("Programas"));
            program.CargarProgramasConCompetenciasAlGV(GVInfoProgramas);
        }
    }
}