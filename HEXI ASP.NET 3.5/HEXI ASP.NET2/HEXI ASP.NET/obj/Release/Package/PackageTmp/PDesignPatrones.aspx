<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PDesignPatrones.aspx.cs" Inherits="HEXI_ASP.NET.DesignPatrones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Fiber | Diseño</title>
    <meta name="Author" content="Johan Esteban Zapata Herrera" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link href="css/patron.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <link rel="stylesheet" href="sweetalert2.css"/>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src='jvscript/spectrum.js'></script>
    <link rel='stylesheet' href='css/spectrum.css' />
</head>
<body>
   <div id="page-wrapper">

				 <header id="header" class="alt">
            <a href="FiberInicioAdmin.aspx">
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
            <img Class="img" src="Iconos/Fiber.png">
        </div>
    </div>
    <br><br>
    <div class="col-lg-12">
        <div class="col-sm-2 col-md-2 col-lg-2" id="menud">
            <ul class="nav nav-pills nav-stacked options text-center">
                <li class="mb">
                    <asp:Image ID="foto" runat="server" width="80px" style="border-radius: 100%;margin-top: 2rem;background-color: #fcf8e3;
    border: 1px solid #333; padding: 2px" />
                    <!--<img src="Iconos/profile.jpg" width="80px" style="border-radius: 100%;margin-top: 2rem;background-color: #fcf8e3;
    border: 1px solid #333; padding: 2px" />-->
                    <h5><asp:Label ID="name" runat="server" Text="Label"></asp:Label></h5><label class="label label-primary">Área textil</label></li>
                <li><a id="lmodal"><span class="glyphicon glyphicon-new-window"></span> Nuevo</a></li>
                <li><a><span class="glyphicon glyphicon-floppy-open"></span> Abrir</a></li>
                <li><a><span class="glyphicon glyphicon-floppy-save"></span> Guardar</a></li>
                <li>
                    <div class="bs-callout bs-callout-default">
                        <h4 id="author"></h4>
                        <p id="phrase"></p>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-sm-10 col-md-10 col-lg-10">
            <div class="col-sm-6 col-md-6 col-lg-6 patron text-center" id="design">
                <div class="card">
                    <div class="header">
                        <h4 class="title"><span class="glyphicon glyphicon-blackboard"></span> Diseño</h4>
                        <p class="category">Patron de tejido plano</p>
                    </div>
                    <div class="content">
                        <div id="chartPreferences">
                            <div id="box">
                                <div id="tablah">
                                    <div id="box2"></div>
                                </div>
                            </div>
                        </div>

                        <div class="footer">
                            <hr>
                            <div class="stats">
                                <i class="fa fa-circle text-info"></i> Innovación
                                <i class="fa fa-circle text-danger"></i> Originalidad
                                <i class="fa fa-circle text-warning"></i> Potencial
                                <i class="fa fa-circle text-primary"></i> Dinamismo
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6 col-lg-6 patron text-center" id="preview">
                <div class="card">
                    <div class="header">
                        <h4 class="title"><span class="glyphicon glyphicon-eye-open"></span> Visualización</h4>
                        <p class="category">Resultado diseño</p>
                    </div>
                    <div class="content">
                        <div id="chart" class="">
                            <div id="result"></div>
                        </div>

                        <div class="footer">
                            <div class="legend">

                            </div>
                            <hr>
                            <div class="stats">
                            </div>
                        </div>
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
    <div class="form-group">
        <div class="col-sm-12">
            <!-- Icons -->
            <!-- Menu -->

            <span id="footer">Fiber&copy; Producto: <a href="#">HEXI</a></span>
        </div>
    </div>

    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" id="myModalpatron" aria-labelledby="mySmallModalLabel" data-backdrop="static">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel">Nuevo diseño</h4>
                </div>
                <div class="modal-body">
                    <form id="body_modal">
                        <div class="form-group">
                            <label for="columncount" class="control-label">Cantidad trama:</label>
                            <input type="text" class="form-control" id="columncount" type="number" placeholder="Ingrese la cantidad de trama" />
                        </div>
                        <div class="form-group">
                            <label for="rowcount" class="control-label">Cantidad urdimbre:</label>
                            <input class="form-control" id="rowcount" type="number" placeholder="Ingrese la cantidad de urdimbre" />
                        </div>
                    </form>
                    <div style="display: none;" id="loader">
                        <img src="Iconos/loader3.svg" width="100%" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="cancel">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="program();" id="create">Crear</button>
                </div>
            </div>
        </div>
    </div>
    <div id="color" style="display:none">
        <input type="color" id="colorpicker" />
    </div>
    <div style="display:none;">
        <asp:TextBox ID="TextBox1" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server"  Visible="false" ReadOnly="true"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server"  Visible="false" ReadOnly="true"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Label"  Visible="false"></asp:Label>
    </div>


    <script>
        var sentences = [{
                author: "Brian Vaszily",
                frase: "Mira lo que otros no ven. Luego muéstralo. Eso es creatividad."
            },
            {
                author: "Edwin Land",
                frase: "Un aspecto esencial de la creatividad es no tener miedo de fracasar."
            },
            {
                author: "Pablo Picasso",
                frase: "Otros han visto lo que es y preguntaron por qué. Yo he visto qué podría ser y he preguntado por qué no."
            },
            {
                author: "Albert Einstein",
                frase: "La creatividad es inteligencia divirtiéndose."
            },
            {
                author: "Edward de Bono",
                frase: "El pensamiento creativo no es un talento mítico. Es un habilidad que puede ser practicada y nutrida."
            },
            {
                author: "Mary Lou Cook",
                frase: "La creatividad es inventar, experimentar, crecer, tomar riesgos, romper reglas, cometer errores y divertirse."
            },
            {
                author: "Ken Robinson",
                frase: "La creatividad es poner tu imaginación a trabajar y produce los resultados más extraordinarios de la cultura humana."
            },
            {
                author: "William Plomer",
                frase: "La creatividad es el poder de conectar lo aparentemente desconectado."
            },
            {
                author: "Ayn Rand",
                frase: "Un hombre creativo esta motivado por el deseo de conseguir, no por el deseo de superar a otros."
            },
            {
                author: "Ken Robinson",
                frase: "La creatividad es el proceso de tener ideas originales que tienen valor. Es un proceso, no es aleatorio."
            },
            {
                author: "Joseph Chilton Pierce",
                frase: "Para vivir una vida creativa debemos perder nuestro miedo de estar equivocados."
            },
            {
                author: "Albert Einstein",
                frase: "La creatividad es contagiosa, pásala."
            },
            {
                author: "Salvador Dali",
                frase: "No tengas miedo de la perfección, nunca la alcanzarás."
            },
            {
                author: "Dan Stevens",
                frase: "La zona de confort es la gran enemiga de la creatividad."
            },
            {
                author: "Keri Smith",
                frase: "La creatividad surge de la habilidad de ver las cosas desde muchos ángulos."
            },
            {
                author: "Rita Mae Brown",
                frase: "La creatividad viene de la confianza. Confía en tus instintos."
            },
            {
                author: "Edward de Bono",
                frase: "Una idea que se desarrolla y se pone en marcha es más importante que una idea que existe solo como idea."
            },
            {
                author: "Pablo Picasso",
                frase: "La inspiración existe, pero te tiene que encontrar trabajando."
            },
            {
                author: "Theodore Levitt",
                frase: "La creatividad es pensar cosas nuevas. La innovación es hacer cosas nuevas."
            },
            {
                author: "David Lynch",
                frase: "La negatividad es el enemigo de la creatividad."
            },
            {
                author: "Brene Brown",
                frase: "A través de la creatividad, esa es mi forma de compartir mi alma con el mundo."
            },
            {
                author: "Dieter F. Uchtdorf",
                frase: "El deseo de crear es uno de los más profundos deseos del alma."
            },
            {
                author: "U Leguin",
                frase: "El adulto creativo es el niño que sobrevivió."
            },
            {
                author: "Maya Angelou",
                frase: "No puedes agotar la creatividad; mientras más la usas, más tienes."
            },
            {
                author: "Edith Wharton",
                frase: "La creatividad no consiste en una nueva manera, sino en una nueva visión."
            },
        ];

        function program() {
            $('#body_modal').hide();
            $('#cancel').hide();
            $('#loader').show();
            $('#create').attr('onclick', '');
            $('#create').text('Procesando...');
            setTimeout(createTable, 4000); // 3000ms = 3s
        }
        id_td = 0;

        function createTable() {
            $('#basictable').remove();
            $('#horizontal').remove();
            $('#vertical').remove();
            $('#rellenn').remove();
            $('#resultado').remove();
            yes = 0;
            horiz = $('<table></table>').attr({
                id: "horizontal"
            });
            rellen = $('<table></table>').attr({
                id: "rellenn"
            });
            vert = $('<table></table>').attr({
                id: "vertical"
            });
            mytable = $('<table></table>').attr({
                id: "basictable"
            });
            patron = $('<table></table>').attr({
                id: "resultado"
            });
            var rows = new Number($("#rowcount").val());
            var cols = new Number($("#columncount").val());
            var tr = [];
            a = 1;
            //alert('procesando');
            for (var l = 0; l < 1; l++) {
                var rowh = $('<tr></tr>').attr({
                    class: ["class1", "class2", "class3"].join(' ')
                }).appendTo(horiz);
                for (var f = 0; f < cols; f++) {
                    $('<td id=' + "h" + (f + 1) + '></td>').appendTo(rowh);
                }
            }

            for (var s = 0; s < 1; s++) {
                var roww = $('<tr></tr>').attr({
                    class: ["class1", "class2", "class3"].join(' ')
                }).appendTo(rellen);
                for (var t = 0; t < cols; t++) {
                    $('<td></td>').appendTo(roww);
                }
            }
            //alert('procesando');
            for (var k = 0; k < rows; k++) {
                var rowv = $('<tr></tr>').attr({
                    class: ["class1", "class2", "class3"].join(' ')
                }).appendTo(vert);
                for (var c = 0; c < 1; c++) {
                    $('<td id=' + "v" + (k + 1) + '></td>').appendTo(rowv);
                }
            }
            //alert('procesando');
            for (var i = 0; i < rows; i++) {
                var row = $('<tr></tr>').attr({
                    class: ["class1", "class2", "class3"].join(' ')
                }).appendTo(mytable);
                var rowp = $('<tr></tr>').attr({
                    class: ["class1", "class2", "class3"].join(' ')
                }).appendTo(patron);
                for (var j = 0; j < cols; j++) {
                    $('<td id=' + "ve" + (i + 1) + "-ho" + (j + 1) + '><div id="d1"></div><div id="d2"></div></td>').appendTo(rowp);
                    $('<td id=' + "v" + (i + 1) + "-h" + (j + 1) + '></td>').appendTo(row);
                }
            }
            console.log("TTTTT:" + mytable.html());
            horiz.appendTo("#box2");
            rellen.appendTo("#box");
            vert.appendTo("#box");
            mytable.appendTo("#tablah");
            patron.appendTo("#result");
            $('#myModalpatron').modal('hide');
            $('#header').css('z-index', '10000');
            $('#body_modal').show();
            $('#cancel').show();
            $('#loader').hide();
            $('#create').attr('onclick', 'createTable();');
            $('#create').text('Crear');
            //mostrar boton color
            //$('#color').show();

            $(function() {
                id = "";
                $('#horizontal td').click(function() {
                    //Capturar id column para asignar color
                    if (yes == 0) {
                        id_td = this.id;
                        $('#colorpicker').spectrum('toggle');
                        return false;
                    }
                });

                $('#vertical td').click(function() {
                    //Capturar id column para asignar color
                    if (yes == 0) {
                        id_td = this.id;
                        $('#colorpicker').spectrum('toggle');
                        return false;
                    }
                });

                $('#basictable td').click(function() {
                    //Capturar id column para asignar color
                    cv = 0;
                    ch = 0;
                    cuenv = $('#vertical td[id*=v]').length;
                    cuenh = $('#horizontal td[id*=h]').length;
                    //alert(cuenv);
                    $('#vertical td[id*=v]').each(function(index) {
                        if ($(this).css("background-color") != "rgba(0, 0, 0, 0)") {
                            cv++;
                        }
                    });
                    $('#horizontal td[id*=h]').each(function(ind) {
                        if ($(this).css("background-color") != "rgba(0, 0, 0, 0)") {
                            ch++;
                        }
                    });
                    if (cv == cuenv && ch == cuenh) {
                        yes = 1;
                        id_td = this.id;
                        //alert(id_td);
                        $('#colorpicker').spectrum('toggle');
                        return false;
                    } else {
                        alert('Debes elegir los colores de la trama y urdimbre');
                    }

                    /*indice = this.id.indexOf('-');
                    idv=this.id.substring(0,indice);
                    idh=this.id.substring(indice+1,this.id.length);
                    colorv=$('#'+idv).css("background-color");
                    colorh=$('#'+idh).css("background-color");
                    if(colorv != "rgba(0, 0, 0, 0)" && colorh != "rgba(0, 0, 0, 0)"){
                        id_td=this.id;
                        alert(id_td);
                        $('#colorpicker').spectrum('toggle');
                        return false;
                    }else{
                        alert('No ha seleccionado el color de la urdimbre');
                    }*/
                    /*id_td=this.id;
                     $('#colorpicker').spectrum('toggle');
                     return false;*/
                });

            });
        }

        $(document).ready(function(e, color) {
            $("#colorpicker").spectrum({
                showPalette: true,
                palette: [
                    ["#000", "#444", "#666", "#999", "#ccc", "#eee", "#f3f3f3", "#fff"],
                    ["#f00", "#f90", "#ff0", "#0f0", "#0ff", "#00f", "#90f", "#f0f"],
                    ["#f4cccc", "#fce5cd", "#fff2cc", "#d9ead3", "#d0e0e3", "#cfe2f3", "#d9d2e9", "#ead1dc"],
                    ["#ea9999", "#f9cb9c", "#ffe599", "#b6d7a8", "#a2c4c9", "#9fc5e8", "#b4a7d6", "#d5a6bd"],
                    ["#e06666", "#f6b26b", "#ffd966", "#93c47d", "#76a5af", "#6fa8dc", "#8e7cc3", "#c27ba0"],
                    ["#c00", "#e69138", "#f1c232", "#6aa84f", "#45818e", "#3d85c6", "#674ea7", "#a64d79"],
                    ["#900", "#b45f06", "#bf9000", "#38761d", "#134f5c", "#0b5394", "#351c75", "#741b47"],
                    ["#600", "#783f04", "#7f6000", "#274e13", "#0c343d", "#073763", "#20124d", "#4c1130"]
                ],
                showSelectionPalette: true, // true by default
                allowEmpty: true,
                showInitial: true,
                showInput: true,
                showAlpha: true,
                color: 'hsva(0,0%,0%,0)',
                disabled: true,
                chooseText: "Seleccionar",
                cancelText: "Cancelar",
                hide: function(tinycolor) {
                    if (yes === 0) {
                        $('#' + id_td).css('background', tinycolor.toHexString());
                    } else {
                        indice = id_td.indexOf('-');
                        idv = id_td.substring(0, indice);
                        idh = id_td.substring(indice + 1, id_td.length);
                        colorv = $('#' + idv).css("background-color");
                        colorh = $('#' + idh).css("background-color");
                        if (colorv != tinycolor && colorh != tinycolor) {
                            alert('El color seleccionado no coincide con la trama ni urdimbre');
                        } else {
                            $('#' + id_td).css('background', tinycolor.toHexString());
                            reemplazo = id_td.replace("v", "ve");
                            reemplazo = reemplazo.replace("h", "ho");
                            shadev = shadeRGBColor(colorv, -0.3);
                            shadeh = shadeRGBColor(colorh, -0.3);
                            if (colorv == tinycolor) {
                                $('#' + reemplazo).find('div#d2').css('z-index', "0");
                                $('#' + reemplazo).find('div#d1').css('background-image', 'linear-gradient(to top, ' + shadev + ' 0%,' + colorv + '49%, ' + shadev + ' 100%)');
                                $('#' + reemplazo).find('div#d1').css('z-index', "1");
                            } else {
                                $('#' + reemplazo).find('div#d1').css('background-image', 'linear-gradient(to top, ' + shadev + ' 0%,' + colorv + '49%, ' + shadev + ' 100%)');
                            }
                            if (colorh == tinycolor) {
                                $('#' + reemplazo).find('div#d1').css('z-index', "0");
                                $('#' + reemplazo).find('div#d2').css('background-image', 'linear-gradient(to right, ' + shadeh + ' 0%,' + colorh + '49%, ' + shadeh + ' 100%)');
                                $('#' + reemplazo).find('div#d2').css('z-index', "1");
                            } else {
                                $('#' + reemplazo).find('div#d2').css('background-image', 'linear-gradient(to right, ' + shadeh + ' 0%,' + colorh + '49%, ' + shadeh + ' 100%)');
                            }
                        }
                    }
                    $('#colorpicker').val('#FFFFFF10'); // #ff0000
                },
            });

            $('#lmodal').click(function() {
                $('#header').css('z-index', '1000');
                $('#myModalpatron').modal('show');
            });

            $('#cancel').click(function() {
                $('#myModalpatron').modal('hide');
                $('#header').css('z-index', '10000');
            });
            var elecc = Math.floor(Math.random() * sentences.length);
            $('#author').text(sentences[elecc].author);
            $('#phrase').text('"' + sentences[elecc].frase + '"');
        });

        function shadeRGBColor(color, percent) {
            var f = color.split(","),
                t = percent < 0 ? 0 : 255,
                p = percent < 0 ? percent * -1 : percent,
                R = parseInt(f[0].slice(4)),
                G = parseInt(f[1]),
                B = parseInt(f[2]);
            return "rgb(" + (Math.round((t - R) * p) + R) + "," + (Math.round((t - G) * p) + G) + "," + (Math.round((t - B) * p) + B) + ")";
        }

    </script>
</body>
</html>
