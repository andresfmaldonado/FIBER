<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IFormularioInventario.aspx.cs" Inherits="HEXI_ASP.NET.IFormularioInventario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <link href="css/select2.css" rel="stylesheet" />
    <link href="css/select2-bootstrap.css" rel="stylesheet" />
    <link href="css/gh-pages.css" rel="stylesheet" />
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="css/sweetalert2.css" rel="stylesheet" />
    <script src="jvscript/sweetalert2.js"></script>
    <script>
        function registro() {
            swal("Registro Exitoso!", "", "success");
        };
    </script>
    <script>
        function problema() {
            swal('Oops...', 'Ocurrió un error inesperado!', 'info');
        }
        function modificacion() {
            swal("Actualización Exitosa!", "", "success");
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
    <title>Fiber|Inventarios</title>
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
                        <div class="alert alert-danger text-center" style="display: none;" id="error">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <strong>Adventencia: </strong>Debe completar todos los campos.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
            <div class="form-group">
                <asp:Label ID="Label1" class="control-label col-sm-2" runat="server" Text="Consulta:"></asp:Label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="DropDownList1" class="form-control col-sm-12" runat="server" OnSelectedIndexChanged="SeleccionInforme" AutoPostBack="true">
                        <asp:ListItem>Seleccione un informe</asp:ListItem>
                        <asp:ListItem>Informe Usuarios</asp:ListItem>
                        <asp:ListItem>Informe Productos</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

           
            <div class="form-group">
                <asp:Label ID="Label5" class="control-label  col-sm-2" runat="server" Text="Fecha :"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="fecha_inic" class="form-control form_datetime" size="16" type="text" value="" ReadOnly="true" onchange="validacion('fecha_inic');" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox5" type="hidden" value="" runat="server"></asp:TextBox>
                    <span class="help-block"></span>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-1 col-center">
                    <div class="btn-group">
                        <asp:Button ID="Button1" type="button" class="btn btn-default" runat="server" Text="Aceptar" />
                    </div>
                </div>
            </div>
        </div>
        <div class="container show-top-margin separate-rows tall-rows">
            <div class="row show-grid">
                <div class="col-md-12">
                    <asp:GridView ID="GVUsuarios" AutoGenerateColumns="false" CssClass="table " GridLines="None" runat="server">
                        <Columns>
                            <asp:BoundField DataField="id_usuario" HeaderText="Código" HeaderStyle-CssClass="th" />
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

            <span id="footer">Fiber&copy; Producto: <a href="#">HEXI</a></span>
        </div>
    </div>
    <script>$('[data-toggle="tooltip"]').tooltip(); </script>
    <script src="jvscript/jquery-3.1.0.js"></script>


    <script src="jvscript/stacktable.min.js" type="text/javascript"></script>

    <script>
        $(document).on('click', '#run', function (e) {
            e.preventDefault();
            $('#simple-example-table').stacktable();
            $(this).replaceWith('<span>ran - resize your window to see the effect</span>');
        });
        $('#responsive-example-table').stacktable({ myClass: 'your-custom-class' });
        $('#cphMainContent_dgvUsers').cardtable();
        $('#agenda-example').stackcolumns();
    </script>
    <script type="text/javascript" src="jvscript/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="jvscript/bootstrap.min.js"></script>
    <script type="text/javascript" src="jvscript/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="jvscript/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>
    <script type="text/javascript">
        $('.form_datetime').datetimepicker({
            format: 'dd/mm/yyyy hh:ii:ss',
            language: 'es',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });
    </script>
    <script src="jvscript/js1/skel.min.js"></script>
    <script src="jvscript/js1/jquery.min.js"></script>
    <script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script src="jvscript/animacion.js"></script>
</body>
</html>
