<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioPedidosProductos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioPedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link href="css/select2.css" rel="stylesheet" />
    <link href="css/select2-bootstrap.css" rel="stylesheet" />
    <link href="css/gh-pages.css" rel="stylesheet" />
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script>
        function registro() {
            swal("Registro Exitoso!", "", "success");
        }
        function problema() {
            swal('Oops...', 'Ocurrió un error inesperado!', 'info');
        }
        function modificacion() {
            swal("Actualización Exitosa!", "", "success");
        }
        function yaexiste() {
            swal('Oops...', 'Esta Cohorte ya existe!', 'error');
        }
        function yaexistedni() {
            swal('Oops...', 'Ya existe una cohorte con este DNI!', 'error');
        }
        function campos() {
            swal('Oops...', 'No completó los campos de forma correcta o te hizo falta alguno(s)!', 'warning');
        }

        function noregistrado() {
            swal('Oops...', 'Esta cohorte no se encuentra registrada!', 'warning');
        }
    </script>
    <title>Fiber|Pedidos Productos</title>
</head>
<body>
    <div id="page-wrapper">

        <!-- Header -->
        <header id="header" class="alt">
            <a href="PPedidos.aspx">
                <h1>
                    <img class="atras" src="Iconos/Material%20Iconse5c41024.png" /></h1>
            </a>
            <nav>
                <a href="#menu"></a>
            </nav>
        </header>

        <!-- Menu -->
        <nav id="menu">
            <div class="inner">
                <h2>Menú</h2>
                <ul class="links">
                    <li><a href="PerfilAdmin.aspx">Perfil</a></li>
                    <li id="usuarios" runat="server"><a href="PFormularioUsuarios.aspx">Usuarios</a></li>
                    <li><a href="PAsistencia.aspx">Ayuda</a></li>
                    <li><a href="default.aspx">Finalizar Sesión</a></li>
                </ul>
                <a href="#" class="close">Close</a>
            </div>
        </nav>
    </div>
    <div class="container">
        <div class="jumbotron">
            <img class="img" src="Iconos/Fiber.png" />
        </div>
    </div>
    <!-- Form -->
    <form id="form1" class="form-horizontal" runat="server">
        <div class="row">
            <!-- Columna derecha -->
            <div class="col-md-5 col-md-offset-1">
                <!-- Id del producto -->
                <asp:TextBox ID="id" Style="display: none;" type="text" CssClass="form-control" runat="server"></asp:TextBox>

                <!-- Referencia del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_referencia" class="control-label col-sm-2" runat="server" Text="Referencia:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="referencia" ReadOnly="true" type="text" class="form-control" placeholder="Referencia del producto" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Descripción del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_descripcion" CssClass="control-label col-sm-2" runat="server" Text="Descripción:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="descripcion" ReadOnly="true" type="text" CssClass="form-control" placeholder="Descripción del producto" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Valor Unidad del producto -->
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="control-label col-sm-2" runat="server" Text="Valor unidad:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="valor" ReadOnly="true" type="text" CssClass="form-control" placeholder="Valor uniatario del producto" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <!-- /Columna derecha -->

            <!-- Columna izquierda -->
            <div class="col-md-5">
                <!-- Nombre del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Nombre" CssClass="control-label col-sm-2" runat="server" Text="Nombre:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="nombre" ReadOnly="true" type="text" CssClass="form-control" placeholder="Nombre del producto" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Cantidad del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Cantidad" CssClass="control-label col-sm-2" runat="server" Text="Cantidad"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="cantidad" type="text" CssClass="form-control" placeholder="Cantidad del producto" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <!-- /Columna izquierda -->
        </div>
        <!-- Boton registrar -->
        <div class="form-group">
            <div class="col-sm-offset-2 col-center">
                <div class="btn-group">
                    <input id="registrar" type="button" class="btn btn-default" value="Registrar" />
                </div>
            </div>
        </div>
        <!-- /Boton registrar-->
        &nbsp
            <!-- Formulario de buscar -->
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Label ID="Label4" class="control-label col-sm-2" runat="server" Text="Buscar:"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtbuscar" type="text" class="form-control" placeholder="Referencia producto" runat="server"></asp:TextBox>
                    </div>
                    <div class=" col-md-1">
                        <input id="buscar" type="button" class="btn btn-default" value="Buscar" />
                    </div>

                    <input id="verTodos" type="button" class="btn btn-default" value="Ver todos" />
                </div>
            </div>
        </div>
        <!-- /Formulario de buscar -->

        <!-- Tabla -->
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="table-responsive" id="registroProductos1">
                        <!-- Tabla -->
                        <table class="table" id="tablaProductos1">
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Tabla -->

        <!-- Boton finalizar pedido -->
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1 col-center">
                <div class="btn-group">
                    <asp:Button ID="fin_consumo" type="button" CssClass="btn btn-default" runat="server" Text="Finalizar consumo" OnClick="fin_consumo_Click" />
                </div>
            </div>
        </div>
        <!-- /Boton finalizar pedido -->

        <asp:HiddenField runat="server" ID="_repostcheckcode" />
    </form>
    <!-- /Form -->

    <!--Footer-->
    <div class="form-group">
        <div class="col-sm-12">
            <!-- Icons -->
            <!-- Menu -->

            <span id="footer">Fiber&copy; Producto: <a href="#">HEXI</a>
            </span>
        </div>
    </div>
    <!-- /Footer -->

    <!-- Modal Buscar -->
    <div class="modal fade bs-example-lg" id="modalBuscar" tabindex="-1" role="dialog" aria-labelledby="modalBuscarLabel" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="table-responsive" id="RegistroProducto">
                        <div class="panel panel-default">
                            <!-- Tabla -->
                            <table class="table" id="tablaProducto">
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dafault" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /Modal Buscar -->

    <!-- Modal Ver Todos -->
    <div class="modal fade bs-example-lg" id="modalTodos" tabindex="-1" role="dialog" aria-labelledby="modalVerTodosLabel" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="table-responsive" id="RegistroProductos">
                        <div class="panel panel-default">
                            <!-- Table -->
                            <table class="table" id="tablaTodos">
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /Modal Ver Todos -->

    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/bootstrap.min.js"></script>
    <!--<script src="jvscript/jquery.dataTables.min.js"></script>-->
    <script src="jvscript/dataTables.bootstrap.min.js"></script>
    <script src="jvscript/dataTables.responsive.min.js"></script>
    <script src="jvscript/responsive.bootstrap.min.js"></script>
    <script src="jvscript/js1/skel.min.js"></script>
    <script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="jvscript/select2.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script>
        $("#buscar").click(function () {
            //cadena tipo json que será enviada al servicio
            var dataString = '{"referencia" : "' + $("#txtbuscar").val() + '"}';
            alert(dataString);

            //Llamar el servicio a través de ajax()
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/buscarProductoP",
                data: dataString,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (Dato) {
                    item = Dato.buscarProductoPResult;
                    $("#tablaProducto").html('');
                    $("#tablaProducto").append('<thead class="text-center"><tr><th>Id</th><th>Referencia</th><th>Nombre</th><th>Descripción</th><th>Valor Unidad</th><th>Acción</th></tr></thead>');
                    $("#tablaProducto").append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $("#tablaProducto").append('<tr><td>' + value.Id_Producto + '</td><td>' + value.Referencia_Producto + '</td><td>' + value.Nombre_Producto + '</td><td>'+value.Descripcion_Producto+'</td><td>' + value.ValorUnitario_Producto + '</td><td><button class="btn btn-default seleccionar" value="' + value.Id_Producto + '">Seleccionar</button></td></tr>');
                    });
                    $("#modalBuscar").modal('show');
                    $(".seleccionar").click(function () {
                        dataString = '{"id" : "' + $(this).val() + '"}';
                        alert(dataString);
                        $.ajax({
                            type: "POST",
                            url: "ServiceLectorQR.svc/buscarProductoPId",
                            data: dataString,
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (Dato) {
                                alert("entro al success");
                                item = Dato.buscarProductoPIdResult;
                                alert(item);
                                $.each(item, function (index, value) {
                                    $("#id").val(value.Id_Producto);
                                    $("#referencia").val(value.Referencia_Producto);
                                    $("#nombre").val(value.Nombre_Producto);
                                    $("#descripcion").val(value.Descripcion_Producto);
                                    $("#valor").val(value.ValorUnitario_Producto);
                                });
                                $("#modalBuscar").modal('hide');
                            },
                            error: function (request, status, error) {
                                alert(error);
                            }
                        });
                    });
                },
                error: function (request, status, error) {
                    alert(error);
                }
            });

        });
        $("#verTodos").click(function () {
            //Llamar el servicio a través de ajax
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/consultarTodosProductosP",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (Dato) {
                    item = Dato.consultarTodosProductosPResult;
                    $("#tablaTodos").html('');
                    $("#tablaTodos").append('<thead class="text-center"><tr><th>Id</th><th>Referencia</th><th>Nombre</th><th>Descripción</th><th>Valor Unidad</th><th>Acción</th></tr></thead>');
                    $("#tablaTodos").append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $("#tablaTodos").append('<tr><td>' + value.Id_Producto + '</td><td>' + value.Referencia_Producto + '</td><td>' + value.Nombre_Producto + '</td><td>' + value.Descripcion_Producto + '</td><td>' + value.ValorUnitario_Producto + '</td><td><button class="btn btn-default seleccionar" value="' + value.Id_Producto + '">Seleccionar</button></td></tr>');
                    });
                    $("#modalTodos").modal('show');
                    $(".seleccionar").click(function () {
                        dataString = '{"id" : "' + $(this).val() + '"}';
                        alert(dataString);
                        $.ajax({
                            type: "POST",
                            url: "ServiceLectorQR.svc/buscarProductoPId",
                            data: dataString,
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (Dato) {
                                alert("entro al success");
                                item = Dato.buscarProductoPIdResult;
                                alert(item);
                                $.each(item, function (index, value) {
                                    $("#id").val(value.Id_Producto);
                                    $("#referencia").val(value.Referencia_Producto);
                                    $("#nombre").val(value.Nombre_Producto);
                                    $("#descripcion").val(value.Descripcion_Producto);
                                    $("#valor").val(value.ValorUnitario_Producto);
                                });
                                $("#modalTodos").modal('hide');
                            },
                            error: function (request, status, error) {
                                alert(error);
                            }
                        });
                    });

                },
                error: function (request, status, error) {
                    alert(error);
                }
            });
        });
        $("#registrar").click(function () {
            dataString = '{"id" : "' + $("#id").val() + '", "cantidad" : "' + $("#cantidad").val() + '", "valor" : "' + $("#valor").val() + '"}';
            alert(dataString);
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/registrarProductoPaso",
                data: dataString,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (Dato) {
                    item = Dato.registrarProductoPasoResult;
                    $("#tablaProductos1").html('');
                    $("#tablaProductos1").append('<thead><tr><th>Id</th><th>Cantidad</th><th>Valor por producto</th><th>Acción</th></tr></thead>');
                    $("#tablaProductos1").append('<tbody></tbody>');
                    var lastIndex = 0;
                    $.each(item, function (index, value) {
                        $("#tablaProductos1").append('<tr><td>' + value.Id_Producto + '</td><td>' + value.Cantidad_Producto + '</td><td>' + value.ValorTotal_Producto + '</td><td><button class="btn btn-danger quitar" value="' + value.Id_Producto + '">Quitar</button></td></tr>');
                        lastIndex = index;
                    });
                    $("#tablaProductos1").append('<tr><td></td><td><b>Total:</b></td><td>' + item[lastIndex].ValorTotal + '</td><td></td></tr>');
                    $("#id, #referencia, #nombre, #descripcion, #cantidad, #valor").val('');

                },
                error: function (request, status, error) {

                }
                
            });
        });
    </script>
</body>
</html>
