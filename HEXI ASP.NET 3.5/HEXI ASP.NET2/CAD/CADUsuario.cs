using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Web.Security;

namespace CAD
{
    public class CADUsuario
    {
        string cad = ConfigurationManager.ConnectionStrings["ConSQL"].ConnectionString;
        SqlConnection cnx;
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlDataReader dr;
        DataTable dt;
        int confirmacion;

        public CADUsuario()
        {
            cnx = new SqlConnection(cad);
        }


        //------------------INGRESO AL SISTEMA--------------------------------------------------
        //Clase para ingresar al sistema
        public int IngresoAlSistema(DTOUsuario user)
        {        
            cnx.Open();
            string password, rol, estado;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_ingresar_al_sistema";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@correo", user.Correo);
            cmd.Parameters.AddWithValue("@rol", user.Nombre_rol);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                password = dr["contraseña_usuario"].ToString();
                estado = dr["estado_usuario"].ToString();
                estado = estado.ToLower();        

                if (user.Contraseña == password && estado == "habilitado") { confirmacion = 1; }
                if (user.Contraseña == password && estado == "deshabilitado") { confirmacion = 2; }
                if (user.Contraseña != password && estado == "habilitado") { confirmacion = 3; }
                if (user.Contraseña != password && estado == "deshabilitado") { confirmacion = 2; }

            }
            else
            {
                confirmacion = 10;
            }           
            dr.Close();
            cnx.Close();
            return confirmacion;
        }

        //Clase para obtener el ID del usuario que ingresa al sistema para poder realizar reportes y modificaciones de perfil
        public string ObtenerIDUsuarioAlIngresarAlSistema(DTOUsuario user)
        {
            cnx.Open();
            string id = "";
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_obtener_id_usurio_con_correo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@correo", user.Correo);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = dr["id_usuario"].ToString();
            }
            cnx.Close();
            return id;
        }

        //----------------------------USUARIOS-------------------------------------------------
        //Clase para cargar los usuarios al gridview
        public void CargarUsuarios(GridView usuarios)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_dgv";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            usuarios.DataSource = dt;
            usuarios.DataBind();
            if (usuarios.Rows.Count > 0)
            {
                usuarios.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();

        }
        //Clase para generar el id de registro de usuarios de forma automatica
        public void ConsultarUltimoIdUsuario(TextBox id)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_ultimo_idusuario";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string codig = dr["id_mayor"].ToString();
                if (codig == null || codig == "")
                {
                    id.Text = Convert.ToString(1);
                }
                else
                {
                    int id_u = ((Convert.ToInt32(dr["id_mayor"].ToString())) + 1);
                    id.Text = id_u.ToString();
                }
            }
            dr.Close();
            cnx.Close();
        }

        //Clase para registrar un usuario
        public int InsertarUsuario(DTOUsuario user)
        {
            int contador = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
               
                cmd.Parameters.AddWithValue("@dni", user.Dni);
                cmd.Parameters.AddWithValue("@nomb", user.Nombre);
                cmd.Parameters.AddWithValue("@apell", user.Apellidos);
                cmd.Parameters.AddWithValue("@correo", user.Correo);
                cmd.Parameters.AddWithValue("@contrase", user.Contraseña);
                cmd.Parameters.AddWithValue("@tel", user.Tel);
                cmd.Parameters.AddWithValue("@estado", user.Estado);
                cmd.Parameters.AddWithValue("@foto", user.Foto);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                contador = 1;
            }
            cnx.Close();
            return contador;
        }

        //Clase para registrar el rol asignado a un registro
        public int AsignarRolUsuario(DTOUsuario user)
        {
            int contador = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_asignar_rol_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_usuario", user.Id);
                cmd.Parameters.AddWithValue("@id_rol", user.Id_rol);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                contador = 1;
            }
            cnx.Close();
            return contador;
        }

        //Clase para consultar que un usuario no esté registrado con un ID determinado
        public int ConsultarUsuarioPorId(DTOUsuario user)
        {
            int contador = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", user.Id);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                contador++;
            }
            dr.Close();
            cnx.Close();
            return contador;
        }

        //Clase para consultar que un usuario no esté registrado con un DNI determinado
        public int ConsultarUsuarioPorDni(DTOUsuario user)
        {
            cnx.Open();
            int contador = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_dni";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni", user.Dni);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                contador++;
            }
            dr.Close();
            cnx.Close();
            return contador;
        }

        //Clase para consultar que un usuario no esté registrado por un correo determinado
        public int ConsultarUsuarioPorCorreo(DTOUsuario user)
        {
            int contador = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_correo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@correo", user.Correo);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                contador++;
            }
            dr.Close();
            cnx.Close();
            return contador;
        }

        //Clase para consultar el id de un rol por su nombre
       public int ConsultarIdRol(DTOUsuario user)
        {
            int idrol = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_rol";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rol", user.Nombre_rol);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                idrol = Convert.ToInt32(dr["id_rol"].ToString());
            }
            dr.Close();
            cnx.Close();
            return idrol;
        }

        //Clase para obtener los datos de un registro y cargarlos para modificarlos
        public int CompletarRegistroParaModificarUsuario(DTOUsuario user,TextBox dni, TextBox nombre, TextBox apellidos, TextBox correo, TextBox contraseña, TextBox confirmaccontrase, TextBox tel)
        {
            int confir = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_usuario_para_modificar";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", user.Id);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dni.Text = dr["dni_usuario"].ToString();
                    nombre.Text = dr["nombre_usuario"].ToString();
                    apellidos.Text = dr["apellido_usuario"].ToString();
                    //rol.SelectedIndex = rol.Items.IndexOf(rol.Items.FindByText(dr["nombre_rol"].ToString()));
                    correo.Text = dr["email_usuario"].ToString();
                    contraseña.Text = dr["contraseña_usuario"].ToString();
                    confirmaccontrase.Text = dr["contraseña_usuario"].ToString();
                    tel.Text = dr["tel_usuario"].ToString();

                }
                dr.Close();
            }
            catch
            {
                confir = 1;
            }
            cnx.Close();
            return confir;
        }

        public int CompletarRolesRegistroUserParaModificar(DTOUsuario user,CheckBoxList rol)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_roles_user";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_user",user.Id);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    foreach (ListItem e in rol.Items)
                    {
                        if ((dr["id_rol"].ToString())==e.Value.ToString())
                        {
                            e.Selected = true;
                        }
                    }
                }
                dr.Close();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para obtener el DNI de un usuario por el ID
       public string ConsultarDNIPorId(DTOUsuario user)
        {
            string dni = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", user.Id);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dni = (dr["dni_usuario"].ToString());
            }
            dr.Close();
            cnx.Close();
            return dni;
        }

        //Clase para consultar el CORREO de un usuario por ID
        public string ConsultarCorreoPorId(DTOUsuario user)
        {
            cnx.Open();
            string correo = "";
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", user.Id);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                correo = dr["email_usuario"].ToString();
            }
            dr.Close();
            cnx.Close();
            return correo;
        }
        //Método para buscar si un rol ya lo tiene un usuario
        public int BuscarSiRolEstaAsignado(DTOUsuario user)
        {
            int resul = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_rol_asignado";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user_p",user.Id);
            cmd.Parameters.AddWithValue("@id_rol_p", user.Id_rol);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                resul++;
            }
            dr.Close();
            cnx.Close();
            return resul;
        }

        //Método para eliminar un rol asignado a un user
        public int EliminarRolAsignado(DTOUsuario user)
        {
            int resul = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_eliminar_rol_asignado";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_user_plaf", user.Id);
                cmd.Parameters.AddWithValue("@id_rol_plaf", user.Id_rol);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                resul = 1;
            }
            cnx.Close();
            return resul;
        }

        //Clase para actualizar la información de un usuario
        public int ActualizarUsuario(DTOUsuario user)
        {

            int confirm = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", user.Id);
                cmd.Parameters.AddWithValue("@dni", user.Dni);
                cmd.Parameters.AddWithValue("@nomb", user.Nombre);
                cmd.Parameters.AddWithValue("@apell", user.Apellidos);
                cmd.Parameters.AddWithValue("@correo", user.Correo);
                cmd.Parameters.AddWithValue("@contrase", user.Contraseña);
                cmd.Parameters.AddWithValue("@tel", user.Tel);
                //cmd.Parameters.AddWithValue("@estado", user.Estado);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                confirm = 1;
            }
            cnx.Close();
            return confirm;
        }

        //Clase para obtener el ROL de un usuario por ID
        public int ObtenerIdRolUsuarioParaModificar(DTOUsuario user)
        {
            int id = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_idrol_usuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user", user.Id);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = Convert.ToInt32(dr["id_rol"].ToString());
            }
            dr.Close();
            cnx.Close();
            return id;
        }

        //Clase para Actualizar el Rol de un usuario
        public int Modificar_Rol_Usuario(DTOUsuario user)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_actualizar_rol_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_usuario", user.Id);
                cmd.Parameters.AddWithValue("@id_rol_viejo", user.Id_rol_viejo);
                cmd.Parameters.AddWithValue("@id_rol_nuevo", user.Id_rol);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para deshabilitar el acceso al sistema a un usuario
        public int DardeBaja(DTOUsuario user)
        {

            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_Dar_de_baja";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", user.Id);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para habilitar el acceso al sistema a un usuario
        public int DardeAlta(DTOUsuario user)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_Dar_de_alta";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", user.Id);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para cargar los roles en el Dropdownlist
        public void LlenarRol(DropDownList rol)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_roles";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            rol.DataSource = dt;
            rol.DataTextField = "nombre_rol";
            rol.DataValueField = "id_rol";
            rol.DataBind();
            cnx.Close();
        }

        //Generar checkbox de los roles de usuario
        public void GenerarCheckBoxRol(CheckBoxList rol)
        {
           // rol = new CheckBoxList();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_roles";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if ((dr["nombre_rol"].ToString()) != "Seleccione el rol")
                {
                    rol.Items.Add(new ListItem(dr["nombre_rol"].ToString(), dr["id_rol"].ToString()));
                }
            }
            dr.Close();
            cnx.Close();
        }

        //Clase para consultar un usuario por DNI y cargarlo al Gridview
        public void ConsultarUsuarioGV(GridView usuariodni, DTOUsuario user)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_dni_dgv";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni", user.Dni);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            usuariodni.DataSource = dt;
            usuariodni.DataBind();
            if (usuariodni.Rows.Count > 0)
            {
                usuariodni.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        //Clase para completar el perfil de usuario
        public void CargarPerfil(DTOUsuario user, TextBox nombres, TextBox apellidos, TextBox correo, Label Nombre_completo, Label NombreRolUsuario,Image foto)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_info_perfil_usuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user", user.Id);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nombres.Text = dr["nombre_usuario"].ToString();
                apellidos.Text = dr["apellido_usuario"].ToString();
                correo.Text = dr["email_usuario"].ToString();
                Nombre_completo.Text = dr["nombre_completo"].ToString();
                NombreRolUsuario.Text = dr["nombre_rol"].ToString();
                foto.ImageUrl = dr["foto_usuario"].ToString();
            }
            dr.Close();
            cnx.Close();
        }

        //Clase para modificar el perfil de usuario
        public int ModificarPefilUsuario(DTOUsuario user)
        {
            cnx.Open();
            int estado = 0;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_perfil_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_user", user.Id);
                cmd.Parameters.AddWithValue("@contraseña", user.Contraseña);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            return estado;
        }

        //Clase para modificar el perfil de usuario
        public int ModificarFotoPerfilUsuario(DTOUsuario user)
        {
            cnx.Open();
            int estado = 0;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_foto_perfil_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_user", user.Id);
                cmd.Parameters.AddWithValue("@fotop", user.Foto);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            return estado;
        }

        // -----------------------------------CORREO--------------------------------------------

        //Clase para enviar email con correo y contraseña para ingresar al sistema
        public bool EnviarCorreoRegistro(DTOUsuario user)
        {
            try
            {
                //Configuración del Mensaje
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.live.com");
                //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                mail.From = new MailAddress("familiafiber@outlook.com", "FIBER©", Encoding.UTF8);
                //Aquí ponemos el asunto del correo
                mail.Subject = "¡Felicidades! Ahora forma parte de la familia FIBER";
                //Aquí ponemos el mensaje que incluirá el correo
                mail.IsBodyHtml = true;
                mail.Body = "Hola " + user.Nombre + "!" + "<br/>" + "<br/>" + "Te damos las bienvenida a la familia FIBER." + "<br/>" + "<br/>" + "Los datos para ingresar al sistema de información son:" + "<br/>" + "Correo: " + user.Correo + "<br/>" + "Contraseña: " + user.Contraseña + "<br/>" + "<br/>" + "Recuerda darle un buen uso a ésta aplicación Web." + "<br/>" + "<br/>" + "<b>" + "​Fiber© Producto HEXI" + "</b>" + "<br/>" + "<br/>" + "<br/>" + "<b>" + "​AVISO LEGAL:" + "</b>" + "Este correo electrónico incluyendo sus anexos, contiene información confidencial de Fiber©, si usted no es el destinatario intencional, se le informa que cualquier uso, difusión, distribución o copiado de esta comunicación está terminantemente prohibido, hacerlo podría tener consecuencias legales como las contenidas en la Ley 1273 de 2009, Ley 1581 de 2012 y todas las que le apliquen. Si ha recibido este correo por error, por favor bórrelo. Si usted es el destinatario, le solicitamos mantener reserva sobre el contenido, los datos o información de contacto del remitente y en general sobre la información de este documento y/o archivos adjuntos, a no ser que exista una autorización explícita. Este mensaje y sus anexos han sido revisados con software antivirus, para evitar que contenga código malicioso que pueda afectar sistemas de cómputo, sin embargo es responsabilidad del destinatario confirmar este hecho en el momento de su recepción.";
                //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                mail.To.Add(user.Correo);
                //Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran
                //mail.Attachments.Add(new Attachment(@"C:\Documentos\carta.docx"));

                //Configuracion del SMTP
                SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                //Especificamos las credenciales con las que enviaremos el mail
                SmtpServer.Credentials = new System.Net.NetworkCredential("familiafiber@outlook.com", "FiberByHEXISENA");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                return true;
            }
            catch
            {
                return false;
            }
        }

        //Clase para enviar email con información requerida en CONTACTO Página Principal
        public bool EnviarCorreoContacto(DTOUsuario user)
        {
            try
            {
                //Configuración del Mensaje
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.live.com");
                //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                mail.From = new MailAddress("familiafiber@outlook.com", "HEXI©", Encoding.UTF8);
                //Aquí ponemos el asunto del correo
                mail.Subject = "Solicitud Cliente HEXI";
                //Aquí ponemos el mensaje que incluirá el correo
                mail.IsBodyHtml = true;
                mail.Body = "<b>" + "Datos solicitante:" + "</b>" + "<br/>" + "<br/>" + "<b>" + "Nombre :" + "</b>" + "<br/>" + user.Nombre_contacto + "<br/>" + "<b>" + "Correo Electrónico: " + "</b>" + "<br/>" + user.Correo_contacto + "<br/>" + "<br/>" + "<b>" + "Mensaje:" + "</b>" + "<br/>" + user.Mensaje_contacto + "<br/>" + "<br/>" + "<b>" + "Contacto HEXI©" + "</b>";
                //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                mail.To.Add("hexi@outlook.es");
                //Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran
                //mail.Attachments.Add(new Attachment(@"C:\Documentos\carta.docx"));

                //Configuracion del SMTP
                SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                //Especificamos las credenciales con las que enviaremos el mail
                SmtpServer.Credentials = new System.Net.NetworkCredential("familiafiber@outlook.com", "FiberByHEXISENA");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool EnviarCorreoConfirmaciónEnvíoMensajeContacto(DTOUsuario user)
        {
            try
            {
                //Configuración del Mensaje
                MailMessage mail = new MailMessage();              
                //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                mail.From = new MailAddress("hexi@outlook.es", "HEXI©", Encoding.UTF8);
                //Aquí ponemos el asunto del correo
                mail.Subject = "Confirmación HEXI©";
                //Aquí ponemos el mensaje que incluirá el correo
                mail.IsBodyHtml = true;
                mail.Body = "Hola " + user.Nombre_contacto + "!" + "<br/>" + "<br/>" + "Muchas gracias por contactarnos, hemos recibido tu solicitud. A partir de éste momento comenzaremos a tramitarla para poder brindarte una respuesta en el menor tiempo posible." + "<br/>" + "<br/>" + "Cordialmente," + "<br/>" + "<b>" + "SERVICIO AL CLIENTE." + "<br/>" + "HEXI©" + "</b>" + "<br/>" + "<br/>" + "<br/>" + "<b>" + "​AVISO LEGAL:" + "</b>" + "Este correo electrónico incluyendo sus anexos, contiene información confidencial de HEXI©, si usted no es el destinatario intencional, se le informa que cualquier uso, difusión, distribución o copiado de esta comunicación está terminantemente prohibido, hacerlo podría tener consecuencias legales como las contenidas en la Ley 1273 de 2009, Ley 1581 de 2012 y todas las que le apliquen. Si ha recibido este correo por error, por favor bórrelo. Si usted es el destinatario, le solicitamos mantener reserva sobre el contenido, los datos o información de contacto del remitente y en general sobre la información de este documento y/o archivos adjuntos, a no ser que exista una autorización explícita. Este mensaje y sus anexos han sido revisados con software antivirus, para evitar que contenga código malicioso que pueda afectar sistemas de cómputo, sin embargo es responsabilidad del destinatario confirmar este hecho en el momento de su recepción.";
                //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                mail.To.Add(user.Correo_contacto);
                //Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran
                //mail.Attachments.Add(new Attachment(@"C:\Documentos\carta.docx"));

                //Configuracion del SMTP
                SmtpClient SmtpServer = new SmtpClient();
                SmtpServer.Host = "smtp.live.com";
                SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                //Especificamos las credenciales con las que enviaremos el mail
                SmtpServer.Credentials = new System.Net.NetworkCredential("familiafiber@outlook.com", "FiberByHEXISENA");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                return true;
            }
            catch
            {
                return false;
            }
        }


        //Clase para enviar email con correo y contraseña para ingresar al sistema
        public bool EnviarCorreoRestablecimientoContraseña(DTOUsuario user)
        {
            cnx.Open();
            try
            {
                // Generate a nueva contraseña de 12 caracteres con 3 caracteres numéricos.
                user.Contraseña = Membership.GeneratePassword(12, 3);
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_nueva_contraseña_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@correo_user", user.Correo);
                cmd.Parameters.AddWithValue("@nuevapass", user.Contraseña);
                cmd.ExecuteNonQuery();
                //Configuración del Mensaje
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.live.com");
                //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                mail.From = new MailAddress("familiafiber@outlook.com", "FIBER©", Encoding.UTF8);
                //Aquí ponemos el asunto del correo
                mail.Subject = "¡Proceso exitoso! Se ha restablecido su contraseña en Fiber";
                //Aquí ponemos el mensaje que incluirá el correo
                mail.IsBodyHtml = true;
                mail.Body = "Hola!" + "<br/>" + "<br/>" + "Al parecer olvidó su contraseña, por ende, hemos generado una nueva. A continuación le remitimos sus datos de acceso al sistema de información Fiber." + "<br/>" + "<br/>"+ "Correo: "+ user.Correo + "<br/>"+ "Contraseña: "+ user.Contraseña + "<br/>" + "<br/>" + "Recuerda darle un buen uso a ésta aplicación Web." + "<br/>" + "<br/>" + "<b>" + "​Fiber© Producto HEXI" + "</b>" + "<br/>" + "<br/>" + "<br/>" + "<b>" + "​AVISO LEGAL:" + "</b>" + "Este correo electrónico incluyendo sus anexos, contiene información confidencial de Fiber©, si usted no es el destinatario intencional, se le informa que cualquier uso, difusión, distribución o copiado de esta comunicación está terminantemente prohibido, hacerlo podría tener consecuencias legales como las contenidas en la Ley 1273 de 2009, Ley 1581 de 2012 y todas las que le apliquen. Si ha recibido este correo por error, por favor bórrelo. Si usted es el destinatario, le solicitamos mantener reserva sobre el contenido, los datos o información de contacto del remitente y en general sobre la información de este documento y/o archivos adjuntos, a no ser que exista una autorización explícita. Este mensaje y sus anexos han sido revisados con software antivirus, para evitar que contenga código malicioso que pueda afectar sistemas de cómputo, sin embargo es responsabilidad del destinatario confirmar este hecho en el momento de su recepción.";
                //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                mail.To.Add(user.Correo);
                //Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran
                //mail.Attachments.Add(new Attachment(@"C:\Documentos\carta.docx"));

                //Configuracion del SMTP
                SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                //Especificamos las credenciales con las que enviaremos el mail
                SmtpServer.Credentials = new System.Net.NetworkCredential("familiafiber@outlook.com", "FiberByHEXISENA");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                return true;
            }
            catch
            {
                return false;
            }
        }


        //--------------------------------REPORTE PROBLEMAS---------------------------->

        //Clase para consultar el ID del ultimo registro de reportes de problemas e incrementarlo para un nuevo registro
        public int ConsultarUltimoIDReporteProblemaEIncrementarlo()
        {
            int id_reporte_problema = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_ultimoregisto_problemas";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string id = dr["id_reporte_problema_mayor"].ToString();

                if (id == null || id == "")
                {
                    id_reporte_problema = 1;
                }
                else
                {
                    id_reporte_problema = (Convert.ToInt32(dr["id_reporte_problema_mayor"].ToString())) + 1;
                }
            }
            dr.Close();
            cnx.Close();
            return id_reporte_problema;
        }

        //Clase para consultar la existencia de un reporte de probñema por un ID determinado
        public int ConsultarReporteProblemaPorID(DTOUsuario user)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_reporte_problema_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_report_prob", user.Id);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        //Clase para cargar los reportes de un usuario al GV
        public void CargarReportesDeUsuarioAlGV(DTOUsuario user, GridView reportes)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_reportes_problemas_de_un_usuario_al_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user", user.Id);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            reportes.DataSource = dt;
            reportes.DataBind();
            if (reportes.Rows.Count > 0)
            {
                reportes.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        //Clase para registrar un registro de un problema
        public int InsertarReporteProblema(DTOUsuario user)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_reporte_problema";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nomb_pro", user.Nomb_report);
                cmd.Parameters.AddWithValue("@descrip_pro", user.Descript_report);
                cmd.Parameters.AddWithValue("@fecha_reg", user.Fecha_report);
                cmd.Parameters.AddWithValue("@estado_repor", user.Estado_report);
                cmd.Parameters.AddWithValue("@id_user", user.Id);
                cmd.ExecuteNonQuery();

            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public List<string> estadisticasUsers()
        {
            List<string> estadist = new List<string>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_estadistica_users";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                estadist.Add(dr["users"].ToString());
                estadist.Add(dr["habilit"].ToString());
            }
            dr.Close();
            cnx.Close();
            return estadist;
        }

        public void InsertarHistorial(DTOUsuario history)
        {
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_history";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user", history.Id_u_logueado);
                cmd.Parameters.AddWithValue("@description",history.Descripcion_history);
                cmd.ExecuteNonQuery();
            }
            catch
            {

            }
            cnx.Close();
        }

        public void CargarHistorialDeUsuario(DTOUsuario user, BulletedList historial)
        {
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_cargar_history";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idus", user.Id_u_logueado);
                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                historial.DataTextField = "history";
                historial.DataSource = dt;
                historial.DataBind();
            
            }
            catch
            {

            }
            cnx.Close();
        }
    }
}
