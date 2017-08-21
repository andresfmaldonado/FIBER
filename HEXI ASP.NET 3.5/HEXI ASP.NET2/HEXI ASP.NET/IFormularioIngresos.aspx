<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioIngresos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioIngresos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/inform.css"/>
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script>
        function registro() {
            swal("Proceso éxitoso!", "", "success");
        };
    </script>
    <script>
        function problema(descriptionp) {
            swal('Oops...', 'Ocurrió un error inesperado! '+descriptionp, 'info');
        }
        function modificacion() {
            swal("Actualización éxitosa!", "", "success");
        }
        function yaexiste() {
            swal('Oops...', 'Esta cohorte ya existe!', 'error');
        }
        function yaexistedni() {
            swal('Oops...', 'Ya existe una cohorte con este DNI!', 'error');
        }
        function campos() {
            swal('Oops...', 'No completó los campos de forma correcta o te hizo falta alguno(s)!', 'warning');
        }

        function noprocess() {
            swal('Oops...', 'No ha procesado ningun producto!', 'warning');
        }
    </script>
    <title>Fiber|Ingresos</title>
</head>
<body>
    <div id="page-wrapper">

        <!-- Header -->
        <header id="header" class="alt">
            <a href="PprincipalInventariosAdmin.aspx">
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
     <div class="container">
        <br />
        <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
                <form id="form1" runat="server">
                 <div class="panel panel-default">
                    <!--panel-heading -->
                    <div class="panel-heading config">
                        <i class="fa fa-tags fa-fw"></i> Categoría
                        <div class="pull-right">
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                            <div id="catped">
                                <div class="form-group">
                                    <label for="exampleInputMes">Categoría Pedido:</label>
                                    <select class="form-control" id="DropDownList3" onchange="categp();">
                                        <option value="0">Seleccione una categoria</option>
                                        <option value="1">Pedido productos</option>
                                        <option value="2">Pedido hilos </option>
                                    </select>
                                    <span class="help-block"></span>
                                </div>
                                <!--<div class="text-center"><button type="button" class="btn btn-primary" id="tiped">Aceptar</button></div>-->
                            </div>
                    </div>
                </div>
                                <div class="panel panel-default" style="display:none;" id="pedproduct">
                    <!--panel-heading -->
                    <div class="panel-heading config">
                        <i class="fa fa-shopping-cart fa-fw"></i> Productos
                        <div class="pull-right">
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                            <div id="pediprod">
                                <div class="form-group">
                                    <label for="exampleInputMes">Pedido:</label>
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" onchange="validacion('DropDownList1');">

                                    </asp:DropDownList>
                                    <span class="help-block"></span>
                                </div>
                                <div class="text-center"><button type="button" class="btn btn-primary" id="getpediproduc">Verificar compras</button></div>
                            </div>
                    </div>
                </div>
                 <div class="panel panel-default" style="display:none;" id="pedhilos">
                    <!--panel-heading -->
                    <div class="panel-heading config">
                        <i class="fa fa-shopping-cart fa-fw"></i> Hilos
                        <div class="pull-right">
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                            <div id="pedihilos">
                                <div class="form-group">
                                    <label for="exampleInputMes">Pedido:</label>
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server" onchange="validacion('DropDownList2');">

                                    </asp:DropDownList>
                                    <span class="help-block"></span>
                                </div>
                                <div class="text-center"><button type="button" class="btn btn-primary" id="getpedhilo">Verificar compras</button></div>
                            </div>
                    </div>
                </div>
            </form>
            </div>
            <div class="col-sm-8 col-md-8 co-lg-8 informes">
                <div class="panel panel-default" id="tableproducts" style="display:none;">
                    <!--panel-heading -->
                    <div class="panel-heading">
                        <i class="fa fa-cubes fa-fw"></i> <span class="label label-primary" id="date">01/02/2017</span>
                        <div class="pull-right">
                           <button class="btn btn-primary btn-xs" id="viewshop"><i class="fa fa-eye" aria-hidden="true"></i> Ver compras</button>
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                        <div class="table-responsive text-center" id="contentinform">
                            <table class="table table-bordered table-hover table-striped" id="getpedido">
                                </table>
                            </div>
                        </div>
                    </div>
         <div class="panel panel-default" id="tablehilos" style="display:none;">
                    <!--panel-heading -->
                    <div class="panel-heading">
                        <i class="fa fa-cubes fa-fw"></i> <span class="label label-primary" id="dateh">01/02/2017</span>
                        <div class="pull-right">
                           <button class="btn btn-primary btn-xs" id="viewshoph"><i class="fa fa-eye" aria-hidden="true"></i> Ver compras</button>
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                        <div class="table-responsive text-center" id="contentinform">
                            <table class="table table-bordered table-hover table-striped" id="gethilo">
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
         </div>
    <div class="form-group">
        <div class="col-sm-12">
            <!-- Icons -->
            <!-- Menu -->

            <span id="footer">Fiber&copy; Producto: <a href="#">HEXI</a></span>
        </div>
    </div>
    <!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        <h4 class="modal-title" id="exampleModalLabel">Confirmación producto</h4>
      </div>
      <div class="modal-body">
        <form>
         <div class="form-group">
            <label for="recipient-name" class="control-label">Referencia:</label>
            <input type="text" class="form-control" id="refer_p" readonly />
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Nombre:</label>
            <input type="text" class="form-control" id="name_p" readonly />
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Cantidad defectuosa:</label>
            <input type="text" class="form-control" id="cantidad_d" onkeyup="validacion('cantidad_d');"/>
            <span class="help-block"></span>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Cantidad Total:</label>
            <input type="text" class="form-control" id="cantidad_p" onkeyup="validacion('cantidad_p');"/>
          <span class="help-block"></span>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Observaciones:</label>
            <textarea class="form-control" id="observaciones_p" onkeyup="validacion('observaciones_p');"></textarea>
          <span class="help-block"></span>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="registrar();">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bs-example-modal-sm" id="exampleModalh" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        <h4 class="modal-title" id="exampleModalLabelh">Confirmación producto</h4>
      </div>
      <div class="modal-body">
        <form>
         <div class="form-group">
            <label for="recipient-name" class="control-label">Referencia:</label>
            <input type="text" class="form-control" id="refer_h" readonly />
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Titulo:</label>
            <input type="text" class="form-control" id="title_h" readonly />
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Color:</label>
            <input type="text" class="form-control" id="color_h" readonly/>
          </div>
            <div class="form-group">
            <label for="message-text" class="control-label">Cantidad defectuosa:</label>
            <input type="text" class="form-control" id="cantidad_d_h" onkeyup="validacion('cantidad_d_h');"/>
          <span class="help-block"></span>
         </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Cantidad Total:</label>
            <input type="text" class="form-control" id="cantidad_h" onkeyup="validacion('cantidad_h');"/>
         <span class="help-block"></span>
         </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">Observaciones:</label>
            <textarea class="form-control" id="observaciones_h" onkeyup="validacion('observaciones_h');"></textarea>
          <span class="help-block"></span>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="registrarph();">Aceptar</button>
      </div>
    </div>
  </div>
