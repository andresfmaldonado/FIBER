<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PFormularioCohorte.aspx.cs" Inherits="HEXI_ASP.NET.PFormularioCohorte" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <!--<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />-->
    <link href="css/DateTimePicker.css" rel="stylesheet" />
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
            swal("Registro éxitoso!", "", "success");
        };
    </script>
    <script>
        function problema() {
            swal('Oops...', 'Ocurrió un error inesperado!', 'info');
        }
        function modificacion() {
            swal("Actualización éxitosa!", "", "success");
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
    <script src="jvscript/jquery-3.1.0.js"></script>
    <!--<link href="css/stacktable.css" rel="stylesheet"/>-->
    <title>Fiber|Cohorte</title>
</head>
<body>
    <div id="page-wrapper">

        <!-- Header -->
        <header id="header" class="alt">
            <a href="PprincipalPatronesAdmin.aspx">
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
            <img class="img" src="Iconos/Fiber.png" />
        </div>
    </div>
    <form id="form1" class="form-horizontal" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="form-group">
                        <div class="alert alert-danger text-center" style="display: none;" id="error">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <strong>Adventencia: </strong>Debe completar todos los campos.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-md-offset-3">        
            <div class="form-group">
                <asp:Label ID="Label2" class="control-label col-sm-2" runat="server" Text="DNI:"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="dnicohorte" type="text" class="form-control" placeholder="Número de identificación de la cohorte" onkeyup="validacion('dnicohorte');" runat="server" MaxLength="15"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" class="control-label  col-sm-2" runat="server" Text="Inicia:"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="fecha_inic" class="form-control" data-field="datetime" type="text" ReadOnly="true" onchange="validacion('fecha_inic');" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox4" type="hidden" runat="server"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" class="control-label  col-sm-2" runat="server" Text="Finaliza:"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="fecha_fin" class="form-control" data-field="datetime" type="text" ReadOnly="true" onchange="validacion('fecha_fin');" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox6" type="hidden" runat="server"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" class="control-label col-sm-2" runat="server" Text="Programa:"></asp:Label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="Programas" class="form-control col-sm-12" onchange="selecprograma();" runat="server"></asp:DropDownList>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" class="control-label col-sm-2" runat="server" Text="Integrantes:"></asp:Label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="Integrantes" onchange="selecintegrantes();" class="form-control col-sm-12 input-sm select2-multiple" multiple="multiple" runat="server"></asp:DropDownList>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="Button1" type="button" class="btn btn-default" runat="server" Text="Registrar" OnClick="Button1_Click" />
                    </div>
                </div>
                <div class="col-sm-offset-1 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="Button2" type="button" class="btn btn-default" runat="server" Text="Actualizar" OnClick="Button2_Click" />
                    </div>
                </div>
                <div class="col-sm-offset-1 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="Button3" type="button" class="btn btn-default" runat="server" Text="Cancelar" OnClick="Button3_Click" />
                    </div>
                </div>
            </div>
            &nbsp
               <div class="form-group">
            <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Tabla:"></asp:Label>
    <div class="col-sm-10">
        <asp:DropDownList ID="opciontabla" class="form-control" onchange="tabla('opciontabla');" runat="server">
            <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
            <asp:ListItem Value="1">Mostrar</asp:ListItem>
            <asp:ListItem Value="2">Ocultar</asp:ListItem>
        </asp:DropDownList>
    </div>
  </div>
            </div>
        <div id="tabla" style="display:none">
            <div class="col-md-6 col-md-offset-3"> 
         <div class="container-fluid">
             <div class="row">
                 <div class="col-xs-12">
                     <div class="form-group">
                         <div class="alert alert-danger text-center" style="display: none;" id="errorbusqueda">
                             <button type="button" class="close" data-dismiss="alert">&times;</button>
                             <strong>Adventencia: </strong>Debe completar este campo para poder realizar la busqueda.
                         </div>
                     </div>
                 </div>
             </div>
         </div>
            <div class="form-group">
                <asp:Label ID="Label6" class="control-label col-sm-2" runat="server" Text="Buscar:"></asp:Label>
                <div class="col-sm-8">
                    <asp:TextBox ID="busqueda" type="text" class="form-control" placeholder="DNI Cohorte" onkeyup="validacion('busqueda');" runat="server" MaxLength="15"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
                <div class=" col-md-2">
                    <asp:Button ID="Button5" type="button" class="btn btn-default" runat="server" Text="Buscar" OnClick="Button5_Click" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label8" class="control-label col-sm-2" runat="server" Text="Categoría:"></asp:Label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="tipogv" class="form-control col-sm-12" onchange="selecGV();" runat="server">
                        <asp:ListItem Value="0">Cohortes</asp:ListItem>
                        <asp:ListItem Value="1">Integrantes</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="container show-top-margin separate-rows tall-rows">
            <div class="row show-grid">
                <div class="col-md-12">
                    <div style="display: none;" id="GdvCohortes">
                        <asp:GridView ID="GVCohortes" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" CellSpacing="0" Width="100%" DataKeyNames="id_cohorte" runat="server" OnRowEditing="RowEditingEvent">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="ID_COHORTE" runat="server" Text='<% # Bind("id_cohorte") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI">
                                    <ItemTemplate>
                                        <asp:Label ID="DNI_COHORTE" runat="server" Text='<% # Bind("dni_cohorte") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Programa">
                                    <ItemTemplate>
                                        <asp:Label ID="NOMBRE_PROGRAMA" runat="server" Text='<% # Bind("nombre_programa") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Inicia">
                                    <ItemTemplate>
                                        <asp:Label ID="FECHA_INICIO" runat="server" Text='<% # Bind("fecha_inic_cohorte") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Termina">
                                    <ItemTemplate>
                                        <asp:Label ID="FECHA_FIN" runat="server" Text='<% # Bind("fecha_fin_cohorte") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Button" ShowEditButton="true" ControlStyle-CssClass="btn btn-info">
                                    <ControlStyle CssClass="btn btn-info"></ControlStyle>

                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div style="display: none;" id="GdvIntegrantes">
                        <asp:GridView ID="GVIntegrantes" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" CellSpacing="0" Width="100%" DataKeyNames="dni_cohorte" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="DNI Cohorte">
                                    <ItemTemplate>
                                        <asp:Label ID="DNICOHORTE" runat="server" Text='<% # Bind("dni_cohorte") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Programa">
                                    <ItemTemplate>
                                        <asp:Label ID="nom_Programa" runat="server" Text='<% # Bind("nombre_programa") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI Usuario">
                                    <ItemTemplate>
                                        <asp:Label ID="DNI_Usuario" runat="server" Text='<% # Bind("dni_usuario") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre(s)">
                                    <ItemTemplate>
                                        <asp:Label ID="Nombre_usuario" runat="server" Text='<% # Bind("nombre_usuario") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellidos">
                                    <ItemTemplate>
                                        <asp:Label ID="apellido_usuario" runat="server" Text='<% # Bind("apellido_usuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
            </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="form-group">
                        <div class="text-center" style="display: none;" id="nada">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div id="dtBox"></div>
    <div class="form-group">
        <div class="col-sm-12">
            <!-- Icons -->
            <!-- Menu -->

            <span id="footer">Fiber&copy; Producto: HEXI</span>
        </div>
    </div>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/bootstrap.min.js"></script>
    <script src="jvscript/jquery.dataTables.min.js"></script>
    <script src="jvscript/dataTables.bootstrap.min.js"></script>
    <script src="jvscript/dataTables.responsive.min.js"></script>
    <script src="jvscript/responsive.bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#opciontabla > option[value="0"]').attr('selected', 'selected');
            $('#GVCohortes').dataTable();
            $('#GVIntegrantes').dataTable();
        });
    </script>
    <script type="text/javascript">
        var v = true;
        $("span.help-block").hide();
        $("#GdvCohortes").show();
        $("#GdvIntegrantes").hide();
        $('#Button1').click(verificar);
        $('#Button2').click(verificarmodifi);
        $('#Button5').click(buscar);
        function verificarmodifi() {

            var v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0, v6 = 0, v7 = 0;
            v1 = validacion('dnicohorte');
            v2 = validacion('fecha_inic');
            v3 = validacion('fecha_fin');
            v4 = selecprograma();
            v5 = validacion('Programas');
            v6 = selecintegrantesmodifi();
            if (v1 === false || v2 === false || v3 === false || v4 === false || v5 === false || v6 === false || v7 === false) {
                $("#exito").hide();
                $("#error").show();
                return false;
            } else {
                var lista = document.getElementById("Integrantes");
                var opciones = lista.options;
                var option = 1;
                for (i = 0; i < opciones.length; i++) {

                    if (opciones[i].selected == true) {

                        var grupos = opciones[i].value;

                        if (option == 1) {
                            document.getElementById("TextBox1").value = grupos;
                        }
                        else {
                            document.getElementById("TextBox1").value = (document.getElementById("TextBox1").value) + ',' + grupos;
                        }
                        option++;
                    }
                }
                var resultado3 = $("#fecha_inic").val();
                $("#TextBox4").val(resultado3);
                var resultado4 = $("#fecha_fin").val();
                $("#TextBox6").val(resultado4);
                //$("#error").hide();
                //$("#exito").show();
                return true;
            }

        }
        function verificar() {

            var v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0, v6 = 0, v7 = 0;
            v1 = validacion('dnicohorte');
            v2 = validacion('fecha_inic');
            v3 = validacion('fecha_fin');
            v4 = selecprograma();
            v5 = selecintegrantes();
            v6 = validacion('Programas');
            v7 = validacion('Integrantes');
            if (v1 === false || v2 === false || v3 === false || v4 === false || v5 === false || v6 === false || v7 === false) {
                $("#exito").hide();
                $("#error").show();
                return false;
            } else {
                var lista = document.getElementById("Integrantes");
                var opciones = lista.options;
                var option = 1;
                for (i = 0; i < opciones.length; i++) {

                    if (opciones[i].selected == true) {

                        var grupos = opciones[i].value;

                        if (option == 1) {
                            document.getElementById("TextBox1").value = grupos;
                        }
                        else {
                            document.getElementById("TextBox1").value = (document.getElementById("TextBox1").value) + ',' + grupos;
                        }
                        option++;
                    }
                }
                var resultado = $("#fecha_inic").val();
                $("#TextBox4").val(resultado);
                var resultado2 = $("#fecha_fin").val();
                $("#TextBox6").val(resultado2);
                //$("#error").hide();
                //$("#exito").show();
                return true;
            }

        }
        function buscar() {

            var e1 = 0;
            e1 = validacion('busqueda');
            if (e1 === false) {
                $("#exito").hide();
                $("#errorbusqueda").show();
                return false;
            } else {
                //$("#error").hide();
                //$("#exito").show();
                return true;
            }
        }
        function selecprograma() {
            if ($("#Programas option:selected").val() == null || $("#carrera option:selected").val() == 0) {
                $('#Programas').parent().parent().attr("class", "form-group has-error");
                $('#Programas').parent().children('span').text("Seleccione el programa al que pertenece la cohorte.").show();
                return false;
            } else {
                $('#Programas').parent().parent().attr("class", "form-group has-success");
                return true;

            }
        }
        function selecintegrantes() {
            if ($("#Integrantes option:selected").val() == null || $("#Integrantes option:selected").val() == 0) {
                $('#Integrantes').parent().parent().attr("class", "form-group has-error");
                $('#Integrantes').parent().children('span').text("Seleccione los integrantes de la cohorte.").show();
                return false;
            } else {
                $('#Integrantes').parent().children('span').hide();
                $('#Integrantes').parent().parent().attr("class", "form-group has-success");
                return true;

            }
        }
        function selecintegrantesmodifi() {
            if ($("#Integrantes option:selected").val() == 0) {
                $('#Integrantes').parent().parent().attr("class", "form-group has-error");
                $('#Integrantes').parent().children('span').text("Seleccione los integrantes de la cohorte.").show();
                return false;
            } else {
                $('#Integrantes').parent().children('span').hide();
                $('#Integrantes').parent().parent().attr("class", "form-group has-success");
                return true;

            }
        }
        function selecGV() {
            selectgv = document.getElementById('tipogv').selectedIndex;
            if (selectgv == 0) {
                $("#GdvIntegrantes").hide();
                $("#GdvCohortes").show();
            }
            else {
                if (selectgv == 1) {
                    $("#GdvCohortes").hide();
                    $("#GdvIntegrantes").show();
                }
            }
        }
        function validacion(campo) {
            var a = 0;

            if (campo === 'dnicohorte') {
                dni = document.getElementById(campo).value;
                if (dni == null || dni.length == 0 || /^\s+$/.test(dni)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el DNI de la cohorte.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                }
                else {
                    if (isNaN(dni)) {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");


                        return false;
                    }
                    else {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').hide();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");

                        return true;
                    }


                }

            }
            if (campo === 'fecha_inic') {
                fechai = document.getElementById(campo).value;
                fechafin = document.getElementById("fecha_fin").value;


                var xxMonth = fechai.substring(3, 5);
                var xxDay = fechai.substring(0, 2);
                var xxYear = fechai.substring(6, 10);
                var yyMonth = fechafin.substring(3, 5);
                var yyDay = fechafin.substring(0, 2);
                var yyYear = fechafin.substring(6, 10);
                var dateStart = new Date(xxYear, xxMonth, xxDay);
                var dateEnd = new Date(yyYear, yyMonth, yyDay);

                if (fechai == null || fechai.length == 0 || /^\s+$/.test(fechai)) {

                    $("#glypcn" + campo).remove();
                    $('#TextBox4').parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#TextBox4').parent().children('span').text("Ingrese la fecha de inicio.").show();

                    return false;

                } else {
                    if (/^\d{2}\/\d{2}\/\d{4}\s+\d{2}\:\d{2}\:\d{2}$/.test(fechai) == false && /^\d{2}\/\d{2}\/\d{4}\s+\d{1}\:\d{2}\:\d{2}$/.test(fechai) == false) {
                        $("#glypcn" + campo).remove();
                        $('#TextBox4').parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#TextBox4').parent().children('span').text("Solo se admiten fechas.").show();

                        return false;
                    }
                    else {
                        if (fechai == fechafin) {
                            $("#glypcn" + campo).remove();
                            $('#TextBox4').parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#TextBox4').parent().children('span').text("Las fechas no pueden ser iguales.").show();

                            return false;
                        }
                        else {
                            if (dateStart > dateEnd) {
                                $("#glypcn" + campo).remove();
                                $('#TextBox4').parent().parent().attr("class", "form-group has-error has-feedback");
                                $('#TextBox4').parent().children('span').text("La fecha de inicio debe ser menor que la final.").show();

                                return false;

                            } else {

                                $("#glypcn" + campo).remove();
                                $('#TextBox4').parent().parent().attr("class", "form-group has-success has-feedback");
                                $('#TextBox4').parent().children('span').hide();

                                return true;
                            }
                        }

                    }
                }
            }
            if (campo === 'fecha_fin') {
                fechaf = document.getElementById(campo).value;
                fechainic = document.getElementById("fecha_inic").value;

                var xMonth = fechainic.substring(3, 5);
                var xDay = fechainic.substring(0, 2);
                var xYear = fechainic.substring(6, 10);
                var yMonth = fechaf.substring(3, 5);
                var yDay = fechaf.substring(0, 2);
                var yYear = fechaf.substring(6, 10);
                var dateStarted = new Date(xYear, xMonth, xDay);
                var dateEnded = new Date(yYear, yMonth, yDay);
                var Dif = dateEnded.getTime() - dateStarted.getTime();
                var dias = Math.floor(Dif / (1000 * 24 * 60 * 60));

                if (fechaf == null || fechaf.length == 0 || /^\s+$/.test(fechaf)) {

                    $("#glypcn" + campo).remove();
                    $('#TextBox6').parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#TextBox6').parent().children('span').text("Ingrese la fecha de finalización.").show();
                    return false;

                } else {
                    if (/^\d{2}\/\d{2}\/\d{4}\s+\d{2}\:\d{2}\:\d{2}$/.test(fechaf) == false && /^\d{2}\/\d{2}\/\d{4}\s+\d{1}\:\d{2}\:\d{2}$/.test(fechaf) == false) {
                        $("#glypcn" + campo).remove();
                        $('#TextBox6').parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#TextBox6').parent().children('span').text("Solo se admiten fechas.").show();

                        return false;
                    }
                    else {
                        if (fechaf.ge == fechainic) {
                            $("#glypcn" + campo).remove();
                            $('#TextBox6').parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#TextBox6').parent().children('span').text("Las fechas no pueden ser iguales.").show();

                            return false;
                        }
                        else {
                            if (dateStarted > dateEnded) {
                                $("#glypcn" + campo).remove();
                                $('#TextBox6').parent().parent().attr("class", "form-group has-error has-feedback");
                                $('#TextBox6').parent().children('span').text("La fecha de finalización debe ser mayor que la de inicio.").show();

                                return false;

                            } else {

                                if (dias < 30) {
                                    $("#glypcn" + campo).remove();
                                    $('#TextBox6').parent().parent().attr("class", "form-group has-error has-feedback");
                                    $('#TextBox6').parent().children('span').text("La fecha de finalización debe ser mayor a 30 días.").show();

                                    return false;
                                }
                                else {
                                    $("#glypcn" + campo).remove();
                                    $('#TextBox6').parent().parent().attr("class", "form-group has-success has-feedback");
                                    $('#TextBox6').parent().children('span').hide();

                                    return true;
                                }
                            }


                        }

                    }
                }
            }

            if (campo === 'Programas') {
                var lista = document.getElementById(campo);
                var opciones = lista.options;
                for (i = 0; i < opciones.length; i++) {
                    if (opciones[i].selected == true) {
                        var indice = opciones[i].value;
                        if (indice == null || indice == 0) {
                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error");
                            return false;

                        }
                        else {
                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-success");
                            return true;

                        }
                    }
                }
            }
            if (campo === 'Integrantes') {
                var lista = document.getElementById(campo);
                var opciones = lista.options;
                for (i = 0; i < opciones.length; i++) {
                    if (opciones[i].selected == true) {
                        var indice = opciones[i].value;
                        if (indice == null || indice == 0) {

                            $(campo).parent().parent().attr("class", "form-group has-error");

                            return false;
                        }
                        else {

                            $(campo).parent().parent().attr("class", "form-group has-success");

                            return true;

                        }
                    }
                }
            }
            if (campo === 'busqueda') {
                buscar = document.getElementById(campo).value;
                if (buscar == null || buscar.length == 0 || /^\s+$/.test(buscar)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el DNI de la cohorte.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                }
                else {
                    if (isNaN(buscar)) {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");


                        return false;
                    }
                    else {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').hide();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");

                        return true;
                    }
                }
            }


        }

        function tabla(opciont) {
            selectabla = document.getElementById(opciont).selectedIndex;
            if (selectabla == 1) {
                $('#tabla').show();
            }
            if (selectabla == 2) {
                $('#tabla').hide();
            }
        }
    </script>
    <script type="text/javascript" src="jvscript/bootstrap.min.js"></script>
    <script src="jvscript/DateTimePicker.js"></script>
    <script type="text/javascript">
		
			$(document).ready(function()
			{
				$("#dtBox").DateTimePicker({
				    dateTimeFormat: "dd/MM/yyyy HH:mm:ss",
                    dateSeparator: "/",
                    timeSeparator: ":",
                    shortDayNames: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sáb"],
                    fullDayNames: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
                    shortMonthNames: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
                    fullMonthNames: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
                    titleContentDateTime: "Seleccione la fecha y hora",
                    buttonsToDisplay: ["HeaderCloseButton", "SetButton", "ClearButton"],
                    setButtonContent: "Aceptar",
                    clearButtonContent: "Limpiar",

                });
			});
		
		</script>
    <!--<script type="text/javascript" src="jvscript/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="jvscript/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>-->
    <!--<script type="text/javascript">
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
    </script>-->
    <script src="jvscript/js1/skel.min.js"></script>
    <script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="jvscript/select2.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script>
        $(function () {
            $("#Integrantes").select2();
        });
        var placeholder = "Seleccione los integrantes de la cohorte";
        $('#Integrantes').select2({ placeholder: placeholder });
        function repoFormatResult(repo) {
            var markup = "<div class='select2-result-repository clearfix'>" +
                "<div class='select2-result-repository__avatar'><img src='" + repo.owner.avatar_url + "' /></div>" +
                "<div class='select2-result-repository__meta'>" +
                    "<div class='select2-result-repository__title'>" + repo.full_name + "</div>";

            if (repo.description) {
                markup += "<div class='select2-result-repository__description'>" + repo.description + "</div>";
            }

            markup += "<div class='select2-result-repository__statistics'>" +
                        "<div class='select2-result-repository__forks'><span class='glyphicon glyphicon-flash'></span> " + repo.forks_count + " Forks</div>" +
                        "<div class='select2-result-repository__stargazers'><span class='glyphicon glyphicon-star'></span> " + repo.stargazers_count + " Stars</div>" +
                        "<div class='select2-result-repository__watchers'><span class='glyphicon glyphicon-eye-open'></span> " + repo.watchers_count + " Watchers</div>" +
                    "</div>" +
                "</div></div>";

            return markup;
        }

        function repoFormatSelection(repo) {
            return repo.full_name;
        }
        $('#Integrantes').on(select2OpenEventName, function () {
            if ($(this).parents("[class*='has-']").length) {
                var classNames = $(this).parents("[class*='has-']")[0].className.split(/\s+/);

                for (var i = 0; i < classNames.length; ++i) {
                    if (classNames[i].match("has-")) {
                        $("#select2-drop").addClass(classNames[i]);
                    }
                }
            }
        });

    </script>
    <script src="jvscript/animacion.js"></script>


</body>
</html>
