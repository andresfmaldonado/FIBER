<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioConsumoHilos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioConsumoHilos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link href="css/stacktable.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script>
        function registro() {
            swal("Proceso éxitoso!", "", "success");
        }
        function problema() {
            swal('Oops...', 'Ocurrió un error inesperado! ', 'info');
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
    <title>Fiber|Consumo Hilos</title>
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
    <form id="form1" class="form-horizontal" runat="server">
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
                    <asp:Label ID="Label7" class="control-label col-sm-2" runat="server" Text="Metros:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="metros" placeholder="Metros del hilo" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" class="control-label col-sm-2" runat="server" Text="Consumo:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="consumo" placeholder="Consumo del hilo" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-1 col-center">
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
        
        
     <div class="form-group">
        <div class="col-sm-offset-5 col-sm-1 col-center">
            <div class="btn-group">
                <asp:Button ID="fin_consumo" type="button" class="btn btn-default" runat="server" Text="Finalizar consumo" OnClick="fin_consumo_Click" />
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
    <script>$('[data-toggle="tooltip"]').tooltip(); </script>
    <script src="jvscript/jquery-3.1.0.js"></script>


    <script src="jvscript/stacktable.min.js" type="text/javascript"></script>

    <script>
        $(document).on('click', '#run', function (e) {
            e.preventDefault();
            $('#simple-example-table').stacktable();
            $(this).replaceWith('<span>ran - resize your window to see the effect</span>');
        });
        $('#responsive-example-table').stacktable({ myClass: 'your-custom-class' });
        $('#cphMainContent_dgvUsers').cardtable();
        $('#agenda-example').stackcolumns();
    </script>
    <script type="text/javascript" src="jvscript/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="jvscript/bootstrap.min.js"></script>
    <script type="text/javascript" src="jvscript/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="jvscript/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>
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
            var dataString = '{"referencia":"' + $("#txtbuscar").val() +'"}';
            
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/hilo",
                data: dataString,
                contentType: "application/json; charset=ut-8",
                dataType: "json",
                processdata: true,
                success: function (Dato) {
                    alert("Entró al success");
                    console.log(Dato.hiloResult);
                    item = Dato.hiloResult;
                    $("#hilo").html('');
                    $("#hilo").append('<thead class="text-center"><tr><th>Id</th><th>Referencia</th><th>Tipo</th><th>Titulo</th><th>Color</th><th>Metros</th><th>Accion</th></tr></thead>');
                    $("#hilo").append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $("#hilo").append('<tr><td>' + value.Id_Hilo + '</td><td>' + value.Referencia_Hilo + '</td><td>' + value.Tipo_Hilo + '</td><td>' + value.Titulo_Hilo + '</td><td>' + value.Color_Hilo + '</td><td>' + value.Metros_Hilo + '</td><td><button id="seleccionarHilo" class="btn btn-default" value="'+value.Id_Hilo+'">Seleccionar</button></td></tr>');
                    });
                    $("#modalBuscar").modal('show');
                    $("#seleccionarHilo").click(function () {
                        var dataString2 = '{"id":"' + $("#seleccionarHilo").val() + '"}';
                        $.ajax({
                            type: "POST",
                            url: "ServiceLectorQR.svc/hilo_por_id",
                            data: dataString2,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            processdata: true,
                            success: function (Dato) {
                                item = Dato.hilo_por_idResult;
                                $.each(item, function (index, value) {
                                    $("#id").val(value.Id_Hilo);
                                    $("#referencia").val(value.Referencia_Hilo);
                                    $("#tipo").val(value.Tipo_Hilo);
                                    $("#titulo").val(value.Titulo_Hilo);
                                    $("#color").val(value.Color_Hilo);
                                    $("#metros").val(value.Metros_Hilo);
                                });
                                $("#modalBuscar").modal('hide');
                            },
                            error: function (Mensaje) {
                                alert("ERROR al llamar al servicio2 " + Mensaje.status + " " + Mensaje.statusText);
                            }
                        });
                    });
                },
                error: function (Mensaje) {
                    alert("ERROR al llamar el servicio" + Mensaje.status + " " + Mensaje.statusText);
                }
            });
        });
        $("#registrar").click(function () {
            var dataString3 = '{"id":"' + $("#id").val() + '","referencia":"' + $("#referencia").val() + '","metros":"' + $("#metros").val() + '","consumo":"' + $("#consumo").val() + '"}';
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/registrarHilo",
                data: dataString3,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (Dato) {
                    console.log(Dato.registrarHiloResult);
                    item = Dato.registrarHiloResult;
                    $("#registrohilos2").html('');
                    $("#registrohilos2").append('<thead><tr><th>Id</th><th>Referencia</th><th>Metros</th><th>Consumo</th><th>Acción</th></tr></thead>');
                    $("#registrohilos2").append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $("#registrohilos2").append('<tr><td>' + value.Id_Hilo + '</td><td>' + value.Referencia_Hilo + '</td><td>' + value.Metros_Hilo + '</td><td>' + value.Consumo + '</td><td><button id="olvidar" value="' + value.Id_Hilo + '" class="btn btn-danger">Quitar</button></td></tr>');
                    });
                    $("#id, #referencia, #tipo, #titulo, #color, #metros, #consumo").val('');
                    
                    
                },
                error: function (Mensaje) {
                    alert("ERROR al llamar el servicio53 " + Mensaje.status + " " + Mensaje.statusText);
                }
            });
            
            $("#olvidar").click(function () {
                var dataString5 = '{"id":"' + $("#olvidar").val() + '"}';

                $.ajax({
                    type: "POST",
                    url: "ServiceLectorQR.svc/olvidarHilo",
                    data: dataString5,
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    processdata: true,
                    success: function (Dato) {
                        item = Dato.olvidarHiloResult;
                        $("#registrohilos2").html('');
                        $("#registrohilos2").append('<thead><tr><th>Id</th><th>Referencia</th><th>Metros</th><th>Consumo</th><th>Acción</th></tr></thead>');
                        $("#registrohilos2").append('<tbody></tbody>');
                        $.each(item, function (index, value) {
                            $("#registrohilos2").append('<tr><td>' + value.Id_Hilo + '</td><td>' + value.Referencia_Hilo + '</td><td>' + value.Metros_Hilo + '</td><td>' + value.Consumo + '</td><td><button id="olvidar" value="' + value.Id_Hilo + '" class="btn btn-danger">Quitar</button></td></tr>');
                        });
                    },
                    error: function (Mensaje) {
                        alert("Error");
                    }
                });
            });
        });
        $("#verTodos").click(function () {
            $.ajax({
                type: "POST",
                url: "ServiceLectorQR.svc/verTodosHilos",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (Dato) {
                    
                    console.log(Dato.verTodosHilosResult);
                    item = Dato.verTodosHilosResult;
                    $("#TodosHilos").html('');
                    $("#TodosHilos").append('<thead><tr><th>Id</th><th>Referencia</th><th>Tipo</th><th>Titulo</th><th>Color</th><th>Metros</th><th>Accion</th></tr></thead>');
                    $("#TodosHilos").append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $("#TodosHilos").append('<tr><td>' + value.Id_Hilo + '</td><td>' + value.Referencia_Hilo + '</td><td>' + value.Tipo_Hilo + '</td><td>' + value.Titulo_Hilo + '</td><td>' + value.Color_Hilo + '</td><td>' + value.Metros_Hilo + '</td><td><button class="btn btn-default seleccionarTodoHilo" value="' + value.Id_Hilo + '">Seleccionar</button></td></tr>');
                    });
                    $("#modalTodos").modal('show');
                    $(".seleccionarTodoHilo").click(function () {
                       
                        var dataString4 = '{"id":"' + $(this).val() + '"}';
                        alert(dataString4);
                        $.ajax({
                            type: "POST",
                            url: "ServiceLectorQR.svc/hilo_por_id",
                            data: dataString4,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            processdata: true,
                            success: function (Dato) {
                                console.log(Dato.hilo_por_idResult);
                                item = Dato.hilo_por_idResult;
                                $.each(item, function (index, value) {
                                    $("#id").val(value.Id_Hilo);
                                    $("#referencia").val(value.Referencia_Hilo);
                                    $("#tipo").val(value.Tipo_Hilo);
                                    $("#titulo").val(value.Titulo_Hilo);
                                    $("#color").val(value.Color_Hilo);
                                    $("#metros").val(value.Metros_Hilo);
                                });
                                $("#modalTodos").modal('hide');
                            },
                            error: function (Mensaje) {
                                alert("ERROR al llamar al servicio4 " + Mensaje.status + " " + Mensaje.statusText);
                            }
                        });
                    });
                },
                error: function (Mensaje) {
                    alert("ERROR al llamar el servicio " + Mensaje.status + " " + Mensaje.statusText);
                }
            });
        });
    </script>
</body>
</html>
