<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioConsumoProductos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioConsumoProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen"/>
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
    <link href="css/stacktable.css" rel="stylesheet"/>
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script>
        function registro() {
            swal("¡Proceso exitoso!", "", "success");
        }

        function problema() {
            swal("Oops...", "Ocurrió un error inesperado", "info");
        }

        function campos() {
            swal("Oops...", "No llenó el campo de consumo.", "warning");
        }
    </script>
    <title>Fiber|Consumo Productos</title>
</head>
<body>
    <div id="page-wrapper">

        <!-- Header -->
        <header id="header" class="alt">
            <a href="PConsumo.aspx">
                <h1>
                    <img class="atras" src="Iconos/Material%20Iconse5c41024.png" /></h1>
            </a>
            <nav>
                <a href="#menu"></a>
            </nav>
        </header>
        <!-- /Header -->

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
        <!-- /Mennu -->
    </div>

    <!-- Container Icono-->
    <div class="container">
        <div class="jumbotron">
            <img class = "img" src = "Iconos/Fiber.png"/>
        </div>
    </div>
    <!-- /Container Icono -->

    <!-- Form -->
    <form id="form1" class="form-horizontal" runat="server">
        <div class="row">
            <!-- Columna derecha -->
            <div class="col-md-5 col-md-offset-1">
                <!-- Id del producto -->
                <asp:TextBox ID="id" style="display: none;" type="text" CssClass="form-control" runat="server"></asp:TextBox>
                
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

                <!-- Placa del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Placa" CssClass="control-label col-sm-2" runat="server" Text="Placa:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="placa" ReadOnly="true" type="text" CssClass="form-control" placeholder="Placa del producto" runat="server"></asp:TextBox>
                     </div>
                </div>

                <!-- Modelo del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Modelo" CssClass="control-label col-sm-2" runat="server" Text="Modelo:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="modelo" ReadOnly="true" type="text" CssClass="form-control" placeholder="Modelo del producto" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Cantidad del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Cantidad" CssClass="control-label col-sm-2" runat="server" Text="Cantidad"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="cantidad" ReadOnly="true" type="text" CssClass="form-control" placeholder="Cantidad del producto" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <!-- Columna izquierda -->
            <div class="col-md-5">
                <!-- Nombre del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Nombre" CssClass="control-label col-sm-2" runat="server" Text="Nombre:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="nombre" ReadOnly="true" type="text" CssClass="form-control" placeholder="Nombre del producto" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Novedad del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Novedad" CssClass="control-label col-sm-2" runat="server" Text="Novedad:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="novedad" ReadOnly="true" type="text" CssClass="form-control" placeholder="Novedad del producto" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Serial del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Serial" CssClass="control-label col-sm-2" runat="server" Text="Serial:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="serial" ReadOnly="true" type="text" CssClass="form-control" placeholder="Serial del producto" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Marca del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_Marca" CssClass="control-label col-sm-2" runat="server" Text="Marca:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="marca" ReadOnly="true" type="text" CssClass="form-control" placeholder="Marca del producto" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Consumo del producto -->
                <div class="form-group">
                    <asp:Label ID="lbl_consumo" CssClass="control-label col-sm-2" runat="server" Text="Consumo:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="consumo" type="text" CssClass="form-control" placeholder="Consumo del producto" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div> 
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-center">
                <div class="btn-group">
                    <input id="registrar" type="button" class="btn btn-default" value="Registrar" />
                </div>
            </div>
        </div>
        &nbsp
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Label ID="Label4" class="control-label col-sm-2" runat="server" Text="Buscar:"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtbuscar" type="text" class="form-control" placeholder="Nombre Producto" runat="server"></asp:TextBox>
                    </div>
                    <div class=" col-md-1">
                        <input id="buscar" type="button" class="btn btn-default" value="Buscar" />
                    </div>

                    <input id="verTodos" type="button" class="btn btn-default" value="Ver todos" />
                </div>
            </div>
        </div>
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

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1 col-center">
                <div class="btn-group">
                    <asp:Button ID="fin_consumo" type="button" CssClass="btn btn-default" runat="server" Text="Finalizar consumo" OnClick="fin_consumo_Click" />
                </div>
            </div>
        </div>
 
        <asp:HiddenField runat="server" ID="_repostcheckcode" />
    </form>
    <div class="form-group">
        <div class="col-sm-12">
            <!-- Icons -->
            <!-- Menu -->

            <span id="footer">Fiber&copy; Producto: <a href="#">HEXI</a></span>
        </div>
    </div>

    <!--Modal Buscar -->
    <div class="modal fade bs-example-bg" id="modalBuscar" tabindex="-1" role="dialog" aria-labelledby="modalBuscarLabel" data-backdrop="static">
        <div class="modal-dialog modal-bg" role="document">
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
    <!-- /Modal1 -->

    <!-- Modal2 -->
    <div class="modal fade bs-example-bg" id="modalTodos" tabindex="-1" role="dialog" aria-labelledby="modalVerTodosLabel" data-backdrop="static">
        <div class="modal-dialog modal-bg" role="document">
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
    <!-- /Modal2 -->
    <script>$('[data-toggle="tooltip"]').tooltip(); </script>
    <script src="jvscript/jquery-3.1.0.js"></script>


    <script src="jvscript/stacktable.min.js" type="text/javascript"></script>

