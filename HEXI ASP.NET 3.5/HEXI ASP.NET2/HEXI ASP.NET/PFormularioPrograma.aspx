<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PFormularioPrograma.aspx.cs" Inherits="HEXI_ASP.NET.PFormularioPrograma" %>

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
    <title>Fiber|Programas</title>
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
        <asp:TextBox ID="dni_programa" type="text" class="form-control" placeholder="Número de identificación del programa" onkeyup="validacion('dni_programa');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label3" class="control-label col-sm-2" runat="server" Text="Nombre:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="nombre_programa" type="text" class="form-control" placeholder="Nombre del programa" onkeyup="validacion('nombre_programa');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
       <div class="form-group">
           <asp:Label ID="Label5" class="control-label col-sm-2" runat="server" Text="Horas:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:TextBox ID="cantid_horas" type="text" class="form-control" placeholder="Cantidad de horas del programa" onkeyup="validacion('cantid_horas');" runat="server" MaxLength="11"></asp:TextBox>
        <span class="help-block"></span>
    </div>
  </div>
         <div class="form-group">
            <asp:Label ID="Label4" class="control-label  col-sm-2" runat="server" Text="Destrezas:"></asp:Label>
    <div class="col-sm-10"> 
        <asp:DropDownList ID="competencias" onchange="selecompetencias();" class="form-control col-sm-12 input-sm select2-multiple" multiple="multiple" runat="server"></asp:DropDownList>
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
         <asp:Label ID="Label6" class="control-label col-sm-2" runat="server" Text="Buscar:"></asp:Label>
    <div class="col-sm-8">
        <asp:TextBox ID="busqueda" type="text" class="form-control" placeholder="DNI del programa" onkeyup="validacion('busqueda');" runat="server" MaxLength="30"></asp:TextBox>
        <span class="help-block"></span>
    </div>
            <div class=" col-md-2">
                <asp:Button ID="Button5" type="button" class="btn btn-default" runat="server" Text="Buscar" OnClick="Button5_Click" />
</div>
  </div> 
        <div class="form-group">
         <asp:Label ID="Label7" class="control-label col-sm-2" runat="server" Text="Categoría:"></asp:Label>
    <div class="col-sm-10">
        <asp:DropDownList ID="tipogv" class="form-control col-sm-12" onchange="selecGV();" runat="server">
            <asp:ListItem Value="0">Programas</asp:ListItem>
            <asp:ListItem Value="1">Programas/Competencias</asp:ListItem>
        </asp:DropDownList>
    </div>     
  </div>
        </div>  
        <div class="container show-top-margin separate-rows tall-rows">
  <div class="row show-grid">
      <div class="col-md-12">  
          <div style="display:none;"  id="GdvProgramas">
          <asp:GridView ID="GVProgramas" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%" DataKeyNames="id_programa" runat="server" OnRowEditing="RowEditingEvent">
              <Columns>
                  <asp:TemplateField HeaderText="ID">
                      <ItemTemplate>
                          <asp:Label ID="ID_PROGRAMA" runat="server" Text='<% # Bind("id_programa") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="DNI">
                      <ItemTemplate>
                          <asp:Label ID="DNI_PROGRAMA" runat="server" Text='<% # Bind("dni_programa") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Programa">
                      <ItemTemplate>
                          <asp:Label ID="NOMBRE_PROGRAMA" runat="server" Text='<% # Bind("nombre_programa") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Horas" >
                      <ItemTemplate>
                          <asp:Label ID="CANTIDAD_HORAS" runat="server" Text='<% # Bind("cantid_horas_programa") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:CommandField ButtonType="Button" ShowEditButton="true" ControlStyle-CssClass="btn btn-info" >
<ControlStyle CssClass="btn btn-info"></ControlStyle>

                  </asp:CommandField>
              </Columns>
          </asp:GridView>
               </div>

          <div style="display:none;"  id="GdvInfoProgramas">
          <asp:GridView ID="GVInfoProgramas" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%" DataKeyNames="dni_programa" runat="server">
              <Columns>
                  <asp:TemplateField HeaderText="DNI Programa">
                      <ItemTemplate>
                          <asp:Label ID="DNIPROGRAMA" runat="server" Text='<% # Bind("dni_programa") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Programa">
                      <ItemTemplate>
                          <asp:Label ID="NOM_PROGRAMA" runat="server" Text='<% # Bind("nombre_programa") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="DNI Competencia">
                      <ItemTemplate>
                          <asp:Label ID="DNI_COMPETENCIA" runat="server" Text='<% # Bind("dni_competencia") %>'></asp:Label>
                      </ItemTemplate>

                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Competencia" >
                      <ItemTemplate>
                          <asp:Label ID="NOM_COMPETENCIA" runat="server" Text='<% # Bind("nombre_competencia") %>'></asp:Label>
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
                        <div class="text-center" style="display:none;" id="nada">
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        
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
            $('#GVProgramas').dataTable();
            $('#GVInfoProgramas').dataTable();
        });
    </script>
    <script type="text/javascript" src="jvscript/ValidacionesJS.js">
        
    </script>
 <script src="jvscript/js1/skel.min.js"></script>
	<script src="jvscript/js1/jquery.scrollex.min.js"></script>
	<script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="jvscript/select2.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script>
       $(function () {
           $("#competencias").select2();
       });
		    var placeholder = "Seleccione las competencias del programa";
		    $('#competencias').select2({ placeholder: placeholder });
       function repoFormatResult( repo ) {
           var markup = "<div class='select2-result-repository clearfix'>" +
               "<div class='select2-result-repository__avatar'><img src='" + repo.owner.avatar_url + "' /></div>" +
               "<div class='select2-result-repository__meta'>" +
                   "<div class='select2-result-repository__title'>" + repo.full_name + "</div>";

           if ( repo.description ) {
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

       function repoFormatSelection( repo ) {
           return repo.full_name;
       }
       $('#competencias').on(select2OpenEventName, function () {
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
</body>
</html>
