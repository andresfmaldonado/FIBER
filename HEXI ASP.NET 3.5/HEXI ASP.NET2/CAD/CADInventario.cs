﻿using DTO;
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
                cmd.CommandText = "prc_insertar_pedido_p";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fec", inven.Fecha_Pedido);
                cmd.Parameters.AddWithValue("@desc", inven.Id_Producto);
                cmd.Parameters.AddWithValue("@cant", inven.Cantidad_Producto);
                
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
                cmd.CommandText = "prc_insertar_pedido_h";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fec", inven.Fecha_Pedido);
                cmd.Parameters.AddWithValue("@desc", inven.Id_Hilo);
                //cmd.Parameters.AddWithValue("@cant", inven.Cantidad_Hilo);

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

    }
    
}
