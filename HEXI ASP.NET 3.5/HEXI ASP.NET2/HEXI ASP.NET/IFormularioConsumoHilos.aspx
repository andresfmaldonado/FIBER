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
                <asp:TextBox ID="id" Style="display: none;" type="text" class="form-control" runat="server"></asp:TextBox>

                <div class="form-group">
                    <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Referencia:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="referencia" disabled="true" type="text" class="form-control" placeholder="Referencia del hilo" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" class="control-label col-sm-2" runat="server" Text="Color:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="color" placeholder="Color del hilo" disabled="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" class="control-label col-sm-2" runat="server" Text="Título:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="titulo" placeholder="Título del hilo" disabled="true" runat="server"></asp:TextBox>
                    </div>
                </div>

            </div>
            <div class="col-md-4 col-md-offset-1">
                <div class="form-group">
                    <asp:Label ID="Label5" class="control-label col-sm-2" runat="server" Text="Tipo:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="tipo" placeholder="Tipo del hilo" disabled="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" class="control-label col-sm-2" runat="server" Text="Metros:"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox class="form-control" ID="metros" placeholder="Metros del hilo" disabled="true" runat="server"></asp:TextBox>
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
                    <asp:Button ID="registrar" OnClick="registrar_Click" type="button" class="btn btn-default" runat="server" Text="Registrar" />
                </div>
            </div>

        </div>
        &nbsp
     <div class="form-group">
         <asp:Label ID="Label4" class="control-label col-sm-2" runat="server" Text="Buscar:"></asp:Label>
         <div class="col-sm-7">
             <asp:TextBox ID="buscar" type="text" class="form-control" placeholder="Nombre Hilo" runat="server"></asp:TextBox>
         </div>
         <div class=" col-md-1">
             <input id="buscarHilo" type="button" class="btn btn-default" value="Buscar" />
         </div>
         <div class="col-md-1">
             <input id="todos" type="button" class="btn btn-default" value="Ver todos" />
         </div>
     </div>
        
        <div class="container show-top-margin separate-rows tall-rows">
            <div class="row show-grid">
                <div class="col-md-12">
                    <asp:GridView ID="GVHilosTemp" AutoGenerateColumns="false" CssClass="table table-striped table-bordered dt-responsive nowrap" CellSpacing="0" Width="100%" DataKeyNames="id_hilo"  runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="ID_HILO" runat="server" Text='<% # Bind("id_hilo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="REFERENCIA">
                                <ItemTemplate>
                                    <asp:Label ID="REFERENCIA_HILO" runat="server" Text='<% # Bind("referencia") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="METROS">
                                <ItemTemplate>
                                    <asp:Label ID="METROS_HILO" runat="server" Text='<% # Bind("metros") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CONSUMO">
                                <ItemTemplate>
                                    <asp:Label ID="CONSUMO" runat="server" Text='<% # Bind("consumo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CANTIDAD RESTANTE">
                                <ItemTemplate>
                                    <asp:Label ID="RESTA" runat="server" Text='<% # Bind("resta") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>
       
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1">
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
    <!-- Modal1 -->
    <div class="modal fade bs-example-modal-lg" id="modalOneHilo" tabindex="-1" role="dialog" aria-labelledby="modalOneHilo" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="modalOneHilo1">Hilo.</h4>
                </div>
                <div class="modal-body">
                    <!-- panel-body -->
                    <div class="panel-body">
                        <div class="table-responsive text-center" id="contentHilo">
                            <table class="table table-bordered table-hover table-striped" id="hilo">
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

    <!-- /modal -->
    <!-- Modal2 -->
    <div class="modal fade bs-example-modal-lg" id="modalAllHilos" tabindex="-1" role="dialog" aria-labelledby="modalAllHilos" data-backdrop="static">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="modalLabelAllHilos">Todos los hilos.</h4>
                </div>
                <div class="modal-body">
                    <!-- panel-body -->
                    <div class="panel-body">
                        <div class="table-responsive text-center" id="contentinform">
                            <table class="table table-bordered table-hover table-striped" id="hilos">
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

    <!-- /modal -->
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
    <script type="text/javascript">
        $('.form_datetime').datetimepicker({
            format: 'dd/mm/yyyy hh:ii:ss',
            language: 'es',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });
    </script>
    <script type="text/javascript">
        var id = 0;
        $('#todos').click(function () {
            
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "ServiceLectorQR.svc/tablahilos",
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (Dato) {
                    console.log(Dato.tablahilosResult);
                    item = Dato.tablahilosResult;
                    $("#hilos").html('');
                    $("#hilos").append('<thead class="text-center"><tr><th>ID</th><th>Referencia</th><th>Tipo</th><th>Titulo</th><th>Color</th><th>Metros</th><th></th></tr>');
                    $("#hilos").append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $("#hilos").append('<tr id="re' + value.Id_Hilo + '"><td id ="cod' + value.Id_Hilo + '">' + value.Id_Hilo + '</td><td id="refe' + value.Id_Hilo + '">' + value.Referencia_Hilo + '</td><td id="tipo' + value.Id_Hilo + '">' + value.Tipo_Hilo + '</td><td id="titulo' + value.Id_Hilo + '">' + value.Titulo_Hilo + '</td><td id="color' + value.Id_Hilo + '">' + value.Color_Hilo + '</td><td id="metros' + value.Id_Hilo + '">' + value.Metros_Hilo + '</td><td id="selec"><button  type="button" class="btn btn-primary seleccionarHilo" value="' + value.Id_Hilo + '">Seleccionar</button></td></tr>');
                    });
                    
                    $('.seleccionarHilo').click(function () {
                        id = $(this).val();
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            data: '{"id":"' + id + '"}',
                            url: "ServiceLectorQR.svc/hilos",
                            contentType: "application/json; charset=utf-8",
                            processdata: true,
                            success: function (Dato) {
                                console.log(Dato.hilosResult);
                                item = Dato.hilosResult;
                                $.each(item, function (index, value) {
                                    $('#id').val(value.Id_Hilo);
                                    $('#referencia').val(value.Referencia_Hilo);
                                    $('#tipo').val(value.Tipo_Hilo);
                                    $('#titulo').val(value.Titulo_Hilo);
                                    $('#color').val(value.Color_Hilo);
                                    $('#metros').val(value.Metros_Hilo);
                                    $('#modalAllHilos').modal('hide');
                                });
                            },
                            error: function (Mensaje) {
                                alert('Error al llamar el servicio: ' + Mensaje.status + ' ' + Mensaje.statusText);
                            }

                        });
                    });
                },
                error: function (Mensaje) {
                    alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
                }
            });
            $('#modalAllHilos').modal('show');
        });

        var ref;
        $('#buscarHilo').click(function () {
            ref = $('#buscar').val();
            $.ajax({
                method: "POST",
                data: '{"referencia":"'+ref+'"}',
                url: "ServiceLectorQR.svc/buscarHilo",
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (Dato) {
                    console.log(Dato.buscarHiloResult);
                    item = Dato.buscarHiloResult;
                    $('#hilo').html('');
                    $('#hilo').append('<thead><tr><th>ID</th><th>REFERENCIA</th><th>TIPO</th><th>TITULO</th><th>COLOR</th><th>METROS</th><th></th></tr></thead>');
                    $('#hilo').append('<tbody></tbody>');
                    $.each(item, function (index, value) {
                        $('#hilo').append('<tr id="' + value.Id_Hilo + '"><td>' + value.Id_Hilo + '</td><td>' + value.Referencia_Hilo + '</td><td>' + value.Tipo_Hilo + '</td><td>' + value.Titulo_Hilo + '</td><td>' + value.Color_Hilo + '</td><td>' + value.Metros_Hilo + '</td><td><button type="button" class="btn btn-primary seleccionarHilo" value="'+value.Id_Hilo+'">Seleccionar</button>');
                    });
                    var id = 0;
                    $('.seleccionarHilo').click(function () {
                        id = $(this).val();
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            data: '{"id":"' + id + '"}',
                            url: "ServiceLectorQR.svc/hilos",
                            contentType: "application/json; charset=utf-8",
                            processdata: true,
                            success: function (Dato) {
                                console.log(Dato.hilosResult);
                                item = Dato.hilosResult;
                                $.each(item, function (index, value) {
                                    $('#id').val(value.Id_Hilo);
                                    $('#referencia').val(value.Referencia_Hilo);
                                    $('#tipo').val(value.Tipo_Hilo);
                                    $('#titulo').val(value.Titulo_Hilo);
                                    $('#color').val(value.Color_Hilo);
                                    $('#metros').val(value.Metros_Hilo);
                                    $('#modalOneHilo').modal('hide');
                                });
                            },
                            error: function (Mensaje) {
                                alert('Error al llamar el servicio: ' + Mensaje.status + ' ' + Mensaje.statusText);
                            }

                        });
                    });

                },
                error: function (Mensaje) {
                    alert('Error al llamar el servicio: ' + Mensaje.status + ' ' + Mensaje.statusText);
                }
            });
            $('#modalOneHilo').modal('show');
        });
        
       
       
    </script>
    <script type="text/javascript">
        
            
            
   
        
    </script>
    <script src="jvscript/js1/skel.min.js"></script>
    <script src="jvscript/js1/jquery.min.js"></script>
    <script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script src="jvscript/animacion.js"></script>
</body>
</html>
