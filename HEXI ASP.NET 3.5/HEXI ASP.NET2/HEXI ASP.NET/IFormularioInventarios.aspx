<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioInventarios.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioInventarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/inform2.css" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="js/jquery-3.1.0.js"></script>
    <script src="js/sweetalert2.js"></script>
    <script>
        function problema() {
            swal('Oops...', 'Ocurrió un error inesperado!', 'info');
        }

        function yaexiste() {
            swal('Oops...', 'Ya existe un inventario con esta referencia!', 'error');
        }

        function campos() {
            swal('Oops...', 'No completó los campos de forma correcta o te hizo falta alguno(s)!', 'warning');
        }

        function registro() {
            swal('Registro éxitoso', '', 'success');
        }
    </script>
    <title>Fiber|Inventario</title>
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
                        <form id="form1" runat="server">
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
    <div class="col-md-4 col-md-offset-1">
        <div class="form-group">
            <asp:Label ID="Label11" class="control-label col-sm-3" runat="server" Text="Referencia:"></asp:Label>
    <div class="col-sm-9">
        <asp:TextBox ID="referencia" type="text" class="form-control" placeholder="Referencia inventario" name="referencia" onkeyup="validacion('referencia');" runat="server" MaxLength="10"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
        </div>
<div class="col-md-4 col-md-offset-1">
        <div class="form-group">
            <asp:Label ID="Label4" class="control-label  col-sm-3" runat="server" Text="Observación:"></asp:Label>
    <div class="col-sm-9"> 
        <asp:TextBox ID="observaciones" type="text" class="form-control" placeholder="Detalles del inventario" name="observaciones" onkeyup="validacion('observaciones');" runat="server" MaxLength="50"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
    </div>
    <div class="col-md-6 col-md-offset-3">
             <div class="clearfix"><br/></div>
      <div class="form-group"> 
    <div class="col-sm-offset-5 col-sm-1 col-center">
     <div class="btn-group">
         <asp:Button ID="Button1" type="submit" class="btn btn-default" runat="server" Text="Registrar" OnClick="Button1_Click" />
</div>
      </div>
  </div>
        <div class="clearfix"><br/>  <br /><br /> </div> 
        </div>     
            <div class="container">
        <br />
        <div class="row">       
              <div class="col-sm-6 col-md-6 co-lg-6 informes">
                <div class="panel panel-default">
                    <!--panel-heading -->
                    <div class="panel-heading">
                        <i class="fa fa-cubes fa-fw"></i><span class="label label-primary" id="date"> Productos</span>
                        <div class="pull-right">
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                        <div class="table-responsive text-center" id="contentinform">
                            <asp:GridView ID="GridView1" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" runat="server">
                               <Columns>
                                   <asp:TemplateField HeaderText="ID">
                                       <ItemTemplate>
                                           <asp:Label ID="codigop" runat="server" Text='<% # Bind("id_producto")%>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Referencia">
                                       <ItemTemplate>
                                           <asp:Label ID="referenciap" runat="server" Text='<% # Bind("referencia_producto")%>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Nombre">
                                       <ItemTemplate>
                                           <asp:Label ID="nombrep" runat="server" Text='<% # Bind("nombre_producto")%>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Cantidad">
                                       <ItemTemplate>
                                           <asp:TextBox ID="cantidadp" runat="server" Text='<% # Bind("cantidad_producto")%>'  class="form-control" style="height:100%;"></asp:TextBox>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Novedad">
                                       <ItemTemplate>
                                           <asp:TextBox ID="novedadp" runat="server" Text='<% # Bind("novedad_producto")%>'  class="form-control" style="height:100%;"></asp:TextBox>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                            </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-md-6 co-lg-6 informes">
                <div class="panel panel-default">
                    <!--panel-heading -->
                    <div class="panel-heading">
                        <i class="fa fa-cubes fa-fw"></i><span class="label label-primary"> Hilos</span>
                        <div class="pull-right">
                        </div>
                    </div>
                    <!-- panel-body -->
                    <div class="panel-body">
                        <div class="table-responsive text-center">
                            <asp:GridView ID="GridView2" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" runat="server">
                               <Columns>
                                   <asp:TemplateField HeaderText="ID">
                                       <ItemTemplate>
                                           <asp:Label ID="codigoh" runat="server" Text='<% # Bind("id_hilo")%>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Referencia">
                                       <ItemTemplate>
                                           <asp:Label ID="referenciah" runat="server" Text='<% # Bind("referencia_hilo")%>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Tipo">
                                       <ItemTemplate>
                                           <asp:Label ID="tipoh" runat="server" Text='<% # Bind("tipo_hilo")%>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Titulo">
                                       <ItemTemplate>
                                           <asp:Label ID="tituloh" runat="server" Text='<% # Bind("titulo_hilo")%>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Color">
                                       <ItemTemplate>
                                           <asp:Label ID="colorh" runat="server" Text='<% # Bind("color_hilo")%>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Metros">
                                       <ItemTemplate>
                                           <asp:TextBox ID="metrosh" runat="server" Text='<% # Bind("metros_hilo")%>'  class="form-control"  style="min-height:100%;"></asp:TextBox>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                            </asp:GridView>
                            </div>
                        </div>
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
    <script src="js/js1/skel.min.js"></script>
    <script src="js/js1/jquery.scrollex.min.js"></script>
    <script src="js/js1/util.js"></script>
    <script src="js/js1/main.js"></script>
    <!--<script src="js/jquery-3.1.0.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.js"></script>
     <script type="text/javascript">
        var v = true;
        $("span.help-block").hide();
        $('#Button1').click(verificar);

        function verificar() {
            var v1 = 0, v2 = 0;
            v1 = validacion('referencia');
            v2 = validacion('observaciones');
         
            if (v1 === false || v2 === false) {
                $("#exito").hide();
                $("#error").show();
                return false;
            } else {
                return true;
            }
        }

        function validacion(campo) {
            var a = 0;
            if (campo === 'referencia') {
                ref = document.getElementById(campo).value;
                if (ref == null || ref.length == 0 || /^\s+$/.test(ref)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la referencia del inventario.").show();
                   // $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ 0123456789\s]+$/.test(ref) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabéticos y numéricos").show();
                       // $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        return false;
                    } else {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').hide();
                       // $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                        return true;
                    }

                }
            }
            
            if (campo === 'observaciones') {
                mar = document.getElementById(campo).value;
                if (mar == null || mar.length == 0 || /^\s+$/.test(mar)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese las observaciones del inventario.").show();
                   // $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ \s]+$/.test(mar) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten caracteres alfabéticos").show();
                      //  $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        return false;
                    } else {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                        $('#' + campo).parent().children('span').hide();
                       // $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                        return true;
                    }
                }
            }
           

        }
        


    </script>
</body>
</html>
