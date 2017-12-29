using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using MvcApplication1.Models;

namespace MvcApplication1.Servicios
{
  /// <summary>
  /// Descripción breve de ServiciosJson
  /// </summary>
  [WebService(Namespace = "http://tempuri.org/")]
  [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
  [System.ComponentModel.ToolboxItem(false)]
  // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
  [System.Web.Script.Services.ScriptService]
  public class ServiciosJson : System.Web.Services.WebService
  {
    [WebMethod]
    [ScriptMethod(UseHttpGet = false,ResponseFormat = ResponseFormat.Json)]
        public List<Categoria> GetCategorias()
    {
      List<Categoria> Categorias = new List<Categoria>()
            { new Categoria {Codigo ="1", Descripcion ="CategoriaA"},
                new Categoria {Codigo ="2",Descripcion ="CategoriaB"}
            };
      return Categorias;
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public List<Producto> GetProductos(string categoria)
    {
      List<Producto> Productos = new List<Producto>();
      Productos = GetListaProductos();
      var a = from c in Productos where c.Categoria == categoria select c;
      return a.ToList();
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public List<Producto> GetProductosDetalle(string codigo)
    {
      List<Producto> Productos = new List<Producto>();
      Productos = GetListaProductos();
      var a = from c in Productos where c.Codigo == codigo select c;
      return a.ToList();
    }

    public List<Producto> GetListaProductos()
    {
      List<Producto> Productos = new List<Producto>()
            { new Producto {Codigo ="1", Descripcion ="ProductoA",Precio ="100", Categoria ="1"},
                new Producto {Codigo ="2",Descripcion ="ProductoB",Precio ="200", Categoria ="2"},
                new Producto {Codigo ="3", Descripcion ="ProductoC",Precio ="300", Categoria ="1"},
                new Producto {Codigo ="4",Descripcion ="ProductoD",Precio ="400", Categoria ="2"}
            };
      return Productos;
    }

  }
}
