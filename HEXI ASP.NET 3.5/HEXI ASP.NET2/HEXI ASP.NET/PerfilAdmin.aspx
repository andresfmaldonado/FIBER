<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfilAdmin.aspx.cs" Inherits="HEXI_ASP.NET.PerfilAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
    <link href="css/Jcrop.css" rel="stylesheet" />
    <link href="css/styleventanaemergente.css" rel="stylesheet" />
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
               swal("Modificación de contraseña éxitosa!", "", "success");
           }
           function modificacionphoto() {
               swal("Foto de perfil actualizada!", "", "success");
           }
           function campos() {
               swal('Oops...', 'No completó los campos de forma correcta o te hizo falta alguno(s)!', 'warning');
           }
    </script>
        <script src="jvscript/jquery-3.1.0.js"></script>
    <title>Fiber|Perfil</title>
</head>
<body>
    <div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
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
                                <li><a href="FiberInicioAdmin.aspx">Inicio</a></li>
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
    <img class = "img" src = "Iconos/Fiber.png"/>
</div>
      </div>
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
<div class="container">
<br/>
<br/>
	<div class="row" id="main">
        <div class="col-md-5 well" id="leftPanel">
            <div class="row">
                <div class="col-md-12">
                	<div>
                        <asp:Image ID="Image1" runat="server" height="200px" width="200px" alt="Texto Alternativo" class="img-circle img-thumbnail"/>
        				<h2><asp:Label ID="NombreUsuario" runat="server" Text=""></asp:Label></h2>
        				<p><span><asp:Label ID="NombreRolUsuario" runat="server" Text=""></asp:Label>:</span><br/>Gracias por formar parte de la familia Fiber.<br/>
                        Recuerda darle un buen uso a esta Aplicación Wep.</p>                        
                <asp:Button ID="Button2" runat="server" class="btn btn-warning" Text="Actualizar Foto" />   
        			</div>
        		</div>
            </div>
        </div>
        <div class="col-md-7 well" id="rightPanel">
            <div class="row">
    <div class="col-md-12">
			<h2>Editar perfil.</h2>
			<hr class="colorgraph"/>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <asp:TextBox ID="Nombre" type="text" name="first_name" class="form-control input-lg" placeholder="Nombre(s)" ReadOnly="true" tabindex="1" runat="server"></asp:TextBox>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <asp:TextBox ID="Apellidos" type="text" name="last_name" class="form-control input-lg" placeholder="Apellidos" ReadOnly="true" tabindex="2" runat="server"></asp:TextBox>
					</div>
				</div>
			</div>
			<div class="form-group">
                <asp:TextBox ID="correo" type="email" name="email" class="form-control input-lg" placeholder="Correo electrónico" ReadOnly="true" tabindex="3" runat="server"></asp:TextBox>
			</div>
			<div class="row">
                <div class="col-sm-6">
				<div>
					<div class="form-group">
                        <asp:TextBox ID="Contraseña" type="password" name="password" class="form-control input-lg" onkeyup="validacion('Contraseña');" placeholder="Contraseña" tabindex="4" runat="server" MaxLength="30"></asp:TextBox>
                        <span class="help-block"></span>
					</div>
				</div>
                    </div>
                <div class="col-sm-6">
				<div>
					<div class="form-group">
                        <asp:TextBox ID="Confirmacion" type="password" name="password_confirmation" class="form-control input-lg" onkeyup="validacion('Confirmacion');" placeholder="Confirmación contraseña" tabindex="5" runat="server" MaxLength="30"></asp:TextBox>
                        <span class="help-block"></span>
					</div>
				</div>
               </div>
			</div>
			<hr class="colorgraph"/>
			<div class="row" align="center">
				<div class="col-xs-12 col-md-6">
                    <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Guardar" type="button"/><br />
                    <br />
                </div>
			</div>
	</div>
</div>
<!-- Modal -->
</div>
        </div>
     </div> 
                  <div class="popup-overlay" id="popup-overlay1">
<div id="popup" style="display: none;" align="center">
    <div class="content-popup">
         <div class="close"><a href="#" id="close">
             <asp:Image ID="Image2" runat="server" width="30px" height="30px" ImageUrl="Iconos/cancel.svg" /></a></div>
        <h2>Confirmación</h2>
            <hr class="colorgraph"/>
        <div class="row">
				<div class="col-sm-12">
				<div>
					<div class="form-group">
            <asp:TextBox ID="pass" type="password" runat="server" class="form-control input-lg" onkeyup="validacion('pass');" placeholder="Ingrese la contraseña Actual"></asp:TextBox>
            <span class="help-block"></span>
			</div>
                    </div>
                    
            <div class="form-group">
            <div class="col-sm-offset-1 col-sm-6 col-center">
                 <div class="btn-group">
         <asp:Button ID="Acept" runat="server" class="btn btn-success btn-block btn-lg" Text="Aceptar" OnClick="Acept_Click" />
