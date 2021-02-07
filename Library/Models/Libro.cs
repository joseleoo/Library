using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Models
{
    public class Libro
    {
        public int Id { get; set; }

        [StringLength(100, ErrorMessage = "Solo se permiten 100 caracteres")]
        public string Titulo{ get; set; }

        [Required(ErrorMessage = "Editorial requerido")]
        [Display(Name = "Editorial")]
        public Editorial Editorial{ get; set; }
        public DateTime Fecha { get; set; }
        public int Costo { get; set; }

        [Display(Name = "Precio")]
        public int PrecioSugerido { get; set; }
        public string Autor { get; set; }
       
    }
}
