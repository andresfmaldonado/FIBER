using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace HEXI_ASP.NET
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "ServiceLectorQR" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione ServiceLectorQR.svc o ServiceLectorQR.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class ServiceLectorQR : IServiceLectorQR
    {
        public string GetData(int value)
        {
            throw new NotImplementedException();
        }

        public List<DTOInventario> GetProduct(string referencia)
        {
            DTOInventario Referproducto = new DTOInventario();
            CADInventario Process = new CADInventario();
            Referproducto.Referencia_Producto = referencia;
            List<DTOInventario> Product = Process.ConsultarProductoPorRefQR(Referproducto);
            return Product;
        }

        public List<string> idenu (string c, string p, string r)
        {
            List<string> userl = new List<string>();
            DTOUsuario user = new DTOUsuario();
            user.Correo = c;
            user.Contraseña = p;
            user.Nombre_rol = r;
            CADUsuario procesos = new CADUsuario();
            try
            {
                if (procesos.ConsultarUsuarioPorCorreo(user) > 0)
                {
                    if ((procesos.IngresoAlSistema(user)) == 1)
                    {
                        string id_user = procesos.ObtenerIDUsuarioAlIngresarAlSistema(user);
                        userl.Add("1");
                        userl.Add(id_user);

                    }
                    if ((procesos.IngresoAlSistema(user)) == 2)
                    {
                        userl.Add("2");
                    }
                    if ((procesos.IngresoAlSistema(user)) == 3)
                    {
                        userl.Add("3");
                    }
                    if ((procesos.IngresoAlSistema(user)) == 10)
                    {
                        userl.Add("10");
                    }
                }else
                {
                    userl.Add("0");
                }
                

            }
            catch
            {
                userl = null;
            }
            return userl;
        }

        public string contacto(string name, string email, string mensaje)
        {
            string result;
            DTOUsuario infor = new DTOUsuario();
            CADUsuario user = new CADUsuario();
            infor.Nombre_contacto = name;
            infor.Correo_contacto = email;
            infor.Mensaje_contacto = mensaje;
            try
            {
                if (user.EnviarCorreoContacto(infor) == true)
                {
                    user.EnviarCorreoConfirmaciónEnvíoMensajeContacto(infor);
                    result = "true";
                }
                else
                {
                    result = "false";
                }
            }
            catch
            {
                result = null;
            }
            return result;
        }

        public string recup(string correou)
        {
            string estado;
            DTOUsuario user = new DTOUsuario();
            user.Correo = correou;
            CADUsuario process = new CADUsuario();
            if (process.ConsultarUsuarioPorCorreo(user) != 0)
            {
                if ((process.EnviarCorreoRestablecimientoContraseña(user)) == true)
                {
                    estado = "correcto";
                }
                else
                {
                    estado = "error";
                }
            }
            else
            {
                estado = "noexiste";
            }
            return estado;
        }

        public List<DTOInventario> GetProductsInform()
        {
            CADInventario Process = new CADInventario();
            List<DTOInventario> Products = Process.GetInfoProductos();
            return Products;
        }

        public List<string> GetUsersInform()
        {
            CADUsuario user = new CADUsuario();
            List<string> userestadist = user.estadisticasUsers();
            return userestadist;
        }

        public List<DTOInventario> tablapedidop(int referencia)
        {
            List<DTOInventario> tabla = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Pedido = referencia;
            tabla = proceso.tablapedidosproductos(datos);
            return tabla;
        }

        public List<DTOInventario> tablapedidoh(int referencia)
        {
            List<DTOInventario> tabla = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Pedido = referencia;
            tabla = proceso.tablapedidoshilos(datos);
            return tabla;
        }

        public List<string> regisingre(int referenciap)
        {
            List<string> respuesta = new List<string>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Pedido = referenciap;
            respuesta = proceso.registeringreso(datos);
            return respuesta;
        }

        public int regisingreproduct(int idiped, int idi, int idpro, int cantid_ingreso, int cantidad_defectuosa, string detalles)
        {
            int result = 0;
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Pedido = idiped;
            datos.Id_Ingreso = idi;
            datos.Id_Producto = idpro;
            datos.Cantidad_Ingreso = cantid_ingreso;
            datos.Cantidad_Defectuoso = cantidad_defectuosa;
            datos.Detalles_Ingreso = detalles;
            result = proceso.registeringresoproducto(datos);
            return result;
        }

        public int regisingrehilo(int idiped, int idi, int idh, float cantid_ingreso, float cantidad_defectuosa, string detalles)
        {
            int result = 0;
            var culture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            culture.NumberFormat.NumberDecimalSeparator = ".";
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Pedido = idiped;
            datos.Id_Ingreso = idi;
            datos.Id_Hilo = idh;
            datos.Cantidad_Ingreso_Hilo = cantid_ingreso;
            datos.Cantidad_Defectuoso_Hilo = cantidad_defectuosa;
            datos.Detalles_Ingreso = detalles;
            result = proceso.registeringresohilo(datos);
            return result;
        }

        public List<DTOInventario> hilo(string referencia){
            List<DTOInventario> hilo = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Referencia_Hilo = referencia;
            hilo = proceso.consultarHiloReferenciaConsumo(datos);
            return hilo;
        }

        public List<DTOInventario> hilo_por_id(int id)
        {
            List<DTOInventario> hilo = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Hilo = id;
            hilo = proceso.consultarHiloIdConsumo(datos);
            return hilo;
        }

        
        public List<DTOInventario> registrarHilo(int id, string referencia, float metros, float consumo)
        {
            
            List<DTOInventario> hilos = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Hilo = id;
            datos.Referencia_Hilo = referencia;
            datos.Metros_Hilo = metros;
            datos.Consumo = consumo;
            datos.Resta = metros - consumo;
            hilos = proceso.registrarHilosPaso(datos);
            return hilos;
        }

        public List<DTOInventario> verTodosHilos()
        {
            List<DTOInventario> todosHilos = new List<DTOInventario>();
            CADInventario proceso = new CADInventario();
            todosHilos = proceso.consultarTodosHilos();
            return todosHilos;
        }

        public List<DTOInventario> olvidarHilo(int id)
        {
   
            List<DTOInventario> hilos = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Hilo = id;
            hilos = proceso.olvidarHilo(datos);
            
            return hilos;
        }

        public List<DTOInventario> buscarProducto(string referencia)
        {
            List<DTOInventario> producto = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario procesos = new CADInventario();

            datos.Referencia_Producto = referencia;

            producto = procesos.buscarProductoConsumo(datos);

            return producto;
        }

        public List<DTOInventario> buscarProductoId(int id)
        {
            List<DTOInventario> producto = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario procesos = new CADInventario();

            datos.Id_Producto = id;

            producto = procesos.buscarProductoConsumoId(datos);

            return producto;
        }

        public List<DTOInventario> buscarTodosProductos()
        {
            List<DTOInventario> producto = new List<DTOInventario>();
            CADInventario procesos = new CADInventario();

            producto = procesos.buscarTodosProductos();

            return producto;
        }

        public List<DTOInventario> registrarProducto(int id, string referencia, float cantidad, float consumo)
        {

            List<DTOInventario> producto = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Producto = id;
            datos.Referencia_Producto = referencia;
            datos.Cantidad_Producto = cantidad;
            datos.Consumo = consumo;
            datos.Resta = cantidad - consumo;
            producto = proceso.registrarProductoPaso(datos);
            return producto;
        }

        public List<DTOInventario> buscarHiloPedido(string referencia)
        {
            List<DTOInventario> hilo = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            datos.Referencia_Hilo = referencia;
            CADInventario proceso = new CADInventario();
            hilo = proceso.buscarHiloPedidoRef(datos);
            return hilo;
        }

        public List<DTOInventario> buscarHiloPedidoId(int id)
        {
            List<DTOInventario> hilo = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            datos.Id_Hilo = id;
            CADInventario proceso = new CADInventario();
            hilo = proceso.buscarHiloPedidoId(datos);
            return hilo;
        }

        public List<DTOInventario> buscarTodosHilosP()
        {
            List<DTOInventario> hilos = new List<DTOInventario>();
            CADInventario proceso = new CADInventario();
            hilos = proceso.buscarTodosHilosP();
            return hilos;
        }

        public List<DTOInventario> registrarHiloP(int id, float metros, float valor)
        {
            List<DTOInventario> hilos = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario proceso = new CADInventario();
            datos.Id_Pedido = proceso.consultarMaximoPedido();
            datos.Id_Hilo = id;
            datos.Metros_Hilo = metros;
            datos.ValorTotal_Hilo = metros * valor;
            hilos = proceso.registrarHiloP(datos);
            return hilos;
        }

        public float consultarTotal()
        {
            float Total = 0;
            CADInventario proceso = new CADInventario();
            Total = proceso.consultarTotal();
            return Total;

        }


    }
}
