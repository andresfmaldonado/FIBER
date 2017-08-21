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


namespace CAD
{
    public class CADPrograma
    {
        string cadena = ConfigurationManager.ConnectionStrings["ConSQL"].ConnectionString;
        SqlConnection cnx;
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlDataReader dr;
        DataTable dt;
        //int confirmacion = 0;

        public CADPrograma()
        {
            cnx = new SqlConnection(cadena);
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
        public void ConsultarCohorteDNIyCargarloGV(DTOPrograma program, GridView cohortedni)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_dni_gv";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_coh", program.Dni_cohorte);
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
        public int ConsultarCohortePorID(DTOPrograma program)
        {
            cnx.Open();
            int contad = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", program.Id_cohorte);
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
        public int ConsultarCohortePorDNI(DTOPrograma program)
        {
            cnx.Open();
            int contad = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_dni";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni", program.Dni_cohorte);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                contad++;
            }
            dr.Close();
            cnx.Close();
            return contad;
        }

        //Clase para obtener id por dni
        public int ConsultarIDCohortePorDNI(DTOPrograma program)
        {
            cnx.Open();
            int id = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_dni";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni", program.Dni_cohorte);
            dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                id = int.Parse(dr["id_cohorte"].ToString());
            }
            dr.Close();
            cnx.Close();
            return id;
        }

        //Clase para registrar una cohorte
        public int InsertarCohorte(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_cohorte";
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("@dni_c", program.Dni_cohorte);
                cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
                cmd.Parameters.AddWithValue("@fecha_i", program.Fecha_ini_cohorte);
                cmd.Parameters.AddWithValue("@fecha_f", program.Fecha_fin_cohorte);
                cmd.Parameters.AddWithValue("@fecha_r", program.Fecha_registro_cohorte);
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
        public int CompletarRegistroCohorteParaModificar(DTOPrograma program, TextBox dni, TextBox fechai, TextBox fechaf, DropDownList programa)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_cohorte_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", program.Id_cohorte);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
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
        public int ConsultarCantidadDias(DTOPrograma program)
        {
            cnx.Open();
            int fecha = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_calcular_fecha";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha_f", program.Fecha_registro_cohorte);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                fecha = Convert.ToInt32(dr["dias"].ToString());
            }
            cnx.Close();
            return fecha;
        }
        //Clase para obtener el día de registro de una cohorte

        public DateTime consultarFechaRegistro(DTOPrograma program)
        {
            cnx.Open();
            string fecha = "16/02/1992 12:15:12";
            DateTime registro = Convert.ToDateTime(fecha);
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", program.Id_cohorte);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                registro = Convert.ToDateTime(dr["fecha_registro"].ToString());
            }
            cnx.Close();
            return registro;
        }

        //Clase para modificar los datos de una cohorte
        public int ModificarCohorte(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_cohorte";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_c", program.Id_cohorte);
                cmd.Parameters.AddWithValue("@dni_c", program.Dni_cohorte);
                cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
                cmd.Parameters.AddWithValue("@fecha_i", program.Fecha_ini_cohorte);
                cmd.Parameters.AddWithValue("@fecha_f", program.Fecha_fin_cohorte);
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
        public int AsignarIntegrantesACohorte(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_usuarios_a_cohorte";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_user", program.Id_integrante);
                cmd.Parameters.AddWithValue("@id_cohor", program.Id_cohorte);
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

        public int ConsultarUsuarioEnCohorte(DTOPrograma program)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_usuario_en_cohorte";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_user", program.Id_integrante);
            cmd.Parameters.AddWithValue("@id_cohort", program.Id_cohorte);
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
        public string ConsultarDNICohorteParaModificar(DTOPrograma program)
        {
            cnx.Open();
            string dni = "";
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_cohorte_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", program.Id_cohorte);
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
        public int ConsultarCompetenciaPorID(DTOPrograma program)
        {
            cnx.Open();
            int competencia = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
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
        public int ConsultarCompetenciaPorDNI(DTOPrograma program)
        {
            cnx.Open();
            int yaexiste = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_dni";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_comp", program.Dni_competencia);
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
        public int ConsultarCompetenciaPorNombre(DTOPrograma program)
        {
            cnx.Open();
            int existe = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_nombre";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nomb", program.Nombre_competencia);
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
        public int InsertarCompetencia(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_competencia";
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("@dni_com", program.Dni_competencia);
                cmd.Parameters.AddWithValue("@nomb_com", program.Nombre_competencia);
                cmd.Parameters.AddWithValue("@canti_re", program.Cantid_resultados_compet);
                cmd.Parameters.AddWithValue("@cantid_h", program.Cantid_horas_compet);
                cmd.Parameters.AddWithValue("@fecha_re", program.Fecha_reg_compet);
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
        public int CompletarRegistroCompetenciaParaModificar(DTOPrograma program, TextBox dni_comp, TextBox nombre, TextBox resultados, TextBox horas)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_competencia_por_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
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
        public DateTime FechaRegistroCompetencia(DTOPrograma program)
        {
            string fecha = "16/02/1992 12:15:12";
            DateTime fecha_reg = Convert.ToDateTime(fecha);
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
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
        public int CantidadDiasRegistroCompetencia(DTOPrograma program)
        {
            cnx.Open();
            int dias = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_calcular_fecha_competencia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha_r", program.Fecha_reg_compet);
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
        public string ConsultarDNICompetencia(DTOPrograma program)
        {
            string dni = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
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
        public string ConsultarNombreCompetencia(DTOPrograma program)
        {
            string nombre = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
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
        public int ModificarCompetencia(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_competencia";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_com", program.Id_competencia);
                cmd.Parameters.AddWithValue("@dni_com", program.Dni_competencia);
                cmd.Parameters.AddWithValue("@nomb_com", program.Nombre_competencia);
                cmd.Parameters.AddWithValue("@canti_re", program.Cantid_resultados_compet);
                cmd.Parameters.AddWithValue("@cantid_h", program.Cantid_horas_compet);
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
        public void ConsultarCompetenciaPorDNIyCargarlaAlGV(DTOPrograma program, GridView competencia)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_por_dni_ycargarh_gv";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_compe", program.Dni_competencia);
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
        public int ConsultarResultadoPorID(DTOPrograma program)
        {
            cnx.Open();
            int existe = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_result", program.Id_result);
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
        public int ConsultarResultadoPorDNI(DTOPrograma program)
        {
            cnx.Open();
            int existe = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_DNI";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_result", program.Dni_result);
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
        public int ConsultarResultadoPorNOMBRE(DTOPrograma program)
        {
            cnx.Open();
            int existe = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_NOMBRE";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nomb_result", program.Nombre_result);
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
        public int InsertarUnResultado(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_resultado";
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
                cmd.Parameters.AddWithValue("@dni_result", program.Dni_result);
                cmd.Parameters.AddWithValue("@nomb_result", program.Nombre_result);
                cmd.Parameters.AddWithValue("@horas", program.Cantid_horas_result);
                cmd.Parameters.AddWithValue("@fecha_reg", program.Fecha_reg_result);
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
        public int AutocompletarRegistroResultadoParaModificar(DTOPrograma program, TextBox dni_r, DropDownList competen, TextBox nombre, TextBox horas)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_resultado_por_ID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_result", program.Id_result);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
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
        public DateTime ObtenerfechaRegistroResultado(DTOPrograma program)
        {
            string fecha = "16/02/1992 12:15:12";
            DateTime fecha_reg = Convert.ToDateTime(fecha);
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_result", program.Id_result);
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
        public int ObtenerCantidadDiasResultado(DTOPrograma program)
        {
            int dias = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_calcular_fecha_resultado";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha_r", program.Fecha_reg_result);
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
        public string ObtenerDNIResultado(DTOPrograma program)
        {
            string dni = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_result", program.Id_result);
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
        public string ObtenerNombreResultado(DTOPrograma program)
        {

            string nom = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_result", program.Id_result);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nom = dr["nombre_resultado"].ToString();
            }
            dr.Close();
            cnx.Close();
            return nom;
        }

        public int ModificarResultado(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_resultado";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_result", program.Id_result);
                cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
                cmd.Parameters.AddWithValue("@dni_result", program.Dni_result);
                cmd.Parameters.AddWithValue("@nomb_result", program.Nombre_result);
                cmd.Parameters.AddWithValue("@horas", program.Cantid_horas_result);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public void ConsultarResultadoPorDNIyCargarloAlGV(DTOPrograma program, GridView resultadoDNI)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_resultado_por_DNI_yCargarlo_gridview";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_result", program.Dni_result);
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
        public int ConsultarProgramaPorID(DTOPrograma program)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
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
        public int ConsultarProgramaPorDNI(DTOPrograma program)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_DNI";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_prog", program.Dni_programa);
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
        public int ConsultarProgramaPorNOMBRE(DTOPrograma program)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_NOMBRE";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@nom_prog", program.Nombre_programa);
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
        public int InsertarPrograma(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_programa";
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("@dni_prog", program.Dni_programa);
                cmd.Parameters.AddWithValue("@nomb_prog", program.Nombre_programa);
                cmd.Parameters.AddWithValue("@horas", program.Cantid_horas_programa);
                cmd.Parameters.AddWithValue("@fecha_reg", program.Fecha_reg_programa);
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
        public int AsignarCompetenciaAPrograma(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_asignar_competencia_al_programa";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
                cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
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
        public int CompletarRegistroProgramaParaModificar(DTOPrograma program, TextBox dni, TextBox nom, TextBox hora)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_programa_por_ID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
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
        public DateTime ObtenerFechaRegistroPrograma(DTOPrograma program)
        {
            string fecha = "16/02/1992 12:15:12";
            DateTime fecha_reg = Convert.ToDateTime(fecha);
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
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
        public int CalcularDiasDesdeFechaRegistroPrograma(DTOPrograma program)
        {
            int dias = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_calcular_fecha_programa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha_r", program.Fecha_reg_programa);
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
        public string ObtenerDNIPrograma(DTOPrograma program)
        {
            string dni = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
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
        public string ObtenerNombrePrograma(DTOPrograma program)
        {
            string nombre = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_ID";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nombre = dr["nombre_programa"].ToString();
            }
            dr.Close();
            cnx.Close();
            return nombre;
        }

        public int ModificarPrograma(DTOPrograma program)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_programa";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
                cmd.Parameters.AddWithValue("@dni_prog", program.Dni_programa);
                cmd.Parameters.AddWithValue("@nomb_prog", program.Nombre_programa);
                cmd.Parameters.AddWithValue("@horas", program.Cantid_horas_programa);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public int ConsultarSiCompetenciaYaEstáAsignadaAPrograma(DTOPrograma program)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_competencia_en_programa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_prog", program.Id_programa);
            cmd.Parameters.AddWithValue("@id_comp", program.Id_competencia);
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

        public void BuscarProgramaYCargarloAlGV(DTOPrograma program, GridView programa)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscar_por_DNI_Ycargar_programa_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_prog", program.Dni_programa);
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

        //Clase para consultar ID de un programa por un DNI determinado
        public int ConsultarIDProgramaPorDNI(DTOPrograma program)
        {
            int id = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_programa_por_DNI";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@dni_prog", program.Dni_programa);
            dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                id = int.Parse(dr["id_programa"].ToString());
            }
            dr.Close();
            cnx.Close();
            return id;
        }
    }
}