</div>
                </div>
                </div>
        </div>                                     
    </div>
         <br />
            <hr class="colorgraph"/>
      </div>
      </div>  
                      </div> 
        
        <div class="popup-overlay" id="popup-overlay2">
<div id="popup2" style="display: none;" align="center">
    <div class="content-popup">
         <div class="close"><a href="#" id="close2">
             <asp:Image ID="Image3" runat="server" width="30px" height="30px" ImageUrl="Iconos/cancel.svg" /></a></div>
        <h2>Actualizar Foto</h2>
            <hr class="colorgraph"/>
        <div class="row">
				<div class="col-sm-12">
				<div>
					<div class="form-group">
           <asp:Label ID="Label8" class="control-label col-sm-2" runat="server" Text="Foto:"></asp:Label>
           <div class="col-sm-10"> 
        <div class="input-group" id="fotouser">
        <label class="input-group-btn" id="seleccionarfoto" runat="server">
         <span class="btn btn-primary" id="fotop" runat="server">
        <asp:FileUpload ID="FU1" runat="server" />
             </span>
            </label>
             <asp:TextBox ID="picture1" type="text" class="form-control" ReadOnly="true" name="picture" onchange="validacionfoto('picture1');" runat="server"></asp:TextBox>
             <!--<span ></span>-->
             <asp:Label ID="lblMsg" runat="server" class="help-block" Text=""/>
            </div>
    </div>
			</div>
                    </div>
                     &nbsp
                    <div>
                     <div class="form-group">
            <div class="col-sm-offset-1 col-sm-6 col-center">
                 <div class="btn-group">
         <asp:Button ID="btnUpload" runat="server" class="btn btn-success btn-block btn-lg" Text="Subir" OnClick="btnUpload_Click" />
</div>
                </div>
                </div>
                     <asp:Panel ID="panCrop" runat="server" Visible="false" Width="300px">
                    <table class="hola">
                        <tr>
                            <td>
                                <asp:Image ID="imgUpload" CssClass="hola" runat="server" Width="300px"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
            <div class="col-sm-offset-1 col-sm-6 col-center">
                 <div class="btn-group">
         <asp:Button ID="btnCrop" runat="server" class="btn btn-success btn-block btn-lg" Text="Cortar y Guardar" OnClick="btnCrop_Click" />
</div>
                </div>
                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%-- Hidden field for store cror area --%>
                                <asp:HiddenField ID="X" runat="server" />
                                <asp:HiddenField ID="Y" runat="server" />
                                <asp:HiddenField ID="W" runat="server" />
                                <asp:HiddenField ID="H" runat="server" />
                            </td>
                        </tr>
                                                           
                    </table>
                </asp:Panel>
        </div>  
				</div>                                  
    </div>
         <br />
            <hr class="colorgraph"/>
      </div>
      </div>  
                      </div>   
    </form>
    <footer id="footer">
						Fiber&copy; Producto: HEXI
			</footer>
    <link href="css/Jcrop.css" rel="stylesheet" />
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/Jcrop.js"></script>
    <script language="javascript">
                $(document).ready(function () {
                    $('#<%=imgUpload.ClientID%>').Jcrop({
                        onSelect: SelectCropArea,
                        aspectRatio: 1,
                        setSelect: [200, 200, 200, 200],
                        boxWidth: 300,
                        boxHeight: 300,
                        CanSelect: true,
                        canDrag:true,
                    });
                });
                function SelectCropArea(c) {
                    $('#<%=X.ClientID%>').val(parseInt(c.x));
                    $('#<%=Y.ClientID%>').val(parseInt(c.y));
                    $('#<%=W.ClientID%>').val(parseInt(c.w));
                    $('#<%=H.ClientID%>').val(parseInt(c.h));
                }
            </script>
    <script type="text/javascript">
        var v = true;
        $("span.help-block").hide();
        $('#Button1').click(verificar);
        function verificar(){

            var v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0, v6 = 0, v7 = 0, v8 = 0, v9 = 0;
            v1 = validacion('Contraseña');
            v2 = validacion('Confirmacion');
            if (v1 === false || v2 === false) {
                 $("#exito").hide();
                 $("#error").show();
                 return false;
            }else{
                //$("#error").hide();
                //$("#exito").show();
                $('#popup').fadeIn('slow');
                $('#popup-overlay1').fadeIn('slow');
                return false;
            }
        }
        function validacion(campo){
            var a=0;        
            if (campo === 'Contraseña') {
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
                        $('#' + campo).parent().children('span').text("Debe de contener mínimo 8 caracteres, almenos una mayúscula, una minúscula y un número").show();
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
                                $('#' + campo).parent().children('span').text("Debe de contener al menos una mayúscula, una minúscula y un número.").show();
                                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-thumbs-down form-control-feedback'></span>");

                                return false;
                            }
                        }
                    }
                }
            }
            if (campo === 'Confirmacion') {
                confirmpassword = document.getElementById(campo).value;
                passw = document.getElementById("Contraseña").value;
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
                        $('#' + campo).parent().children('span').hide();
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

            if (campo === 'pass') {
                mipassword = document.getElementById(campo).value;
                realpassw = '<%= Session["passw"] %>';
                if (mipassword == null || mipassword.length == 0 || /^\s+$/.test(mipassword)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la contraseña actual").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");

                    return false;

                }
                else {
                    if (mipassword == realpassw) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').text("Contraseña correcta").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                        return true;
                    }
                    else {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Contraseña incorrecta").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");

                        return false;
                    }
                }

            }
        }
    </script>
     <script type="text/javascript">
         $(document).ready(function () {
   $('#FU1').attr('style', 'display:none;');
   $('#FU1').attr('accept', 'image/*;');
   $('#fotop').append('Seleccionar');
    $('#Acept').click(verifipassactual);
    $('#close').click(function(){
		$('#popup').fadeOut('slow');
		$('#popup-overlay1').fadeOut('slow');
		return false;
    });
    function verifipassactual() {

        var v3 = 0;
        v3 = validacion('pass');
        if (v3 === false) {
            return false;
        } else {
            //$("#error").hide();
            //$("#exito").show();
            $('#popup').fadeOut('slow');
            $('#popup-overlay1').fadeOut('slow');
            return true;
        }
    }
});
</script>
    <script>
        $('#btnUpload').click(verificarfoto);
