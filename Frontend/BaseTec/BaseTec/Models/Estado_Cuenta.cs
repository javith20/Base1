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
    
    public partial class Estado_Cuenta
    {
        public int Id_Estado_Cuenta { get; set; }
        public int Id_Cuenta { get; set; }
        public System.DateTime Fecha_Inicio { get; set; }
        public System.DateTime Fecha_Fin { get; set; }
        public decimal Saldo_Inicial { get; set; }
        public decimal Saldo_Final { get; set; }
        public bool Activo { get; set; }
    
        public virtual Cuenta Cuenta { get; set; }
    }
}
