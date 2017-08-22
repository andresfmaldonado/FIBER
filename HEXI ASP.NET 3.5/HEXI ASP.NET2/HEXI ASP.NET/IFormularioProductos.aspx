<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioProductos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioProductos" %>

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
           function registro() {
               swal("Registro éxitoso!", "", "success");
           }
           function problema() {
               swal('Oops...', 'Ocurrió un error inesperado!', 'info');
           }
           function modificacion(){
               swal("Actualización éxitosa!", "", "success");
           }
           function yaexiste() {
               swal('Oops...', 'Este producto ya existe!', 'error');
           }
           function yaexisteref() {
               swal('Oops...', 'Ya existe un producto con esta referencia!', 'error');
           }
           function yaexisteplaca() {
               swal('Oops...', 'Ya existe un producto con esta placa!', 'error');
           }
           function yaexisteserial() {
               swal('Oops...', 'Ya existe un producto con este serial!', 'error');
           }
           function campos() {
               swal('Oops...', 'No completó los campos de forma correcta o te hizo falta alguno(s)!', 'warning');
           }

        function noregistrado() {
            swal('Oops...', 'Esta cohorte no se encuentra registrada!', 'warning');
        }
    </script>
    <title>Fiber|Productos</title>
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
                    <li><a href="FolderCodeQR.aspx">Códigos QR</a></li>
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
        <div class="col-md-4 col-md-offset-1">
            <div class="form-group" style="display:none;">
                <div class="col-sm-9">
                    <asp:TextBox ID="codigo" type="text" class="form-control" ReadOnly="true" placeholder="Código del producto" runat="server"></asp:TextBox>
                    
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label11" class="control-label col-sm-3" runat="server" Text="Referencia:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="referencia" onkeyup="validacion('referencia');" type="text" class="form-control" placeholder="Referencia del producto" runat="server" MaxLength="10"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" class="control-label col-sm-3" runat="server" Text="Nombre:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="nombre" onkeyup="validacion('nombre');" type="text" class="form-control" placeholder="Nombre del producto" runat="server" MaxLength="50"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label12" class="control-label col-sm-3" runat="server" Text="Descripción:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="descripcion" onkeyup="validacion('descripcion');" type="text" class="form-control" placeholder="Descripción del producto" runat="server" MaxLength="50"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label13" class="control-label col-sm-3" runat="server" Text="Novedad:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="novedad" onkeyup="validacion('novedad');" type="text" class="form-control"  placeholder="Novedad del producto" runat="server" MaxLength="30"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" class="control-label  col-sm-3" runat="server" Text="Placa:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="placa" onkeyup="validacion('placa');" type="text" class="form-control" placeholder="Placa del producto" runat="server" MaxLength="10"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" class="control-label col-sm-3" runat="server" Text="Serial:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="serial" onkeyup="validacion('serial');" type="text" class="form-control" placeholder="Serial del producto" runat="server" MaxLength="10"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            </div>
             <div class="col-md-4 col-md-offset-1">
            <div class="form-group">
                <asp:Label ID="Label8" class="control-label col-sm-3" runat="server" Text="Modelo:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="modelo" onkeyup="validacion('modelo');" type="text" class="form-control" placeholder="Modulo del producto" runat="server" MaxLength="20"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label9" class="control-label col-sm-3" runat="server" Text="Marca:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="marca" onkeyup="validacion('marca');" type="text" class="form-control" placeholder="Marca del producto" runat="server" MaxLength="10"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="Label2" class="control-label col-sm-3" runat="server" Text="Cantidad:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="cantidad" onkeyup="validacion('cantidad');" type="text" class="form-control" placeholder="Cantidad del producto" runat="server" MaxLength="11"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" class="control-label col-sm-3" runat="server" Text="Valor unitario:"></asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="valorUnitario" onkeyup="validacion('valorUnitario');" type="text" class="form-control" placeholder="Valor unitario del producto" runat="server" MaxLength="20"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label14" class="control-label col-sm-3" runat="server" Text="Consumible:"></asp:Label>
                <div class="col-sm-9">
                    <asp:DropDownList ID="consumible" onchange="selectConsumible();" CssClass="form-control" runat="server">
                        <asp:ListItem Value="" Selected="False">Producto consumible</asp:ListItem>
                        <asp:ListItem Value="1">Si</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                    <span class="help-block"></span>
                </div>
            </div>
                 </div>
               <div class="col-md-6 col-md-offset-3">
                    <div class="clearfix"><br/></div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="btn_Registrar"  class="btn btn-default" runat="server" Text="Registrar" OnClick="btn_Registrar_Click" />
                    </div>
                </div>
                <div class="col-sm-offset-1 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="btn_Actualizar" type="button" class="btn btn-default" runat="server" Text="Actualizar" OnClick="btn_Actualizar_Click" />
                    </div>
                </div>
                <div class="col-sm-offset-1 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="btn_Cancelar" type="button" class="btn btn-default" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click"/>
                    </div>
                </div>
            </div>
             &nbsp
             <div class="form-group">
            <asp:Label ID="Label3" class="control-label col-sm-2" runat="server" Text="Tabla:"></asp:Label>
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
         <asp:Label ID="Label10"  class="control-label col-sm-2" runat="server" Text="Buscar:" ></asp:Label>
         <div class="col-sm-8">
             <asp:TextBox ID="buscar" type="text" class="form-control" placeholder="Referencia del Producto" onkeyup="validacion('buscar');" runat="server" MaxLength="10"></asp:TextBox>
           <span class="help-block"></span>
         </div>
         <div class=" col-md-2">
             <asp:Button ID="btn_Buscar" OnClick="btn_Buscar_Click" type="button" class="btn btn-default" runat="server" Text="Buscar" />
         </div>
     </div>
        </div>
        <div class="container show-top-margin separate-rows tall-rows">
            <div class="row show-grid">
                <div class="col-md-12">
                    <asp:GridView ID="GVProductos" AutoGenerateColumns="false" CssClass="table table-striped table-bordered dt-responsive nowrap" Cellspacing="0" Width="100%" runat="server" DataKeyNames="id_producto" OnRowEditing="GVProductos_RowEditing">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                      <ItemTemplate>
                          <asp:Label ID="ID_PRODUC" runat="server" Text='<% # Bind("id_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Referencia">
                      <ItemTemplate>
                          <asp:Label ID="REF_PRODUC" runat="server" Text='<% # Bind("referencia_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Nombre" >
                      <ItemTemplate>
                          <asp:Label ID="NOMB_PRODUC" runat="server" Text='<% # Bind("nombre_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Descripción">
                      <ItemTemplate>
                          <asp:Label ID="DESC_PRODUC" runat="server" Text='<% # Bind("descripcion_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Novedad">
                      <ItemTemplate>
                          <asp:Label ID="NOV_PRODUC" runat="server" Text='<% # Bind("novedad_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Placa">
                      <ItemTemplate>
                          <asp:Label ID="PLACA_PRODUC" runat="server" Text='<% # Bind("placa_producto") %>'></asp:Label>
                      </ItemTemplate>
                      </asp:TemplateField>

                  <asp:TemplateField HeaderText="Serial">
                      <ItemTemplate>
                          <asp:Label ID="SERIAL_PRODUC" runat="server" Text='<% # Bind("serial_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Marca">
                      <ItemTemplate>
                          <asp:Label ID="MARCA_PRODUC" runat="server" Text='<% # Bind("marca_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Modelo">
                      <ItemTemplate>
                          <asp:Label ID="MOD_PRODUC" runat="server" Text='<% # Bind("modelo_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>


                  <asp:TemplateField HeaderText="Valor unitario">
                      <ItemTemplate>
                          <asp:Label ID="VAL_PRODUC" runat="server" Text='<% # Bind("valorUnitario_producto") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Consumible">
                      <ItemTemplate>
                          <asp:Label ID="CONSU" runat="server" Text='<% # Bind("consumible") %>'></asp:Label>
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
        <asp:HiddenField runat="server" ID="_repostcheckcode" />
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
            // $("#GVProductos").dataTable();
             //$('#tabla').hide();
         });
     </script>
  <script type="text/javascript">
        var v = true;
        $("#codigo").hide();
        $("span.help-block").hide();
        $("#GVProductos").show();
        $('#btn_Registrar').click(verificar);
        $('#btn_Actualizar').click(verificarmodifi);
        $('#btn_Buscar').click(buscar);
        function verificarmodifi() {
            var c1 = 0,c2=0, c3 = 0, c4 = 0, c5 = 0,
                c6 = 0, c7 = 0, c8 = 0, c9 = 0, c10 = 0;
            c1 = validacion('referencia');
            c3 = validacion('nombre');
            c3 = validacion('descripcion');
            c4 = validacion('novedad');
            c5 = validacion('placa');
            c6 = validacion('serial');
            c7 = validacion('marca');
            c8 = validacion('modelo');
            c9 = validacion('valorUnitario');
            c10 = selectConsumible();
            c2 = validacion('cantidad');
            if (c1 == false || c2 == false || c3 == false || c4 == false || c5 == false || c6 == false || c7 == false || c8 == false || c9 == false || c10 == false) {
                $("#exito").hide();
                $("#error").show();
                return false;

            } else {
                return true;
            }
        }
        function verificar() {
            var v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0, v6 = 0, v7 = 0, v8 = 0, v9 = 0, v10 = 0, v11=0;
            v1 = validacion('referencia');
            v2 = validacion('nombre');
            v3 = validacion('descripcion');
            v4 = validacion('novedad');
            v5 = validacion('placa');
            v6 = validacion('serial');
            v7 = validacion('marca');
            v8 = validacion('modelo');
            v9 = validacion('valorUnitario');
            v10 = selectConsumible();
            v11 = validacion('cantidad');
            if (v1 === false || v2 === false || v3 === false || v4 === false || v5 === false || v6 == false || v7 == false || v8 == false || v9 == false || v10 == false || v11==false) {
                $("#exito").hide();
                $("#error").show();
                return false;
            } else {
                return true;
            }
        }
        function buscar() {
            var e1 = 0;
            e1 = validacion('buscar');
            if (e1 === false) {
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
                    $('#' + campo).parent().children('span').text("Ingrese la referencia del producto.").show();
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
            if (campo === 'nombre') {
                nomb = document.getElementById(campo).value;
                if (nomb == null || nomb.length == 0 || /^\s+$/.test(nomb)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el nombre del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ 0123456789 (),.:/>\- \s]+$/.test(nomb) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabeticos, numéricos y algunos especiales").show();
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
            if (campo === 'descripcion') {
                descr = document.getElementById(campo).value;
                if (descr == null || descr.length == 0 || /^\s+$/.test(descr)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la descripción del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ 0123456789 (),.:/>\- \s]+$/.test(descr) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabeticos, numéricos y algunos especiales").show();
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

            if (campo === 'novedad') {
                nov = document.getElementById(campo).value;
                if (nov == null || nov.length == 0 || /^\s+$/.test(nov)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la novedad del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ 0123456789 (),. \s]+$/.test(nov) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabeticos, numéricos y algunos especiales").show();
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
            if (campo === 'placa') {
                pla = document.getElementById(campo).value;
                if (pla == null || pla.length == 0 || /^\s+$/.test(pla)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la placa del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ 0123456789 (),.:/>\- \s]+$/.test(pla) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se permiten caracteres alfabeticos, numéricos y algunos especiales").show();
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
            if (campo === 'serial') {
                ser = document.getElementById(campo).value;
                if (ser == null || ser.length == 0 || /^\s+$/.test(ser)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el serial del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[0123456789 \-]+$/.test(ser) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten números y guiones").show();
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
            if (campo === 'marca') {
                mar = document.getElementById(campo).value;
                if (mar == null || mar.length == 0 || /^\s+$/.test(mar)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la marca del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ \s]+$/.test(mar) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten caracteres alfabéticos").show();
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
            if (campo === 'modelo') {
                mod = document.getElementById(campo).value;
                if (mod == null || mod.length == 0 || /^\s+$/.test(mod)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el modelo del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ 0123456789 ]+$/.test(mod) == false) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten caracteres alfabéticos y númericos").show();
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
            
            if (campo === 'valorUnitario') {
                val = document.getElementById(campo).value;
                if (val == null || val.length == 0 || /^\s+$/.test(val)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese el valor por unidad del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (isNaN(val)) {
                        $("#glypcn" + campo).remove();
                        $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                        $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                        $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                        return false;
                    }
                    else {

                        if (val == 0) {
                            $("#glypcn" + campo).remove();
                            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                            $('#' + campo).parent().children('span').text("El valor debe ser mayor a cero.").show();
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

            if (campo === 'cantidad') {
                cant = document.getElementById(campo).value;
                if (cant == null || cant.length == 0 || /^\s+$/.test(cant)) {
                    $("#glypcn" + campo).remove();
                    $("#" + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la cantidad del producto.").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;
                } else {
                    if (isNaN(cant)) {
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

            if (campo === 'buscar') {
                buscar = document.getElementById(campo).value;
                if (buscar == null || buscar.length == 0 || /^\s+$/.test(buscar)) {
                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la marca del producto.").show();
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
        function selectConsumible() {

            indice = document.getElementById('consumible').selectedIndex;
            if (indice == null || indice == 0) {
                $('#consumible').parent().parent().attr("class", "form-group has-error");
                $('#consumible').parent().children('span').text("Seleccione una opción").show();
                return false;
            }
            else {
                $('#consumible').parent().parent().attr("class", "form-group has-success");
                $('#consumible').parent().children('span').hide();
                return true;

            }
        }

        function tabla(opciont) {
            selectabla = document.getElementById(opciont).selectedIndex;
            if (selectabla == 1) {
                $('#tabla').show();
                $("#GVProductos").dataTable();
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
