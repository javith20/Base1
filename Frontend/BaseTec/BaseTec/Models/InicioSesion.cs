using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Municipalidad.Models
{
    public class InicioSesion
    {
            
        public string usuario { get; set; }
        [Required]
        public string contrasegna { get; set; }
        [Required]
        public bool estado { get; set; }
    }
}
