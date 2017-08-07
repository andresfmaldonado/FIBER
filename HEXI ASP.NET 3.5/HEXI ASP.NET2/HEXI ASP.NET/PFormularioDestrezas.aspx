<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PFormularioDestrezas.aspx.cs" Inherits="HEXI_ASP.NET.PFormularioDestrezas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script>
           function registro(){
               swal("Registro éxitoso!", "", "success");
           }
           function problema() {
               swal('Oops...', 'Ocurrió un error inesperado!', 'info');
           }
           function modificacion(){
               swal("Actualización éxitosa!", "", "success");
           }
           function yaexiste() {
               swal('Oops...', 'Esta Competencia ya existe!', 'error');
           }
           function yaexistedni() {
               swal('Oops...', 'Ya existe una Competencia con este DNI!', 'error');
           }
           function yaexistenombre() {
               swal('Oops...', 'Ya existe una Competencia con este Nombre!', 'error');
           }
           function campos() {
               swal('Oops...', 'No completó los campos de forma correcta o te hizo falta alguno(s)!', 'warning');
           }

        function noregistrado() {
            swal('Oops...', 'Esta competencia no se encuentra registrada!', 'warning');
        }
    </script>
    <title>Fiber|Destrezas</title>
</head>
<body>
    <div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<a href="PprincipalPatronesAdmin.aspx"><h1><img class="atras" src="Iconos/Material%20Iconse5c41024.png"/></h1></a>
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
    <img class = "img" src = "Iconos/Fiber.png"/>
</div>
      </div>
    <form id="form1" class="form-horizontal" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-xs-12">
                    <div class="form-group">
                        <div class="alert alert-danger text-center" style="display:none;" id="error">
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
        <asp:TextBox ID="dnicompetencia" type="text" class="form-control" placeholder="Número de identificación de la competencia" onkeyup="validacion('dnicompetencia');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label4" class="control-label col-sm-2" runat="server" Text="Nombre:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="nombre_competencia" type="text" class="form-control" placeholder="Nombre de la competencia" onkeyup="validacion('nombre_competencia');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
        <div class="form-group">
            <asp:Label ID="Label5" class="control-label  col-sm-2" runat="server" Text="Resultados:"></asp:Label>
    <div class="col-sm-10">
        <asp:TextBox ID="resultados" type="text" class="form-control" placeholder="Cantidad de resultados de la competencia" onkeyup="validacion('resultados');" runat="server" MaxLength="11"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label6" class="control-label col-sm-2" runat="server" Text="Horas:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="horas" type="text" class="form-control" placeholder="Cantidad de horas de la competencia" onkeyup="validacion('horas');" runat="server" MaxLength="11"></asp:TextBox>
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
        <div id="tabla" style="display:none;">
        <div class="col-md-6 col-md-offset-3"> 
        <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                    <div class="form-group">
                        <div class="alert alert-danger text-center" style="display:none;"  id="errorbusqueda">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <strong>Adventencia: </strong>Debe completar este campo para poder realizar la busqueda.
                        </div> 
                    </div>
                </div>
            </div>
             </div>
     <div class="form-group">
         <asp:Label ID="Label7" class="control-label col-sm-2" runat="server" Text="Buscar:"></asp:Label>
    <div class="col-sm-8"> 
        <asp:TextBox ID="busqueda" type="text" class="form-control" placeholder="Nombre de la competencia" onkeyup="validacion('busqueda');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
            <div class=" col-md-2">
                <asp:Button ID="Button5" type="button" class="btn btn-default" runat="server" Text="Buscar" OnClick="Button5_Click" />
</div>
  </div> 
        </div>  
        <div class="container show-top-margin separate-rows tall-rows">
  <div class="row show-grid">
      <div class="col-md-12">  
          <asp:GridView ID="GVCompetencias" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%" DataKeyNames="id_competencia" runat="server" OnRowEditing="RowEditingEvent">
              <Columns>
                  <asp:TemplateField HeaderText="ID">
                      <ItemTemplate>
                          <asp:Label ID="ID_COMPETENCIA" runat="server" Text='<% # Bind("id_competencia") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="DNI">
                      <ItemTemplate>
                          <asp:Label ID="DNI_COMPETENCIA" runat="server" Text='<% # Bind("dni_competencia") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Nombre">
                      <ItemTemplate>
                          <asp:Label ID="NOMBRE_COMPETENCIA" runat="server" Text='<% # Bind("nombre_competencia") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Resultados" >
                      <ItemTemplate>
                          <asp:Label ID="RESULTADOS" runat="server" Text='<% # Bind("cantid_resultados") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Horas">
                      <ItemTemplate>
                          <asp:Label ID="HORAS" runat="server" Text='<% # Bind("cantid_horas") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:CommandField ButtonType="Button" ShowEditButton="true" ControlStyle-CssClass="btn btn-info" >
