<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioUsuarios.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
<!--<link href="css/stacktable.css" rel="stylesheet"/>-->
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
     <script>
  function registro(){
      swal("Registro Exitoso!", "", "success");
      };
      </script>
       <script>
           function problema() {
               swal('Oops...', 'Ocurrió un error inesperado!', 'info');
           }
           function modificacion(){
               swal("Modificación éxitosa!", "", "success");
           }
           function AccesoDesh() {
               swal("La habilitación de acceso al sistema fue eliminado con éxito!", "", "success");
           }
           function AccesoHab() {
               swal("La deshabilitación de acceso al sistema fue eliminado con éxito!", "", "success");
           }
           function yaexiste() {
               swal('Oops...', 'Este usuario ya existe!', 'error');
           }
           function yaexistedni() {
               swal('Oops...', 'Ya existe un usuario con este documento!', 'error');
           }
           function yaexistecorreo() {
               swal('Oops...', 'Ya existe un usuario con este correo!', 'error');
           }
           function campos() {
               swal('Oops...', 'No completó los campos de forma correcta o te hizo falta alguno(s)!', 'warning');
           }

        function noregistrado() {
            swal('Oops...', 'Este usuario no se encuentra registrado!', 'warning');
        }
    </script>
    <title>Fiber|Usuarios</title>
</head>
<body>
    <div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<a href="PprincipalInventariosAdmin.aspx"><h1><img class="atras" src="Iconos/Material%20Iconse5c41024.png"/></h1></a>
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
								<li><a href="default.aspx">Finalizar Sesión</a></li>
								<li><a href="PerfilAdmin.aspx">Perfil</a></li>
								<li><a href="#">Asistencia</a></li>
							</ul>
							<a href="#" class="close">Close</a>
						</div>
					</nav>
      </div>
    <div class="container">
  <div class="jumbotron">
     <!-- <img Class = "img" src = "Iconos/fblanco.jpg">-->
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
            <asp:Label ID="Label11" class="control-label col-sm-2" runat="server" Text="Documento:"></asp:Label>
    <div class="col-sm-10">
        <asp:TextBox ID="identificacion" type="text" class="form-control" placeholder="Número documento de identificación" name="identificacion" onkeyup="validacion('identificacion');" runat="server" MaxLength="15"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
  <div class="form-group">
      <asp:Label ID="Label2" class="control-label col-sm-2" runat="server" Text="Nombre(s):"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="nombres" type="text" class="form-control" placeholder="Nombre(s) del usuario" name="nombres" onkeyup="validacion('nombres');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label3" class="control-label col-sm-2" runat="server" Text="Apellidos:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="apellidos" type="text" class="form-control" placeholder="Apellidos del usuario" name="apellidos" onkeyup="validacion('apellidos');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
        <div class="form-group">
            <asp:Label ID="Label10" class="control-label col-sm-2" runat="server" Text="Rol:"></asp:Label>
    <div class="col-sm-10">
        <asp:DropDownList ID="roles" class="form-control col-sm-12" onchange="validacion('roles');" name="roles" runat="server">
        </asp:DropDownList>
        <span class="help-block"></span>