</div>

 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="myModalLabel">Compras confirmadas</h4>
                </div>
                <div class="modal-body">
                    <div class="table-responsive shop" id="contentinform">
                        <div class="panel panel-default">
                            <!-- Table -->
                            <table class="table" id="prodtosconfirmads">
                                <thead>
                                    <tr>
                                        <th>Referencia</th>
                                        <th>Nombre</th>
                                        <th>Cantidad defectuosa</th>
                                        <th>Cantidad Total</th>
                                        <th>Observaciones</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="text-center">
                    <img src="Imagenes/loader.svg" id="processhop" style="display:none;"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="optionshop">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" onclick="registershop();">Registrar compras</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="myModalLabelh">Compras confirmadas</h4>
                </div>
                <div class="modal-body">
                    <div class="table-responsive shoph" id="contentinform">
                        <div class="panel panel-default">
                            <!-- Table -->
                            <table class="table" id="prodtosconfirmadsh">
                                <thead>
                                    <tr>
                                        <th>Referencia</th>
                                        <th>Titulo</th>
                                        <th>Color</th>
                                        <th>Cantidad defectuosa</th>
                                        <th>Cantidad Total</th>
                                        <th>Observaciones</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="text-center">
                    <img src="Imagenes/loader.svg" id="processhoph" style="display:none;"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="optionshoph">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" onclick="registershop();">Registrar compras</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <script src="jvscript/js1/skel.min.js"></script>
    <script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <!--<script src="js/jquery-3.1.0.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="jvscript/bootstrap.js"></script>
    <script>
    var optiondropdown;
    document.getElementById('DropDownList1').insertBefore(new Option('Seleccione un pedido', '0'), document.getElementById("DropDownList1").firstChild);
    document.getElementById('DropDownList1').value = '0';
    document.getElementById('DropDownList2').insertBefore(new Option('Seleccione un pedido', '0'), document.getElementById("DropDownList2").firstChild);
    document.getElementById('DropDownList2').value = '0';
    $('#getpediproduc').click(function () {
        var t1 = 0;
        t1 = validacion('DropDownList1');
        if (t1 === false) {
            return false;
        } else {
            var option = $('#DropDownList1 option:selected').text();
            var fecha = option.substring(0, 11);
            $('#date').text(fecha);
            optiondropdown = $('#DropDownList1 option:selected').val();
            $.ajax({
                type: "POST", //GET or POST or PUT or DELETE verb
                url: "ServiceLectorQR.svc/tablapedidop", // Location of the service
                data: '{"referencia": "' + optiondropdown + '"}', //Data sent to server
                contentType: "application/json; charset=utf-8", // content type sent to server
                dataType: "json", //Expected data format from server
                processdata: true, //True or False
                success: function (Dato) {//On Successfull service call
                    console.log(Dato.tablapedidopResult);
                    item = Dato.tablapedidopResult;
                    $('#getpedido').html('');
                    $('#getpedido').append('<thead class="text-center"><tr><th>#</th><th>Referencia</th><th>Nombre</th><th>Cantidad</th><th></th></tr>');
                    $('#getpedido').append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        console.log(value.Id_Producto);
                        if (value.Estado_Pedido == "SI") {
                            $('#getpedido').append('<tr id="re' + value.Id_Producto + '"><td id="cod' + value.Id_Producto + '">' + value.Id_Producto + '</td><td id="refer' + value.Id_Producto + '">' + value.Referencia_Producto + '</td><td id="name' + value.Id_Producto + '">' + value.Nombre_Producto + '</td><td id="cantid' + value.Id_Producto + '">' + value.Cantidad_Producto + '</td><td><a class="label label-success" id="btn' + value.Id_Producto + '"><i class="fa fa-check-circle" aria-hidden="true"></i> Confirmado</a></td>');
                        } else {
                            $('#getpedido').append('<tr id="re' + value.Id_Producto + '"><td id="cod' + value.Id_Producto + '">' + value.Id_Producto + '</td><td id="refer' + value.Id_Producto + '">' + value.Referencia_Producto + '</td><td id="name' + value.Id_Producto + '">' + value.Nombre_Producto + '</td><td id="cantid' + value.Id_Producto + '">' + value.Cantidad_Producto + '</td><td><button class="btn btn-info" value=' + JSON.stringify(value) + ' onclick="confirmarcompra(value);" id="btn' + value.Id_Producto + '">Confirmar compra</button></td>')
                        }
                    });
                },
                error: function (Mensaje) {
                    alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
                }// When Service call fails
            });
            return true;
        }
    });

    $('#getpedhilo').click(function () {
        var f1 = 0;
        f1 = validacion('DropDownList2');
        if (f1 === false) {
            return false;
        } else {
            var option = $('#DropDownList2 option:selected').text();
            var fecha = option.substring(0, 11);
            $('#dateh').text(fecha);
            optiondropdown = $('#DropDownList2 option:selected').val();
            $.ajax({
                type: "POST", //GET or POST or PUT or DELETE verb
                url: "ServiceLectorQR.svc/tablapedidoh", // Location of the service
                data: '{"referencia": "' + optiondropdown + '"}', //Data sent to server
                contentType: "application/json; charset=utf-8", // content type sent to server
                dataType: "json", //Expected data format from server
                processdata: true, //True or False
                success: function (Dato) {//On Successfull service call
                    console.log(Dato.tablapedidohResult);
                    item = Dato.tablapedidohResult;
                    $('#gethilo').html('');
                    $('#gethilo').append('<thead class="text-center"><tr><th>#</th><th>Referencia</th><th>Titulo</th><th>Color</th><th>Metros</th><th></th></tr>');
                    $('#gethilo').append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        console.log(value.Id_Producto);
                        if (value.Estado_Pedido == "SI") {
                            $('#gethilo').append('<tr id="reh' + value.Id_Hilo + '"><td id="codh' + value.Id_Hilo + '">' + value.Id_Hilo + '</td><td id="referh' + value.Id_Hilo + '">' + value.Referencia_Hilo + '</td><td id="title' + value.Id_Hilo + '">' + value.Titulo_Hilo + '</td><td id="color' + value.Id_Hilo + '">' + value.Color_Hilo + '</td><td id="mtros' + value.Id_Hilo + '">' + value.Metros_Hilo + '</td><td><a class="label label-success" id="btnh' + value.Id_Hilo + '"><i class="fa fa-check-circle" aria-hidden="true"></i> Confirmado</a></td>');
                        } else {
                            $('#gethilo').append('<tr id="reh' + value.Id_Hilo + '"><td id="codh' + value.Id_Hilo + '">' + value.Id_Hilo + '</td><td id="referh' + value.Id_Hilo + '">' + value.Referencia_Hilo + '</td><td id="title' + value.Id_Hilo + '">' + value.Titulo_Hilo + '</td><td id="color' + value.Id_Hilo + '">' + value.Color_Hilo + '</td><td id="mtros' + value.Id_Hilo + '">' + value.Metros_Hilo + '</td><td><button class="btn btn-info" value=' + JSON.stringify(value) + ' onclick="confirmarcomprah(value);" id="btnh' + value.Id_Hilo + '">Confirmar compra</button></td>')
                        }
                    });
                },
                error: function (Mensaje) {
                    alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
                }// When Service call fails
            });
            return true;
        }
    });

    function categp() {
        tipopedido = $('#DropDownList3 option:selected').val();
        if (tipopedido == null || tipopedido == 0) {
            $('#DropDownList3').parent().attr("class", "form-group has-error");
            $('#DropDownList3').parent().children('span').text("Seleccione una categoria").show();
            return false;
        }
        else {
            $('#DropDownList3').parent().attr("class", "form-group has-success");
            $('#DropDownList3').parent().children('span').hide();

            if (tipopedido == 1) {
                $('#pedproduct').show();
                $('#tableproducts').show();
                $('#tablehilos').hide();
                $('#pedhilos').hide();
            }
            if (tipopedido == 2) {
                $('#pedproduct').hide();
                $('#tableproducts').hide();
                $('#pedhilos').show();
                $('#tablehilos').show();
            }
        }
    }

    var producto;
    var hilo;
    function confirmarcompra(product) {
        $('#header').css('z-index', '1000');
        producto=JSON.parse(product);
        $('#refer_p').val(producto.Referencia_Producto);
        $('#name_p').val(producto.Nombre_Producto);
        $('#cantidad_p').val(producto.Cantidad_Producto);
        $('#cantidad_d').val(0);
        $('#observaciones_p').val('Todo correcto');
        $('#exampleModal').modal('show');
    }

    function confirmarcomprah(h) {
        $('#header').css('z-index', '1000');
        hilo = JSON.parse(h);
        $('#refer_h').val(hilo.Referencia_Hilo);
        $('#title_h').val(hilo.Titulo_Hilo);
        $('#color_h').val(hilo.Color_Hilo);
        $('#cantidad_d_h').val(0);
        $('#cantidad_h').val(hilo.Metros_Hilo);
        $('#observaciones_h').val('Todo correcto');
        $('#exampleModalh').modal('show');
    }

    function registrar() {
        var v1 = 0, v2 = 0, v3 = 0;
        v1 = validacion("cantidad_d");
        v2 = validacion("cantidad_p");
        v3 = validacion("observaciones_p");
        // v7 = validacion("metros");
        if (v1 === false || v2 === false || v3 === false) {
            $("#error").show();
            return false;
        } else {
            var observac = document.getElementById('observaciones_p').value;
            var cantidpro = document.getElementById('cantidad_p').value;
            var cantidmala = document.getElementById('cantidad_d').value;

            var productoconfirmado = {
                Id: producto.Id_Producto,
                Referencia: producto.Referencia_Producto,
                Nombre: producto.Nombre_Producto,
                CantidadTotal: cantidpro,
                CantidadDefectuosa: cantidmala,
                Observaciones: observac
            };
            dbingresos.push(productoconfirmado);
            $('#btn' + producto.Id_Producto).css('display', 'none');
            $('#exampleModal').modal('hide');
        }
    }

    function registrarph() {
        var c1 = 0, c2 = 0, c3 = 0;
        c1 = validacion("cantidad_d_h");
        c2 = validacion("cantidad_h");
        c3 = validacion("observaciones_h");
        // v7 = validacion("metros");
        if (c1 === false || c2 === false || c3 === false) {
            $("#error").show();
            return false;
        } else {
            var observach = document.getElementById('observaciones_h').value;
            var cantidh = document.getElementById('cantidad_h').value;
            var cantidmalah = document.getElementById('cantidad_d_h').value;

            var hiloconfirmado = {
                Id: hilo.Id_Hilo,
                Referencia: hilo.Referencia_Hilo,
                Titulo: hilo.Titulo_Hilo,
                Color: hilo.Color_Hilo,
                CantidadTotal: cantidh,
                CantidadDefectuosa: cantidmalah,
                Observaciones: observach
            };
            dbingresosh.push(hiloconfirmado);
            $('#btnh' + hilo.Id_Hilo).css('display', 'none');
            $('#exampleModalh').modal('hide');
        }
    }
    var dbingresos = [];
    var dbingresosh = [];
    $(document).ready(function () {
        dbingresos = [];
        dbingresosh = [];
    });

    $('#viewshop').click(function () {
        if (dbingresos.length === 0) {
            noprocess();
        } else {
            $('#header').css('z-index', '1000');
            listar();
            $('#myModal').modal('show');
        } 
    });

    $('#viewshoph').click(function () {
        if (dbingresosh.length === 0) {
            noprocess();
        } else {
            $('#header').css('z-index', '1000');
            listarh();
            $('#myModalh').modal('show');
        }
    });

    function listar() {
        //Obtener el cuerpo de la tabla del DOM
        $("#prodtosconfirmads tbody").html('');
        $.each(dbingresos, function (index, value) {
            console.log('Index:' + index + ', Value:' + value);
            /* Vamos agregando a nuestra tabla las filas necesarias */
            $("#prodtosconfirmads").append("<tr><td>" + value.Referencia + "</td><td>" + value.Nombre + "</td><td>" + value.CantidadDefectuosa + "</td><td>" + value.CantidadTotal + "</td><td>" + value.Observaciones + "</td><td><button type='button' class='btn btn-danger' value='" + index + "' onclick='delet(value);'>Eliminar</button></td></tr>");
        });

    }

    function listarh() {
        //Obtener el cuerpo de la tabla del DOM
        $("#prodtosconfirmadsh tbody").html('');
        $.each(dbingresosh, function (index, value) {
            console.log('Index:' + index + ', Value:' + value);
            /* Vamos agregando a nuestra tabla las filas necesarias */
            $("#prodtosconfirmadsh").append("<tr><td>" + value.Referencia + "</td><td>" + value.Titulo + "</td><td>" + value.Color + "</td><td>" + value.CantidadDefectuosa + "</td><td>" + value.CantidadTotal + "</td><td>" + value.Observaciones + "</td><td><button type='button' class='btn btn-danger' value='" + index + "' onclick='deleth(value);'>Eliminar</button></td></tr>");
        });

    }

    function delet(indice) {
        $('#btn' + dbingresos[indice].Id).css('display', 'inline-block');
        dbingresos.splice(indice, 1);
        if (dbingresos.length === 0) {
            $('#myModal').modal('hide');
        } else {
            listar();
        }
    }

    function deleth(indice) {
        $('#btnh' + dbingresosh[indice].Id).css('display', 'inline-block');
        dbingresosh.splice(indice, 1);
        if (dbingresosh.length === 0) {
            $('#myModalh').modal('hide');
        } else {
            listarh();
        }
    }

    function registershop() {
        $('#optionshop').hide();
        $('.shop').hide();
        $('#processhop').show();
        setTimeout(registeringreshop, 2000); // 3000ms = 3s
    }

    function registershop() {
        $('#optionshoph').hide();
        $('.shoph').hide();
        $('#processhoph').show();
        setTimeout(registeringreshoph, 2000); // 3000ms = 3s
    }

    function registeringreshop(){
        $.ajax({
            type: "POST", //GET or POST or PUT or DELETE verb
            url: "ServiceLectorQR.svc/regisingre", // Location of the service
            data: '{"referenciap": "' + optiondropdown + '"}', //Data sent to server
            contentType: "application/json; charset=utf-8", // content type sent to server
            dataType: "json", //Expected data format from server
            processdata: true, //True or False
            success: function (Datos) {//On Successfull service call
                console.log(Datos.regisingreResult);
                itemped = Datos.regisingreResult[0];
                itemingr = Datos.regisingreResult[1];
                correct = 0;
                $.each(dbingresos, function (index, value) {
                    $.ajax({
                        type: "POST", //GET or POST or PUT or DELETE verb
                        url: "ServiceLectorQR.svc/regisingreproduct", // Location of the service
                        data: '{"idiped": "' + itemped + '","idi": "' + itemingr + '","idpro": "' + value.Id + '","cantid_ingreso": "' + value.CantidadTotal + '","cantidad_defectuosa": "' + value.CantidadDefectuosa + '","detalles": "' + value.Observaciones + '"}', //Data sent to server
                        contentType: "application/json; charset=utf-8", // content type sent to server
                        dataType: "json", //Expected data format from server
                        processdata: true, //True or False
                        success: function (ResultProcess) {//On Successfull service call
                            if (ResultProcess.regisingreproductResult == 0) {
                                correct++;
                            } 
                            if (index == ((dbingresos.length) - 1)) {
                                $('#optionshop').show();
                                $('.shop').show();
                                $('#processhop').hide();
                                if (correct == dbingresos.length) {
                                    $('#myModal').modal('hide');
                                    registro();
                                    dbingresos = [];
                                    $('#getpedido').html('');
                                }
                            }
                        },
                        error: function (Mensaje) {
                            problema(Mensaje.status + ' ' + Mensaje.statusText);
                           // alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
                        }// When Service call fails
                    });

                   // $("#prodtosconfirmads").append("<tr><td>" + value.Referencia + "</td><td>" + value.Nombre + "</td><td>" + value.Cantidad + "</td><td>" + value.Observaciones + "</td><td><button type='button' class='btn btn-danger' value='" + index + "' onclick='delet(value);'>Eliminar</button></td></tr>");
                });
            },
            error: function (Mensaje) {
                problema(Mensaje.status + ' ' + Mensaje.statusText);
                //alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
            }// When Service call fails
        });
    }

    function registeringreshoph() {
        $.ajax({
            type: "POST", //GET or POST or PUT or DELETE verb
            url: "ServiceLectorQR.svc/regisingre", // Location of the service
            data: '{"referenciap": "' + optiondropdown + '"}', //Data sent to server
            contentType: "application/json; charset=utf-8", // content type sent to server
            dataType: "json", //Expected data format from server
            processdata: true, //True or False
            success: function (Datosh) {//On Successfull service call
                console.log(Datosh.regisingreResult);
                itempedh = Datosh.regisingreResult[0];
                itemingrh = Datosh.regisingreResult[1];
                correcth = 0;
                $.each(dbingresosh, function (index, value) {
                    $.ajax({
                        type: "POST", //GET or POST or PUT or DELETE verb
                        url: "ServiceLectorQR.svc/regisingrehilo", // Location of the service
                        data: '{"idiped": "' + itempedh + '","idi": "' + itemingrh + '","idh": "' + value.Id + '","cantid_ingreso": "' + value.CantidadTotal + '","cantidad_defectuosa": "' + value.CantidadDefectuosa + '","detalles": "' + value.Observaciones + '"}', //Data sent to server
                        contentType: "application/json; charset=utf-8", // content type sent to server
                        dataType: "json", //Expected data format from server
                        processdata: true, //True or False
                        success: function (ResultProcess) {//On Successfull service call
                            if (ResultProcess.regisingrehiloResult == 0) {
                                correcth++;
                            }
                            if (index == ((dbingresosh.length) - 1)) {
                                $('#optionshoph').show();
                                $('.shoph').show();
                                $('#processhoph').hide();
                                if (correcth == dbingresosh.length) {
                                    $('#myModalh').modal('hide');
                                    registro();
                                    dbingresosh = [];
                                    $('#gethilo').html('');
                                }
                            }
                        },
                        error: function (Mensaje) {
                            problema(Mensaje.status + ' ' + Mensaje.statusText);
                            //alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
                        }// When Service call fails
                    });

                   // $("#prodtosconfirmads").append("<tr><td>" + value.Referencia + "</td><td>" + value.Nombre + "</td><td>" + value.Cantidad + "</td><td>" + value.Observaciones + "</td><td><button type='button' class='btn btn-danger' value='" + index + "' onclick='delet(value);'>Eliminar</button></td></tr>");
                });
            },
            error: function (Mensaje) {
                problema(Mensaje.status + ' ' + Mensaje.statusText);
                //alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
            }// When Service call fails
        });
    }

    function validacion(campo) {
        var a = 0;
        if (campo === 'observaciones_p') {
            tip = document.getElementById(campo).value;
            if (tip == null || tip.length == 0 || /^\s+$/.test(tip)) {
                $("#glypcn" + campo).remove();
                $("#" + campo).parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Ingrese las observaciones de la compra.").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                return false;
            } else {
                if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ \s]+$/.test(tip) == false) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabéticos").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-success has-feedback");
                    $('#' + campo).parent().children('span').hide();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                    return true;
                }
            }
        }

        if (campo === 'observaciones_h') {
            tip = document.getElementById(campo).value;
            if (tip == null || tip.length == 0 || /^\s+$/.test(tip)) {
                $("#glypcn" + campo).remove();
                $("#" + campo).parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Ingrese las observaciones de la compra.").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                return false;
            } else {
                if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ \s]+$/.test(tip) == false) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabéticos").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-success has-feedback");
                    $('#' + campo).parent().children('span').hide();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                    return true;
                }
            }
        }

        if (campo === "cantidad_d") {
            titu = document.getElementById(campo).value;
            if (titu == null || titu.length == 0 || /^\s+$/.test(titu)) {
                $("#glypcn" + campo).remove();
                $("#" + campo).parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Ingrese la cantidad de productos defectuosos.").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                return false;
            } else {
                if (isNaN(titu)) {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                }
                else {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-success has-feedback");
                    $('#' + campo).parent().children('span').hide();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                    return true;
                }
            }
        }
        if (campo === "cantidad_d_h") {
            mt = document.getElementById(campo).value;
            if (mt == null || mt.length == 0 || /^\s+$/.test(mt)) {
                $("#glypcn" + campo).remove();
                $("#" + campo).parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Ingrese la cantidad de metros defectuosos.").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                return false;
            } else {
                if (/^[0-9]+([.][0-9]+)?$/.test(mt) == false) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Solo se permiten caracteres numéricos y decimales").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-success has-feedback");
                    $('#' + campo).parent().children('span').hide();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                    return true;
                }
            }
        }

        if (campo === "cantidad_h") {
            mtotal = document.getElementById(campo).value;
            if (mtotal == null || mtotal.length == 0 || /^\s+$/.test(mtotal)) {
                $("#glypcn" + campo).remove();
                $("#" + campo).parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Ingrese la cantidad total de metros.").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                return false;
            } else {
                if (mtotal == 0) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("El cantidad total debe ser mayor a cero.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[0-9]+([.][0-9]+)?$/.test(mtotal) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se permiten caracteres numéricos y decimales").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        return false;
                    } else {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').hide();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                        return true;
                    }
                }
            }
        }

        if (campo === "cantidad_p") {
            pes = document.getElementById(campo).value;
            if (pes == null || pes.length == 0 || /^\s+$/.test(pes)) {
                $("#glypcn" + campo).remove();
                $("#" + campo).parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Ingrese la cantidad total del producto.").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                return false;
            } else {
                if (isNaN(pes)) {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                }
                else {

                    if (pes == 0) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("El cantidad total debe ser mayor a cero.").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        return false;
                    } else {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').hide();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                        return true;
                    }
                }
            }
        }

        if (campo === 'DropDownList1') {

            indice = document.getElementById(campo).selectedIndex;
            if (indice == null || indice == 0) {
                $('#' + campo).parent().parent().attr("class", "form-group has-error");
                $('#' + campo).parent().children('span').text("Seleccione un pedido").show();
                return false;
            }
            else {
                $('#' + campo).parent().parent().attr("class", "form-group has-success");
                $('#' + campo).parent().children('span').hide();
                return true;

            }
        }

        if (campo === 'DropDownList2') {

            indice = document.getElementById(campo).selectedIndex;
            if (indice == null || indice == 0) {
                $('#' + campo).parent().parent().attr("class", "form-group has-error");
                $('#' + campo).parent().children('span').text("Seleccione un pedido").show();
                return false;
            }
            else {
                $('#' + campo).parent().parent().attr("class", "form-group has-success");
                $('#' + campo).parent().children('span').hide();
                return true;

            }
        }
    }
    </script>
</body>
</html>
