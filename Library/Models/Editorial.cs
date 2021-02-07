using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Library.Models
{
    public class Editorial
    {
        public int Id { get; set; }

        
        [StringLength(100, ErrorMessage = "Solo se permiten 100 caracteres")]
        public string Nombre { get; set; }
    }
}
