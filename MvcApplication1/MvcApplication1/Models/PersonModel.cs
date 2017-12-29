using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication1.Models
{
  public class PersonModel
  {

    ///<summary>

    /// Gets or sets Name.

    ///</summary>

    public string Name { get; set; }



    ///<summary>

    /// Gets or sets DateTime.

    ///</summary>

    public string DateTime { get; set; }

  }

  public class Categoria
  {

    public string Codigo { get; set; }
    public string Descripcion { get; set; }
  }

  public class Producto
  {
    public string Codigo { get; set; }
    public string Descripcion { get; set; }
    public string Precio { get; set; }
    public string Categoria { get; set; }


  }
}