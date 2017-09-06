<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioPedidosHilos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioPedidosHilos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
    <link href="css/select2.css" rel="stylesheet" />
    <link href="css/select2-bootstrap.css" rel="stylesheet"/>
    <link href="css/gh-pages.css" rel="stylesheet" />
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script>
        function registro() {
            swal("¡Registro Exitoso!", "", "success");
        }
        function problema() {
            swal('Oops...', '¡Ocurrió un error inesperado!', 'info');
        }
        function modificacion() {
            swal('¡Actualización exitosa!', '', 'success');
        }
        function yaexiste() {
            swal('Oops...', '¡Este pedido ya existe!', 'error');
        }
        function campos() {
            swal('Oops...', 'No completó los campos de forma correcta o le hizo falta alguno(s)', 'warning');
        }
        function noregistrado() {
            swal('Oops...', 'Este pedido no se encuentra registrado', 'warning');
        }
    </script>
    <title>Fiber|Pedidos Hilos</title>
</head>
<body>
    <div id="page-wrapper">
        <!--Header-->
        <header id="header" class="alt">
            <a href="PPedidos.aspx">
                <h1>
                    <img class="atras" src="Iconos/Material%20Iconse5c41024.png" />
                </h1>
            </a>
            <nav>
                <a href="#menu"></a>
            </nav>
        </header>

        <!--Menu-->
        <nav id="menu">
            <div class="inner">
                <h2>Menú</h2>
                <ul class="links">
                    <li>
                        <a href="PerfilAdmin.aspx">
                            Perfil
                        </a>
                    </li>
                    <li id="usuarios" runat="server">
                        <a href="PFormularioUsuarios.aspx">
                            Usuarios
                        </a>
                    </li>
                    <li>
                        <a href="PAsistencia.aspx">
                            Ayuda
                        </a>
                    </li>
                    <li>
                        <a href="default.aspx">
                            Finalizar sesión
                        </a>
                    </li>
                </ul>
                <a href="#" class="close"></a>
            </div>
        </nav>
    </div>

    <!-- Formulario -->
    <div class="container">
        <div class="jumbotron">
            <img class="img" src="Iconos/Fiber.png" />
        </div>
    </div>
    <form id="form1" runat="server" class="form-horizontal">
       <div class="row">
           <div class="col-md-4 col-md-offset-1">
                <asp:TextBox ID="id" Style="display: none;" type="text" class="form-control"  runat="server"></asp:TextBox>

                <div class="form-group">
                    <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Referencia:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="referencia" ReadOnly="true" type="text" class="form-control" placeholder="Referencia del hilo" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" class="control-label col-sm-2" runat="server" Text="Color:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="color" placeholder="Color del hilo" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" class="control-label col-sm-2" runat="server" Text="Título:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="titulo" placeholder="Título del hilo" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
               

            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label ID="Label5" class="control-label col-sm-2" runat="server" Text="Tipo:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="tipo" placeholder="Tipo del hilo" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" class="control-label col-sm-2" runat="server" Text="Valor:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="valor" placeholder="Valor por metro del hilo" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" class="control-label col-sm-2" runat="server" Text="Cantidad:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="cantidad" placeholder="Cantidad del hilo a solicitar" runat="server" required></asp:TextBox>
                    </div>
                </div>
                
            </div>
       </div>
        <!-- Botón registrar -->
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-1 col-center">
                <div class="btn-group">
                    <input id="registrar" type="button" class="btn btn-default" value="Registrar" />
                </div>
            </div>
        </div>
        &nbsp
        <!-- Formulario Buscar -->
     <div class="row">
         <div class="col-md-12">
             <div class="form-group">
                 <asp:Label ID="Label4" class="control-label col-sm-2" runat="server" Text="Buscar:"></asp:Label>
                 <div class="col-md-7">
                     <asp:TextBox ID="txtbuscar" type="text" class="form-control" placeholder="Referencia del hilo" runat="server"></asp:TextBox>
                 </div>
                 <div class="col-md-1">
                     <input id="buscar" type="button" class="btn btn-default" value="Buscar" />
                 </div>

                 <input id="verTodos" type="button" class="btn btn-default" value="Ver todos" />
             </div>
         </div>
     </div>

        <!-- Tabla Registro -->
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="table-responsive " id="tablaHilos2">

                        <!-- Table -->
                        <table class="table" id="registrohilos2">
                        </table>
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- Botón Finalizar Pedido -->
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1 col-center">
                <div class="btn-group">
                    <asp:Button ID="fin_pedido" type="button" class="btn btn-default" runat="server" Text="Finalizar pedido" OnClick="fin_pedido_Click" />
                </div>
            </div>

        </div>
        <asp:HiddenField runat="server" ID="_repostcheckcode" />
    </form>

    <!--Footer-->
    <div class="form-group">
        <div class="col-sm-12">
            <!--Icons-->
            <!--Menu-->

            <span id="footer">
                Fiber&copy; Producto:<a href="#">HEXI</a>
            </span> 
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade bs-example-bg" id="modalBuscar" tabindex="-1" role="dialog" aria-labelledby="modalBuscarLabel" data-backdrop="static">
        <div class="modal-dialog modal-bg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="table-responsive" id="tablaHilo">
                        <div class="panel panel-default">
                            <!-- Table -->
                            <table class="table" id="hilo">
             
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
    <!-- /Modal -->

    <!-- Modal2 -->
    <div class="modal fade bs-example-bg" id="modalTodos" tabindex="-1" role="dialog" aria-labelledby="modalVerTodosLabel" data-backdrop="static">
        <div class="modal-dialog modal-bg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="table-responsive" id="tablaHilos">
                        <div class="panel panel-default">
                            <!-- Table -->
                            <table class="table" id="TodosHilos">
             
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
    <!-- /Modal2 -->
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
    <script type="text/javascript">
        
        $("#buscar").click(function () {
            var dataString = '{"referencia" : "' + $("#txtbuscar").val() + '"}';
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/buscarHiloPedido",
                data: dataString,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                processdata: true,
                success: function (Dato) {
                    console.log(Dato.buscarHiloPedidoResult);
                    item = Dato.buscarHiloPedidoResult;
                    $("#hilo").html('');
                    $("#hilo").append('<thead><tr><th>Id</th><th>Referencia</th><th>Tipo</th><th>Título</th><th>Color</th><th>Valor Metro</th><th>Acción</th></tr></thead>');
                    $("#hilo").append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $("#hilo").append('<tr><td>' + value.Id_Hilo + '</td><td>' + value.Referencia_Hilo + '</td><td>' + value.Tipo_Hilo + '</td><td>' + value.Titulo_Hilo + '</td><td>' + value.Color_Hilo + '</td><td>' + value.ValorMetro + '</td><td><button  class="btn btn-default seleccionar" value="' + value.Id_Hilo + '">Seleccionar</button></td></tr>');
                    });
                    $("#modalBuscar").modal('show');
                    $(".seleccionar").click(function () {
                        dataString = '{"id":"' + $(this).val() + '"}';
                        $.ajax({
                            type: "POST",
                            url: "ServiceLectorQR.svc/buscarHiloPedidoId",
                            data: dataString,
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (Dato) {
                                console.log(Dato.buscarHiloPedidoIdResult);
                                item = Dato.buscarHiloPedidoIdResult;
                                $.each(item, function (index, value) {
                                    $("#id").val(value.Id_Hilo);
                                    $("#referencia").val(value.Referencia_Hilo);
                                    $("#tipo").val(value.Tipo_Hilo);
                                    $("#titulo").val(value.Titulo_Hilo);
                                    $("#color").val(value.Color_Hilo);
                                    $("#valor").val(value.ValorMetro);
                                });
                                $("#modalBuscar").modal('hide');
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
            alert("Entró al Click");
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/buscarTodosHilosP",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (Dato) {
                    alert("Entró al success");
                    console.log(Dato.buscarTodosHilosPResult);
                    item = Dato.buscarTodosHilosPResult;
                    $("#TodosHilos").html('');
                    $("#TodosHilos").append('<thead><tr><th>Id</th><th>Referencia</th><th>Tipo</th><th>Título</th><th>Color</th><th>Valor Metro</th><th>Accion</th></tr></thead>');
                    $("#TodosHilos").append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $("#TodosHilos").append('<tr><td>' + value.Id_Hilo + '</td><td>' + value.Referencia_Hilo + '</td><td>' + value.Tipo_Hilo + '</td><td>' + value.Titulo_Hilo + '</td><td>' + value.Color_Hilo + '</td><td>' + value.ValorMetro + '</td><td><button class="btn btn-default seleccionar" value="' + value.Id_Hilo + '">Seleccionar</button></td></tr>');
                    });
                    $("#modalTodos").modal('show');
                    $(".seleccionar").click(function () {
                        dataString = '{"id":"' + $(this).val() + '"}';
                        $.ajax({
                            type: "POST",
                            url: "ServiceLectorQR.svc/buscarHiloPedidoId",
                            data: dataString,
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (Dato) {
                                console.log(Dato.buscarHiloPedidoIdResult);
                                item = Dato.buscarHiloPedidoIdResult;
                                $.each(item, function (index, value) {
                                    $("#id").val(value.Id_Hilo);
                                    $("#referencia").val(value.Referencia_Hilo);
                                    $("#tipo").val(value.Tipo_Hilo);
                                    $("#titulo").val(value.Titulo_Hilo);
                                    $("#color").val(value.Color_Hilo);
                                    $("#valor").val(value.ValorMetro);
                                });
                                $("#modalTodos").modal('hide');
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
            dataString = '{"id":"' + $("#id").val() + '", "metros":"' + $("#cantidad").val() + '", "valor":"' + $("#valor").val() + '"}';
            alert(dataString);
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/registrarHiloP",
                data: dataString,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (Dato) {
                    alert("entró al success");
                    console.log(Dato.registrarHiloPResult);
                    item = Dato.registrarHiloPResult;
                    $("#registrohilos2").html('');
                    $("#registrohilos2").append('<thead><tr><th>Id hilo</th><th>Metros</th><th>Valor por hilo</th><th>Acción</th></tr></thead>');
                    $("#registrohilos2").append('<tbody></tbody>');
                    var lastIndex = 0;
                    $.each(item, function (index, value) {
                        $("#registrohilos2").append('<tr><td>' + value.Id_Hilo + '</td><td>' + value.Metros_Hilo + '</td><td>' + value.ValorTotal_Hilo + '</td><td><button class="btn btn-danger quitar" value="' + value.Id_Hilo + '">Quitar</button></td></tr>');
                        lastIndex = index;
                    });
                    $("#registrohilos2").append('<tr><td></td><td><b>Total:</b></td><td>' + item[lastIndex].ValorTotal + '</td><td></td></tr>');
                    $("#id, #referencia, #tipo, #titulo, #color, #cantidad, #valor").val('');
                    
                },
                error: function (request, status, error) {
                    alert(error);
                }
            });
        });
        
    </script>
</body>
</html>
