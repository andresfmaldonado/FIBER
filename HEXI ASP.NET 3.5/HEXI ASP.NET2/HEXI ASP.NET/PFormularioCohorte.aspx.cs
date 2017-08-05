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
    public partial class PFormularioCohorte : System.Web.UI.Page
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
                        program.CargarProgramaDropdownlist(Programas);
                        program.CargarUsuarioDropdownlist(Integrantes);
                        program.CargarCohortesGV(GVCohortes);
                        //program.ConsultarUltimaCohorte(CodigoCohorte);
                        program.CargarIntegrantesCohorteGV(GVIntegrantes);
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


        protected void RowEditingEvent(object sender, GridViewEditEventArgs e)
        {
            int codigo = Convert.ToInt32(GVCohortes.DataKeys[e.NewEditIndex].Values[0]);
            DTOPrograma inform = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            inform.Id_cohorte=codigo;
            ViewState["id_cohort"]=codigo;
            if (program.CompletarRegistroCohorteParaModificar(inform,dnicohorte,fecha_inic,fecha_fin,Programas) == 0)
            {
                Button1.CssClass = "btn btn-default";
                Button1.Enabled = false;
                Button2.CssClass = "btn btn-default";
                Button2.Enabled = true;
                Button3.CssClass = "btn btn-default";
                Button3.Enabled = true;
                DateTime fecha = program.consultarFechaRegistro(inform);
                inform.Fecha_registro_cohorte = fecha;
                if (program.ConsultarCantidadDias(inform) > 2 || program.ConsultarCantidadDias(inform)<0)
                {
                    dnicohorte.CssClass = "form-control";
                    dnicohorte.Enabled = false;                
                    TextBox4.Enabled = false;
                    Programas.CssClass = "form-control col-sm-12";
                    Programas.Enabled = false;
                    string scriptfecha = @"<script type='text/javascript'>
                                    $('#fecha_inic').attr('data-field','nada');
                                    </script>";

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptfecha, false);
                }
                else
                {
                    dnicohorte.CssClass = "form-control";
                    dnicohorte.Enabled = true;
                    TextBox4.Enabled = true;
                    Programas.CssClass = "form-control col-sm-12";
                    Programas.Enabled = true;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
            GVCohortes.EditIndex = -1;
            program.CargarCohortesGV(GVCohortes);
            program.CargarIntegrantesCohorteGV(GVIntegrantes);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            int confirmacion = 0;
            DateTime fecha_registro = DateTime.Now;
            int programa = 0;
            int integrante = 0;
            try
            {
                //int dni = int.Parse(dnicohorte.Text);
                programa = int.Parse(Programas.SelectedValue);
                integrante = int.Parse(Integrantes.SelectedValue);
                DateTime fechainicio = Convert.ToDateTime(TextBox4.Text);
                DateTime fechafin = Convert.ToDateTime(TextBox6.Text);

               
                confirmacion = 4;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (programa > 0)
            {
                confirmacion = confirmacion + 1;
            }
            if (integrante > 0)
            {
                confirmacion = confirmacion + 1;
            }
            
            if (confirmacion == 6)
            {
                infor.Dni_cohorte = dnicohorte.Text;
                infor.Id_programa = programa;
                infor.Fecha_ini_cohorte = Convert.ToDateTime(TextBox4.Text);
                infor.Fecha_fin_cohorte = Convert.ToDateTime(TextBox6.Text);
                infor.Fecha_registro_cohorte = fecha_registro;
                    if (program.ConsultarCohortePorDNI(infor) == 0)
                    {
                        if (program.InsertarCohorte(infor) == 0)
                        {
                            infor.Id_cohorte = program.ConsultarIDCohortePorDNI(infor);
                            int aceptar = 0;
                            int veces = 0;
                            int longitud = 0;
                            int signo = 0;
                            string cadena = TextBox1.Text;
                            int integran = 0;
                            string numero = "";
                            while (aceptar == 0) {
                                longitud = cadena.Length;
                                signo = cadena.IndexOf(",");
                                if (signo != -1)
                                {
                                    numero = cadena.Substring(0, signo);
                                    integran = Convert.ToInt32(numero);
                                    infor.Id_integrante = integran;
                                    cadena = cadena.Substring(signo + 1, (longitud - (signo + 1)));
                                }else
                                {
                                    integran = Convert.ToInt32(cadena);
                                    infor.Id_integrante = integran;
                                    aceptar = 1;
                                }
                                if(program.AsignarIntegrantesACohorte(infor) == 0)
                                {
                                    veces = veces + 1;
                                }
                            }
                            if (aceptar == 1 && veces>0)
                            {
                                dnicohorte.Text = "";
                                fecha_inic.Text = "";
                                fecha_fin.Text = "";
                                //program.ConsultarUltimaCohorte(CodigoCohorte);
                                program.CargarProgramaDropdownlist(Programas);
                                program.CargarUsuarioDropdownlist(Integrantes);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsis", "problema();", true);
                            }
                            
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsistencia", "problema();", true);
                        }
                    }
                    else
                    {
                        dnicohorte.Text = "";
                        fecha_inic.Text = "";
                        fecha_fin.Text = "";
                        program.CargarProgramaDropdownlist(Programas);
                        program.CargarUsuarioDropdownlist(Integrantes);
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "ya", "yaexistedni();", true);
                    }               

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "malo", "campos();", true);
            }
            GVCohortes.EditIndex = -1;
            program.CargarCohortesGV(GVCohortes);
            program.CargarIntegrantesCohorteGV(GVIntegrantes);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            CADPrograma program = new CADPrograma();
            //program.ConsultarUltimaCohorte(CodigoCohorte);
            program.CargarProgramaDropdownlist(Programas);
            program.CargarUsuarioDropdownlist(Integrantes);
            dnicohorte.Text = "";
            Button1.CssClass = "btn btn-default";
            Button1.Enabled = true;
            Button2.CssClass = "btn btn-default";
            Button2.Enabled = false;
            Button3.CssClass = "btn btn-default";
            Button3.Enabled = false;
            dnicohorte.CssClass = "form-control";
            dnicohorte.Enabled = true;
            dnicohorte.Text = "";
            fecha_inic.CssClass = "form-control form_datetime";
            fecha_inic.Enabled = true;
            fecha_inic.Text = "";
            fecha_fin.Text = "";
            TextBox4.Enabled = true;
            Programas.CssClass = "form-control col-sm-12";
            Programas.Enabled = true;
            program.CargarProgramaDropdownlist(Programas);
            GVCohortes.EditIndex = -1;
            program.CargarCohortesGV(GVCohortes);
            program.CargarIntegrantesCohorteGV(GVIntegrantes);
            string scriptfecha = @"<script type='text/javascript'>
                                    $('#fecha_inic').attr('data-field','datetime');
                                    </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptfecha, false);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            int modifi = 0;
            infor.Id_cohorte = int.Parse(ViewState["id_cohort"].ToString()); ;
            string dnic = program.ConsultarDNICohorteParaModificar(infor);
            if (dnic != dnicohorte.Text)
            {
                modifi = 1;
            }
            int confirmacion = 0;
            DateTime fecha_registro = DateTime.Now;
            int programa = 0;
            int integrante = 0;
            DateTime fechainicioc= DateTime.Parse("2017-04-03 11:05");
            DateTime fechafinc= DateTime.Parse("2017-04-03 11:05");
            try
            {
                //int dni = int.Parse(dnicohorte.Text);
                programa = int.Parse(Programas.SelectedValue);
                integrante = int.Parse(Integrantes.SelectedValue);
                if (integrante == 1) { integrante = 0; }
                fechainicioc = Convert.ToDateTime(fecha_inic.Text);
                fechafinc = Convert.ToDateTime(TextBox6.Text);
                confirmacion = 4;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (programa > 0)
            {
                confirmacion = confirmacion + 1;
            }
            if (confirmacion == 5)
            {
                infor.Dni_cohorte = dnicohorte.Text;
                infor.Id_programa = programa;
                infor.Fecha_ini_cohorte = fechainicioc;
                infor.Fecha_fin_cohorte = fechafinc;
                if (modifi == 0)
                {
                    if (program.ModificarCohorte(infor) == 0)
                    {
                        int aceptar = 0;
                        int veces = 0;
                        int longitud = 0;
                        int signo = 0;
                        string cadena = TextBox1.Text;
                        int integran = 0;
                        string numero = "";
                        if (integrante > 0)
                        {
                            while (aceptar == 0)
                            {
                                longitud = cadena.Length;
                                signo = cadena.IndexOf(",");
                                if (signo != -1)
                                {
                                    numero = cadena.Substring(0, signo);
                                    integran = Convert.ToInt32(numero);
                                    infor.Id_integrante = integran;
                                    cadena = cadena.Substring(signo + 1, (longitud - (signo + 1)));
                                }
                                else
                                {
                                    integran = Convert.ToInt32(cadena);
                                    infor.Id_integrante = integran;
                                    aceptar = 1;
                                }
                                if (program.ConsultarUsuarioEnCohorte(infor) == 0)
                                {
                                    if (program.AsignarIntegrantesACohorte(infor) == 0)
                                    {
                                        veces = veces + 1;
                                    }
                                }

                            }
                            if (aceptar == 1 && veces > 0)
                            {
                                dnicohorte.Text = "";
                                fecha_inic.Text = "";
                                fecha_fin.Text = "";
                                //program.ConsultarUltimaCohorte(CodigoCohorte);
                                program.CargarProgramaDropdownlist(Programas);
                                program.CargarUsuarioDropdownlist(Integrantes);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                string scriptfecha = @"<script type='text/javascript'>
                                    $('#fecha_inic').attr('data-field','datetime');
                                    </script>";

                                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptfecha, false);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensajem", "modificacion();", true);
                                dnicohorte.Text = "";
                                fecha_inic.Text = "";
                                fecha_fin.Text = "";
                                //program.ConsultarUltimaCohorte(CodigoCohorte);
                                program.CargarProgramaDropdownlist(Programas);
                                program.CargarUsuarioDropdownlist(Integrantes);
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                string scriptfecha = @"<script type='text/javascript'>
                                    $('#fecha_inic').attr('data-field','datetime');
                                    </script>";

                                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptfecha, false);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensajemod", "modificacion();", true);
                            dnicohorte.Text = "";
                            fecha_inic.Text = "";
                            fecha_fin.Text = "";
                            //program.ConsultarUltimaCohorte(CodigoCohorte);
                            program.CargarProgramaDropdownlist(Programas);
                            program.CargarUsuarioDropdownlist(Integrantes);
                            Button1.CssClass = "btn btn-default";
                            Button1.Enabled = true;
                            Button2.CssClass = "btn btn-default";
                            Button2.Enabled = false;
                            Button3.CssClass = "btn btn-default";
                            Button3.Enabled = false;
                            string scriptfecha1 = @"<script type='text/javascript'>
                                    $('#fecha_inic').attr('data-field','datetime');
                                    </script>";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptfecha1, false);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsist", "problema();", true);
                    }
                }
                else
                {
                    if (program.ConsultarCohortePorDNI(infor) == 0)
                    {
                        if (program.ModificarCohorte(infor) == 0)
                        {
                            int aceptar1 = 0;
                            int veces1 = 0;
                            int longitud1 = 0;
                            int signo1 = 0;
                            string cadena1 = TextBox1.Text;
                            int integran1 = 0;
                            string numero1 = "";
                            if (integrante > 0)
                            {
                                while (aceptar1 == 0)
                                {
                                    longitud1 = cadena1.Length;
                                    signo1 = cadena1.IndexOf(",");
                                    if (signo1 != -1)
                                    {
                                        numero1 = cadena1.Substring(0, signo1);
                                        integran1 = Convert.ToInt32(numero1);
                                        infor.Id_integrante = integran1;
                                        cadena1 = cadena1.Substring(signo1 + 1, (longitud1 - (signo1 + 1)));
                                    }
                                    else
                                    {
                                        integran1 = Convert.ToInt32(cadena1);
                                        infor.Id_integrante = integran1;
                                        aceptar1 = 1;
                                    }
                                    if (program.ConsultarUsuarioEnCohorte(infor) == 0)
                                    {
                                        if (program.AsignarIntegrantesACohorte(infor) == 0)
                                        {
                                            veces1 = veces1 + 1;
                                        }
                                    }

                                }
                                if (aceptar1 == 1 && veces1 > 0)
                                {
                                    dnicohorte.Text = "";
                                    fecha_inic.Text = "";
                                    fecha_fin.Text = "";
                                    //program.ConsultarUltimaCohorte(CodigoCohorte);
                                    program.CargarProgramaDropdownlist(Programas);
                                    program.CargarUsuarioDropdownlist(Integrantes);
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "modificacion();", true);
                                    Button1.CssClass = "btn btn-default";
                                    Button1.Enabled = true;
                                    Button2.CssClass = "btn btn-default";
                                    Button2.Enabled = false;
                                    Button3.CssClass = "btn btn-default";
                                    Button3.Enabled = false;
                                    string scriptfecha = @"<script type='text/javascript'>
                                    $('#fecha_inic').attr('data-field','datetime');
                                    </script>";

                                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptfecha, false);
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensajem", "modificacion();", true);
                                    dnicohorte.Text = "";
                                    fecha_inic.Text = "";
                                    fecha_fin.Text = "";
                                    //program.ConsultarUltimaCohorte(CodigoCohorte);
                                    program.CargarProgramaDropdownlist(Programas);
                                    program.CargarUsuarioDropdownlist(Integrantes);
                                    Button1.CssClass = "btn btn-default";
                                    Button1.Enabled = true;
                                    Button2.CssClass = "btn btn-default";
                                    Button2.Enabled = false;
                                    Button3.CssClass = "btn btn-default";
                                    Button3.Enabled = false;
                                    string scriptfecha = @"<script type='text/javascript'>
                                    $('#fecha_inic').attr('data-field','datetime');
                                    </script>";

                                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", scriptfecha, false);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensajemod", "modificacion();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "inconsist", "problema();", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "ya", "yaexistedni();", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "malo", "campos();", true);
            }
            GVCohortes.EditIndex = -1;
            program.CargarCohortesGV(GVCohortes);
            program.CargarIntegrantesCohorteGV(GVIntegrantes);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DTOPrograma infor = new DTOPrograma();
            CADPrograma program = new CADPrograma();
            int dni = 0;
            try
            {
                int dni_cohor = int.Parse(busqueda.Text);
                infor.Dni_cohorte = busqueda.Text;
                dni = program.ConsultarCohortePorDNI(infor);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }

                if (dni > 0)
                {
                    program.ConsultarCohorteDNIyCargarloGV(infor,GVCohortes);
                }else
                {
                    program.CargarCohortesGV(GVCohortes);
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "noexistencia", "noregistrado();", true);
                }
            busqueda.Text = "";
            program.CargarIntegrantesCohorteGV(GVIntegrantes);
            tipogv.SelectedIndex = tipogv.Items.IndexOf(tipogv.Items.FindByText("Cohortes"));
        }
    }
}