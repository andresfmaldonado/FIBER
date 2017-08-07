using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DTOPrograma
    {
        private int id_cohorte;
        private string _dni_cohorte;
        private DateTime _fecha_ini_cohorte;
        private DateTime _fecha_fin_cohorte;
        private DateTime _fecha_registro_cohorte;
        private int id_integrante;
        private int _id_competencia;
        private string _dni_competencia;
        private string _nombre_competencia;
        private int _cantid_resultados_compet;
        private int _cantid_horas_compet;
        private DateTime _fecha_reg_compet;
        private int id_result;
        private string dni_result;
        private string nombre_result;
        private int cantid_horas_result;
        private DateTime fecha_reg_result;
        private int _id_programa;
        private string _dni_programa;
        private string _nombre_programa;
        private int _cantid_horas_programa;
        private DateTime _fecha_reg_programa;

        public int Id_cohorte
        {
            get
            {
                return id_cohorte;
            }

            set
            {
                id_cohorte = value;
            }
        }

        public string Dni_cohorte
        {
            get
            {
                return _dni_cohorte;
            }

            set
            {
                _dni_cohorte = value;
            }
        }

        public DateTime Fecha_ini_cohorte
        {
            get
            {
                return _fecha_ini_cohorte;
            }

            set
            {
                _fecha_ini_cohorte = value;
            }
        }

        public DateTime Fecha_fin_cohorte
        {
            get
            {
                return _fecha_fin_cohorte;
            }

            set
            {
                _fecha_fin_cohorte = value;
            }
        }

        public DateTime Fecha_registro_cohorte
        {
            get
            {
                return _fecha_registro_cohorte;
            }

            set
            {
                _fecha_registro_cohorte = value;
            }
        }

        public int Id_integrante
        {
            get
            {
                return id_integrante;
            }

            set
            {
                id_integrante = value;
            }
        }

        public int Id_competencia
        {
            get
            {
                return _id_competencia;
            }

            set
            {
                _id_competencia = value;
            }
        }

        public string Dni_competencia
        {
            get
            {
                return _dni_competencia;
            }

            set
            {
                _dni_competencia = value;
            }
        }

        public string Nombre_competencia
        {
            get
            {
                return _nombre_competencia;
            }

            set
            {
                _nombre_competencia = value;
            }
        }

        public int Cantid_resultados_compet
        {
            get
            {
                return _cantid_resultados_compet;
            }

            set
            {
                _cantid_resultados_compet = value;
            }
        }

        public int Cantid_horas_compet
        {
            get
            {
                return _cantid_horas_compet;
            }

            set
            {
                _cantid_horas_compet = value;
            }
        }

        public DateTime Fecha_reg_compet
        {
            get
            {
                return _fecha_reg_compet;
            }

            set
            {
                _fecha_reg_compet = value;
            }
        }

        public int Id_result
        {
            get
            {
                return id_result;
            }

            set
            {
                id_result = value;
            }
        }

        public string Dni_result
        {
            get
            {
                return dni_result;
            }

            set
            {
                dni_result = value;
            }
        }

        public string Nombre_result
        {
            get
            {
                return nombre_result;
            }

            set
            {
                nombre_result = value;
            }
        }

        public int Cantid_horas_result
        {
            get
            {
                return cantid_horas_result;
            }

            set
            {
                cantid_horas_result = value;
            }
        }

        public DateTime Fecha_reg_result
        {
            get
            {
                return fecha_reg_result;
            }

            set
            {
                fecha_reg_result = value;
            }
        }

        public int Id_programa
        {
            get
            {
                return _id_programa;
            }

            set
            {
                _id_programa = value;
            }
        }

        public string Dni_programa
        {
            get
            {
                return _dni_programa;
            }

            set
            {
                _dni_programa = value;
            }
        }

        public string Nombre_programa
        {
            get
            {
                return _nombre_programa;
            }

            set
            {
                _nombre_programa = value;
            }
        }

        public int Cantid_horas_programa
        {
            get
            {
                return _cantid_horas_programa;
            }

            set
            {
                _cantid_horas_programa = value;
            }
        }

        public DateTime Fecha_reg_programa
        {
            get
            {
                return _fecha_reg_programa;
            }

            set
            {
                _fecha_reg_programa = value;
            }
        }
    }
}
