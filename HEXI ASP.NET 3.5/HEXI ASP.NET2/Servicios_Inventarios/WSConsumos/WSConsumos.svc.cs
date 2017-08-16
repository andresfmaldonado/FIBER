using CAD;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WSConsumos
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class WSConsumos : IWSConsumos
    {
        public List<DTOInventario> tablaconsumo(string id)
        {
            List<DTOInventario> tabla = new List<DTOInventario>();
            DTOInventario datos = new DTOInventario();
            CADInventario procesos = new CADInventario();
            datos.Id_Consumo = int.Parse(id);
            tabla = procesos.tablaconsumos(datos);
            return tabla;
        }
    }
}
