<%@ Page Language="C#"  Inherits="System.Web.Mvc.ViewPage<MvcApplication1.Models.PersonModel>" %>

<!DOCTYPE html>

 

<html>

<head runat="server">
    <title></title>
    <%--   Cargo la librerya JQuery--%>
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
    
     <%--   Leno el dropdownlist de categorias al cargar la pagina--%>
        $().ready(function () {
            $.ajax({
                type: "POST",
                url: "Home/GetCategorias",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                   // var models = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;

                    for (var i = 0; i < response.length; i++) {
                        var val = response[i].Codigo;
                        var text = response[i].Descripcion;
                        $("#ddlCategorias").get(0).options[$("#ddlCategorias").get(0).options.length] = new Option(text, val);
                        // $('#ddlCategorias').addOption(val, text, false); Esto tambien deberia funcionar

                    }
                    //De esta manera tambien podemos llenar el dropdownlist
                    //                                          $.each(response.d, function (index, item) {
                    //                                          alert( item.Descripcion);
                    //                                           });

                },
                error: function (response) {
                    if (response.length != 0)
                        alert(response);
                }
            });

        });

           <%--   Leno el dropdownlist de productos al cambiar de categoria--%>
        $(document).ready(function () {
            $("#ddlCategorias").change(function () {
                $.ajax({
                    type: "POST",
                    url: "Home/GetProductos",
                    data: "{categoria: '" + $('#ddlCategorias').val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if ($("#ddlProductos").get(0).options.length != 1) {
                            $("#ddlProductos").get(0).options.length = 0;
                            var val = "0";
                            var text = "Seleccione un Producto";
                            $("#ddlProductos").get(0).options[$("#ddlProductos").get(0).options.length] = new Option(text, val);
                        }
                        for (var i = 0; i < response.length; i++) {
                            var val = response[i].Codigo;
                            var text = response[i].Descripcion;
                            $("#ddlProductos").get(0).options[$("#ddlProductos").get(0).options.length] = new Option(text, val);

                        }

                    },
                    error: function (response) {
                        if (response.length != 0)
                            alert(response);
                    }
                });
            });

        });

     <%--   Creo una tabla con el detalle del producto al seleccionar uno--%>
        $(document).ready(function () {
            $("#ddlProductos").change(function () {
                $.ajax({
                    type: "POST",
                    url: "Home/GetProductosDetalle",
                    data: "{codigo: '" + $('#ddlProductos').val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                    //    var models = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                        var conten;
                        conten = "<table id='Mitabla' border='2'>";
                        conten += "<tr><td>";
                        conten += "Codigo";
                        conten += "</td>";
                        conten += "<td>";
                        conten += "Descripcion";
                        conten += "</td>";
                        conten += "<td>";
                        conten += "Precio";
                        conten += "</td>";
                        conten += "<td>";
                        conten += "Categoria";
                        conten += "</td>";
                        conten += "</tr>";
                        for (var i = 0; i < response.length; i++) {
                            var val = response[i].Codigo;
                            var text = response[i].Descripcion;
                            var Precio = response[i].Precio;
                            var Categoria = response[i].Categoria;

                            $('#txtprueba').val('se selecciono:' + text);// se le asigna valor al text box
                            conten += "<tr><td>";
                            conten += val;
                            conten += "</td>";
                            conten += "<td>";
                            conten += text;
                            conten += "</td>";
                            conten += "<td>";
                            conten += Precio;
                            conten += "</td>";
                            conten += "<td>";
                            conten += Categoria;
                            conten += "</td>";
                            conten += "</tr>";
                        }
                        conten += "</table>";
                        $("#tabla").html(conten);
                    },
                    error: function (response) {
                        if (response.length != 0)
                            alert(response);
                    }
                });
            });

        });


         <%--   Creo la tabla con todos los productos al empezar--%>
        $(document).ready(function () {
             $.ajax({
                    type: "POST",
                    url: "Home/GetTodosProductos",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        //    var models = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                        var conten;
                        conten = "<table id='Mitabla' border='2'>";
                        conten += "<tr><td>";
                        conten += "Codigo";
                        conten += "</td>";
                        conten += "<td>";
                        conten += "Descripcion";
                        conten += "</td>";
                        conten += "<td>";
                        conten += "Precio";
                        conten += "</td>";
                        conten += "<td>";
                        conten += "Categoria";
                        conten += "</td>";
                        conten += "</tr>";
                        for (var i = 0; i < response.length; i++) {
                            var val = response[i].Codigo;
                            var text = response[i].Descripcion;
                            var Precio = response[i].Precio;
                            var Categoria = response[i].Categoria;

                         //   $('#txtprueba').val('se selecciono:' + text);// se le asigna valor al text box
                            conten += "<tr><td>";
                            conten += val;
                            conten += "</td>";
                            conten += "<td>";
                            conten += text;
                            conten += "</td>";
                            conten += "<td>";
                            conten += Precio;
                            conten += "</td>";
                            conten += "<td>";
                            conten += Categoria;
                            conten += "</td>";
                            conten += "</tr>";
                        }
                        conten += "</table>";
                        $("#tabla").html(conten);
                    },
                    error: function (response) {
                        if (response.length != 0)
                            alert(response);
                    }
                });
          });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
        <p>
            Categorias:</p>
        <asp:DropDownList ID="ddlCategorias" runat="server" ClientIDMode="Static">
            <asp:ListItem Text="Seleccione una Categoria" Value="0" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <p>
            Productos:</p>
        <asp:DropDownList ID="ddlProductos" runat="server" ClientIDMode="Static">
            <asp:ListItem Text="Seleccione un Producto" Value="0" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtprueba" runat="server"></asp:TextBox>
    </div>
    <div id="tabla" runat="server">
    </div>
    </form>
</body>
</html>
