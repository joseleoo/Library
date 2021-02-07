using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Models
{
    public class Libro
    {
        public int Id { get; set; }
        [Required]
        [StringLength(100, ErrorMessage = "Solo se permiten 100 caracteres")]
        public string Titulo{ get; set; }
        
        [Required]
        [Display(Name = "Editorial")]
        public int IdEditorial { get; set; }
        [ForeignKey("IdEditorial")]
        public Editorial Editorial { get; set; }


        [Required]
        public DateTime Fecha { get; set; }
        [Required]
        public int Costo { get; set; }
        
        [Required]
        [Display(Name = "Precio")]
        public int PrecioSugerido { get; set; }

        public string Autor { get; set; }
       
    }
}
