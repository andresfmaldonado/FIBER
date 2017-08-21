using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DTOUsuario
    {
        private string _correo;
        private string _contraseña;
        private int _id;
        private string _dni;
        private string _nombre;
        private string _apellidos;
        private string _tel;
        private string _estado;
        private string _foto;
        private int _id_rol;
        private string _nombre_rol;
        private int _id_rol_viejo;
        private string nombre_contacto;
        private string correo_contacto;
        private string mensaje_contacto;
        private int id_report;
        private string nomb_report;
        private string descript_report;
        private DateTime fecha_report;
        private string estado_report;
        private string _descripcion_history;
        private int _id_u_logueado;

        public string Correo
        {
            get
            {
                return _correo;
            }

            set
            {
                _correo = value;
            }
        }

        public string Contraseña
        {
            get
            {
                return _contraseña;
            }

            set
            {
                _contraseña = value;
            }
        }

        public int Id
        {
            get
            {
                return _id;
            }

            set
            {
                _id = value;
            }
        }

        public string Dni
        {
            get
            {
                return _dni;
            }

            set
            {
                _dni = value;
            }
        }

        public string Nombre
        {
            get
            {
                return _nombre;
            }

            set
            {
                _nombre = value;
            }
        }

        public string Apellidos
        {
            get
            {
                return _apellidos;
            }

            set
            {
                _apellidos = value;
            }
        }

        public string Tel
        {
            get
            {
                return _tel;
            }

            set
            {
                _tel = value;
            }
        }

        public string Estado
        {
            get
            {
                return _estado;
            }

            set
            {
                _estado = value;
            }
        }

        public string Foto
        {
            get
            {
                return _foto;
            }

            set
            {
                _foto = value;
            }
        }

        public int Id_rol
        {
            get
            {
                return _id_rol;
            }

            set
            {
                _id_rol = value;
            }
        }

        public string Nombre_rol
        {
            get
            {
                return _nombre_rol;
            }

            set
            {
                _nombre_rol = value;
            }
        }

        public int Id_rol_viejo
        {
            get
            {
                return _id_rol_viejo;
            }

            set
            {
                _id_rol_viejo = value;
            }
        }

        public string Nombre_contacto
        {
            get
            {
                return nombre_contacto;
            }

            set
            {
                nombre_contacto = value;
            }
        }

        public string Correo_contacto
        {
            get
            {
                return correo_contacto;
            }

            set
            {
                correo_contacto = value;
            }
        }

        public string Mensaje_contacto
        {
            get
            {
                return mensaje_contacto;
            }

            set
            {
                mensaje_contacto = value;
            }
        }

        public int Id_report
        {
            get
            {
                return id_report;
            }

            set
            {
                id_report = value;
            }
        }

        public string Nomb_report
        {
            get
            {
                return nomb_report;
            }

            set
            {
                nomb_report = value;
            }
        }

        public string Descript_report
        {
            get
            {
                return descript_report;
            }

            set
            {
                descript_report = value;
            }
        }

        public DateTime Fecha_report
        {
            get
            {
                return fecha_report;
            }

            set
            {
                fecha_report = value;
            }
        }

        public string Estado_report
        {
            get
            {
                return estado_report;
            }

            set
            {
                estado_report = value;
            }
        }

        public string Descripcion_history
        {
            get
            {
                return _descripcion_history;
            }

            set
            {
                _descripcion_history = value;
            }
        }

        public int Id_u_logueado
        {
            get
            {
                return _id_u_logueado;
            }

            set
            {
                _id_u_logueado = value;
            }
        }
    }
}