<ControlStyle CssClass="btn btn-info"></ControlStyle>

                  </asp:CommandField>
              </Columns>
          </asp:GridView>
          </div>
      </div>
            </div>
            </div>
    </form>
    <div class="form-group">
    <div class="col-sm-12"> 

						<span id="footer">Fiber&copy; Producto: HEXI</span>
    </div>
  </div>

    <script src="jvscript/bootstrap.min.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/jquery.dataTables.min.js"></script>
    <script src="jvscript/dataTables.bootstrap.min.js"></script>
    <script src="jvscript/dataTables.responsive.min.js"></script>
    <script src="jvscript/responsive.bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#opciontabla > option[value="0"]').attr('selected', 'selected');
            $('#GVCompetencias').dataTable();
        });
    </script>
    <script type="text/javascript">
        var v=true;
        $("span.help-block").hide();
        $('#Button1').click(verificar);
        $('#Button2').click(verificar);
        $('#Button5').click(buscar);
        function verificar(){

            var v1 = 0, v2 = 0, v3 = 0, v4 = 0;
            v1 = validacion('dnicompetencia');
            v2 = validacion('nombre_competencia');
            v3 = validacion('resultados');
            v4 = validacion('horas');
            if (v1 === false || v2 === false || v3 === false || v4 === false) {
                 $("#exito").hide();
                 $("#error").show();
                 return false;
            } else {
               
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
        function validacion(campo){
            var a=0;
            
            if (campo==='dnicompetencia')
            {
                dni = document.getElementById(campo).value;
                if (dni == null || dni.length == 0 || /^\s+$/.test(dni)) {
                    $("#glypcn"+campo).remove();
                    $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#'+campo).parent().children('span').text("Ingrese el código de la competencia.").show();
                    $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                   
                }
                else
                {
                    if (isNaN(dni)) {

                        $("#glypcn"+campo).remove();
                        $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#'+campo).parent().children('span').text("Solo se admiten números.").show();
                        $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");

              
                        return false;
                    }
                    else{

                        $("#glypcn"+campo).remove();
                        $('#'+campo).parent().parent().attr("class", "form-group has-success has-feedback");
                        $('#'+campo).parent().children('span').hide();
                        $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-ok form-control-feedback'></span>");
             
                        return true;
                    }
                    
                    
                }
                
            }
            if (campo === 'nombre_competencia') {
                name = document.getElementById(campo).value;
                if (name == null || name.length == 0 || /^\s+$/.test(name)) {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el nombre de la competencia.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ\s]+$/.test(name) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten caracteres alfabéticos").show();
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
            if (campo === 'resultados') {
                resul = document.getElementById(campo).value;
                if (resul == null || resul.length == 0 || /^\s+$/.test(resul)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la cantidad de resultados.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                }
                else {
                    if (isNaN(resul)) {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");


                        return false;
                    }
                    else {
                        if (resul == 0 || resul == "0") {

                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#' + campo).parent().children('span').text("Ingrese la cantidad de resultados.").show();
                            $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                            return false;

                        } else {

                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                            $('#' + campo).parent().children('span').hide();
                            $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");

                            return true;
                        }
                    }
                }
            }
            if (campo === 'horas') {
                horas = document.getElementById(campo).value;
                if (horas == null || horas.length == 0 || /^\s+$/.test(horas)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la cantidad de horas.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                }
                else {
                    if (isNaN(horas)) {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");


                        return false;
                    }
                    else {
                        if (horas == 0 || horas == "0") {

                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#' + campo).parent().children('span').text("Ingrese la cantidad de horas.").show();
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
            if (campo === 'busqueda') {
                buscar = document.getElementById(campo).value;
                if (buscar == null || buscar.length == 0 || /^\s+$/.test(buscar)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el DNI de la competencia.").show();
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
    <script src="jvscript/js1/skel.min.js"></script>
	<script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script src="jvscript/animacion.js"></script>
</body>
</html>