function verificarfoto(){

            var v1 = 0;
            v1 = validacionfoto('picture1');
            if (v1 === false ) {              
                 return false;
            }else{
                //$("#error").hide();
                //$("#exito").show();
                return true;
            }
        }
        function validacionfoto(campo){
            var a = 0;
            var escribir = document.getElementById('lblMsg');
            if (campo === 'picture1') {
                var file = document.getElementById('picture1').value;
                if (file == null || file == '') {
                    $('#fotouser').parent().parent().attr("class", "form-group has-error has-feedback");
                    escribir.innerHTML = " ";
                    escribir.innerHTML = "Seleccione una foto";
                    // $('#fotouser').parent().children('span').text("Seleccione una foto").show();
            return false;
        }else{
        //DEFINE UN ARRAY CON LAS EXTENSIONES DE ARCHIVOS VALIDAS
        var extArray = new Array(".jpg", ".jpeg", ".bmp", ".png", ".gif");
        //SE EXTRAE LA EXTENSION DEL ARCHIVO CON EL PUNTO INCLUIDP 
        var ext = file.slice(file.indexOf(".")).toLowerCase();
 
        //SE RECORRE EL ARRAY PARA VERIFICAR SI LA EXTENSSION DEL ARCHIVO ESTA DEFINIDA 
        //EN EL ARRAY QUE CONTIENE LAS EXTENSIONES VALIDAS
        for (var i = 0; i < extArray.length; i++) {
            if (extArray[i] == ext) {
              //  alert("El archivo SI es una imagen.");
                a=1;
            }
        }
        if (a == 1) {
                return true;

            }else{
                $('#fotouser').parent().parent().attr("class", "form-group has-error has-feedback");
               // $('#' + campo).parent().children('span').text("Esto no es una imagen").show();
                escribir.innerHTML = '';
                escribir.innerHTML = 'Seleccione una foto';
        return false;
            }
        }
            }
        }
      </script>
     <script type="text/javascript">
$(document).ready(function(){
  $('#Button2').click(function(){
      photo();
        return false;
    });
    
    $('#close2').click(function(){
        $('#popup2').fadeOut('slow');
        $('#popup-overlay2').fadeOut('slow');
        return false;
    });

    function photo() {
        $('#popup2').fadeIn('slow');
        $('#popup-overlay2').fadeIn('slow');
    }
});

$(function () {

    //We can attach the `fileselect` event to all file inputs on the page
    $(document).on('change', ':file', function () {
        var input = $(this),
            numFiles = input.get(0).files ? input.get(0).files.length : 1,
            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
    });

    // We can watch for our custom `fileselect` event like this
    $(document).ready(function () {
        $(':file').on('fileselect', function (event, numFiles, label) {

            var input = $(this).parents('.input-group').find(':text'),
                log = numFiles > 1 ? numFiles + ' files selected' : label;

            if (input.length) {
                input.val(log);
            } else {
                if (log) alert(log);
            }

        });
    });

});
</script>

    <script src="jvscript/js1/skel.min.js"></script>
	<script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/bootstrap.js"></script>
</body>
</html>
