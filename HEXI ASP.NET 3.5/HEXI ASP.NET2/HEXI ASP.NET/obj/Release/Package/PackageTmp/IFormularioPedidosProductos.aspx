<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioPedidosProductos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioPedidos" %>

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
                swal("Registro Exitoso!", "", "success");
            }
           function problema() {
               swal('Oops...', 'Ocurrió un error inesperado!', 'info');
           }
           function modificacion(){
               swal("Actualización Exitosa!","", "success");
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
    <title>Fiber|Pedidos Productos</title>
</head>
<body>
    <div id="page-wrapper">

        <!-- Header -->
        <header id="header" class="alt">
            <a href="PPedidos.aspx">
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
        <div class="container show-top-margin separate-rows tall-rows">
            <div class="row show-grid">
                <div class="col-md-11">  
                    <div style="display:none;"  id="GdvPedidosProductos">
                        <asp:GridView ID="GVPedidos_P" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%" DataKeyNames="id_pedido" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="ID_PEDIDO" runat="server" Text='<% # Bind("id_pedido") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FECHA">
                                    <ItemTemplate>
                                        <asp:Label ID="FECHA_PEDIDO" runat="server" Text='<% # Bind("fecha_pedido") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI_USUARIO">
                                    <ItemTemplate>
                                        <asp:Label ID="DNI_USUARIO" runat="server" Text='<% # Bind("dni_usuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="REFERENCIA_PRODUCTO">
                                    <ItemTemplate>
                                        <asp:Label ID="REF_PRODUCTO" runat="server" Text='<% # Bind("referencia_producto_necesario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CANTIDAD_PRODUCTO">
                                    <ItemTemplate>
                                        <asp:Label ID="CANTIDAD_PRODUCTO" runat="server" Text='<% # Bind("cantidad_producto") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                
                                <asp:CommandField ButtonType="Button" ShowEditButton="true" ControlStyle-CssClass="btn btn-info" >
                                    <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                </asp:CommandField>
                            </Columns>
                       </asp:GridView>
                    </div>
                </div>    
                <div class="col-md-1">
                    <div class="col-sm-offset-2 col-sm-1 col-center">
                        <div class="btn-group">
                            <asp:Button ID="btn_Agregar" type="button" CssClass="btn btn-default" runat="server" Text="Agregar" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-1 col-center">
                            <div class="btn-group">
                                <asp:Button ID="btn_Guardar" type="button" CssClass="btn btn-default" runat="server" Text="Guardar" />
                            </div>
                        </div> 
                        <div class="col-sm-offset-2 col-sm-1 col-center">
                            <div class="btn-group">
                                <asp:Button ID="btn_Imprimir" type="button" CssClass="btn btn-default" runat="server" Text="Imprimir" />
                            </div>
                        </div> 
                        <div class="col-sm-offset-2 col-sm-1 col-center">
                            <div class="btn-group">
                                <asp:Button ID="btn_Enviar" type="button" CssClass="btn btn-default" runat="server" Text="Enviar" />
                            </div>
                        </div> 
                        <div class="col-sm-offset-2 col-sm-1 col-center">
                            <div class="btn-group">
                                <asp:Button ID="btn_Cancelar" type="button" CssClass="btn btn-default" runat="server" Text="Cancelar" />
                            </div>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField runat="server" ID="_repostcheckcode" />
    </form>

    <!--Footer-->
    <div class="form-group">
        <div class="col-sm-12">
            <!-- Icons -->
            <!-- Menu -->

            <span id="footer">
                Fiber&copy; Producto: <a href="#">HEXI</a>
            </span>
        </div>
    </div>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/bootstrap.min.js"></script>
    <!--<script src="jvscript/jquery.dataTables.min.js"></script>-->
    <script src="jvscript/dataTables.bootstrap.min.js"></script>
    <script src="jvscript/dataTables.responsive.min.js"></script>
    <script src="jvscript/responsive.bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#GVPedidos_P').dataTable();
        });
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
