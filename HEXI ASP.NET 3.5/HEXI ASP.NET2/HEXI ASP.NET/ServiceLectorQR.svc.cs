using CAD;
using DTO;
using System;
using System.Collections.Generic;
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

        public List<DTOInventario> GetHilo(string code)
        {
            DTOInventario GuidHilo = new DTOInventario();
            CADInventario Process = new CADInventario();
            GuidHilo.Code_Hilo = code;
            List<DTOInventario> Hilo = Process.ConsultarHiloPorGuidQR(GuidHilo);
            return Hilo;
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
    }
}
