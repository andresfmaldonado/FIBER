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
    <!--<script src="jvscript/adapter.min.js"></script>-->
    <script src="jvscript/instascan.min.js"></script>
    
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
                    <br />
                    <div class="panel panel-default  alert alert-info">
                        <div id="qr" class="">
                            <div class="panel-heading"><div class="pull-left"><h2><i class="fa fa-qrcode" aria-hidden="true"></i> Scanner QR</h2></div><div class="pull-right">
                                       <select id="tipocode" class="form-control col-md-2 select-xs" style="height: 26px;padding: 5px 5px;font-size: 12px;line-height: 1.5;border-radius: 3px;">
                                           <option>Productos</option>
                                           <option>Hilos</option>
                                       </select>
                        </div>
                            </div>
                            <div class="clearfix"></div>
                            <br />
                            <div id="reader" class="twPc-bg block-center">
                                 <video id="preview" style="position: inherit;"></video>
                            </div>
                            <div class="clearfix"></div><br/>
                                <span id="cameraoption"></span>
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

                                        <div class="col-sm-5 col-xs-6 tital ">Cantidad:</div>
                                        <div class="col-sm-7" id="cantidad"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Valor unitario:</div>
                                        <div class="col-sm-7" id="valor"></div>

                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-warning  btn_inr" onclick="lector();"><span class="glyphicon glyphicon-share-alt"></span> Regresar</button>
                        </div>
                        <div id="resultado2" style="display:none;">
                            <h2>Resultado</h2>
                            <div class="panel-body">

                                <div class="box box-info">
                                    <div class="box-body">
                                        <div>
                                            <img alt="User Pic" src="Iconos/FontAwesome_f180(0)_160.png" class="img-circle img-responsive center-block" />
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-sm-5 col-xs-6 tital ">Referencia:</div>
                                        <div class="col-sm-7 col-xs-6 " id="referenciah"></div>
                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Código:</div>
                                        <div class="col-sm-7" id="codigoh"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Tipo:</div>
                                        <div class="col-sm-7" id="tipoh"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Titulo:</div>
                                        <div class="col-sm-7" id="tituloh"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Color:</div>
                                        <div class="col-sm-7" id="colorh"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Metros:</div>
                                        <div class="col-sm-7" id="metrosh"></div>

                                        <div class="clearfix"></div>
                                        <div class="bot-border"></div>

                                        <div class="col-sm-5 col-xs-6 tital ">Valor Metro:</div>
                                        <div class="col-sm-7" id="valorh"></div>

                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn btn-warning  btn_inr" onclick="lector();"><span class="glyphicon glyphicon-share-alt"></span> Regresar</button>
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
        camaras = [];
        let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
        scanner.addListener('scan', function (content) {
            console.log(content);
            if ($("#tipocode option:selected").text() == "Productos") {
                //alert(data);
                $.ajax({
                    type: "POST", //GET or POST or PUT or DELETE verb
                    url: "ServiceLectorQR.svc/GetProduct", // Location of the service
                    data: '{"referencia": "' + content + '"}', //Data sent to server
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
                            $('#cantidad').html(Dato.GetProductResult[0].Cantidad_Producto);
                            $('#valor').html(Dato.GetProductResult[0].ValorUnitario_Producto);
                            $('#resultado').show();
                            $('#resultado2').hide();
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
            } else {
                $.ajax({
                    type: "POST", //GET or POST or PUT or DELETE verb
                    url: "ServiceLectorQR.svc/GetHilo", // Location of the service
                    data: '{"code": "' + content + '"}', //Data sent to server
                    contentType: "application/json; charset=utf-8", // content type sent to server
                    dataType: "json", //Expected data format from server
                    processdata: true, //True or False
                    success: function (Datoh) {//On Successfull service call
                        //alert('pocesando..');
                        if (Datoh.GetHiloResult[0] != null) {
                            $('#referenciah').html(Datoh.GetHiloResult[0].Referencia_Hilo);
                            $('#codigoh').html(Datoh.GetHiloResult[0].Code_Hilo);
                            $('#tipoh').html(Datoh.GetHiloResult[0].Tipo_Hilo);
                            $('#tituloh').html(Datoh.GetHiloResult[0].Titulo_Hilo);
                            $('#colorh').html(Datoh.GetHiloResult[0].Color_Hilo);
                            $('#metrosh').html(Datoh.GetHiloResult[0].Metros_Hilo);
                            $('#valorh').html(Datoh.GetHiloResult[0].ValorMetro);
                            $('#resultado2').show();
                            $('#resultado').hide();
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
            }
        });
          
        Instascan.Camera.getCameras().then(function (cameras) {
            if (cameras.length > 0) {
                camaras = cameras;
                $.each(cameras, (i, c) => {
                    if (i == 0) {
                        $('#cameraoption').append('<button type="button" class="btn btn-info" value=' + i + ' onclick=selectCamera(value)><i class="fa fa-camera" aria-hidden="true"></i> ' + (i + 1) + '</button>');
                    }
                    if (i > 0) {
                        if (i == 1) {
                            $('#cameraoption').append('<button  type="button" class="btn btn-warning" value=' + i + ' onclick=selectCamera(value)><i class="fa fa-camera" aria-hidden="true"></i> ' + (i + 1) + '</button>');
                        } else {
                            $('#cameraoption').append('<button  type="button" class="btn btn-danger" value=' + i + ' onclick=selectCamera(value)><i class="fa fa-camera" aria-hidden="true"></i> ' + (i + 1) + '</button>');
                        }
                    }
                });
                scanner.start(cameras[0]);
            } else {
                camara();
            }

        }).catch(function (e) {
            problema(e);
        });

        function selectCamera(camara) {
            scanner.start(camaras[camara]);
        }

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
    <script>
        $(document).ready(function () {
            $('#resultado').hide();
            $('#resultado2').hide();
            $('#qr').show();
        });
        function lector() {
            $('#resultado').hide();
            $('#resultado2').hide();
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
            $('#referenciah').html('');
            $('#codigoh').html('');
            $('#tipoh').html('');
            $('#tituloh').html('');
            $('#colorh').html('');
            $('#metrosh').html('');
            $('#valorh').html('');
        }

    </script>
</body>
</html>
