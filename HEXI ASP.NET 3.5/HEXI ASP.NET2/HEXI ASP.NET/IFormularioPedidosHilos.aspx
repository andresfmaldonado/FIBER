<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioPedidosHilos.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioPedidosHilos" %>

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
            swal("¡Registro Exitoso!", "", "success");
        }
        function problema() {
            swal('Oops...', '¡Ocurrió un error inesperado!', 'info');
        }
        function modificacion() {
            swal('¡Actualización exitosa!', '', 'success');
        }
        function yaexiste() {
            swal('Oops...', '¡Este pedido ya existe!', 'error');
        }
        function campos() {
            swal('Oops...', 'No completó los campos de forma correcta o le hizo falta alguno(s)', 'warning');
        }
        function noregistrado() {
            swal('Oops...', 'Este pedido no se encuentra registrado', 'warning');
        }
    </script>
    <title>Fiber|Pedidos Hilos</title>
</head>
<body>
    <div id="page-wrapper">
        <!--Header-->
        <header id="header" class="alt">
            <a href="PPedidos.aspx">
                <h1>
                    <img class="atras" src="Iconos/Material%20Iconse5c41024.png" />
                </h1>
            </a>
            <nav>
                <a href="#menu"></a>
            </nav>
        </header>

        <!--Menu-->
        <nav id="menu">
            <div class="inner">
                <h2>Menú</h2>
                <ul class="links">
                    <li>
                        <a href="PerfilAdmin.aspx">
                            Perfil
                        </a>
                    </li>
                    <li id="usuarios" runat="server">
                        <a href="PFormularioUsuarios.aspx">
                            Usuarios
                        </a>
                    </li>
                    <li>
                        <a href="PAsistencia.aspx">
                            Ayuda
                        </a>
                    </li>
                    <li>
                        <a href="default.aspx">
                            Finalizar sesión
                        </a>
                    </li>
                </ul>
                <a href="#" class="close"></a>
            </div>
        </nav>
    </div>

    <div class="container">
        <div class="jumbotron">
            <img class="img" src="Iconos/Fiber.png" />
        </div>
    </div>
    <form id="form1" runat="server" class="form-horizontal">
        <div class="container show-top-margin separate-rows tall-rows">
            <div class="row show-grid">
                <div class="col-md-11">
                    <div id="GVPedidosHilos">
                        <asp:GridView ID="GVPedidos_H" AutoGenerateColumns="true" CssClass="table table-striped table-bordered dt-responsive nowrap" CellSpacing="0" Width="100%" DataKeyNames="id_hilo" runat="server" OnRowDeleted="GVPedidos_H_RowDeleted">
                            <Columns>
                                <asp:TemplateField HeaderText="REFERENCIA">
                                    <ItemTemplate>
                                        <asp:Label ID="REFERENCIA_HILO" runat="server" Text="Bind('referencia_hilo')"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TIPO">
                                    <ItemTemplate>
                                        <asp:Label ID="TIPO_HILO" runat="server" Text="Bind('referencia_hilo')"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TITULO">
                                    <ItemTemplate>
                                        <asp:Label ID="TITULO_HILO" runat="server" Text="Bind('referencia_hilo')"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="COLOR">
                                    <ItemTemplate>
                                        <asp:Label ID="COLOR_HILO" runat="server" Text="Bind('referencia_hilo')"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PESO">
                                    <ItemTemplate>
                                        <asp:Label ID="PESO_HILO" runat="server" Text="Bind('referencia_hilo')"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Button" ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger" >
                                    <ControlStyle CssClass="btn btn-danger" />
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
            <!--Icons-->
            <!--Menu-->

            <span id="footer">
                Fiber&copy; Producto:<a href="#">HEXI</a>
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
            $('#GVPedidos_H').dataTable();
        })
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
