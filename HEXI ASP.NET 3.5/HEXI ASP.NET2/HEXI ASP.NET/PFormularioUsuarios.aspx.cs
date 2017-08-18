using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DTO;
using CAD;

namespace HEXI_ASP.NET
{
    public partial class PFormularioUsurios : System.Web.UI.Page
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
                        CADUsuario procesos = new CADUsuario();
                        procesos.CargarUsuarios(GVUsuarios);
                        procesos.GenerarCheckBoxRol(rolesuser);
                        //procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
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
                Response.Redirect("PFormularioUsuarios.aspx");
            }
        }

        protected void RowDeletingEvent(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow fila = GVUsuarios.Rows[e.RowIndex];
            int codigo = Convert.ToInt32(GVUsuarios.DataKeys[e.RowIndex].Values[0]);
            string estado = (fila.FindControl("ESTADO_USER") as Label).Text.ToLower();
            string useridentific = (fila.FindControl("DNI_USER") as Label).Text;
            DTOUsuario user = new DTOUsuario();
            user.Id = codigo;
            user.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
            CADUsuario procesos = new CADUsuario();
            if (estado == "habilitado")
            {
                if (procesos.DardeBaja(user) == 0)
                {
                    user.Descripcion_history = "Deshabilitación usuario: "+useridentific;
                    procesos.InsertarHistorial(user);
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "baja", "AccesoDesh();", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "errorbaja", "problema();", true);
                }
            }
            else
            {
                if (estado == "deshabilitado")
                {
                    if (procesos.DardeAlta(user) == 0)
                    {
                        user.Descripcion_history = "Habilitación usuario: " + useridentific;
                        procesos.InsertarHistorial(user);
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alta", "AccesoHab();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "erroralta", "problema();", true);
                    }
                }
            }
            GVUsuarios.EditIndex = -1;
            procesos.CargarUsuarios(GVUsuarios);
        }

        protected void RowEditingEvent(object sender, GridViewEditEventArgs e)
        {
            int codigo = Convert.ToInt32(GVUsuarios.DataKeys[e.NewEditIndex].Values[0]);
            DTOUsuario user = new DTOUsuario();
            user.Id = codigo;
            ViewState["id_user"] = codigo;
            CADUsuario procesos = new CADUsuario();
            rolesuser.ClearSelection();
            if (procesos.CompletarRegistroParaModificarUsuario(user, identificacion, nombres, apellidos, email, password, confirmpassword, telefono) == 0)
            {
                if (procesos.CompletarRolesRegistroUserParaModificar(user, rolesuser) == 0)
                {
                    Button1.CssClass = "btn btn-default";
                    Button1.Enabled = false;
                    //FileUpload1.Enabled = false;
                    Button2.CssClass = "btn btn-default";
                    Button2.Enabled = true;
                    Button3.CssClass = "btn btn-default";
                    Button3.Enabled = true;
                }
                else
                {
                    identificacion.Text = "";
                    nombres.Text = "";
                    apellidos.Text = "";
                    email.Text = "";
                    password.Text = "";
                    confirmpassword.Text = "";
                    telefono.Text = "";
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
            }
            GVUsuarios.EditIndex = -1;
            procesos.CargarUsuarios(GVUsuarios);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int confirmacion = 0;
            int rol = 0;
            DTOUsuario user = new DTOUsuario();
            CADUsuario procesos = new CADUsuario();
            try
            {
                //int dni = int.Parse(identificacion.Text);
                //int tel = int.Parse(telefono.Text);
                //rol = int.Parse(roles.SelectedValue);
                int count = 0;
                foreach (ListItem rolselect in rolesuser.Items)
                {
                    if (rolselect.Selected)
                    {
                        count++;
                    }
                }
                if (count > 0)
                {
                    confirmacion = 2;
                }
            }
            catch
            {
                confirmacion = 0;
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (nombres.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (apellidos.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (email.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (password.Text != "" && password.Text == confirmpassword.Text)
            {
                confirmacion = confirmacion + 1;
            }
            /*if (FileUpload1.FileName.ToString() == "")
            {
                picture1.Text = "photoperfilpodefecto.jpg";
            }
            else
            {
                picture1.Text = FileUpload1.FileName.ToString();
            }*/
            if (confirmacion == 6)
            {
                //user.Id = Convert.ToInt32(CodigoUsuario.Text);
                user.Dni = identificacion.Text;
                user.Nombre = nombres.Text;
                user.Apellidos = apellidos.Text;
                user.Correo = email.Text;
                user.Contraseña = password.Text;
                user.Tel = telefono.Text;
                user.Estado = "Habilitado";
                //user.Foto = ("Fotos/" + picture1.Text);
                user.Foto = "Fotos/photoperfilpodefecto.jpg";
                if (procesos.ConsultarUsuarioPorDni(user) == 0)
                {
                    if (procesos.ConsultarUsuarioPorCorreo(user) == 0)
                    {
                        if (procesos.InsertarUsuario(user) == 0)
                        {
                            string id = procesos.ObtenerIDUsuarioAlIngresarAlSistema(user);
                            user.Id = int.Parse(id);
                            /*if (picture1.Text != "photoperfilpodefecto.jpg")
                            {
                                FileUpload1.SaveAs(Server.MapPath("Fotos\\" + FileUpload1.FileName));
                            }*/
                            foreach (ListItem rolselected in rolesuser.Items)
                            {
                                if (rolselected.Selected)
                                {
                                    user.Id_rol = int.Parse(rolselected.Value);
                                    if (procesos.AsignarRolUsuario(user) == 0)
                                    {
                                        rol++;
                                    }
                                }
                            }
                            if (rol != 0)
                            {
                                procesos.EnviarCorreoRegistro(user);
                                user.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                                user.Descripcion_history = "Registro usuario: " + identificacion.Text;
                                procesos.InsertarHistorial(user);
                                identificacion.Text = "";
                                nombres.Text = "";
                                apellidos.Text = "";
                                email.Text = "";
                                password.Text = "";
                                confirmpassword.Text = "";
                                telefono.Text = "";
                                Estadou.SelectedIndex = 0;
                                //picture1.Text = "";
                                //procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
                                rolesuser.ClearSelection();
                                procesos.CargarUsuarios(GVUsuarios);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "mensaje", "registro();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "problema();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "registrado", "yaexistecorreo();", true);
                        identificacion.Text = "";
                        nombres.Text = "";
                        apellidos.Text = "";
                        email.Text = "";
                        password.Text = "";
                        confirmpassword.Text = "";
                        telefono.Text = "";
                        Estadou.SelectedIndex = 0;
                        //picture1.Text = "";
                        rolesuser.ClearSelection();
                        // procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "ya", "yaexistedni();", true);
                    identificacion.Text = "";
                    nombres.Text = "";
                    apellidos.Text = "";
                    email.Text = "";
                    password.Text = "";
                    confirmpassword.Text = "";
                    telefono.Text = "";
                    Estadou.SelectedIndex = 0;
                    //picture1.Text = "";
                    rolesuser.ClearSelection();
                    // procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermite", "campos();", true);
            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DTOUsuario user = new DTOUsuario();
            CADUsuario procesos = new CADUsuario();
            int dni = 0;
            try
            {
                // int ident = int.Parse(busqueda.Text);
                user.Dni = busqueda.Text;
                dni = procesos.ConsultarUsuarioPorDni(user);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (dni > 0)
            {
                procesos.ConsultarUsuarioGV(GVUsuarios, user);
            }
            else
            {
                procesos.CargarUsuarios(GVUsuarios);
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "noexiste", "noregistrado();", true);
            }
            busqueda.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            identificacion.Text = "";
            nombres.Text = "";
            apellidos.Text = "";
            email.Text = "";
            password.Text = "";
            confirmpassword.Text = "";
            telefono.Text = "";
            Estadou.SelectedIndex = 0;
            //picture1.Text = "";
            Button1.CssClass = "btn btn-default";
            Button1.Enabled = true;
            Button2.CssClass = "btn btn-default";
            Button2.Enabled = false;
            //FileUpload1.Enabled = true;
            Button3.CssClass = "btn btn-default";
            Button3.Enabled = false;
            CADUsuario procesos = new CADUsuario();
            GVUsuarios.EditIndex = -1;
            procesos.CargarUsuarios(GVUsuarios);
            rolesuser.ClearSelection();
            // procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int confirmacion = 0;
            int doc = 0;
            int correo = 0;
            int proceso_rol = 0;
            // int rol_nuevo = 0;
            DTOUsuario user = new DTOUsuario();
            CADUsuario procesos = new CADUsuario();
            try
            {
                //int dni = int.Parse(identificacion.Text);
                //int tel = int.Parse(telefono.Text);
                //rol_nuevo = int.Parse(roles.SelectedValue);
                user.Id = int.Parse(ViewState["id_user"].ToString());
                // rol_viejo = (procesos.ObtenerIdRolUsuarioParaModificar(user));
                confirmacion = 2;
            }
            catch
            {
                confirmacion = 0;
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nopermitecamp", "campos();", true);
            }
            if (nombres.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (apellidos.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (email.Text != "")
            {
                confirmacion = confirmacion + 1;
            }
            if (password.Text != "" && password.Text == confirmpassword.Text)
            {
                confirmacion = confirmacion + 1;
            }
            if (confirmacion == 6)
            {
                user.Dni = identificacion.Text;
                user.Nombre = nombres.Text;
                user.Apellidos = apellidos.Text;
                user.Correo = email.Text;
                user.Contraseña = password.Text;
                user.Tel = telefono.Text;
                user.Id_u_logueado = int.Parse(Convert.ToString(Session["id_usuario"]));
                user.Descripcion_history = "Actualización usuario: " + identificacion.Text;

                if (procesos.ConsultarDNIPorId(user) != (identificacion.Text))
                {
                    doc = 1;
                }
                if (procesos.ConsultarCorreoPorId(user) != email.Text)
                {
                    correo = 1;
                }
                if (correo == 1 && doc == 1)
                {
                    if (procesos.ConsultarUsuarioPorDni(user) == 0)
                    {
                        if (procesos.ConsultarUsuarioPorCorreo(user) == 0)
                        {
                            if (procesos.ActualizarUsuario(user) == 0)
                            {
                                foreach (ListItem rolselected in rolesuser.Items)
                                {
                                    user.Id_rol = int.Parse(rolselected.Value);
                                    if (rolselected.Selected)
                                    {
                                        if (procesos.BuscarSiRolEstaAsignado(user) == 0)
                                        {
                                            if (procesos.AsignarRolUsuario(user) == 0)
                                            {
                                                proceso_rol++;
                                            }
                                        }
                                        else
                                        {
                                            proceso_rol++;
                                        }
                                    }
                                    else
                                    {
                                        if (procesos.BuscarSiRolEstaAsignado(user) > 0)
                                        {
                                            if (procesos.EliminarRolAsignado(user) == 0)
                                            {
                                                proceso_rol++;
                                            }
                                        }
                                    }
                                }
                                if (proceso_rol > 0)
                                {
                                    procesos.InsertarHistorial(user);
                                    identificacion.Text = "";
                                    nombres.Text = "";
                                    apellidos.Text = "";
                                    email.Text = "";
                                    password.Text = "";
                                    confirmpassword.Text = "";
                                    telefono.Text = "";
                                    //Estadou.SelectedIndex = 0;
                                    //picture1.Text = "";
                                    Button1.CssClass = "btn btn-default";
                                    Button1.Enabled = true;
                                    Button2.CssClass = "btn btn-default";
                                    Button2.Enabled = false;
                                    //FileUpload1.Enabled = true;
                                    Button3.CssClass = "btn btn-default";
                                    Button3.Enabled = false;
                                    rolesuser.ClearSelection();
                                    // procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "modif", "modificacion();", true);
                                }
                                else
                                {
                                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "unerror", "Problema();", true);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "errores", "Problema();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "email", "yaexistecorreo();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "dni", "yaexistedni();", true);
                    }
                }

                if (correo == 1 && doc == 0)
                {
                    if (procesos.ConsultarUsuarioPorCorreo(user) == 0)
                    {
                        if (procesos.ActualizarUsuario(user) == 0)
                        {
                            foreach (ListItem rolselected in rolesuser.Items)
                            {
                                user.Id_rol = int.Parse(rolselected.Value);
                                if (rolselected.Selected)
                                {
                                    if (procesos.BuscarSiRolEstaAsignado(user) == 0)
                                    {
                                        if (procesos.AsignarRolUsuario(user) == 0)
                                        {
                                            proceso_rol++;
                                        }
                                    }
                                    else
                                    {
                                        proceso_rol++;
                                    }
                                }
                                else
                                {
                                    if (procesos.BuscarSiRolEstaAsignado(user) > 0)
                                    {
                                        if (procesos.EliminarRolAsignado(user) == 0)
                                        {
                                            proceso_rol++;
                                        }
                                    }
                                }
                            }
                            if (proceso_rol > 0)
                            {
                                procesos.InsertarHistorial(user);
                                identificacion.Text = "";
                                nombres.Text = "";
                                apellidos.Text = "";
                                email.Text = "";
                                password.Text = "";
                                confirmpassword.Text = "";
                                telefono.Text = "";
                                //Estadou.SelectedIndex = 0;
                                //picture1.Text = "";
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                //FileUpload1.Enabled = true;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                rolesuser.ClearSelection();
                                //procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "modif", "modificacion();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "unerror", "Problema();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "Problema();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "email", "yaexistecorreo();", true);
                    }
                }
                if (doc == 1 && correo == 0)
                {
                    if (procesos.ConsultarUsuarioPorDni(user) == 0)
                    {
                        if (procesos.ActualizarUsuario(user) == 0)
                        {
                            foreach (ListItem rolselected in rolesuser.Items)
                            {
                                user.Id_rol = int.Parse(rolselected.Value);
                                if (rolselected.Selected)
                                {
                                    if (procesos.BuscarSiRolEstaAsignado(user) == 0)
                                    {
                                        if (procesos.AsignarRolUsuario(user) == 0)
                                        {
                                            proceso_rol++;
                                        }
                                    }
                                    else
                                    {
                                        proceso_rol++;
                                    }
                                }
                                else
                                {
                                    if (procesos.BuscarSiRolEstaAsignado(user) > 0)
                                    {
                                        if (procesos.EliminarRolAsignado(user) == 0)
                                        {
                                            proceso_rol++;
                                        }
                                    }
                                }
                            }
                            if (proceso_rol > 0)
                            {
                                procesos.InsertarHistorial(user);
                                identificacion.Text = "";
                                nombres.Text = "";
                                apellidos.Text = "";
                                email.Text = "";
                                password.Text = "";
                                confirmpassword.Text = "";
                                telefono.Text = "";
                                //Estadou.SelectedIndex = 0;
                                //picture1.Text = "";
                                Button1.CssClass = "btn btn-default";
                                Button1.Enabled = true;
                                Button2.CssClass = "btn btn-default";
                                Button2.Enabled = false;
                                //FileUpload1.Enabled = true;
                                Button3.CssClass = "btn btn-default";
                                Button3.Enabled = false;
                                rolesuser.ClearSelection();
                                // procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "modif", "modificacion();", true);
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this, GetType(), "unerror", "Problema();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "Problema();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "dni", "yaexistedni();", true);
                    }
                }

                if (correo == 0 && doc == 0)
                {

                    if (procesos.ActualizarUsuario(user) == 0)
                    {
                        foreach (ListItem rolselected in rolesuser.Items)
                        {
                            user.Id_rol = int.Parse(rolselected.Value);
                            if (rolselected.Selected)
                            {
                                if (procesos.BuscarSiRolEstaAsignado(user) == 0)
                                {
                                    if (procesos.AsignarRolUsuario(user) == 0)
                                    {
                                        proceso_rol++;
                                    }
                                }
                                else
                                {
                                    proceso_rol++;
                                }
                            }
                            else
                            {
                                if (procesos.BuscarSiRolEstaAsignado(user) > 0)
                                {
                                    if (procesos.EliminarRolAsignado(user) == 0)
                                    {
                                        proceso_rol++;
                                    }
                                }
                            }
                        }
                        if (proceso_rol > 0)
                        {
                            procesos.InsertarHistorial(user);
                            identificacion.Text = "";
                            nombres.Text = "";
                            apellidos.Text = "";
                            email.Text = "";
                            password.Text = "";
                            confirmpassword.Text = "";
                            telefono.Text = "";
                            //Estadou.SelectedIndex = 0;
                            // picture1.Text = "";
                            Button1.CssClass = "btn btn-default";
                            Button1.Enabled = true;
                            Button2.CssClass = "btn btn-default";
                            Button2.Enabled = false;
                            //FileUpload1.Enabled = true;
                            Button3.CssClass = "btn btn-default";
                            Button3.Enabled = false;
                            rolesuser.ClearSelection();
                            // procesos.ConsultarUltimoIdUsuario(CodigoUsuario);
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "modif", "modificacion();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, GetType(), "unerror", "Problema();", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, GetType(), "error", "Problema();", true);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "nocamp", "campos();", true);
            }
            GVUsuarios.EditIndex = -1;
            procesos.CargarUsuarios(GVUsuarios);
        }


    }
}