using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace HEXI_ASP.NET
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IServiceLectorQR" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IServiceLectorQR
    {
        [OperationContract]
        [WebInvoke(Method = "GET", ResponseFormat = WebMessageFormat.Json)]
        string GetData(int value);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> GetProduct(string referencia);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<string> idenu(string c, string p, string r);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        string contacto(string name, string email, string mensaje);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        string recup(string correou);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> GetProductsInform();

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<string> GetUsersInform();

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> tablapedidop(int referencia);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<string> regisingre(int referenciap);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        int regisingreproduct(int idiped, int idi, int idpro, int cantid_ingreso, int cantidad_defectuosa, string detalles);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        int regisingrehilo(int idiped, int idi, int idh, float cantid_ingreso, float cantidad_defectuosa, string detalles);

        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> tablapedidoh(int referencia);

        //Contrato que retorna un hilo según su referencia
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> hilo(string referencia);

        //Contrato que retorna un hilo según su ID
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> hilo_por_id(int id);

        //Contrato para registrar un hilo en la tabla Paso con atributos de consumo
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> registrarHilo(int id, string referencia, float metros, float consumo);

        //Contrato para registrar un producto en la tabla Paso con atributos de consumo
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> registrarProducto(int id, string referencia, float cantidad, float consumo);

        //Contrato para buscar todos los hilos
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> verTodosHilos();

        //Contrato para eliminar registro de un hilo de la tabla Paso
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> olvidarHilo(int id);

        //Contrato para buscar un producto según su referencia
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> buscarProducto(string referencia);

        //Contrato para buscar todos los productos
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> buscarTodosProductos();

        //Contrato para buscar un producto según su ID
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> buscarProductoId(int id);

        //Contrato para buscar atributos de un hilo para realizar el pedido según su referencia
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> buscarHiloPedido(string referencia);

        //Contrato para buscar atributos de un hilo para realizar el pedido según su ID
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> buscarHiloPedidoId(int id);

        //Contrato para buscar todos los hilos para realizar un pedido
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> buscarTodosHilosP();

        //Contrato para registrar un hilo en la tabla Paso para hacer un pedido
        [OperationContract]
        [WebInvoke(Method ="POST", BodyStyle =WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> registrarHiloP(int id, float metros, float valor);
 
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        float consultarTotal();

        //Contrato para consultar un producto por la referencia para pedidos
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> buscarProductoP(string referencia);

        //Contrato para consultar un producto por el ID para pedidos
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> buscarProductoPId(int id);

        //Contrato para consultar todos los productos para pedidos
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> consultarTodosProductosP();

        //Contrato para registrar productos en la tabla Paso
        [OperationContract]
        [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
        List<DTOInventario> registrarProductoPaso(int id, float cantidad, float valor);

    }
}