<script>
  $(document).on('click', '#run', function(e) {
    e.preventDefault();
    $('#simple-example-table').stacktable();
    $(this).replaceWith('<span>ran - resize your window to see the effect</span>');
  });
  $('#responsive-example-table').stacktable({myClass:'your-custom-class'});
  $('#cphMainContent_dgvUsers').cardtable();
  $('#agenda-example').stackcolumns();
      </script>
<script type="text/javascript" src="jvscript/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="jvscript/bootstrap.min.js"></script>
<script type="text/javascript" src="jvscript/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="jvscript/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        format: 'dd/mm/yyyy hh:ii:ss',
        language: 'es',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
</script>
 <script src="jvscript/js1/skel.min.js"></script>
 <script src="jvscript/js1/jquery.min.js"></script>
 <script src="jvscript/js1/jquery.scrollex.min.js"></script>
 <script src="jvscript/js1/util.js"></script>
 <script src="jvscript/js1/main.js"></script>
 <script src="jvscript/jquery-3.1.0.js"></script>
 <script src="jvscript/bootstrap.js"></script>
 <script src="jvscript/animacion.js"></script>
 <script>
     $("#buscar").click(function () {
         var dataString = '{"referencia":"' + $("#txtbuscar").val() + '"}';

         $.ajax({
             type: "POST",
             url: "ServiceLectorQR.svc/buscarProducto",
             data: dataString,
             contentType: "application/json; charset=ut-8",
             dataType: "json",
             processdata: true,
             success: function (Dato) {
                 console.log(Dato.buscarProductoResult);
                 item = Dato.buscarProductoResult;
                 $("#tablaProducto").html('');
                 $("#tablaProducto").append('<thead class="text-center"><tr><th>Id</th><th>Referencia</th><th>Nombre</th><th>Placa</th><th>Cantidad</th><th>Accion</th></tr></thead>');
                 $("#tablaProducto").append('<tbody></tbody>');
                 $.each(item, function (index, value) {
                     $("#tablaProducto").append('<tr><td>' + value.Id_Producto + '</td><td>' + value.Referencia_Producto + '</td><td>' + value.Nombre_Producto + '</td><td>' + value.Placa_Producto + '</td><td>' + value.Cantidad_Producto + '</td><td><button id="seleccionar" class="btn btn-default" value="' + value.Id_Producto + '">Seleccionar</button></td></tr>');
                 });
                 $("#modalBuscar").modal('show');
                 $("#seleccionar").click(function () {
                     dataString = '{"id" : "' + $(this).val() + '"}';
                     alert(dataString);
                     $.ajax({
                         type: "POST",
                         url: "ServiceLectorQR.svc/buscarProductoId",
                         data: dataString,
                         dataType: "json",
                         contentType: "application/json; charset=utf-8",
                         success: function (Dato) {
                             item = Dato.buscarProductoIdResult;
                             $.each(item, function (index, value) {
                                 $("#id").val(value.Id_Producto);
                                 $("#referencia").val(value.Referencia_Producto);
                                 $("#nombre").val(value.Nombre_Producto);
                                 $("#descripcion").val(value.Descripcion_Producto);
                                 $("#novedad").val(value.Novedad_Producto);
                                 $("#placa").val(value.Placa_Producto);
                                 $("#serial").val(value.Serial_Producto);
                                 $("#cantidad").val(value.Cantidad_Producto);
                                 $("#modelo").val(value.Modelo_Producto);
                                 $("#marca").val(value.Marca_Producto);
                             });
                             $("#modalBuscar").modal('hide');
                         },
                         error: function (request) {
                             alert("ERROR al llamar el servicio" + request.status + " " + request.statusText);
                         }
                     });
                 });
                 
             },
             error: function (Mensaje) {
                 alert("ERROR al llamar el servicio" + Mensaje.status + " " + Mensaje.statusText);
             }
         });
     });
     $("#verTodos").click(function () {
         $.ajax({
             type: "POST",
             url: "ServiceLectorQR.svc/buscarTodosProductos",
             dataType: "json",
             contentType: "application/json; charset=utf-8",
             success: function (Dato) {
                 
                 item = Dato.buscarTodosProductosResult;
                 $("#tablaTodos").html('');
                 $("#tablaTodos").append('<thead class="text-center"><tr><th>Id</th><th>Referencia</th><th>Nombre</th><th>Placa</th><th>Cantidad</th><th>Accion</th></tr></thead>');
                 $("#tablaTodos").append('<tbody></tbody>');
                 $.each(item, function (index, value) {
                     $("#tablaTodos").append('<tr><td>' + value.Id_Producto + '</td><td>' + value.Referencia_Producto + '</td><td>' + value.Nombre_Producto + '</td><td>' + value.Placa_Producto + '</td><td>' + value.Cantidad_Producto + '</td><td><button class="btn btn-default seleccionar" value="' + value.Id_Producto + '">Seleccionar</button></td></tr>');
                 });
                 $("#modalTodos").modal('show');
                 $(".seleccionar").click(function () {
                     dataString = '{"id" : "' + $(this).val() + '"}';
                     $.ajax({
                         type: "POST",
                         url: "ServiceLectorQR.svc/buscarProductoId",
                         data: dataString,
                         dataType: "json",
                         contentType: "application/json; charset=utf-8",
                         success: function (Dato) {
                             item = Dato.buscarProductoIdResult;
                             $.each(item, function (index, value) {
                                 $("#id").val(value.Id_Producto);
                                 $("#referencia").val(value.Referencia_Producto);
                                 $("#nombre").val(value.Nombre_Producto);
                                 $("#descripcion").val(value.Descripcion_Producto);
                                 $("#novedad").val(value.Novedad_Producto);
                                 $("#placa").val(value.Placa_Producto);
                                 $("#serial").val(value.Serial_Producto);
                                 $("#cantidad").val(value.Cantidad_Producto);
                                 $("#modelo").val(value.Modelo_Producto);
                                 $("#marca").val(value.Marca_Producto);
                             });
                             $("#modalTodos").modal('hide');
                         },
                         error: function (request) {
                             alert("ERROR al llamar el servicio" + request.status + " " + request.statusText);
                         }
                     });
                 });
             }
         });
     });

     $("#registrar").click(function () {
         dataString = '{"id":"' + $("#id").val() + '","referencia":"' + $("#referencia").val() + '","cantidad":"' + $("#cantidad").val() + '","consumo":"'+$("#consumo").val()+'"}';
         alert(dataString);
         $.ajax({
             type: "POST",
             url: "ServiceLectorQR.svc/registrarProducto",
             data: dataString,
             dataType: "json",
             contentType: "application/json; charset=utf-8",
             processdata: true,
             success: function (Dato) {
                 console.log(Dato.registrarProductoResult);
                 item = Dato.registrarProductoResult;
                 $("#tablaProductos1").html('');
                 $("#tablaProductos1").append('<thead><tr><th>Id</th><th>Referencia</th><th>Cantidad</th><th>Consumo</th><th>Acción</th></tr></thead>');
                 $("#tablaProductos1").append('<tbody></tbody>');
                 $.each(item, function (index, value) {
                     $("#tablaProductos1").append('<tr><td>' + value.Id_Producto + '</td><td>' + value.Referencia_Producto + '</td><td>' + value.Cantidad_Producto + '</td><td>' + value.Consumo + '</td><td><button id="olvidar" value="' + value.Id_Producto + '" class="btn btn-danger">Quitar</button></td></tr>');
                 });
                 $("#id, #referencia, #nombre, #descripcion, #novedad, #placa, #serial, #modelo, #marca, #cantidad, #consumo").val('');

             },
             error: function (Mensaje) {
                 alert("ERROR al llamar el servicio53 " + Mensaje.status + " " + Mensaje.statusText);
             }
         });

         $("#olvidar").click(function () {
             var dataString5 = '{"id":"' + $("#olvidar").val() + '"}';
             alert(dataString5);
             $.ajax({
                 type: "POST",
                 url: "ServiceLectorQR.svc/olvidarProducto",
                 data: dataString5,
                 dataType: "json",
                 contentType: "application/json; charset=utf-8",
                 processdata: true,
                 success: function (Dato) {
                     item = Dato.olvidarHiloResult;
                     $("#tablaProductos1").html('');
                     $("#tablaProductos1").append('<thead><tr><th>Id</th><th>Referencia</th><th>Cantidad</th><th>Consumo</th><th>Acción</th></tr></thead>');
                     $("#tablaProductos1").append('<tbody></tbody>');
                     $.each(item, function (index, value) {
                         $("#tablaProductos1").append('<tr><td>' + value.Id_Producto + '</td><td>' + value.Referencia_Producto + '</td><td>' + value.Cantidad_Producto + '</td><td>' + value.Consumo + '</td><td><button id="olvidar" value="' + value.Id_Hilo + '" class="btn btn-danger">Quitar</button></td></tr>');
                     });
                 },
                 error: function (Mensaje) {
                     alert("Error");
                 }
             });
         });
     });
 </script>
</body>
</html>
