//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BaseTec.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cuenta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cuenta()
        {
            this.Beneficiario = new HashSet<Beneficiario>();
            this.Estado_Cuenta = new HashSet<Estado_Cuenta>();
            this.Usuario_Visualizacion = new HashSet<Usuario_Visualizacion>();
        }
    
        public int Id_Cuenta { get; set; }
        public int Id_Persona { get; set; }
        public int Id_Tipo_Cuenta_Ahorros { get; set; }
        public string Num_Cuenta { get; set; }
        public System.DateTime Fecha_Creacion { get; set; }
        public decimal Saldo { get; set; }
        public bool Activo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Beneficiario> Beneficiario { get; set; }
        public virtual Persona Persona { get; set; }
        public virtual Tipo_Cuenta_Ahorros Tipo_Cuenta_Ahorros { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Estado_Cuenta> Estado_Cuenta { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Usuario_Visualizacion> Usuario_Visualizacion { get; set; }
    }
}
