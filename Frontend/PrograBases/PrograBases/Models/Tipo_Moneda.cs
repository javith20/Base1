//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PrograBases.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tipo_Moneda
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tipo_Moneda()
        {
            this.Tipo_Cuenta_Ahorros = new HashSet<Tipo_Cuenta_Ahorros>();
        }
    
        public int Id_Tipo_Moneda { get; set; }
        public string Nombre { get; set; }
        public string Simbolo { get; set; }
        public bool Activo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tipo_Cuenta_Ahorros> Tipo_Cuenta_Ahorros { get; set; }
    }
}