</div>
    </div>
        <div class="form-group">
            <asp:Label ID="Label4" class="control-label  col-sm-2" runat="server" Text="Correo:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="email" type="email" class="form-control" placeholder="Correo del usuario" name="email" onkeyup="validacion('email');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label5" class="control-label col-sm-2" runat="server" Text="Contraseña:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="password" type="password" class="form-control" placeholder="Contraseña del usuario" name="password" onkeyup="validacion('password');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label6" class="control-label col-sm-2" runat="server" Text="Contraseña:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="confirmpassword" type="password" class="form-control" placeholder="Confirmar contraseña" name="confirmpassword" onkeyup="validacion('confirmpassword');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label7" class="control-label col-sm-2" runat="server" Text="Teléfono:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="telefono" type="text" class="form-control" placeholder="Número Teléfonico del usuario" name="telefono" onkeyup="validacion('telefono');" runat="server" MaxLength="10"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
      <!--  <div class="form-group">
            <asp:Label ID="Label12" class="control-label col-sm-2" runat="server" Text="Estado:"></asp:Label>
    <div class="col-sm-10">
        <asp:DropDownList ID="Estadou" class="form-control" onchange="validacion('Estadou');" runat="server">
            <asp:ListItem Value="0">Seleccione un estado</asp:ListItem>
            <asp:ListItem Value="1">Habilitado</asp:ListItem>
            <asp:ListItem Value="2">Deshabilitado</asp:ListItem>
        </asp:DropDownList>
        <span class="help-block"></span>
    </div>
  </div>-->
       <!--<div class="form-group">
            <asp:Label ID="Label8" class="control-label col-sm-2" runat="server" Text="Foto:"></asp:Label>
           <div class="col-sm-10"> 
        <div class="input-group">
        <label class="input-group-btn">
         <span class="btn btn-primary" id="fotop" runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server" />
             </span>
            </label>
             <asp:TextBox ID="picture1" type="text" class="form-control" ReadOnly="true" name="picture" runat="server"></asp:TextBox>
            </div>
    </div>
  </div>-->
      <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-1 col-center">
     <div class="btn-group">
         <asp:Button ID="Button1" type="submit" class="btn btn-default" runat="server" Text="Registrar" OnClick="Button1_Click"  />
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
         <asp:Label ID="Label9" class="control-label col-sm-2" runat="server" Text="Buscar"></asp:Label>
    <div class="col-sm-8"> 
        <asp:TextBox ID="busqueda" type="text" class="form-control" placeholder="DNI Usuario" name="busqueda" onkeyup="validacion('busqueda');" runat="server" MaxLength="15"></asp:TextBox>
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
          <asp:GridView ID="GVUsuarios" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%" DataKeyNames="id_usuario" runat="server" OnRowDeleting="RowDeletingEvent" OnRowEditing="RowEditingEvent">
              <Columns>
                  <asp:TemplateField HeaderText="ID">
                      <ItemTemplate>
                          <asp:Label ID="ID_USER" runat="server" Text='<% # Bind("id_usuario") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Documento">
                      <ItemTemplate>
                          <asp:Label ID="DNI_USER" runat="server" Text='<% # Bind("dni_usuario") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Nombre(s)">
                      <ItemTemplate>
                          <asp:Label ID="NOMBRE_USER" runat="server" Text='<% # Bind("nombre_usuario") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Apellidos" >
                      <ItemTemplate>
                          <asp:Label ID="APELLIDOS_USER" runat="server" Text='<% # Bind("apellido_usuario") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Correo">
                      <ItemTemplate>
                          <asp:Label ID="EMAIL_USER" runat="server" Text='<% # Bind("email_usuario") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Teléfono">
                      <ItemTemplate>
                          <asp:Label ID="TEL_USER" runat="server" Text='<% # Bind("tel_usuario") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Estado">
                      <ItemTemplate>
                          <asp:Label ID="ESTADO_USER" runat="server" Text='<% # Bind("estado_usuario") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:CommandField ButtonType="Button" ShowEditButton="true" ControlStyle-CssClass="btn btn-info" >
<ControlStyle CssClass="btn btn-info"></ControlStyle>

                  </asp:CommandField>
                  <asp:CommandField ButtonType="Button" ShowDeleteButton="true" DeleteText="Cambiar Estado" ControlStyle-CssClass="btn btn-warning" >
