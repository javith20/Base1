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
    
    public partial class Bitacora_Accion
    {
        public int Id_Bitacora_Accion { get; set; }
        public int Id_Tipo_Accion { get; set; }
        public int Id_Objeto_Accion { get; set; }
        public int Quien_Inserto { get; set; }
        public string Insertado_Por { get; set; }
        public System.DateTime Inserto_El { get; set; }
    
        public virtual Tipo_Accion Tipo_Accion { get; set; }
    }
}
