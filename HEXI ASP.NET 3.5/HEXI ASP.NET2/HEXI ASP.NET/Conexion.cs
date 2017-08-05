using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace HEXI_ASP.NET
{
    class Conexion
    {
        SqlConnection cnx;
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlDataReader dr;
        DataTable dt;
        int confirmacion = 0;


        public Conexion()
        {
            cnx = new SqlConnection("Data Source=DESKTOP-34LMFQR\\SQLEXPRESS;Initial Catalog=Fiber;Integrated Security=True");
        }

        //------------------INGRESO AL SISTEMA--------------------------------------------------
        //Clase para ingresar al sistema
        public int IngresoAlSistema(string correo, string contrase)
        {
            cnx.Open();
            string password, rol, estado;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_ingresar_al_sistema";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@correo", correo);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                password = dr["contraseña_usuario"].ToString();
                rol = dr["nombre_rol"].ToString();
                estado = dr["estado_usuario"].ToString();
                estado = estado.ToLower();
                if (contrase == password && rol == "SuperAdministrador" && estado == "habilitado") { confirmacion = 1; }
                if (contrase == password && rol == "SuperAdministrador" && estado == "deshabilitado") { confirmacion = 2; }
                if (contrase != password && rol == "SuperAdministrador" && estado == "habilitado") { confirmacion = 3; }
                if (contrase != password && rol == "SuperAdministrador" && estado == "deshabilitado") { confirmacion = 2; }
                if (contrase == password && rol == "Administrador") { confirmacion = 4; }
                if (contrase == password && rol == "Instructor") { confirmacion = 5; }
                if (contrase == password && rol == "Aprendiz") { confirmacion = 6; }
            }
            dr.Close();
            cnx.Close();
            return confirmacion;
        }

        //Clase para obtener el ID del usuario que ingresa al sistema para poder realizar reportes y modificaciones de perfil
        public string ObtenerIDUsuarioAlIngresarAlSistema(string correo)
        {
            cnx.Open();
            string id = "";
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_obtener_id_usurio_con_correo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@correo",correo);
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
            if (dr.Read()) {
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
        public int InsertarUsuario(int id, int dni, string nombre, string apellidos, string email, string contraseña, int tel, string estado, string imagen)
        {
            int contador = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@dni", dni);
                cmd.Parameters.AddWithValue("@nomb", nombre);
                cmd.Parameters.AddWithValue("@apell", apellidos);
                cmd.Parameters.AddWithValue("@correo", email);
                cmd.Parameters.AddWithValue("@contrase", contraseña);
                cmd.Parameters.AddWithValue("@tel", tel);
                cmd.Parameters.AddWithValue("@estado", estado);
                cmd.Parameters.AddWithValue("@foto", imagen);
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
        public int AsignarRolUsuario(int id_usuario, int id_rol)
        {
            int contador = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_asignar_rol_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_usuario", id_usuario);
                cmd.Parameters.AddWithValue("@id_rol", id_rol);
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
        public int ConsultarUsuarioPorId(int id)
        {
            int contador = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
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
        public int ConsultarUsuarioPorDni(int dni)
        {
            cnx.Open();
            int contador = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_dni";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni", dni);
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
        public int ConsultarUsuarioPorCorreo(string correo)
        {
            int contador = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_correo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@correo", correo);
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
        public int ConsultarIdRol(string rol)
        {
            int idrol = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_rol";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rol", rol);
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
        public int CompletarRegistroParaModificarUsuario(int codigo, TextBox id, TextBox dni, TextBox nombre, TextBox apellidos, DropDownList rol, TextBox correo, TextBox contraseña, TextBox confirmaccontrase, TextBox tel, TextBox estado)
        {
            int confir = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_usuario_para_modificar";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", codigo);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    id.Text = dr["id_usuario"].ToString();
                    dni.Text = dr["dni_usuario"].ToString();
                    nombre.Text = dr["nombre_usuario"].ToString();
                    apellidos.Text = dr["apellido_usuario"].ToString();
                    rol.SelectedIndex = rol.Items.IndexOf(rol.Items.FindByText(dr["nombre_rol"].ToString()));
                    correo.Text = dr["email_usuario"].ToString();
                    contraseña.Text = dr["contraseña_usuario"].ToString();
                    confirmaccontrase.Text = dr["contraseña_usuario"].ToString();
                    tel.Text = dr["tel_usuario"].ToString();
                    estado.Text = dr["estado_usuario"].ToString();

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

        //Clase para obtener el DNI de un usuario por el ID
        public int ConsultarDNIPorId(int id)
        {
            int dni = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dni = Convert.ToInt32(dr["dni_usuario"].ToString());
            }
            dr.Close();
            cnx.Close();
            return dni;
        }

        //Clase para consultar el CORREO de un usuario por ID
        public string ConsultarCorreoPorId(int id)
        {
            cnx.Open();
            string correo = "";
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                correo = dr["email_usuario"].ToString();
            }
            dr.Close();
            cnx.Close();
            return correo;
        }

        //Clase para actualizar la información de un usuario
        public int ActualizarUsuario(int id, int dni, string nombre, string apellido, string correo, string contrase, int tel, string estado) {

            int confirm = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@dni", dni);
                cmd.Parameters.AddWithValue("@nomb", nombre);
                cmd.Parameters.AddWithValue("@apell", apellido);
                cmd.Parameters.AddWithValue("@correo", correo);
                cmd.Parameters.AddWithValue("@contrase", contrase);
                cmd.Parameters.AddWithValue("@tel", tel);
                cmd.Parameters.AddWithValue("@estado", estado);
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
        public int ObtenerIdRolUsuarioParaModificar(int id_user)
        {
            int id = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_idrol_usuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user", id_user);
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
        public int Modificar_Rol_Usuario(int id_user, int id_viejo, int id_nuevo)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_actualizar_rol_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_usuario", id_user);
                cmd.Parameters.AddWithValue("@id_rol_viejo", id_viejo);
                cmd.Parameters.AddWithValue("@id_rol_nuevo", id_nuevo);
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
        public int DardeBaja(int id) {

            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_Dar_de_baja";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
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
        public int DardeAlta(int id)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_Dar_de_alta";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
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

        //Clase para consultar un usuario por DNI y cargarlo al Gridview
        public void ConsultarUsuarioGV(GridView usuariodni, int dni)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_dni_dgv";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni", dni);
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
        //-----------------------COHORTE--------------------------------------------------------
        //Clase para Cargar los usuarios registrado en DropdownList
        public void CargarUsuarioDropdownlist(DropDownList usuarios)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuarios_select";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            usuarios.DataSource = dt;
            usuarios.DataTextField = "nombre_usuario";
            usuarios.DataValueField = "id_usuario";
            usuarios.DataBind();
            cnx.Close();
        }

        //Clase para cargar los programas en un Dropdownlist
        public void CargarProgramaDropdownlist(DropDownList programas)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programas_select";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            programas.DataSource = dt;
            programas.DataTextField = "nombre_programa";
            programas.DataValueField = "id_programa";
            programas.DataBind();
            cnx.Close();

        }

        //Clase para cargar las cohortes el en Gridview
        public void CargarCohortesGV(GridView cohortes)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_gv";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            cohortes.DataSource = dt;
            cohortes.DataBind();
            if (cohortes.Rows.Count > 0)
            {
                cohortes.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        //Clase para generar el ID de registro de COHORTES de forma automática
        public void ConsultarUltimaCohorte(TextBox id_cohorte)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_ultimo_idcohorte";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string id = dr["id_cohorte_mayor"].ToString();
                if (id == null || id == "")
                {
                    id = Convert.ToString(1);
                    id_cohorte.Text = id;
                }
                else
                {
                    int id_c = ((Convert.ToInt32(dr["id_cohorte_mayor"].ToString())) + 1);
                    id_cohorte.Text = id_c.ToString();
                }

            }
            cnx.Close();
        }

        //Clase para consultar una cohorte por DNI y cargarlo en el GRIDVIEW
        public void ConsultarCohorteDNIyCargarloGV(int dni_c, GridView cohortedni)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_dni_gv";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_coh", dni_c);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            cohortedni.DataSource = dt;
            cohortedni.DataBind();
            if (cohortedni.Rows.Count > 0)
            {
                cohortedni.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        //Clase para consultar que una Cohorte no esté registrada por un ID determinado
        public int ConsultarCohortePorID(int id_cohorte)
        {
            cnx.Open();
            int contad = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id_cohorte);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                contad++;
            }
            dr.Close();
            cnx.Close();
            return contad;
        }

        //Clase para consultar que una cohorte no esté registrada por un DNI determinado
        public int ConsultarCohortePorDNI(int dni_cohorte)
        {
            cnx.Open();
            int contad = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_dni";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni", dni_cohorte);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                contad++;
            }
            dr.Close();
            cnx.Close();
            return contad;
        }

        //Clase para registrar una cohorte
        public int InsertarCohorte(int id_co, int dni_co, int id_prg, DateTime fechai, DateTime fechaf, DateTime fecha_reg)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_cohorte";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id_c", id_co);
                cmd.Parameters.AddWithValue("@dni_c", dni_co);
                cmd.Parameters.AddWithValue("@id_prog", id_prg);
                cmd.Parameters.AddWithValue("@fecha_i", fechai);
                cmd.Parameters.AddWithValue("@fecha_f", fechaf);
                cmd.Parameters.AddWithValue("@fecha_r", fecha_reg);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para obtener los datos de una cohorte y cargarlos para modificar
        public int CompletarRegistroCohorteParaModificar(int id_cohorte, TextBox id, TextBox dni, TextBox fechai, TextBox fechaf, DropDownList programa)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_cohorte_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id_cohorte);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    id.Text = dr["id_cohorte"].ToString();
                    dni.Text = dr["dni_cohorte"].ToString();
                    fechai.Text = dr["fecha_inic_cohorte"].ToString();
                    fechaf.Text = dr["fecha_fin_cohorte"].ToString();
                    programa.SelectedIndex = programa.Items.IndexOf(programa.Items.FindByValue(dr["id_programa"].ToString()));
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

        //Clase para consultar cuantós días han pasado desde la fecha en que inicio una cohorte para habilitar o no determinados campos para modificación
        public int ConsultarCantidadDias(DateTime fecha_i)
        {
            cnx.Open();
            int fecha = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_calcular_fecha";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha_f", fecha_i);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                fecha = Convert.ToInt32(dr["dias"].ToString());
            }
            cnx.Close();
            return fecha;
        }
        //Clase para obtener el día de registro de una cohorte

        public DateTime consultarFechaRegistro(int id)
        {
            cnx.Open();
            string fecha = "16/02/1992 12:15:12";
            DateTime registro = Convert.ToDateTime(fecha);
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                registro = Convert.ToDateTime(dr["fecha_registro"].ToString());
            }
            cnx.Close();
            return registro;
        }

        //Clase para modificar los datos de una cohorte
        public int ModificarCohorte(int id_coh, int dni_coh, int id_progra, DateTime fechai, DateTime fechaf)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_cohorte";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_c", id_coh);
                cmd.Parameters.AddWithValue("@dni_c", dni_coh);
                cmd.Parameters.AddWithValue("@id_prog", id_progra);
                cmd.Parameters.AddWithValue("@fecha_i", fechai);
                cmd.Parameters.AddWithValue("@fecha_f", fechaf);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para registrar los usuarios en un cohorte determinada
        public int AsignarIntegrantesACohorte(int id_cohorte, int id_integrante)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_usuarios_a_cohorte";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_user", id_integrante);
                cmd.Parameters.AddWithValue("@id_cohor", id_cohorte);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para conusulaar si un usuario ya pertenece a una cohorte determinada

        public int ConsultarUsuarioEnCohorte(int id_u, int id_c)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_en_cohorte";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user", id_u);
            cmd.Parameters.AddWithValue("@id_cohort", id_c);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        //Clase para cargar los integrantes de una cohorte al Gridview
        public void CargarIntegrantesCohorteGV(GridView integrantes)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_integrantes_cohorte_gv";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            integrantes.DataSource = dt;
            integrantes.DataBind();
            if (integrantes.Rows.Count > 0)
            {
                integrantes.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        //Clase para obtener el dni antiguo de una cohorte para saber si se ingresó un dni diferente en el texbox al modificar
        public string ConsultarDNICohorteParaModificar(int id_cohor)
        {
            cnx.Open();
            string dni = "";
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id_cohor);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dni = dr["dni_cohorte"].ToString();
            }
            dr.Close();
            cnx.Close();
            return dni;
        }
        //--------------------------------DESTREZAS------------------------------------

        //Clase para obtener el id de la ultima competencia registrada e incrementarla para nuevo registro
        public void ConsultarUltimaCompetencia(TextBox id_competencia)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_ultimo_icompetencia";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string id = dr["id_competencia_mayor"].ToString();
                if (id == null || id == "")
                {
                    id = Convert.ToString(1);
                    id_competencia.Text = id;
                }
                else
                {
                    int id_c = ((Convert.ToInt32(dr["id_competencia_mayor"].ToString())) + 1);
                    id_competencia.Text = id_c.ToString();
                }

            }
            dr.Close();
            cnx.Close();
        }

        //Clase para obtener las competencia registradas y caragarlas al Gridview
        public void CargarCompetenciasGV(GridView competencias)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_competencia_al_gv";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            competencias.DataSource = dt;
            competencias.DataBind();
            if (competencias.Rows.Count > 0)
            {
                competencias.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        //Clase para consultar la existencia de una competencia por un ID determinado
        public int ConsultarCompetenciaPorID(int id_comp)
        {
            cnx.Open();
            int competencia = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_comp", id_comp);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                competencia++;
            }
            dr.Close();
            cnx.Close();
            return competencia;
        }

        //Clase para consultar la existencia de una competencia por un DNI dterminado
        public int ConsultarCompetenciaPorDNI(int dni_compe)
        {
            cnx.Open();
            int yaexiste = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_dni";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_comp", dni_compe);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                yaexiste++;
            }
            dr.Close();
            cnx.Close();
            return yaexiste;
        }

        //Clase para consultar la existencia de una competencia por un Nombre determinado
        public int ConsultarCompetenciaPorNombre(string nombre_comp)
        {
            cnx.Open();
            int existe = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_nombre";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nomb", nombre_comp);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }
        //Clase para insertar una competencia
        public int InsertarCompetencia(int id_compet, int dni_compet, string nomb_compet, int canti_resul, int canti_hora, DateTime fechareg)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_competencia";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_com", id_compet);
                cmd.Parameters.AddWithValue("@dni_com", dni_compet);
                cmd.Parameters.AddWithValue("@nomb_com", nomb_compet);
                cmd.Parameters.AddWithValue("@canti_re", canti_resul);
                cmd.Parameters.AddWithValue("@cantid_h", canti_hora);
                cmd.Parameters.AddWithValue("@fecha_re", fechareg);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
            
        }

        //Clase para autocompletar registro de competencia para modificarla
        public int CompletarRegistroCompetenciaParaModificar(int id_compe, TextBox id_comp, TextBox dni_comp, TextBox nombre, TextBox resultados, TextBox horas)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_competencia_por_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_comp", id_compe);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    id_comp.Text = dr["id_competencia"].ToString();
                    dni_comp.Text = dr["dni_competencia"].ToString();
                    nombre.Text = dr["nombre_competencia"].ToString();
                    resultados.Text = dr["cantid_resultados"].ToString();
                    horas.Text = dr["cantid_horas"].ToString();
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

        //Clase para consultar la fecha de registro de una competencia
        public DateTime FechaRegistroCompetencia(int id_comp)
        {
            string fecha = "16/02/1992 12:15:12";
            DateTime fecha_reg = Convert.ToDateTime(fecha);
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_comp", id_comp);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                fecha_reg = Convert.ToDateTime(dr["fecha_registro_competencia"].ToString());
            }
            dr.Close();
            cnx.Close();
            return fecha_reg;
        }
        //Clase para consultar cuántos días han pasado desde la fecha de registro para permitir o no modificar determinados campos
        public int CantidadDiasRegistroCompetencia(DateTime fecha_reg)
        {
            cnx.Open();
            int dias = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_calcular_fecha_competencia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha_r", fecha_reg);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dias = Convert.ToInt32(dr["dias_registro_comp"].ToString());
            }
            dr.Close();
            cnx.Close();
            return dias;
        }

        //Clase para consultar el dni antiguo de una competencia para saber si ha cambiado el dni en el texbox para modificar
        public string ConsultarDNICompetencia(int id_comp)
        {
            string dni = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_comp", id_comp);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dni = dr["dni_competencia"].ToString();
            }
            dr.Close();
            cnx.Close();
            return dni;
        }

        //Clase para consultar el dni antiguo de una competencia para saber si ha cambiado el dni en el texbox para modificar
        public string ConsultarNombreCompetencia(int id_comp)
        {
            string nombre = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_comp", id_comp);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nombre = dr["nombre_competencia"].ToString();
            }
            dr.Close();
            cnx.Close();
            return nombre;
        }

        //Clase para Modificar una competencia
        public int ModificarCompetencia(int id_compe, int dni_compe, string nombre_compe, int resul_compe, int horas_compe)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_competencia";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_com", id_compe);
                cmd.Parameters.AddWithValue("@dni_com", dni_compe);
                cmd.Parameters.AddWithValue("@nomb_com", nombre_compe);
                cmd.Parameters.AddWithValue("@canti_re", resul_compe);
                cmd.Parameters.AddWithValue("@cantid_h", horas_compe);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para consultar competencia por DNI y cargarla al Gridview
        public void ConsultarCompetenciaPorDNIyCargarlaAlGV(int dnicomp, GridView competencia)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_dni_ycargarh_gv";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_compe", dnicomp);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            competencia.DataSource = dt;
            competencia.DataBind();
            if (competencia.Rows.Count > 0)
            {
                competencia.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        //----------------------------RESULTADOS---------------------------------------------

        //Clase para Cargar las competencias en el DropdownList
        public void CargarCompetencia(DropDownList competencias)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_competencias_select";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            competencias.DataSource = dt;
            competencias.DataTextField = "nombre_competencia";
            competencias.DataValueField = "id_competencia";
            competencias.DataBind();
            cnx.Close();

        }

        //Clase para generar el ID de registro de Resultados Automáticamente
        public void ConsultarUltimoResultadoEIncrementarlo(TextBox id_resultad)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_ultimo_idresultado";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string id = dr["id_resultado_mayor"].ToString();
                if (id == null || id == "")
                {
                    id = Convert.ToString(1);
                    id_resultad.Text = id;
                }
                else
                {
                    int id_c = ((Convert.ToInt32(dr["id_resultado_mayor"].ToString())) + 1);
                    id_resultad.Text = id_c.ToString();
                }

            }
            cnx.Close();
        }

        //Clase para cargar los resultados al Gridview
        public void CargarResultadosAlGV(GridView Resultados)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_resultados_gridview";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Resultados.DataSource = dt;
            Resultados.DataBind();
            if (Resultados.Rows.Count > 0)
            {
                Resultados.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        //Clase para consultar si existe un Resultado Por un ID determinado
        public int ConsultarResultadoPorID(int id_result)
        {
            cnx.Open();
            int existe = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_result", id_result);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        //Clase para consultar si existe un resultado por un DNI dterminado
        public int ConsultarResultadoPorDNI(int dni_result)
        {
            cnx.Open();
            int existe = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_DNI";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_result", dni_result);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        //Clase para consultar si existe un resultado por un NOMBRE dterminado
        public int ConsultarResultadoPorNOMBRE(string nom_result)
        {
            cnx.Open();
            int existe = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_NOMBRE";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nomb_result", nom_result);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        //Clase para insertar un resultado
        public int InsertarUnResultado(int id_r, int dni_r, int id_compet, string nom_r, int horas, DateTime fechareg)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_resultado";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_result", id_r);
                cmd.Parameters.AddWithValue("@id_comp", id_compet);
                cmd.Parameters.AddWithValue("@dni_result", dni_r);
                cmd.Parameters.AddWithValue("@nomb_result", nom_r);
                cmd.Parameters.AddWithValue("@horas", horas);
                cmd.Parameters.AddWithValue("@fecha_reg", fechareg);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para Autocompletar RegistroPara Modificar
        public int AutocompletarRegistroResultadoParaModificar(int id, TextBox id_r, TextBox dni_r, DropDownList competen, TextBox nombre, TextBox horas)
        {
            int estado = 0;
            cnx.Open();
            try {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_resultado_por_ID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_result", id);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    id_r.Text = dr["id_resultado"].ToString();
                    dni_r.Text = dr["dni_resultado"].ToString();
                    competen.SelectedIndex = competen.Items.IndexOf(competen.Items.FindByValue(dr["id_competencia"].ToString()));
                    nombre.Text = dr["nombre_resultado"].ToString();
                    horas.Text = dr["cantid_horas"].ToString();
                }
                dr.Close();
            }
            catch
            {

            }
            cnx.Close();
            return estado;

        }

        //Clase para Obtener la fecha de registro del resultado
        public DateTime ObtenerfechaRegistroResultado(int id_r)
        {
            string fecha = "16/02/1992 12:15:12";
            DateTime fecha_reg = Convert.ToDateTime(fecha);
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_result", id_r);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                fecha_reg = Convert.ToDateTime(dr["fecha_registro_resultado"].ToString());
            }
            dr.Close();
            cnx.Close();
            return fecha_reg;
        }

        //Clase para Obtener la cantidad de Días que han pasado desde el registro
        public int ObtenerCantidadDiasResultado(DateTime fecha_re)
        {
            int dias = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_calcular_fecha_resultado";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha_r", fecha_re);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dias = Convert.ToInt32(dr["dias_registro_result"].ToString());
            }
            dr.Close();
            cnx.Close();
            return dias;
        }

        //Clase para Obtener el DNI de un Resultado
        public string ObtenerDNIResultado(int id_r)
        {
            string dni = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_result", id_r);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dni = dr["dni_resultado"].ToString();
            }
            dr.Close();
            cnx.Close();
            return dni;
        }

        //Clase para Obtener el Nombre de un Resultado
        public string ObtenerNombreResultado(int id_r)
        {

            string nom = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_result", id_r);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nom = dr["nombre_resultado"].ToString();
            }
            dr.Close();
            cnx.Close();
            return nom;
        }

        public int ModificarResultado(int id_re, int id_comp, int dni_re, string nom_re, int horas)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_resultado";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_result", id_re);
                cmd.Parameters.AddWithValue("@id_comp", id_comp);
                cmd.Parameters.AddWithValue("@dni_result", dni_re);
                cmd.Parameters.AddWithValue("@nomb_result", nom_re);
                cmd.Parameters.AddWithValue("@horas", horas);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public void ConsultarResultadoPorDNIyCargarloAlGV(int dni_re, GridView resultadoDNI)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_DNI_yCargarlo_gridview";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_result", dni_re);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            resultadoDNI.DataSource = dt;
            resultadoDNI.DataBind();
            if (resultadoDNI.Rows.Count > 0)
            {
                resultadoDNI.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();

        }

        //------------------------------PROGRAMAS------------------------------------------------

        //Clase para obtener el ultimo id de programa y autoincrementarlo para el registro
        public void ObtenerUltimoIDProgramaEIncrementarlo(TextBox id_programa)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_ultimo_idprograma";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string id = dr["id_programa_mayor"].ToString();
                if (id == null || id == "")
                {
                    id_programa.Text = "1";
                }
                else
                {
                    int id_p = (Convert.ToInt32(dr["id_programa_mayor"].ToString())) + 1;
                    id_programa.Text = id_p.ToString();
                }
            }
            dr.Close();
            cnx.Close();
        }

        public void CargarProgramasAlGV(GridView programas)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_programa_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            programas.DataSource = dt;
            programas.DataBind();
            if (programas.Rows.Count > 0)
            {
                programas.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        public void CargarCompetenciasAlDropdownList(DropDownList competencias)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_competencias_al_dropdownlist";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            competencias.DataSource = dt;
            competencias.DataTextField = "nombre_competencia";
            competencias.DataValueField = "id_competencia";
            competencias.DataBind();
            cnx.Close();
        }

        //Clase para consultar la existencia de un programa por un ID determinado
        public int ConsultarProgramaPorID(int id_p)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", id_p);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        //Clase para consultar la existencia de un programa por un DNI determinado
        public int ConsultarProgramaPorDNI(int dni_p)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_DNI";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_prog", dni_p);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        //Clase para consultar la existencia de un programa por un NOMBRE determinado
        public int ConsultarProgramaPorNOMBRE(string nom_p)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_NOMBRE";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nom_prog", nom_p);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        //Clase para insertar un programa
        public int InsertarPrograma(int id_p, int dni_p, string nom_p, int canti_h, DateTime fecha_reg)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_programa";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_prog", id_p);
                cmd.Parameters.AddWithValue("@dni_prog", dni_p);
                cmd.Parameters.AddWithValue("@nomb_prog", nom_p);
                cmd.Parameters.AddWithValue("@horas", canti_h);
                cmd.Parameters.AddWithValue("@fecha_reg", fecha_reg);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para asignar Competencias a un Programa
        public int AsignarCompetenciaAPrograma(int id_p, int id_c)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_asignar_competencia_al_programa";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_prog", id_p);
                cmd.Parameters.AddWithValue("@id_comp", id_c);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para Autocompletar Registro Para Modificar
        public int CompletarRegistroProgramaParaModificar(int cod, TextBox id, TextBox dni, TextBox nom, TextBox hora)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_programa_por_ID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_prog", cod);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    id.Text = dr["id_programa"].ToString();
                    dni.Text = dr["dni_programa"].ToString();
                    nom.Text = dr["nombre_programa"].ToString();
                    hora.Text = dr["cantid_horas_programa"].ToString();
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

        //Clase para Obtener la fecha de registro
        public DateTime ObtenerFechaRegistroPrograma(int id_p)
        {
            string fecha = "16/02/1992 12:15:12";
            DateTime fecha_reg = Convert.ToDateTime(fecha);
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", id_p);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                fecha_reg = Convert.ToDateTime(dr["fecha_registro_programa"].ToString());
            }
            dr.Close();
            cnx.Close();
            return fecha_reg;
        }

        //Clase para calcular lod días que han pasado desde la fecha de registro
        public int CalcularDiasDesdeFechaRegistroPrograma(DateTime fecha_reg)
        {
            int dias = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_calcular_fecha_programa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha_r",fecha_reg);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dias = Convert.ToInt32(dr["dias_registro_prog"].ToString());
            }
            dr.Close();
            cnx.Close();
            return dias;
        }

        //Clase para obtener el DNI de un programa
        public string ObtenerDNIPrograma(int id_p)
        {
            string dni = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", id_p);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dni = dr["dni_programa"].ToString();
            }
            dr.Close();
            cnx.Close();
            return dni;
        }

        //Clase para obtener el NOMBRE de un programa
        public string ObtenerNombrePrograma(int id_p)
        {
            string nombre = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", id_p);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nombre = dr["nombre_programa"].ToString();
            }
            dr.Close();
            cnx.Close();
            return nombre;
        }

        public int ModificarPrograma(int id_p,int dni_p, string nomb_p, int horas)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_programa";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_prog",id_p);
                cmd.Parameters.AddWithValue("@dni_prog",dni_p);
                cmd.Parameters.AddWithValue("@nomb_prog",nomb_p);
                cmd.Parameters.AddWithValue("@horas",horas);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public int ConsultarSiCompetenciaYaEstáAsignadaAPrograma(int id_p, int id_c)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_en_programa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog",id_p);
            cmd.Parameters.AddWithValue("@id_comp",id_c);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }

        public void CargarProgramasConCompetenciasAlGV(GridView PROGCOMP)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_programa_Y_CompetenciasGV";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            PROGCOMP.DataSource = dt;
            PROGCOMP.DataBind();
            if (PROGCOMP.Rows.Count > 0)
            {
                PROGCOMP.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }

        public void BuscarProgramaYCargarloAlGV(int dni_p,GridView programa)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscar_por_DNI_Ycargar_programa_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_prog", dni_p);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            programa.DataSource = dt;
            programa.DataBind();
            if (programa.Rows.Count > 0)
            {
                programa.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
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

                if(id==null || id == "")
                {
                    id_reporte_problema = 1;
                }else
                {
                   id_reporte_problema = (Convert.ToInt32(dr["id_reporte_problema_mayor"].ToString()))+1;
                }
            }
            dr.Close();
            cnx.Close();
            return id_reporte_problema;
        }

        //Clase para consultar la existencia de un reporte de probñema por un ID determinado
        public int ConsultarReporteProblemaPorID(int id_re)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_reporte_problema_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_report_prob",id_re);
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
        public void CargarReportesDeUsuarioAlGV(int id_user,GridView reportes)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_reportes_problemas_de_un_usuario_al_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user",id_user);
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
        public int InsertarReporteProblema(int id_report,string nomb_report,string descrip_report,DateTime fecha_reg, string estado_report, int id_user)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_reporte_problema";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_pro",id_report);
                cmd.Parameters.AddWithValue("@nomb_pro",nomb_report);
                cmd.Parameters.AddWithValue("@descrip_pro",descrip_report);
                cmd.Parameters.AddWithValue("@fecha_reg",fecha_reg);
                cmd.Parameters.AddWithValue("@estado_repor",estado_report);
                cmd.Parameters.AddWithValue("@id_user",id_user);
                cmd.ExecuteNonQuery();

            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        //Clase para enviar email con correo y contraseña para ingresar al sistema
        public bool EnviarCorreoRegistro(string nombre,string correo,string contraseña)
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
                mail.Body = "Hola "+nombre+"!"+"<br/>"+ "<br/>"+"Te damos las bienvenida a la familia FIBER."+"<br/>"+"<br/>"+"Los datos para poder beneficiarte del sistema de información son:" + "<br/>" +"Correo: "+correo +"<br/>"+ "Contraseña: " +contraseña +"<br/>"+"<br/>"+ "Recuerda darle un buen uso a ésta aplicación Web." +"<br/>"+"<br/>"+"<b>"+"​Fiber© Producto HEXI"+"</b>"+"<br/>"+"<br/>"+"<br/>"+"<b>" +"​AVISO LEGAL:"+"</b>"+"Este correo electrónico incluyendo sus anexos, contiene información confidencial de Fiber©, si usted no es el destinatario intencional, se le informa que cualquier uso, difusión, distribución o copiado de esta comunicación está terminantemente prohibido, hacerlo podría tener consecuencias legales como las contenidas en la Ley 1273 de 2009, Ley 1581 de 2012 y todas las que le apliquen. Si ha recibido este correo por error, por favor bórrelo. Si usted es el destinatario, le solicitamos mantener reserva sobre el contenido, los datos o información de contacto del remitente y en general sobre la información de este documento y/o archivos adjuntos, a no ser que exista una autorización explícita. Este mensaje y sus anexos han sido revisados con software antivirus, para evitar que contenga código malicioso que pueda afectar sistemas de cómputo, sin embargo es responsabilidad del destinatario confirmar este hecho en el momento de su recepción.";
                //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                mail.To.Add(correo);
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
        public bool EnviarCorreoContacto(string nombre, string correo, string mensaje)
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
                mail.Body = "<b>"+"Datos solicitante:" + "</b>" + "<br/>" + "<br/>" + "<b>" + "Nombre :" + "</b>" + "<br/>" + nombre + "<br/>" + "<b>" + "Correo Electrónico: " + "</b>" + "<br/>" + correo + "<br/>" + "<br/>" + "<b>" + "Mensaje:" + "</b>" + "<br/>" + mensaje + "<br/>" + "<br/>" + "<b>" + "Contacto HEXI©" + "</b>";
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

        public bool EnviarCorreoConfirmaciónEnvíoMensajeContacto(string nombre, string correo)
        {
            try
            {
                //Configuración del Mensaje
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.live.com");
                //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                mail.From = new MailAddress("hexi@outlook.es", "HEXI©", Encoding.UTF8);
                //Aquí ponemos el asunto del correo
                mail.Subject = "Confirmación HEXI©";
                //Aquí ponemos el mensaje que incluirá el correo
                mail.IsBodyHtml = true;
                mail.Body = "Hola " + nombre + "!" + "<br/>" + "<br/>" + "Muchas gracias por contactarnos, hemos recibido tu solicitud. A partir de éste momento comenzaremos a tramitarla para poder brindarte una respuesta en el menor tiempo posible." + "<br/>" + "<br/>" + "Cordialmente," + "<br/>" + "<b>" + "SERVICIO AL CLIENTE." + "<br/>" + "HEXI©" + "</b>" + "<br/>" + "<br/>" + "<br/>" + "<b>" + "​AVISO LEGAL:" + "</b>" + "Este correo electrónico incluyendo sus anexos, contiene información confidencial de HEXI©, si usted no es el destinatario intencional, se le informa que cualquier uso, difusión, distribución o copiado de esta comunicación está terminantemente prohibido, hacerlo podría tener consecuencias legales como las contenidas en la Ley 1273 de 2009, Ley 1581 de 2012 y todas las que le apliquen. Si ha recibido este correo por error, por favor bórrelo. Si usted es el destinatario, le solicitamos mantener reserva sobre el contenido, los datos o información de contacto del remitente y en general sobre la información de este documento y/o archivos adjuntos, a no ser que exista una autorización explícita. Este mensaje y sus anexos han sido revisados con software antivirus, para evitar que contenga código malicioso que pueda afectar sistemas de cómputo, sin embargo es responsabilidad del destinatario confirmar este hecho en el momento de su recepción.";
                //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                mail.To.Add(correo);
                //Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran
                //mail.Attachments.Add(new Attachment(@"C:\Documentos\carta.docx"));

                //Configuracion del SMTP
                SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                //Especificamos las credenciales con las que enviaremos el mail
                SmtpServer.Credentials = new System.Net.NetworkCredential("hexi@outlook.es", "DevelopersSENA");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                return true;
            }
            catch
            {
                return false;
            }
        }

        //Clase para completar el perfil de usuario
        public void CargarPerfil(int id, TextBox nombres, TextBox apellidos, TextBox correo, Label Nombre_completo, Label NombreRolUsuario)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_info_perfil_usuario";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user", id);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nombres.Text = dr["nombre_usuario"].ToString();
                apellidos.Text = dr["apellido_usuario"].ToString();
                correo.Text = dr["email_usuario"].ToString();
                Nombre_completo.Text = dr["nombre_completo"].ToString();
                NombreRolUsuario.Text = dr["nombre_rol"].ToString();
            }
            dr.Close();
            cnx.Close();
        }

        public int ModificarPefilUsuario(int id, string contrase)
        {
            cnx.Open();
            int estado = 0;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_perfil_usuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_user",id);
                cmd.Parameters.AddWithValue("@contraseña",contrase);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            return estado;
        }
    }
}