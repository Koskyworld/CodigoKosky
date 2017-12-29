using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication1.Models;

namespace MvcApplication1.Controllers
{
    public class HomeController : Controller
    {
      // GET: Home

      public ActionResult Index()
      {

        return View();

      }

    [HttpPost]
      public JsonResult GetCategorias()
      {
        List<Categoria> Categorias = new List<Categoria>()
            { new Categoria {Codigo ="1", Descripcion ="CategoriaA"},
                new Categoria {Codigo ="2",Descripcion ="CategoriaB"}
            };
        return Json(Categorias);
      }

      [HttpPost]
    public JsonResult GetProductos(string categoria)
        {
          List<Producto> Productos = new List<Producto>();
          Productos = GetListaProductos();
          var a = from c in Productos where c.Categoria == categoria select c;
          return Json(a.ToList());
        }


      [HttpPost]
      public JsonResult GetProductosDetalle(string codigo)
        {
          List<Producto> Productos = new List<Producto>();
          Productos = GetListaProductos();
          var a = from c in Productos where c.Codigo == codigo select c;
          return Json(a.ToList());
        }

      [HttpPost]
      public JsonResult GetTodosProductos()
      {
        List<Producto> Productos = new List<Producto>();
        Productos = GetListaProductos();
        var a = from c in Productos select c;
        return Json(a.ToList());
      }

      [HttpPost]
        public List<Producto> GetListaProductos()
        {
          List<Producto> Productos = new List<Producto>()
            { new Producto {Codigo ="1", Descripcion ="ProductoA",Precio ="100", Categoria ="1"},
                new Producto {Codigo ="2",Descripcion ="ProductoB",Precio ="200", Categoria ="2"},
                new Producto {Codigo ="3", Descripcion ="ProductoC",Precio ="300", Categoria ="1"},
                new Producto {Codigo ="4",Descripcion ="ProductoD",Precio ="400", Categoria ="2"},
                 new Producto {Codigo ="5",Descripcion ="ProductoE",Precio ="700", Categoria ="2"},
                new Producto {Codigo ="6", Descripcion ="ProductoF",Precio ="800", Categoria ="1"},
                new Producto {Codigo ="7",Descripcion ="ProductoG",Precio ="900", Categoria ="2"}
            };
          return Productos;
        }
    
    }
}
