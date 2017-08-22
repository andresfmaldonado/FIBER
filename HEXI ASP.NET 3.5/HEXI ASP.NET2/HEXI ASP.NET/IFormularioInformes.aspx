<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioInformes.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioInformes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Fiber|Informes</title>
    <meta name="Author" content="Johan Esteban Zapata Herrera" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/inform.css"/>
    <script src="jvscript/sweetalert2.js"></script>
    <link rel="stylesheet" href="css/sweetalert2.css"/>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script>
        function problema(error) {
            swal('Oops...', 'Ocurrió un error inesperado!  ' + error, 'info');
        }
        function noexiste() {
            swal('Oops...', 'No se encontró ningún registro!', 'warning');
        }
    </script>
</head>
<body>
    <div id="page-wrapper">

        <!-- Header -->
        <header id="header" class="alt">
            <a href="PprincipalInventariosAdmin.aspx">
                <h1><img class="atras" src="Iconos/Material%20Iconse5c41024.png" /></h1>
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
            <!-- <img Class = "img" src = "Iconos/fblanco.jpg">-->
            <img class="img" src="Iconos/Fiber.png" />
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-md-4 col-lg-4">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-street-view fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge" id="cantu"></div>
                                <div>Usuarios</div>
                                <div><i class="fa fa-info-circle fa-fw" aria-hidden="true"></i><span id="habil"> </span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-files-o fa-3x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">Informes</div>
                                <div class="indic"><i class="fa fa-arrow-circle-down"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <!--panel-heading -->
                    <div class="panel-heading config">
                        <i class="fa fa-sliders fa-fw"></i>
                        <div class="pull-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        Categoría informe
                                        <span class="caret"></span>
                                    </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li><a id="selectproducts">Productos</a>
                                    </li>
                                    <li><a id="selectconsums">Consumos</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                        <form>
                            <div id="product" style="display: none;">
                                <div class="text-center"> <button type="button" class="btn btn-primary btn-lg" id="getproducts" onclick="informproducts();">Generar</button> </div>
                            </div>
                            <div id="consum" style="display: none;">
                                <div class="form-group">
                                    <label for="exampleInputMes">Mes:</label>
                                    <select class="form-control" id="exampleInputMes">
                                        <option value="0">Seleccione un mes</option>
                                        <option value="1">Enero</option>
                                        <option value="2">Febrero</option>
                                        <option value="3">Marzo</option>
                                        <option value="4">Abril</option>
                                        <option value="2">Mayo</option>
                                        <option value="6">Junio</option>
                                        <option value="7">Julio</option>
                                        <option value="8">Agosto</option>
                                        <option value="9">Septiembre</option>
                                        <option value="10">Octubre</option>
                                        <option value="11">Noviembre</option>
                                        <option value="11">Diciembre</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputyear">Año:</label>
                                    <select class="form-control" id="exampleInputyear">
                                    </select>
                                </div>
                                <div class="text-center"><button type="button" class="btn btn-primary" id="getconsums">Generar</button></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-8 col-md-8 co-lg-8 informes">
                <div class="panel panel-default">
                    <!--panel-heading -->
                    <div class="panel-heading">
                        <i class="fa fa-bar-chart-o fa-fw"></i> Informe
                        <div class="pull-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-warning btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                       <span class="glyphicon glyphicon-download-alt"></span> Exportar
                                        <span class="caret"></span>
                                    </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li>
                                        <a id="pdf"><img src="Iconos/pdf.png" width="25px" /><span style="vertical-align: super;"> PDF</span></a>
                                    </li>
                                    <li>
                                        <a id="word"><img src="Iconos/word.png" width="25px" /><span style="vertical-align: super;"> Word</span></a>
                                    </li>
                                    <li>
                                        <a id="btnExport"><img src="Iconos/Excel.ico" width="25px" /><span style="vertical-align: super;"> Excel</span></a>
                                    </li>
                                    <li>
                                        <a id="picture"><img src="Iconos/picture.png" width="25px" /><span style="vertical-align: super;"> Imagen</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                        <div class="table-responsive" id="contentinform">
                            <table class="table table-bordered table-hover table-striped" id="getinformes">
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
    <script src="jvscript/js1/skel.min.js"></script>

    <script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <!--<script src="js/jquery-3.1.0.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="jvscript/bootstrap.js"></script>
    <script src="jvscript/jspdf.debug.js"></script>
    <script src="jvscript/jspdf.plugin.autotable.js"></script>
    <script src="jvscript/html2canvas.js"></script>
    <script src="jvscript/canvas2image.js"></script>
    <script>
        $(document).ready(function() {
            var date = new Date;
            year = date.getFullYear();
            yeardefault = 2017;
            cantyears = year - yeardefault;
            count = 1;
            for (var i = 0; i <= cantyears; i++) {
                if (i == 0) {
                    setyears(0, "Seleccione un año");
                    setyears(count, yeardefault);
                } else {
                    setyears(count, yeardefault);
                }
                count++;
                yeardefault++;
            }

            $.ajax({
                type: "POST", //GET or POST or PUT or DELETE verb
                url: "ServiceLectorQR.svc/GetUsersInform", // Location of the service
                data: '', //Data sent to server
                contentType: "application/json; charset=utf-8", // content type sent to server
                dataType: "json", //Expected data format from server
                processdata: true, //True or False
                success: function (DatosU) {//On Successfull service call
                    //alert('pocesando..');
                    if (DatosU.GetUsersInformResult[0] != null) {
                        // alert(JSON.stringify(Dato.GetProductResult[0].Referencia_Producto));
                        $('#cantu').text(DatosU.GetUsersInformResult[0]);
                        $('#habil').text(" " + DatosU.GetUsersInformResult[1] + " Habilitados / " + DatosU.GetUsersInformResult[0]);
                    } else {
                        //noexiste();
                    }


                },
                error: function (Mensaje) {
                    problema(Mensaje.status + ' ' + Mensaje.statusText);
                    //alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
                }// When Service call fails
            });
        });

        $('#selectproducts').click(function() {
            $('#consum').hide();
            $('#product').show();
        });

        $('#selectconsums').click(function() {
            $('#product').hide();
            $('#consum').show();
        });

        function setyears(valor, texto) {
            $("#exampleInputyear").append(

                $("<option></option>")
                .attr("value", valor)
                .text(texto)

            );
        }


        $("#btnExport").click(function(e) {

            var tab_text = "<table border='2px'><tr bgcolor='#ccc'>";
            var textRange;
            var j = 0;
            tab = document.getElementById('getinformes'); // id of table


            for (j = 0; j < tab.rows.length; j++) {
                tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
                //tab_text=tab_text+"</tr>";
            }

            tab_text = tab_text + "</table>";
            tab_text = tab_text.replace(/<A[^>]*>|<\/A>/g, ""); //remove if u want links in your table
            tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
            tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params
            while (tab_text.indexOf('á') != -1) tab_text = tab_text.replace('á', '&aacute;');
            while (tab_text.indexOf('é') != -1) tab_text = tab_text.replace('é', '&eacute;');
            while (tab_text.indexOf('í') != -1) tab_text = tab_text.replace('í', '&iacute;');
            while (tab_text.indexOf('ó') != -1) tab_text = tab_text.replace('ó', '&oacute;');
            while (tab_text.indexOf('ú') != -1) tab_text = tab_text.replace('ú', '&uacute;');
            while (tab_text.indexOf('º') != -1) tab_text = tab_text.replace('º', '&ordm;');

            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) // If Internet Explorer
            {
                txtArea1.document.open("txt/html", "replace");
                txtArea1.document.write(tab_text);
                txtArea1.document.close();
                txtArea1.focus();
                sa = txtArea1.document.execCommand("SaveAs", true, "Fiber.xls");
            } else //other browser not tested on IE 11
                sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));


            return (sa);

        });

        $('#pdf').click(function() {

            var doc = new jsPDF('p', 'pt');
            var elem = document.getElementById("getinformes");
            var res = doc.autoTableHtmlToJson(elem);
            doc.autoTable(res.columns, res.data);
            doc.save("table.pdf");
        });


        $('#word').click(function() {

            var html, link, blob, url, css;

            // EU A4 use: size: 841.95pt 595.35pt;
            // US Letter use: size:11.0in 8.5in;

            css = (
                '<style>' +
                '@page WordSection1{size: 841.95pt 595.35pt;mso-page-orientation: landscape;}' +
                'div.WordSection1 {page: WordSection1;}' +
                'table{border-collapse:collapse;}td{border:1px gray solid;width:5em;padding:2px;}' +
                '</style>'
            );

            html = document.getElementById("contentinform").innerHTML;
            blob = new Blob(['\ufeff', css + html], {
                type: 'application/msword'
            });
            url = URL.createObjectURL(blob);
            link = document.createElement('A');
            link.href = url;
            // Set default file name. 
            // Word will append file extension - do not add an extension here.
            link.download = 'Document';
            document.body.appendChild(link);
            if (navigator.msSaveOrOpenBlob) navigator.msSaveOrOpenBlob(blob, 'Document.doc'); // IE10-11
            else link.click(); // other browsers
            document.body.removeChild(link);
        });


        $("#picture").click(function() {
            html2canvas($("#getinformes"), {
                onrendered: function(canvas) {
                    saveAs(canvas.toDataURL(), 'picture.jpeg');
                }
            });
        });

        function saveAs(uri, filename) {
            var link = document.createElement('a');
            if (typeof link.download === 'string') {
                link.href = uri;
                link.download = filename;

                //Firefox requires the link to be in the body
                document.body.appendChild(link);

                //simulate click
                link.click();

                //remove the link when done
                document.body.removeChild(link);
            } else {
                window.open(uri);
            }
        }

        function informproducts() {
            $('#getproducts').attr('onclick', '');
            $('#getproducts').empty().append('<i class="fa fa-hourglass-half" aria-hidden="true"> Procesando...</i>');
            $.ajax({
                type: "POST", //GET or POST or PUT or DELETE verb
                url: "ServiceLectorQR.svc/GetProductsInform", // Location of the service
                data: '', //Data sent to server
                contentType: "application/json; charset=utf-8", // content type sent to server
                dataType: "json", //Expected data format from server
                processdata: true, //True or False
                success: function (Datos) {//On Successfull service call
                    //alert('pocesando..');
                    console.log(Datos);
                    if (Datos.GetProductsInformResult[0] != null) {
                        // alert(JSON.stringify(Dato.GetProductResult[0].Referencia_Producto));
                        $("#getinformes").html('');
                        $("#getinformes").append("<thead><tr><th>Referencia</th><th>Descripción</th><th>Novedad</th><th>Placa</th><th>Serial</th><th>Marca</th><th>Modelo</th><th>Unidad</th><th>Valor unitario</th><th>Consumible</th></tr></thead><tbody></tbody>");
                        $.each(Datos.GetProductsInformResult, function (index, value) {
                            console.log('Index:' + index + ', Value:' + value);
                            /* Vamos agregando a nuestra tabla las filas necesarias */
                            $("#getinformes").append("<tr><td>" + value.Referencia_Producto + "</td><td>" + value.Descripcion_Producto + "</td><td>" + value.Novedad_Producto + "</td><td>" + value.Placa_Producto + "</td><td>" + value.Serial_Producto + "</td><td>" + value.Marca_Producto + "</td><td>" + value.Modelo_Producto + "</td><td>" + value.Cantidad_Producto + "</td><td>" + value.ValorUnitario_Producto + "</td><td>" + value.Consumible + "</td></tr>");
                        });
                        
                    } else {
                        noexiste();
                    }
                    $('#getproducts').attr('onclick', 'informproducts();');
                    $('#getproducts').empty().append('Generar');

                },
                error: function (Mensaje) {
                    problema(Mensaje.status + ' ' + Mensaje.statusText);
                    //alert('Error al llamar el servicio : ' + Mensaje.status + ' ' + Mensaje.statusText);
                }// When Service call fails
            });
        }
    </script>
</body>
</html>
