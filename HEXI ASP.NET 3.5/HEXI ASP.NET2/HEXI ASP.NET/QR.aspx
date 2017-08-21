<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QR.aspx.cs" Inherits="HEXI_ASP.NET.QR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Lector QR|Fiber</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/html5-qrcode.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#reader').html5_qrcode(function (data) {
                //alert(data);
                $.ajax({
                    type: "POST", //GET or POST or PUT or DELETE verb
                    url: "ServiceLectorQR.svc/GetProduct", // Location of the service
                    data: '{"referencia": "' + data + '"}', //Data sent to server
                    contentType: "application/json; charset=utf-8", // content type sent to server
                    dataType: "json", //Expected data format from server
                    processdata: true, //True or False
                    success: function (Dato) {//On Successfull service call
                        //alert('pocesando..');
                        if (Dato.GetProductResult[0] != null) {
                            // alert(JSON.stringify(Dato.GetProductResult[0].Referencia_Producto));
                            $('#referencia').html(Dato.GetProductResult[0].Referencia_Producto);
                            $('#nombre').html(Dato.GetProductResult[0].Nombre_Producto);
                            //$('#agrupacion').html(Dato.GetProductResult[0].Agrupacion_Producto);
                            $('#descripcion').html(Dato.GetProductResult[0].Descripcion_Producto);
                            $('#novedad').html(Dato.GetProductResult[0].Novedad_Producto);
                            $('#placa').html(Dato.GetProductResult[0].Placa_Producto);
                            $('#serial').html(Dato.GetProductResult[0].Serial_Producto);
                            $('#marca').html(Dato.GetProductResult[0].Marca_Producto);
                            $('#modelo').html(Dato.GetProductResult[0].Modelo_Producto);
                           // $('#unidad').html(Dato.GetProductResult[0].Unidad_Producto);
                            $('#valor').html(Dato.GetProductResult[0].ValorUnitario_Producto);
                            $('#resultado').show();
                            $('#qr').hide();
                        } else {
                            noexiste();
                        }


                    },
                    error: function (Mensaje) {
                        problema(Mensaje.status + ' ' + Mensaje.statusText);
                        //alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
                    }// When Service call fails
                });

            },
                function (error) {
                    //alert(error);
                }, function (videoError) {
                    camara();
                }
            );
        });

        function problema(error) {
            swal('Oops...', 'Ocurrió un error inesperado!  ' + error, 'info');
        }

        function noexiste() {
            swal('Oops...', 'Esto no se encuentra registrado!', 'warning');
        }

        function camara() {
            swal('Oops...', 'No hay camara!', 'info');
        }
    </script>
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
                    <!--<li><a href="index.html">Inicio</a></li>-->
                   <li><a href="PerfilAdmin.aspx">Perfil</a></li>
                   <li><a href="FolderCodeQR.aspx">Códigos QR</a></li>
                   <li id="usuarios" runat="server"><a href="PFormularioUsuarios.aspx">Usuarios</a></li>
				   <li><a href="PAsistencia.aspx">Ayuda</a></li>
                   <li><a href="default.aspx">Finalizar Sesión</a></li>
                </ul>
                <a href="#" class="close">Close</a>
            </div>
        </nav>
    </div>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <img class="img" src="Iconos/Fiber.png" />
            </div>
        </div>
        <div class="container text-center">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">

                    <div class="panel panel-default  alert alert-info">
                        <div id="qr" class="block-center">
                            <h2>Lector QR</h2>
                            <div id="reader" class="twPc-bg">
                            </div>
                        </div>
                        <div id="resultado" style="display:none;">
                            <h2>Resultado</h2>
                            <div class="panel-body">

                                <div class="box box-info">
                                    <div class="box-body">
                                        <div>
                                            <img alt="User Pic" src="Iconos/FontAwesome_f180(0)_160.png" class="img-circle img-responsive center-block" />
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-sm-5 col-xs-6 tital ">Referencia:</div>
                                        <div class="col-sm-7 col-xs-6 " id="referencia"></div>
                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Nombre:</div>
                                        <div class="col-sm-7" id="nombre"></div>
                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <!--<div class="col-sm-5 col-xs-6 tital ">Agrupación:</div>
                                        <div class="col-sm-7" id="agrupacion"></div>
                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>-->

                                        <div class="col-sm-5 col-xs-6 tital ">Descripción:</div>
                                        <div class="col-sm-7" id="descripcion"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Novedad:</div>
                                        <div class="col-sm-7" id="novedad"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Placa:</div>
                                        <div class="col-sm-7" id="placa"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Serial:</div>
                                        <div class="col-sm-7" id="serial"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Marca:</div>
                                        <div class="col-sm-7" id="marca"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Modelo:</div>
                                        <div class="col-sm-7" id="modelo"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <!--<div class="col-sm-5 col-xs-6 tital ">Unidad:</div>
                                        <div class="col-sm-7" id="unidad"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>-->

                                        <div class="col-sm-5 col-xs-6 tital ">Valor unitario:</div>
                                        <div class="col-sm-7" id="valor"></div>

                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-warning  btn_inr" onclick="lector();"><span class="glyphicon glyphicon-share-alt"></span>Regresar</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </form>
    <footer id="footer">
						Fiber&copy; Producto: HEXI
	</footer>
    <script src="jvscript/js1/skel.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#resultado').hide();
            $('#qr').show();
        });
        function lector() {
            $('#resultado').hide();
            $('#qr').show();
            clear();
        }

        function clear() {
            $('#referencia').html('');
            $('#item').html('');
            $('#agrupacion').html('');
            $('#descripcion').html('');
            $('#novedad').html('');
            $('#placa').html('');
            $('#serial').html('');
            $('#marca').html('');
            $('#modelo').html('');
            $('#unidad').html('');
            $('#valor').html('');
        }
    </script>
</body>
</html>
