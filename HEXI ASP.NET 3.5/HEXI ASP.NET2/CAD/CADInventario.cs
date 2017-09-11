using DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace CAD
{
    public class CADInventario
    {

        string cad = ConfigurationManager.ConnectionStrings["ConSQL"].ConnectionString;
        SqlConnection cnx;
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlDataReader dr;
        DataTable dt;
        int confirmacion;

        public CADInventario()
        {
            cnx = new SqlConnection(cad);
        }

        public void CargarProductos(GridView productos)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_productos_al_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            productos.DataSource = dt;
            productos.DataBind();
            if (productos.Rows.Count > 0)
            {
                productos.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }
        public void CargarPedidoH(GridView pedidosH)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_pedidos_hilos_al_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            pedidosH.DataSource = dt;
            pedidosH.DataBind();
            if (pedidosH.Rows.Count > 0)
            {
                pedidosH.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }
        public void CargarPedidoP(GridView pedidosP)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_pedidos_productos_al_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            pedidosP.DataSource = dt;
            pedidosP.DataBind();
            if (pedidosP.Rows.Count > 0)
            {
                pedidosP.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }
        public int ConsultarProductoPorRef(DTOInventario inven)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_Consultar_producto_por_referencia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", inven.Referencia_Producto);
            dr = cmd.ExecuteReader();
            while(dr.Read()){
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }
        public int ConsultarProductoPorPlaca(DTOInventario inven)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_Consultar_producto_por_placa";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@placa", inven.Placa_Producto);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }
        public int ConsultarProductoPorSerial(DTOInventario inven)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_Consultar_producto_por_serial";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@serial", inven.Serial_Producto);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }
        public int InsertarProducto(DTOInventario inven)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_producto";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ref_pro", inven.Referencia_Producto);
                cmd.Parameters.AddWithValue("@nombre", inven.Nombre_Producto);
                cmd.Parameters.AddWithValue("@desc_pro", inven.Descripcion_Producto);
                cmd.Parameters.AddWithValue("@nov_pro", inven.Novedad_Producto);
                cmd.Parameters.AddWithValue("@placa_pro", inven.Placa_Producto);
                cmd.Parameters.AddWithValue("@serial_pro", inven.Serial_Producto);
                cmd.Parameters.AddWithValue("@marca_pro", inven.Marca_Producto);
                cmd.Parameters.AddWithValue("@mod_pro", inven.Modelo_Producto);
                cmd.Parameters.AddWithValue("@cantid", inven.Cantidad_Producto);
                cmd.Parameters.AddWithValue("@val_pro", inven.ValorUnitario_Producto);
                cmd.Parameters.AddWithValue("@consu_pro", inven.Consumible);
                cmd.ExecuteNonQuery();
            }
            catch 
            {
                estado = 1;
               
            }
            cnx.Close();
            return estado;
        }

        public int ModificarProducto(DTOInventario inventario)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_producto";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_pro", inventario.Id_Producto);
                cmd.Parameters.AddWithValue("@refe_pro",inventario.Referencia_Producto);
                cmd.Parameters.AddWithValue("@nomb_pro", inventario.Nombre_Producto);
                cmd.Parameters.AddWithValue("@desc_pro", inventario.Descripcion_Producto);
                cmd.Parameters.AddWithValue("@nov_pro", inventario.Novedad_Producto);
                cmd.Parameters.AddWithValue("@placa_pro", inventario.Placa_Producto);
                cmd.Parameters.AddWithValue("@serial_pro", inventario.Serial_Producto);
                cmd.Parameters.AddWithValue("@marca_pro", inventario.Marca_Producto);
                cmd.Parameters.AddWithValue("@mod_pro", inventario.Modelo_Producto);
                cmd.Parameters.AddWithValue("@cantid", inventario.Cantidad_Producto);
                cmd.Parameters.AddWithValue("@val_pro", inventario.ValorUnitario_Producto);
                cmd.Parameters.AddWithValue("@consu_pro", inventario.Consumible);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public int InsertarConsumo(DTOInventario inven)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_consumo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_u", inven.Id_Usuario);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public int ModificarHilo(DTOInventario inven)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_modificar_hilo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_hi", inven.Id_Hilo);
                cmd.Parameters.AddWithValue("@refer_hi", inven.Referencia_Hilo);
                cmd.Parameters.AddWithValue("@tipo_hi", inven.Tipo_Hilo);
                cmd.Parameters.AddWithValue("@titulo_hi", inven.Titulo_Hilo);
                cmd.Parameters.AddWithValue("@color_hi", inven.Color_Hilo);
                cmd.Parameters.AddWithValue("@m_hilo", inven.Metros_Hilo);
                cmd.Parameters.AddWithValue("@valor", inven.ValorMetro);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public int CompletarRegistroProductoParaModificar(DTOInventario inven, TextBox codigo, TextBox referencia,TextBox nombre, TextBox descripcion, TextBox novedad, TextBox placa, TextBox serial, TextBox marca, TextBox modelo,TextBox cantidad, TextBox valorUnitario, DropDownList consumible)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_producto_por_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", inven.Id_Producto);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    codigo.Text = dr["id_producto"].ToString();
                    referencia.Text = dr["referencia_producto"].ToString();
                    nombre.Text = dr["nombre_producto"].ToString();
                    descripcion.Text = dr["descripcion_producto"].ToString();
                    novedad.Text = dr["novedad_producto"].ToString();
                    placa.Text = dr["placa_producto"].ToString();
                    serial.Text = dr["serial_producto"].ToString();
                    marca.Text = dr["marca_producto"].ToString();
                    modelo.Text = dr["modelo_producto"].ToString();
                    cantidad.Text = dr["cantidad_producto"].ToString();
                    valorUnitario.Text = dr["valorUnitario_producto"].ToString();
                    consumible.Text = dr["consumible"].ToString();
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
        public int CompletarPedidoPParaModificar(DTOInventario inven, TextBox fecha, TextBox descripcion, TextBox cantidad)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_pedidoP_por_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", inven.Id_Pedido);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    fecha.Text = dr["fecha_pedido"].ToString();
                    descripcion.Text = dr["referencia_producto_necesario"].ToString();
                    cantidad.Text = dr["cantidad_producto"].ToString();
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
        public int CompletarPedidoHParaModificar(DTOInventario inven, TextBox fecha, TextBox descripcion, TextBox cantidad)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_pedidoH_por_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", inven.Id_Pedido);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    fecha.Text = dr["fecha_pedido"].ToString();
                    descripcion.Text = dr["referencia_hilos_necesarios"].ToString();
                    cantidad.Text = dr["cantidad_hilo"].ToString();
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
        public string ObtenerPlacaProducto(DTOInventario inven)
        {
            string placa_p = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_producto_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", inven.Id_Producto);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                placa_p = dr["placa_producto"].ToString();
            }
            dr.Close();
            cnx.Close();
            return placa_p;

        }

        public string ObtenerSerialProducto(DTOInventario inven)
        {
            string serial_p = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_producto_por_id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", inven.Id_Producto);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                serial_p = dr["serial_producto"].ToString();
            }
            dr.Close();
            cnx.Close();
            return serial_p;

        }

        public string ObtenerRefHilo(DTOInventario inven)
        {
            string ref_h = "";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "SELECT referencia_hilo FROM tbl_hilos WHERE id_hilo = '" + inven.Id_Hilo + "'";
            cmd.CommandType = CommandType.Text;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                ref_h = dr["referencia_hilo"].ToString();
            }
            dr.Close();
            cnx.Close();
            return ref_h;
        }

        public void BuscarProductoYCargarloAlGV(DTOInventario inven, GridView producto)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscar_producto_por_refencia_para_cargarlo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", inven.Referencia_Producto);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            producto.DataSource = dt;
            producto.DataBind();
            if (producto.Rows.Count > 0)
            {
                producto.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }
        public void CargarHilos(GridView hilos)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_hilo";
            cmd.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            hilos.DataSource = dt;
            hilos.DataBind();
            if (hilos.Rows.Count > 0)
            {
                hilos.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();

        }
        public int ConsultarHiloPorRef(DTOInventario inven)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_hilo_por_referencia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", inven.Referencia_Hilo);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }
        public int ConsultarHiloPorRefConsumo(DTOInventario inven)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_hilo_por_referencia_consumo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", inven.Referencia_Hilo);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;
        }
        public int InsertarHilo(DTOInventario inven)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_hilo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ref_hi", inven.Referencia_Hilo);
                cmd.Parameters.AddWithValue("@code", inven.Code_Hilo);
                cmd.Parameters.AddWithValue("@tipo_hi", inven.Tipo_Hilo);
                cmd.Parameters.AddWithValue("@titulo_hi", inven.Titulo_Hilo);
                cmd.Parameters.AddWithValue("@color_hi", inven.Color_Hilo);
                cmd.Parameters.AddWithValue("@m_hilo", inven.Metros_Hilo);
                cmd.Parameters.AddWithValue("@valor", inven.ValorMetro);
                cmd.ExecuteNonQuery();
            }
            catch 
            {
                estado = 1;
                
            }
            cnx.Close();
            return estado;
        }

        public int CompletarRegistroHilosParaModificar(DTOInventario inven, TextBox codigo, TextBox referencia, DropDownList tipo, TextBox titulo, TextBox color, TextBox metrosh , TextBox valormetros)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_consultar_hilo_por_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", inven.Id_Hilo);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    codigo.Text = dr["id_hilo"].ToString();
                    referencia.Text = dr["referencia_hilo"].ToString();
                    tipo.SelectedIndex = tipo.Items.IndexOf(tipo.Items.FindByText(dr["tipo_hilo"].ToString()));
                    titulo.Text = dr["titulo_hilo"].ToString();
                    color.Text = dr["color_hilo"].ToString();
                    metrosh.Text = dr["metros_hilo"].ToString();
                    valormetros.Text = dr["valorMetro"].ToString();
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

        public int CompletarRegistroHilosParaModificarConsumo(DTOInventario inven, TextBox codigo, TextBox referencia, TextBox tipo, TextBox titulo, TextBox color, TextBox metros)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_buscar_hilo_para_consumo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ref", inven.Referencia_Hilo);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    codigo.Text = dr["id_hilo"].ToString();
                    referencia.Text = dr["referencia_hilo"].ToString();
                    tipo.Text = dr["tipo_hilo"].ToString();
                    titulo.Text = dr["titulo_hilo"].ToString();
                    color.Text = dr["color_hilo"].ToString();
                    metros.Text = dr["metros_hilo"].ToString();
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

        public void BuscarHiloYCargarloAlGV(DTOInventario inven, GridView hilo)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscar_hilo_por_referencia_para_cargarlo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", inven.Referencia_Hilo);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            hilo.DataSource = dt;
            hilo.DataBind();
            if (hilo.Rows.Count > 0)
            {
                hilo.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }
        public void BuscarHiloYCargarloAlGVConsumo(DTOInventario inven, GridView hilo)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_hilo_por_referencia_consumo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", inven.Referencia_Hilo);
            dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            hilo.DataSource = dt;
            hilo.DataBind();
            if (hilo.Rows.Count > 0)
            {
                hilo.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            cnx.Close();
        }
        public int ConsultarPedidoPorFecha(DTOInventario inven)
        {
            int existe = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_pedido_por_fecha";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fec", inven.Fecha_Pedido);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                existe++;
            }
            dr.Close();
            cnx.Close();
            return existe;

        }
        public int InsertarPedidoP(DTOInventario inven)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "[prc_insertar_pedido_producto]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_ped", inven.Id_Pedido);
                cmd.Parameters.AddWithValue("@id_prod", inven.Id_Producto);
                cmd.Parameters.AddWithValue("@cant_prod", inven.Cantidad_Producto);
                cmd.Parameters.AddWithValue("@valor", inven.ValorTotal_Producto);
                cmd.Parameters.AddWithValue("@valor_pedido", inven.ValorTotal);

                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;

            }
            cnx.Close();
            return estado;
        }
        public int InsertarPedidoH(DTOInventario inven)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_pedido_hilo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_ped", inven.Id_Pedido);
                cmd.Parameters.AddWithValue("@id_hi", inven.Id_Hilo);
                cmd.Parameters.AddWithValue("@metros", inven.Metros_Hilo);
                cmd.Parameters.AddWithValue("@valor", inven.ValorTotal_Hilo);
                cmd.Parameters.AddWithValue("@valor_pedido", inven.ValorTotal);

                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;

            }
            cnx.Close();
            return estado;
        }

        //MÉTODO LECTOR QR PRODUCTOS
        public List<DTOInventario> ConsultarProductoPorRefQR(DTOInventario inven)
        {
            List<DTOInventario> Producto = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_Consultar_producto_por_referencia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", inven.Referencia_Producto);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                DTOInventario Product = new DTOInventario();
                Product.Referencia_Producto = dr["referencia_producto"].ToString();
                Product.Nombre_Producto = dr["nombre_producto"].ToString();
                Product.Descripcion_Producto = dr["descripcion_producto"].ToString();
                Product.Novedad_Producto = dr["novedad_producto"].ToString();
                Product.Placa_Producto = dr["placa_producto"].ToString();
                Product.Serial_Producto = dr["serial_producto"].ToString();
                Product.Marca_Producto = dr["marca_producto"].ToString();
                Product.Cantidad_Producto = int.Parse(dr["cantidad_producto"].ToString());
                Product.Modelo_Producto = dr["modelo_producto"].ToString();
                Product.ValorUnitario_Producto = int.Parse(dr["valorUnitario_producto"].ToString());
                //Product.Consumible = int.Parse(dr["consumible"].ToString());
                Producto.Add(Product);
            }else
            {
                Producto.Add(null);
            }
            dr.Close();
            cnx.Close();
            return Producto;
        }

        //MÉTODO LECTOR QR HILOS
        public List<DTOInventario> ConsultarHiloPorGuidQR(DTOInventario inven)
        {
            List<DTOInventario> Hilo = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_hilo_por_guid";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@guid", inven.Code_Hilo);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                DTOInventario Hilos = new DTOInventario();
                Hilos.Referencia_Hilo = dr["referencia_hilo"].ToString();
                Hilos.Code_Hilo = dr["code_hilo"].ToString();
                Hilos.Tipo_Hilo = dr["tipo_hilo"].ToString();
                Hilos.Titulo_Hilo = int.Parse(dr["titulo_hilo"].ToString());
                Hilos.Color_Hilo = dr["color_hilo"].ToString();
                Hilos.Metros_Hilo = float.Parse(dr["metros_hilo"].ToString());
                Hilos.ValorMetro = float.Parse(dr["valorMetro"].ToString());
                Hilo.Add(Hilos);
            }
            else
            {
                Hilo.Add(null);
            }
            dr.Close();
            cnx.Close();
            return Hilo;
        }

        //Método get productos para informes
        public List<DTOInventario> GetInfoProductos()
        {
            List<DTOInventario> Productos = new List<DTOInventario>();
            cnx.Open();
            int count = 0;
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_cargar_productos_al_GV";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            /*if (dr.Read())
            {*/
            while (dr.Read())
            {
                DTOInventario Product = new DTOInventario();
                Product.Referencia_Producto = dr["referencia_producto"].ToString();
               //Product.Item_Producto = dr["item_producto"].ToString();
                Product.Nombre_Producto = dr["nombre_producto"].ToString();
                Product.Descripcion_Producto = dr["descripcion_producto"].ToString();
                Product.Novedad_Producto = dr["novedad_producto"].ToString();
                Product.Placa_Producto = dr["placa_producto"].ToString();
                Product.Serial_Producto = dr["serial_producto"].ToString();
                Product.Marca_Producto = dr["marca_producto"].ToString();
                Product.Modelo_Producto = dr["modelo_producto"].ToString();
                //Product.Unidad_Producto = int.Parse(dr["unidad_producto"].ToString());
                Product.ValorUnitario_Producto = int.Parse(dr["valorUnitario_producto"].ToString());
                string consumible = dr["consumible"].ToString();
                if (consumible == "True")
                {
                    Product.Consumible = 1;
                }
                else
                {
                    Product.Consumible = 0;
                }
                Productos.Add(Product);
                count++;
            }
            /*}
            else
            {
                Productos.Add(null);
            }*/
            dr.Close();
            cnx.Close();
            return Productos;
        }


        //POR ADAPTAR AL SISTEMA
        public void CargarPedidosProductosSelect(DropDownList pedidos)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_pedidos_select";
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            pedidos.DataTextField = "pedido";
            pedidos.DataValueField = "id_pedido";
            pedidos.DataSource = dt;
            pedidos.DataBind();
            cnx.Close();
        }

        public void CargarPedidosHilosSelect(DropDownList pedidos)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_pedidos_hilos_select";
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            pedidos.DataTextField = "pedido";
            pedidos.DataValueField = "id_pedido";
            pedidos.DataSource = dt;
            pedidos.DataBind();
            cnx.Close();
        }

        public List<DTOInventario> tablapedidosproductos(DTOInventario datos)
        {
            List<DTOInventario> pedidos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_verifi_pedido";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@refer_ped", datos.Id_Pedido);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                pedidos.Add(new DTOInventario { Id_Producto = int.Parse(dr["id_producto"].ToString()), Referencia_Producto = dr["referencia_producto"].ToString(), Nombre_Producto = dr["nombre_producto"].ToString(), Cantidad_Producto = int.Parse(dr["cantidad_producto"].ToString()), Estado_Pedido = dr["estado"].ToString() });
            }
            dr.Close();
            cnx.Close();
            return pedidos;
        }

        public List<DTOInventario> tablapedidoshilos(DTOInventario datos)
        {
            List<DTOInventario> pedidos = new List<DTOInventario>();
            var culture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            culture.NumberFormat.NumberDecimalSeparator = ".";
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_verifi_pedido_hilo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@refer_ped", datos.Id_Pedido);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                pedidos.Add(new DTOInventario { Id_Hilo = int.Parse(dr["id_hilo"].ToString()), Referencia_Hilo = dr["referencia_hilo"].ToString(), Titulo_Hilo = int.Parse(dr["titulo_hilo"].ToString()), Color_Hilo = dr["color_hilo"].ToString(), Metros_Hilo = float.Parse(dr["metros_hilo"].ToString(),culture), Estado_Pedido = dr["estado"].ToString() });
            }
            dr.Close();
            cnx.Close();
            return pedidos;
        }

        public List<string> registeringreso(DTOInventario datos)
        {
            List<string> datosregister = new List<string>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_register_ingreso";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@refer_pedido", datos.Id_Pedido);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                datosregister.Add(dr["Codigopedido"].ToString());
                datosregister.Add(dr["Codigoingreso"].ToString());
            }
            dr.Close();
            cnx.Close();
            return datosregister;
        }

        public int registeringresoproducto(DTOInventario datos)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_ingreso_producto";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idiped", datos.Id_Pedido);
                cmd.Parameters.AddWithValue("@idi", datos.Id_Ingreso);
                cmd.Parameters.AddWithValue("@idpro", datos.Id_Producto);
                cmd.Parameters.AddWithValue("@cantid_ingreso", datos.Cantidad_Ingreso);
                cmd.Parameters.AddWithValue("@cantid_defectuoso", datos.Cantidad_Defectuoso);
                cmd.Parameters.AddWithValue("@detalles", datos.Detalles_Ingreso);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public int registeringresohilo(DTOInventario datos)
        {
            int estado = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_ingreso_hilo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idiped", datos.Id_Pedido);
                cmd.Parameters.AddWithValue("@idi", datos.Id_Ingreso);
                cmd.Parameters.AddWithValue("@idhi", datos.Id_Hilo);
                cmd.Parameters.AddWithValue("@cantid_ingreso", datos.Cantidad_Ingreso_Hilo);
                cmd.Parameters.AddWithValue("@cantid_defectuoso", datos.Cantidad_Defectuoso_Hilo);
                cmd.Parameters.AddWithValue("@detalles", datos.Detalles_Ingreso);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }
        public List<DTOInventario> consultarHiloReferenciaConsumo(DTOInventario datos)
        {
            List<DTOInventario> hilo = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_hilo_por_referencia_consumo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", datos.Referencia_Hilo);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                hilo.Add(new DTOInventario
                {
                    Id_Hilo = int.Parse(dr["id_hilo"].ToString()),
                    Referencia_Hilo = dr["referencia_hilo"].ToString(),
                    Tipo_Hilo = dr["tipo_hilo"].ToString(),
                    Titulo_Hilo = int.Parse(dr["titulo_hilo"].ToString()),
                    Color_Hilo = dr["color_hilo"].ToString(),
                    Metros_Hilo = float.Parse(dr["metros_hilo"].ToString())
                });
            }
            cnx.Close();
            dr.Close();
            return hilo;
            
        }

        public List<DTOInventario> consultarHiloIdConsumo(DTOInventario datos)
        {
            List<DTOInventario> hilo = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscar_hilo_para_consumo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", datos.Id_Hilo);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                 hilo.Add(new DTOInventario
                {
                    Id_Hilo = int.Parse(dr["id_hilo"].ToString()),
                    Referencia_Hilo = dr["referencia_hilo"].ToString(),
                    Tipo_Hilo = dr["tipo_hilo"].ToString(),
                    Titulo_Hilo = int.Parse(dr["titulo_hilo"].ToString()),
                    Color_Hilo = dr["color_hilo"].ToString(),
                    Metros_Hilo = float.Parse(dr["metros_hilo"].ToString())
                });
            }
            cnx.Close();
            dr.Close();
            return hilo;
        }

        public List<DTOInventario> registrarHilosPaso(DTOInventario datos)
        {
            int estado = 0;
            List<DTOInventario> hilos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_insertar_paso";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", datos.Id_Hilo);
            cmd.Parameters.AddWithValue("@ref", datos.Referencia_Hilo);
            cmd.Parameters.AddWithValue("@cant", datos.Metros_Hilo);
            cmd.Parameters.AddWithValue("@con", datos.Consumo);
            cmd.Parameters.AddWithValue("@res", datos.Resta);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch 
            {
                estado = 1;
            }
            if (estado == 0)
            {
                cmd.CommandText = "select * from tbl_paso";
                cmd.CommandType = CommandType.Text;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    hilos.Add(new DTOInventario
                    {
                        Id_Hilo = int.Parse(dr["id"].ToString()),
                        Referencia_Hilo = dr["referencia"].ToString(),
                        Metros_Hilo = float.Parse(dr["cantidad"].ToString()),
                        Consumo = float.Parse(dr["consumo"].ToString()),
                        Resta = float.Parse(dr["resta"].ToString())
                    });
                }
                dr.Close();
            }
            cnx.Close();
            return hilos;
            
        }

        public int consultarMaximoConsumo()
        {
            int id_con = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_maximo_consumo";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id_con = int.Parse(dr["id_consumo"].ToString());
            }
            cnx.Close();
            dr.Close();
            return id_con;

        }

        public int consultarMaximoInventarioHilo()
        {
            int id_inven = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_maximo_id_inventario_hilo";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id_inven = int.Parse(dr["id_inventario"].ToString());
            }
            cnx.Close();
            dr.Close();
            return id_inven;
        }

        public void InsertarConsumoHilo(DTOInventario datos)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_insertar_consumo_hilos";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_cons", datos.Id_Consumo);
            cmd.Parameters.AddWithValue("@id_inven", datos.Id_Inventario);
            cmd.Parameters.AddWithValue("@id_h", datos.Id_Hilo);
            cmd.Parameters.AddWithValue("@cons", datos.Consumo);
            try
            {
                cmd.ExecuteNonQuery();
            }catch (Exception ex)
            {
                throw ex;
            }
            cnx.Close();

        }

        public int EliminarPaso()
        {
            int estado = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "Delete from tbl_paso";
            cmd.CommandType = CommandType.Text;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            cnx.Close();
            return estado;
        }

        public List<DTOInventario> consultarTodosHilos()
        {
            List<DTOInventario> todosHilos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultarTodosHilos";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                todosHilos.Add(new DTOInventario
                {
                    Id_Hilo = int.Parse(dr["id_hilo"].ToString()),
                    Referencia_Hilo = dr["referencia_hilo"].ToString(),
                    Tipo_Hilo = dr["tipo_hilo"].ToString(),
                    Titulo_Hilo = int.Parse(dr["titulo_hilo"].ToString()),
                    Color_Hilo = dr["color_hilo"].ToString(),
                    Metros_Hilo = float.Parse(dr["metros_hilo"].ToString())
                });
            }
            cnx.Close();
            dr.Close();
            return todosHilos;
        }

        public List<DTOInventario> olvidarHilo(DTOInventario datos)
        {
            int estado = 0;
            List<DTOInventario> hilos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_olvidar_registro_paso";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", datos.Id_Hilo);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            if (estado == 0)
            {
                cmd.CommandText = "select * from tbl_paso";
                cmd.CommandType = CommandType.Text;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    hilos.Add(new DTOInventario
                    {
                        Id_Hilo = int.Parse(dr["id"].ToString()),
                        Referencia_Hilo = dr["referencia"].ToString(),
                        Metros_Hilo = float.Parse(dr["cantidad"].ToString()),
                        Consumo = float.Parse(dr["consumo"].ToString()),
                        Resta = float.Parse(dr["resta"].ToString())
                    });
                }
                dr.Close();
            }
            
            cnx.Close();
            return hilos;

        }

        public List<DTOInventario> consultarPasoParaFinalizarConsumo()
        {
            List<DTOInventario> lista = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "SELECT * FROM tbl_paso";
            cmd.CommandType = CommandType.Text;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(new DTOInventario
                {
                    Id_Hilo = int.Parse(dr["id"].ToString()),
                    Id_Producto = int.Parse(dr["id"].ToString()),
                    Consumo = float.Parse(dr["consumo"].ToString())
                });
            }
            cnx.Close();
            dr.Close();
            return lista;
        }

        public List<DTOInventario> buscarProductoConsumo(DTOInventario datos)
        {
            List<DTOInventario> producto = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscar_Producto_Consumo";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", datos.Referencia_Producto);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                producto.Add(new DTOInventario
                {
                    Id_Producto = int.Parse(dr["id_producto"].ToString()),
                    Referencia_Producto = dr["referencia_producto"].ToString(),
                    Nombre_Producto = dr["nombre_producto"].ToString(),
                    Placa_Producto = dr["placa_producto"].ToString(),
                    Cantidad_Producto = float.Parse(dr["cantidad_producto"].ToString())
                });
            }
                
            
            cnx.Close();
            dr.Close();
            return producto;


        }

        public List<DTOInventario> buscarProductoConsumoId(DTOInventario datos)
        {
            List<DTOInventario> producto = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscar_Producto_Consumo_Id";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", datos.Id_Producto);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                producto.Add(new DTOInventario
                {
                    Id_Producto = int.Parse(dr["id_producto"].ToString()),
                    Referencia_Producto = dr["referencia_producto"].ToString(),
                    Nombre_Producto = dr["nombre_producto"].ToString(),
                    Descripcion_Producto = dr["descripcion_producto"].ToString(),
                    Novedad_Producto = dr["novedad_producto"].ToString(),
                    Placa_Producto = dr["placa_producto"].ToString(),
                    Serial_Producto = dr["serial_producto"].ToString(),
                    Modelo_Producto = dr["modelo_producto"].ToString(),
                    Marca_Producto = dr["marca_producto"].ToString(),
                    Cantidad_Producto = float.Parse(dr["cantidad_producto"].ToString())
                });
            }
            cnx.Close();
            dr.Close();
            return producto;


        }

        public List<DTOInventario> buscarTodosProductos()
        {
            List<DTOInventario> productos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_Todos_Productos_Consumo";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                productos.Add(new DTOInventario
                {
                    Id_Producto = int.Parse(dr["id_producto"].ToString()),
                    Referencia_Producto = dr["referencia_producto"].ToString(),
                    Nombre_Producto = dr["nombre_producto"].ToString(),
                    Descripcion_Producto = dr["descripcion_producto"].ToString(),
                    Novedad_Producto = dr["novedad_producto"].ToString(),
                    Placa_Producto = dr["placa_producto"].ToString(),
                    Serial_Producto = dr["serial_producto"].ToString(),
                    Modelo_Producto = dr["modelo_producto"].ToString(),
                    Marca_Producto = dr["marca_producto"].ToString(),
                    Cantidad_Producto = float.Parse(dr["cantidad_producto"].ToString())
                });
            }
            dr.Close();
            cnx.Close();
            return productos;
        }
        public List<DTOInventario> registrarProductoPaso(DTOInventario datos)
        {
            int estado = 0;
            List<DTOInventario> productos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_insertar_paso";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", datos.Id_Producto);
            cmd.Parameters.AddWithValue("@ref", datos.Referencia_Producto);
            cmd.Parameters.AddWithValue("@cant", datos.Cantidad_Producto);
            cmd.Parameters.AddWithValue("@con", datos.Consumo);
            cmd.Parameters.AddWithValue("@res", datos.Resta);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            if (estado == 0)
            {
                cmd.CommandText = "select * from tbl_paso";
                cmd.CommandType = CommandType.Text;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    productos.Add(new DTOInventario
                    {
                        Id_Producto = int.Parse(dr["id"].ToString()),
                        Referencia_Producto = dr["referencia"].ToString(),
                        Cantidad_Producto = float.Parse(dr["cantidad"].ToString()),
                        Consumo = float.Parse(dr["consumo"].ToString()),
                        Resta = float.Parse(dr["resta"].ToString())
                    });
                }
                dr.Close();
            }
            cnx.Close();
            return productos;

        }

        public List<DTOInventario> olvidarProducto(DTOInventario datos)
        {
            int estado = 0;
            List<DTOInventario> productos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_olvidar_registro_paso";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", datos.Id_Producto);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = 1;
            }
            if (estado == 0)
            {
                cmd.CommandText = "select * from tbl_paso";
                cmd.CommandType = CommandType.Text;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    productos.Add(new DTOInventario
                    {
                        Id_Hilo = int.Parse(dr["id"].ToString()),
                        Referencia_Hilo = dr["referencia"].ToString(),
                        Metros_Hilo = float.Parse(dr["cantidad"].ToString()),
                        Consumo = float.Parse(dr["consumo"].ToString()),
                        Resta = float.Parse(dr["resta"].ToString())
                    });
                }
                dr.Close();
            }

            cnx.Close();
            return productos;

        }

        public int consultarMaximoInventarioProducto()
        {
            int id_inventario = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_maximo_id_inventario_producto";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id_inventario = int.Parse(dr["id_inventario"].ToString());
            }
            dr.Close();
            cnx.Close();
            return id_inventario;
        }

        public void InsertarConsumoProducto(DTOInventario datos)
        {
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_insertar_consumo_producto";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id_cons", datos.Id_Consumo);
            cmd.Parameters.AddWithValue("@id_inven", datos.Id_Inventario);
            cmd.Parameters.AddWithValue("@id_prod", datos.Id_Hilo);
            cmd.Parameters.AddWithValue("@cons", datos.Consumo);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            cnx.Close();

        }

        public List<DTOInventario> buscarHiloPedidoRef(DTOInventario datos)
        {
            List<DTOInventario> hilo = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscarHiloPedidoRef";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ref", datos.Referencia_Hilo);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                hilo.Add(new DTOInventario
                {
                    Id_Hilo = int.Parse(dr["id_hilos"].ToString()),
                    Referencia_Hilo = dr["referencia_hilo"].ToString(),
                    Tipo_Hilo = dr["tipo_hilo"].ToString(),
                    Titulo_Hilo = int.Parse(dr["titulo_hilo"].ToString()),
                    Color_Hilo = dr["color_hilo"].ToString(),
                    ValorMetro = float.Parse(dr["valorMetro"].ToString())
                });
            }
            dr.Close();
            cnx.Close();
            return hilo;
        }

        public List<DTOInventario> buscarHiloPedidoId(DTOInventario datos)
        {
            List<DTOInventario> hilo = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscarHiloPedidoId";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", datos.Id_Hilo);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                hilo.Add(new DTOInventario
                {
                    Id_Hilo = int.Parse(dr["id_hilos"].ToString()),
                    Referencia_Hilo = dr["referencia_hilo"].ToString(),
                    Tipo_Hilo = dr["tipo_hilo"].ToString(),
                    Titulo_Hilo = int.Parse(dr["titulo_hilo"].ToString()),
                    Color_Hilo = dr["color_hilo"].ToString(),
                    ValorMetro = float.Parse(dr["valorMetro"].ToString())
                });
            }

            dr.Close();
            cnx.Close();
            return hilo;

        }

        public List<DTOInventario> buscarTodosHilosP()
        {
            List<DTOInventario> hilos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscarTodosHilosP";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                hilos.Add(new DTOInventario
                {
                    Id_Hilo = int.Parse(dr["id_hilos"].ToString()),
                    Referencia_Hilo = dr["referencia_hilo"].ToString(),
                    Tipo_Hilo = dr["tipo_hilo"].ToString(),
                    Titulo_Hilo = int.Parse(dr["titulo_hilo"].ToString()),
                    Color_Hilo = dr["color_hilo"].ToString(),
                    ValorMetro = float.Parse(dr["valorMetro"].ToString())
                });
            }

            dr.Close();
            cnx.Close();
            return hilos;
        }

        public int consultarMaximoPedido()
        {
            int id_pedido = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultarMaximoPedido";
            cmd.CommandType = CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id_pedido = int.Parse(dr["id_pedido"].ToString());
            }
            dr.Close();
            cnx.Close();
            return id_pedido;
            
        }

        public List<DTOInventario> registrarHiloP(DTOInventario datos)
        {
            bool estado = true;
            List<DTOInventario> hilos = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_insertar_paso_pedido";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", datos.Id_Hilo);
            cmd.Parameters.AddWithValue("@cantidad", datos.Metros_Hilo);
            cmd.Parameters.AddWithValue("@valor", datos.ValorTotal_Hilo);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = false;
            }
            if (estado)
            {
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = cnx;
                cmd2.CommandText = "prc_consultar_paso_pedido";
                cmd2.CommandType = CommandType.StoredProcedure;
                dr = cmd2.ExecuteReader();
                while (dr.Read())
                {
                    hilos.Add(new DTOInventario
                    {
                        Id_Hilo = int.Parse(dr["id"].ToString()),
                        Metros_Hilo = float.Parse(dr["cantidad"].ToString()),
                        ValorTotal_Hilo = float.Parse(dr["valor"].ToString()),
                        ValorTotal = float.Parse(dr["valor_total"].ToString())
                    });
                }
                dr.Close();

            }
            cnx.Close();
            return hilos;
        }

        public float consultarTotal()
        {
            float Total = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "select MAX(valor_total) as valor_total from tbl_paso";
            cmd.CommandType = CommandType.Text;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Total = float.Parse(dr["valor_total"].ToString());
            }
            dr.Close();
            cnx.Close();
            return Total;
        }

        public bool InsertarPedido()
        {
            bool estado = true;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_Insertar_pedido";
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = false;
            }
            cnx.Close();
            return estado;


        }

        public List<DTOInventario> consultarPasoParaFinalizarPedido()
        {
            List<DTOInventario> lista = new List<DTOInventario>();
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "SELECT * FROM tbl_paso";
            cmd.CommandType = CommandType.Text;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(new DTOInventario
                {
                    Id_Hilo = int.Parse(dr["id"].ToString()),
                    Id_Producto = int.Parse(dr["id"].ToString()),
                    Metros_Hilo = float.Parse(dr["cantidad"].ToString()),
                    Cantidad_Producto = float.Parse(dr["cantidad"].ToString()),
                    ValorTotal_Hilo = float.Parse(dr["valor"].ToString()),
                    ValorTotal_Producto = float.Parse(dr["valor"].ToString()),
                    ValorTotal = float.Parse(dr["valor_total"].ToString())
                });
            }
            cnx.Close();
            dr.Close();
            return lista;
        }

        public List<DTOInventario> buscarProductoPRef(DTOInventario datos)
        {
            //Instancia de objetos 
            cmd = new SqlCommand();
            List<DTOInventario> producto = new List<DTOInventario>();

            //Abrir conexión
            cnx.Open();

            //Dar valores al SqlCommand
            cmd.Connection = cnx;
            cmd.CommandText = "buscarProductoPRef";
            cmd.CommandType = CommandType.StoredProcedure;

            //Llenar parametros para el procedimiento almacenados
            cmd.Parameters.AddWithValue("@ref", datos.Referencia_Producto);

            //Ejecutar el comando dentro de un DataReader
            dr = cmd.ExecuteReader();

            //Mientras el DataReader pueda leerse, recorrer los datos e insertarlos en el List<DTOInventario>
            while (dr.Read())
            {
                producto.Add(new DTOInventario
                {
                    Id_Producto = int.Parse(dr["id_producto"].ToString()),
                    Referencia_Producto = dr["referencia_producto"].ToString(),
                    Nombre_Producto = dr["nombre_producto"].ToString(),
                    Descripcion_Producto = dr["descripcion_producto"].ToString(),
                    ValorUnitario_Producto = int.Parse(dr["valorUnitario"].ToString())
                });
            }

            //Cerrar la conexión
            cnx.Close();

            //Cerrar el DataReader
            dr.Close();

            //Retornar List<DTOInventario>
            return producto;
        }

        public List<DTOInventario> buscarProductoPId(DTOInventario datos)
        {
            //Instanciar objetos 
            cmd = new SqlCommand();
            List<DTOInventario> producto = new List<DTOInventario>();

            //Abrir conexión
            cnx.Open();

            //Dar valores al commando
            cmd.Connection = cnx;
            cmd.CommandText = "buscarProductoPId";
            cmd.CommandType = CommandType.StoredProcedure;

            //Llenar parametros
            cmd.Parameters.AddWithValue("@id", datos.Id_Producto);

            //Ejecutar comando y agregar resultado al DataReader
            dr = cmd.ExecuteReader();

            //Mientras dr sea leible añadir campos al List
            while (dr.Read())
            {
                producto.Add(new DTOInventario
                {
                    Id_Producto = int.Parse(dr["id_producto"].ToString()),
                    Referencia_Producto = dr["referencia_producto"].ToString(),
                    Nombre_Producto = dr["nombre_producto"].ToString(),
                    Descripcion_Producto = dr["descripcion_producto"].ToString(),
                    ValorUnitario_Producto = int.Parse(dr["valorUnitario"].ToString())
                });
            }

            //Cerrar conexión y DataReader
            dr.Close();
            cnx.Close();

            //Retornar lista
            return producto;
        }

        public List<DTOInventario> buscarTodosProductosP()
        {
            //Instanciar objetos
            cmd = new SqlCommand();
            List<DTOInventario> productos = new List<DTOInventario>();

            //Abrir conexión
            cnx.Open();

            //Dar valores al comando
            cmd.Connection = cnx;
            cmd.CommandText = "prc_buscarTodosProductosP";
            cmd.CommandType = CommandType.StoredProcedure;

            //Ejecutar dentro del DataReader
            dr = cmd.ExecuteReader();

            //Mientras el dr sea leible agregar al list
            while (dr.Read())
            {
                productos.Add(new DTOInventario
                {
                    Id_Producto = int.Parse(dr["id_producto"].ToString()),
                    Referencia_Producto = dr["referencia_producto"].ToString(),
                    Nombre_Producto = dr["nombre_producto"].ToString(),
                    Descripcion_Producto = dr["descripcion_producto"].ToString(),
                    ValorUnitario_Producto = int.Parse(dr["valorUnitario"].ToString())
                });
            }

            //Cerrar conexión y DataReader
            dr.Close();
            cnx.Close();

            //Retornar Lista
            return productos;
        }

        public List<DTOInventario> registrarProductoPasoPed(DTOInventario datos)
        {
            //Instanciar objetos
            cmd = new SqlCommand();
            SqlCommand cmd2 = new SqlCommand();
            List<DTOInventario> productos = new List<DTOInventario>();
            bool estado = true;

            //Abrir conexión
            cnx.Open();

            //Valores del command
            cmd.Connection = cnx;
            cmd.CommandText = "prc_insertar_paso_pedido";
            cmd.CommandType = CommandType.StoredProcedure;

            //Llenar parametros
            cmd.Parameters.AddWithValue("@id", datos.Id_Producto);
            cmd.Parameters.AddWithValue("@cantidad", datos.Cantidad_Producto);
            cmd.Parameters.AddWithValue("@valor", datos.ValorTotal_Producto);

            //Intentar ejecutar command
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                estado = false;

            }

            if (estado)
            {
                cmd2.Connection = cnx;
                cmd2.CommandText = "prc_consultar_paso_pedido";
                cmd2.CommandType = CommandType.StoredProcedure;

                dr = cmd2.ExecuteReader();

                while (dr.Read())
                {
                    productos.Add(new DTOInventario
                    {
                        Id_Producto = int.Parse(dr["id"].ToString()),
                        Cantidad_Producto = float.Parse(dr["cantidad"].ToString()),
                        ValorTotal_Producto = float.Parse(dr["valor"].ToString()),
                        ValorTotal = float.Parse(dr["valor_total"].ToString())
                    });
                }

                dr.Close();

            }
            cnx.Close();
            return productos;
        }

        public int ConsultarInventarioPorReferencia(DTOInventario invent)
        {
            int exist = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_invent_por_referencia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@refer", invent.Referencia_Inventario);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                exist++;
            }
            dr.Close();
            cnx.Close();
            return exist;
        }

        public int RegistrarInventario(DTOInventario invent)
        {
            int result = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_inventario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@refer_inv", invent.Referencia_Inventario);
                cmd.Parameters.AddWithValue("@detalles", invent.Observacion_Inventario);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                result = 1;
            }
            dr.Close();
            cnx.Close();
            return result;
        }

        public int ObtenerIdInventarioPorReferencia(DTOInventario invent)
        {
            int id = 0;
            cnx.Open();
            cmd = new SqlCommand();
            cmd.Connection = cnx;
            cmd.CommandText = "prc_consultar_invent_por_referencia";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@refer", invent.Referencia_Inventario);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = int.Parse(dr["id_inventario"].ToString());
            }
            dr.Close();
            cnx.Close();
            return id;
        }

        public int RegistrarInventarioProducto(DTOInventario invent)
        {
            int result = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_inventario_productos";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_inven", invent.Id_Inventario);
                cmd.Parameters.AddWithValue("@id_prod", invent.Id_Producto);
                cmd.Parameters.AddWithValue("@cantid_regis", invent.Cantidad_Producto);
                cmd.Parameters.AddWithValue("@cantid_actual", invent.Cantidad_Producto);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                result = 1;
            }
            dr.Close();
            cnx.Close();
            return result;
        }

        public int RegistrarInventarioHilo(DTOInventario invent)
        {
            int result = 0;
            cnx.Open();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "prc_insertar_inventario_hilos";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_inven", invent.Id_Inventario);
                cmd.Parameters.AddWithValue("@id_hilo", invent.Id_Hilo);
                cmd.Parameters.AddWithValue("@m_regis", invent.Metros_Hilo);
                cmd.Parameters.AddWithValue("@m_actual", invent.Metros_Hilo);
                cmd.ExecuteNonQuery();
            }
            catch
            {
                result = 1;
            }
            dr.Close();
            cnx.Close();
            return result;
        }
    }
    
}
