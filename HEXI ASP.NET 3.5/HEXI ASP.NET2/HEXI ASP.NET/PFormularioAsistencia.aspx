<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PFormularioAsistencia.aspx.cs" Inherits="HEXI_ASP.NET.PFormularioAsistencia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script>
           function registro(){
               swal("Gracias por ayudarnos a mejorar!", "En la menor brevedad posible obtendrás una respuesta", "success");
           }
           function problema() {
               swal('Oops...', 'Ocurrió un error inesperado!', 'info');
           }
           function yaexiste() {
               swal('Oops...', 'Ya existe un reporte con este ID!', 'error');
           }
           function campos() {
               swal('Oops...', 'No completó los campos de forma correcta o te hizo falta alguno(s)!', 'warning');
           }
    </script>

    <title>Fiber|Asistencia</title>
</head>
<body>
    <div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<a href="PAsistencia.aspx"><h1><img class="atras" src="Iconos/Material%20Iconse5c41024.png"/></h1></a>
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
      <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Problema:"></asp:Label>
    <div class="col-sm-10">
        <asp:TextBox ID="NombreProblema" type="text" class="form-control" placeholder="Nombre del problema" onkeyup="validacion('NombreProblema');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label2" class="control-label col-sm-2" runat="server" Text="Descripción:"></asp:Label>
    <div class="col-sm-10"> 
   <!-- <textarea class="form-control" rows="6" id="DescripcioProblem" placeholder="Descripción del problema" onkeyup="validacion('DescripcionProblema');" runat="server"></textarea>-->
        <asp:TextBox ID="Observaciones" class="form-control" runat="server" Rows="6" placeholder="Descripción del problema" onkeyup="validacion('Observaciones');" TextMode="MultiLine" MaxLength="100"></asp:TextBox>
    <span class="help-block"></span>
    </div>
  </div>
        <div class="form-group"> 
    <div class="col-sm-offset-6 col-sm-1 col-center">
     <div class="btn-group">
         <asp:Button ID="Button1" type="button" class="btn btn-default" runat="server" Text="Registrar" OnClick="Button1_Click"/>
</div>
      </div>
    </div>
        </div>
         &nbsp
         <div class="container show-top-margin separate-rows tall-rows">
  <div class="row show-grid">
      <div class="col-md-12">  
          <asp:GridView ID="GVReporte" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%" DataKeyNames="id_problema" runat="server">
              <Columns>
                  <asp:TemplateField HeaderText="ID">
                      <ItemTemplate>
                          <asp:Label ID="ID_PROBLEMA" runat="server" Text='<% # Bind("id_problema") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Problema">
                      <ItemTemplate>
                          <asp:Label ID="NOMBRE_PROBLEMA" runat="server" Text='<% # Bind("nombre_problema") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Descripción" >
                      <ItemTemplate>
                          <asp:Label ID="DESCRIP_PROBLEMA" runat="server" Text='<% # Bind("observaciones_problema") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Fecha registro">
                      <ItemTemplate>
                          <asp:Label ID="FECHA_REGISTRO" runat="server" Text='<% # Bind("fecha_registro_problema") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>

                   <asp:TemplateField HeaderText="Estado">
                      <ItemTemplate>
                          <asp:Label ID="ESTADO_PROBLEMA" runat="server" Text='<% # Bind("estado_problema") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
              </Columns>
          </asp:GridView>
          </div>
      </div>
            </div>
        <asp:HiddenField runat="server" ID="_repostcheckcode" />
    </form>
    <div class="form-group">
    <div class="col-sm-12"> 
				<!-- Icons -->
				<!-- Menu -->

						<span id="footer">Fiber&copy; Producto: HEXI</span>
    </div>
  </div>
    <script type="text/javascript">
        var v=true;
        $("span.help-block").hide();
        $('#Button1').click(verificar);
        function verificar(){

            var v1 = 0, v2 = 0, v3 = 0, v4 = 0;
            v1 = validacion('NombreProblema');
            v2 = validacion('DescripcionProblema');
            if (v1 === false || v2 === false) {
                 $("#exito").hide();
                 $("#error").show();
                 return false;
            } else {
               
                //$("#error").hide();
                //$("#exito").show();
                return true;
            }

        }
        
        function validacion(campo){
            var a=0;
            if (campo === 'NombreProblema') {
                name = document.getElementById(campo).value;
                if (name == null || name.length == 0 || /^\s+$/.test(name)) {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el nombre del problema.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ ():.\-,'"\s]+$/.test(name) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten caracteres alfabéticos").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        return false;
                    }
                    else {
                        if (name.length > 30) {
                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#' + campo).parent().children('span').text("Solo se admiten 30 caracteres como máximo").show();
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
            if (campo === 'Observaciones') {
                descp = document.getElementById(campo).value;
                if (descp == null || descp.length == 0 || /^\s+$/.test(descp)) {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la descripción del problema.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ 123456789\s]+$/.test(descp) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten caracteres alfabéticos y numéricos").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        return false;
                    }
                    else {
                        if (descp.length > 100) {
                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#' + campo).parent().children('span').text("Solo se admiten 100 caracteres como máximo").show();
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
           

        }
    </script>
    
    <script src="jvscript/bootstrap.min.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/jquery.dataTables.min.js"></script>
    <script src="jvscript/dataTables.bootstrap.min.js"></script>
    <script src="jvscript/dataTables.responsive.min.js"></script>
    <script src="jvscript/responsive.bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#GVReporte').dataTable();
        });
    </script>
    <script src="jvscript/js1/skel.min.js"></script>

	<script src="jvscript/js1/jquery.scrollex.min.js"></script>
	<script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script src="jvscript/animacion.js"></script>
</body>
</html>