<ControlStyle CssClass="btn btn-warning"></ControlStyle>
                  </asp:CommandField>
              </Columns>
          </asp:GridView>
          </div>
      </div>
     </div>
    </form>
          <div class="form-group">
    <div class="col-sm-12"> 
				<!-- Icons -->
				<!-- Menu -->

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
            $('#FileUpload1').attr('style', 'display:none;');
            $('#FileUpload1').attr('accept', 'image/*;');
            $('#fotop').append('Seleccionar');
            $('#GVUsuarios').dataTable();
        });
    </script>
    <script type="text/javascript">
        var v = true;
        $("#codigo").hide();
        $("span.help-block").hide();
        $('#Button1').click(verificar);
        $('#Button2').click(verificar);
        $('#Button5').click(buscar);
        function activarboton() {
            $('#Button2').attr("disabled", true);
        }
        function desactivarboton() {
            $('#Button2').attr("disabled", false);
        }
        function verificar(){

            var v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0, v6 = 0, v7 = 0, v8 = 0, v9 = 0;
            v1 = validacion('identificacion');
            v2 = validacion('nombres');
            v3 = validacion('apellidos');
            v4 = validacion('email');
            v5 = validacion('password');
            v6 = validacion('confirmpassword');
            v7 = validacion('telefono');
            v8 = validacion('Estadou');
            v9 = validacion('roles');
            if (v1 === false || v2 === false || v3 === false || v4 === false || v5 === false || v6 === false || v7 === false || v8 === false || v9 === false ) {
                 $("#exito").hide();
                 $("#error").show();
                 return false;
            }else{
                //$("#error").hide();
                //$("#exito").show();
                return true;
            }
            /*total=v1+v2+v3+v4+v5+v6;
            if (v && total>=6) {
                $("#error").hide();
                $("#exito").show();
            }else{
                 $("#exito").hide();
                 $("#error").show();
            }
            
            
            validacion('nombres');
            validacion('dni');
            validacion('email');
            validacion('genderRadios');
            validacion('carrera');
            if (v) {
                alert("los campos estan validados")
            }
            else{
                alert("los campos no estan validados");
            }*/

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
            
            if (campo==='identificacion')
            {
                codigo = document.getElementById(campo).value;
                if( codigo == null || codigo.length == 0 || /^\s+$/.test(codigo) ) {
                    $("#glypcn"+campo).remove();
                    $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#'+campo).parent().children('span').text("Ingrese el número de identificación").show();
                    $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                   
                }
                else
                {
                    if(isNaN(codigo)) {

                        $("#glypcn"+campo).remove();
                        $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#'+campo).parent().children('span').text("Solo se admiten números").show();
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
            if (campo==='nombres'){
                name = document.getElementById(campo).value;
                if (name == null || name.length == 0 || /^\s+$/.test(name)) {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el nombre").show();
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
            if (campo === 'apellidos') {
                apellido = document.getElementById(campo).value;
                if (apellido == null || apellido.length == 0 || /^\s+$/.test(apellido)) {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese los apellidos").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ\s]+$/.test(apellido) == false) {
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
            if (campo==='email'){
                email = document.getElementById(campo).value;
                if( email == null || email.length == 0 || /^\s+$/.test(email) ) {
                    $("#glypcn"+campo).remove();
                    $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#'+campo).parent().children('span').text("Ingrese el correo electrónico").show();
                    $('#'+campo).parent().append("<span id='glypcn"+campo+"' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        
                    return false;
                    
                }
                else{
                    if (!(/\S+@\S+\.\S+/.test(email))) {
                        $("#glypcn"+campo).remove();
                        $('#'+campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#'+campo).parent().children('span').text("Ingrese un correo válido").show();
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
            if (campo === 'password') {
                password = document.getElementById(campo).value;
                if (password == null || password.length == 0 || /^\s+$/.test(password)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la contraseña").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                }
                else {
                    if (password.length < 8) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Debe de contener mínimo 8 caracteres, almenos una mayúscula y un número").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-thumbs-down form-control-feedback'></span>");
                        return true;
                    }
                    else {
                        if (/^[A-Za-z 0123456789 _:.\- \s ]+$/.test(password) == false) {
                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#' + campo).parent().children('span').text("Puedes usar los siguientes caracteres: a-z, A-Z y signos de puntuación regulares.").show();
                            $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-thumbs-down form-control-feedback'></span>");
                            return false;
                        }
                        else {
                            var nMay = 0, nMin = 0, nNum = 0
                            var t1 = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
                            var t2 = "abcdefghijklmnñopqrstuvwxyz";
                            var t3 = "0123456789";
                            for (i = 0; i < password.length; i++) {
                                if (t1.indexOf(password.charAt(i)) != -1) { nMay++; }
                                if (t2.indexOf(password.charAt(i)) != -1) { nMin++; }
                                if (t3.indexOf(password.charAt(i)) != -1) { nNum++; }
                            }

                            if (nMay > 0 && nMin > 0 && nNum > 0) {

                                $("#glypcn" + campo).remove();
                                $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                                $('#' + campo).parent().children('span').hide();
                                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-thumbs-up form-control-feedback'></span>");
                                return true;
                            }
                            else {
                                $("#glypcn" + campo).remove();
                                $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                                $('#' + campo).parent().children('span').text("Debe de contener al menos una mayúscula y un número.").show();
                                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-thumbs-down form-control-feedback'></span>");

                                return false;
                            }
                        }
                    }
                }
            }
            if (campo === 'confirmpassword') {
                confirmpassword = document.getElementById(campo).value;
                passw = document.getElementById("password").value;
                if (confirmpassword == null || confirmpassword.length == 0 || /^\s+$/.test(confirmpassword)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Confirme la contraseña").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");

                    return false;

                }
                else {
                    if (confirmpassword==passw) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').text("Las contraseñas coinciden").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                        return true;
                    }
                    else {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Las contraseñas no coinciden").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");

                        return false;
                    }
                }

            }
            if (campo === 'telefono') {
                tel = document.getElementById(campo).value;
                if (tel == null || tel.length == 0 || /^\s+$/.test(tel)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el número de contacto").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                }
                else {
                    if (isNaN(tel)) {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten números").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");


                        return false;
                    }else{
                        if(tel.length<7){
                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#' + campo).parent().children('span').text("El número de contacto debe contener mínimo 7 caracteres").show();
                            $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                            return false;
                        }else {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').hide();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");

                        return true;
                    }
                }
                }
            }
            if (campo === 'Estadou') {
                indice = document.getElementById(campo).selectedIndex;
                if (indice == null || indice == 0) {
                    $('#Estadou').parent().parent().attr("class", "form-group has-error");
                    $('#' + campo).parent().children('span').text("Seleccione un estado").show();
                    return false;
                }
                else {
                    $('#Estadou').parent().parent().attr("class", "form-group has-success");
                    $('#' + campo).parent().children('span').hide();
                    return true;

                }
            }
                    if (campo === 'foto') {
                        imagen = document.getElementById("picture").value;
                        campo = 'picture';
                        if (imagen == null || imagen.length == 0 || /^\s+$/.test(imagen)) {
                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#' + campo).parent().children('span').text("Ingrese el número de identificación").show();
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

            if (campo==='roles'){
                indice = document.getElementById(campo).selectedIndex;
                if( indice == null || indice == 0 ) {
                    $('#roles').parent().parent().attr("class", "form-group has-error");
                    $('#' + campo).parent().children('span').text("Seleccione un rol").show();
                    return false;
                }
                else{
                    $('#roles').parent().parent().attr("class", "form-group has-success");
                    $('#' + campo).parent().children('span').hide();
                    return true;

                }
            }
            if (campo === 'busqueda') {
                buscar = document.getElementById(campo).value;
                if (buscar == null || buscar.length == 0 || /^\s+$/.test(buscar)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el número de identificación").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                }
                else {
                    if (isNaN(buscar)) {

                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten números").show();
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
    </script>
<!--<script src="jvscript/stacktable.min.js" type="text/javascript"></script>

<script>
  $(document).on('click', '#run', function(e) {
    e.preventDefault();
    $('#simple-example-table').stacktable();
    $(this).replaceWith('<span>ran - resize your window to see the effect</span>');
  });
  $('#responsive-example-table').stacktable({myClass:'your-custom-class'});
  $('#GVUsuarios').cardtable();
  $('#agenda-example').stackcolumns();
      </script>-->

    <script src="jvscript/js1/skel.min.js"></script>
	<script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="jvscript/bootstrap.js"></script>
      <script>
      $(function() {

  //We can attach the `fileselect` event to all file inputs on the page
  $(document).on('change', ':file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
  });

  // We can watch for our custom `fileselect` event like this
  $(document).ready( function() {
      $(':file').on('fileselect', function(event, numFiles, label) {

          var input = $(this).parents('.input-group').find(':text'),
              log = numFiles > 1 ? numFiles + ' files selected' : label;

          if( input.length ) {
              input.val(log);
          } else {
              if( log ) alert(log);
          }

      });
  });
  
});
          
      </script>
      <script src="jvscript/animacion.js"></script>
</body>
</html>
