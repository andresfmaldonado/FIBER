<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioHilos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioHilos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
    <link href="css/select2.css" rel="stylesheet" />
    <link href="css/select2-bootstrap.css" rel="stylesheet"/>
    <link href="css/gh-pages.css" rel="stylesheet" />
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script>
  function registro(){
      swal("Registro éxitoso!", "", "success");
      };
      </script>
       <script>
           function problema() {
               swal('Oops...', 'Ocurrió un error inesperado!', 'info');
           }
           function modificacion(){
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

        function noregistrado() {
            swal('Oops...', 'Esta cohorte no se encuentra registrada!', 'warning');
        }
    </script>
    <title>Fiber|Hilos</title>
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
            <div class="form-group" style="display:none;">
                <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Código:" Visible="false"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="codigo" type="text" class="form-control" placeholder="Código del hilo" runat="server" MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" class="control-label col-sm-2" runat="server" Text="Referencia:"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="referencia" onkeyup="validacion('referencia');" type="text" class="form-control" placeholder="Referencia del hilo" runat="server" MaxLength="10"></asp:TextBox>
                <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" class="control-label col-sm-2" runat="server" Text="Tipo:"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="tipo" onkeyup="validacion('tipo');" type="text" class="form-control" placeholder="Tipo de hilo" runat="server" MaxLength="10"></asp:TextBox>
               <span class="help-block"></span>
                     </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" class="control-label col-sm-2" runat="server" Text="Titulo:"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="titulo" onkeyup="validacion('titulo');" type="text" class="form-control" placeholder="Titulo del hilo" runat="server" MaxLength="3"></asp:TextBox>
                <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" class="control-label  col-sm-2" runat="server" Text="Color:"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="color" onkeyup="validacion('color');" type="text" class="form-control" placeholder="Color del hilo" runat="server" MaxLength="10"></asp:TextBox>
                <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" class="control-label col-sm-2" runat="server" Text="Valor por metro:"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="valor" onkeyup="validacion('valor');" type="text" class="form-control" placeholder="Valor por metro" runat="server" MaxLength="10"></asp:TextBox>
                <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="btn_Registrar" type="button" class="btn btn-default" runat="server" Text="Registrar" OnClick="btn_Registrar_Click" />
                    </div>
                </div>
                <div class="col-sm-offset-1 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="btn_Actualizar" type="button" class="btn btn-default" runat="server" Text="Actualizar" OnClick="btn_Actualizar_Click" />
                    </div>
                </div>
                <div class="col-sm-offset-1 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="btn_Cancelar" type="button" class="btn btn-default" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" />
                    </div>
                </div>
                
            </div>
            &nbsp
             <div class="form-group">
            <asp:Label ID="Label8" class="control-label col-sm-2" runat="server" Text="Tabla:"></asp:Label>
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
     <div class="form-group">
         <asp:Label ID="Label6" class="control-label col-sm-2" runat="server" Text="Buscar:"></asp:Label>
         <div class="col-sm-8">
             <asp:TextBox ID="buscar" type="text" class="form-control" placeholder="referencia Hilo" runat="server" MaxLength="10"></asp:TextBox>
         <span class="help-block"></span>
         </div>
         <div class=" col-md-2">
             <asp:Button ID="btn_Buscar" type="button" class="btn btn-default" runat="server" Text="Buscar" OnClick="btn_Buscar_Click" />
         </div>
     </div>
        </div>
        <div class="container show-top-margin separate-rows tall-rows">
            <div class="row show-grid">
                <div class="col-md-12">
                    <asp:GridView ID="GVHilos" AutoGenerateColumns="false" CssClass="table table-striped table-bordered dt-responsive nowrap" Cellspacing="0" Width="100%" DataKeyNames="id_hilo" OnRowEditing="GVHilos_RowEditing" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                      <ItemTemplate>
                          <asp:Label ID="ID_HILO" runat="server" Text='<% # Bind("id_hilo") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                            <asp:TemplateField HeaderText="Referencia">
                      <ItemTemplate>
                          <asp:Label ID="REFERENICA_HILO" runat="server" Text='<% # Bind("referencia_hilo") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo">
                      <ItemTemplate>
                          <asp:Label ID="TIPO_HILO" runat="server" Text='<% # Bind("tipo_hilo") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                            <asp:TemplateField HeaderText="Titulo">
                      <ItemTemplate>
                          <asp:Label ID="TITULO_HILO" runat="server" Text='<% # Bind("titulo_hilo") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                            <asp:TemplateField HeaderText="Color">
                      <ItemTemplate>
                          <asp:Label ID="COLOR_HILO" runat="server" Text='<% # Bind("color_hilo") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                            <asp:TemplateField HeaderText="Valor">
                      <ItemTemplate>
                          <asp:Label ID="VALOR_METRO" runat="server" Text='<% # Bind("valorMetro") %>'></asp:Label>
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
            <!-- Icons -->
            <!-- Menu -->

            <span id="footer">Fiber&copy; Producto: <a href="#">HEXI</a></span>
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
             $("#GVHilos").dataTable();
         });
     </script>
   <script type="text/javascript">
       var v = true;
       $("#codigo").hide();
       $("span.help-block").hide();
       $("#btn_Registrar").click(verificar);
       $("#btn_Actualizar").click(verificarmodifi);
       $("#btn_Buscar").click(buscar);
       function verificarmodifi() {
           var c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;
           c1 = validacion("referencia");
           c2 = validacion("tipo");
           c3 = validacion("titulo");
           c4 = validacion("color");
           c5 = validacion("valor");
           c6 = validacion("codigo");
           if (c1 == false || c2 == false || c3 == false || c4 == false || c5 == false) {
               $("#error").show();
               return false;
           } else {
               return true;
           }
       }
       function verificar() {
           var v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0;
           v1 = validacion("referencia");
           v2 = validacion("tipo");
           v3 = validacion("titulo");
           v4 = validacion("color");
           v5 = validacion("valor");
           v6 = validacion("codigo");
           if (v1 === false || v2 === false || v3 === false || v4 === false || v5 === false) {
               $("#error").show();
               return false;
           } else {
               return true;
           }
       }
       function buscar() {
           e1 = 0;
           e1 = validacion("buscar");
           if (e1 == false) {
               $("#error").show();
               return false;
           } else {
               return true;
           }
       }
       function validacion(campo) {
           var a = 0;
           if (campo === "referencia") {
               ref = document.getElementById(campo).value;
               if (ref == null || ref.length == 0 || /^\s+$/.test(ref)) {
                   $("#glypcn" + campo).remove();
                   $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                   $('#' + campo).parent().children('span').text("Ingrese la referencia del hilo.").show();
                   $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                   return false;
               } else {
                   if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ 0123456789\s]+$/.test(ref) == false) {
                       $("#glypcn" + campo).remove();
                       $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                       $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabéticos y numéricos").show();
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
           if (campo === 'tipo') {
               tip = document.getElementById(campo).value;
               if (tip == null || tip.length == 0 || /^\s+$/.test(tip)) {
                   $("#glypcn" + campo).remove();
                   $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                   $('#' + campo).parent().children('span').text("Ingrese el tipo del hilo.").show();
                   $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                   return false;
               } else {
                   if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ \s]+$/.test(tip) == false) {
                       $("#glypcn" + campo).remove();
                       $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                       $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabéticos").show();
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
           if (campo === "titulo") {
               titu = document.getElementById(campo).value;
               if (titu == null || titu.length == 0 || /^\s+$/.test(titu)) {
                   $("#glypcn" + campo).remove();
                   $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                   $('#' + campo).parent().children('span').text("Ingrese el titulo del hilo.").show();
                   $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                   return false;
               } else {
                   if (isNaN(titu)) {

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
           if (campo === "color") {
               col = document.getElementById(campo).value;
               if (col == null || col.length == 0 || /^\s+$/.test(col)) {
                   $("#glypcn" + campo).remove();
                   $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                   $('#' + campo).parent().children('span').text("Ingrese el color del producto.").show();
                   $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                   return false;
               } else {
                   if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ \s]+$/.test(col) == false) {
                       $("#glypcn" + campo).remove();
                       $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                       $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabéticos").show();
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
           if (campo === "valor") {
               pes = document.getElementById(campo).value;
               if (pes == null || pes.length == 0 || /^\s+$/.test(pes)) {
                   $("#glypcn" + campo).remove();
                   $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                   $('#' + campo).parent().children('span').text("Ingrese el peso del producto.").show();
                   $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                   return false;
               } else {
                   if (isNaN(pes)) {

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
           if (campo === "buscar") {
               buscar = document.getElementById(campo).value;
               if (buscar == null || buscar.length == 0 || /^\s+$/.test(buscar)) {
                   $("#glypcn" + campo).remove();
                   $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                   $('#' + campo).parent().children('span').text("Ingrese la referencia del hilo.").show();
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
	<script src="jvscript/js1/jquery.scrollex.min.js"></script>
	<script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="jvscript/select2.js"></script>
    <script src="jvscript/bootstrap.js"></script>
</body>
</html>
