using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DTOInventario
    {
        //tbl_Inventario
        private int id_inventario;
        private string referencia_inventario;
        private string observacion_inventario;
        private DateTime fecha_inventario;

        public int Id_Inventario { get; set; }
        public string Observacion_Inventario { get; set; }
        public DateTime Fecha_Inventario { get; set; }

        //tbl_Productos
        private int id_producto;
        private string referencia_producto;
        private string nombre_producto;
        private string descripcion_producto;
        private string novedad_producto;
        private string placa_producto;
        private string serial_producto;
        private string marca_producto;
        private string modelo_producto;
        private int valorUnitario_producto;
        private int consumible;

        public int Id_Producto { get; set; }
        public string Referencia_Producto { get; set; }
        public string Nombre_Producto { get; set; }
        public string Descripcion_Producto { get; set; }
        public string Novedad_Producto { get; set; }
        public string Placa_Producto { get; set; }
        public string Serial_Producto { get; set; }
        public string Marca_Producto { get; set; }
        public string Modelo_Producto { get; set; }
        public int ValorUnitario_Producto { get; set; }
        public int Consumible { get; set; }

        //tbl_hilos
        private int id_hilo;
        private string referencia_hilo;
        private string code_hilo;
        private string tipo_hilo;
        private int titulo_hilo;
        private string color_hilo;
        private float valorMetro;

        public int Id_Hilo { get; set; }
        public string Referencia_Hilo { get; set; }
        public string Code_Hilo { get; set; }
        public string Tipo_Hilo { get; set; }
        public int Titulo_Hilo { get; set; }
        public string Color_Hilo { get; set; }
        public float ValorMetro { get; set; }

        //tbl_inventario_producto
        private int cantidad_producto;

        public int Cantidad_Producto { get; set; }

        //tbl_inventario_hilo
        private float metros_hilo;

        public float Metros_Hilo { get; set; }

        //tbl_pedidos
        private int id_pedido;
        private DateTime fecha_pedido;
        private float valorTotal;
        private string estado_pedido;
        

        public int Id_Pedido { get; set; }
        public DateTime Fecha_Pedido { get; set; }
        public float ValorTotal { get; set; }
        public string Estado_Pedido { get; set; }
        

        //tbl_ingreso

        private int id_ingreso;


        public int Id_Ingreso { get; set; }

        //tbl_ingreso_productos_e_hilos

        private int cantidad_ingreso;
        private int cantidad_defectuoso;
        private float cantidad_ingreso_hilo;
        private float cantidad_defectuoso_hilo;
        private string detalles_ingreso;

        public int Cantidad_Ingreso { get; set; }
        public int Cantidad_Defectuoso { get; set; }
        public float Cantidad_Ingreso_Hilo { get; set; }
        public float Cantidad_Defectuoso_Hilo { get; set; }
        public string Detalles_Ingreso { get; set; }


        //tbl_pedido_producto
        private float valorTotal_producto;

        public float ValorTotal_Producto { get; set; }

        //tbl_pedido_hilo
        private float valorTotal_hilo;

        public float ValorTotal_Hilo { get; set; }

        //tbl_Consumo
        private int id_consumo;
        private DateTime fecha_consumo;
        private int id_usuario;

        public int Id_Consumo { get; set; }
        public DateTime Fecha_Consumo { get; set; }
        public int Id_Usuario { get; set; }





    }
}
