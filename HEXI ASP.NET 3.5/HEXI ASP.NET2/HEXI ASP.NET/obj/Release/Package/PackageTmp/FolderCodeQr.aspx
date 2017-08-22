<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FolderCodeQr.aspx.cs" Inherits="HEXI_ASP.NET.FolderCodeQr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Pragma" content="no-cache" />
    <title>Fiber|Folder QR</title>
</head>
<body>
    <canvas id="bg"></canvas>
    <div id="page-wrapper">

        <!-- Header -->
        <header id="header" class="alt">
            <h1><a href="#"></a></h1>
            <nav>
                <a href="#menu"></a>
            </nav>
        </header>

        <!-- Menu -->
        <nav id="menu">
            <div class="inner">
                <h2>Menú</h2>
                <ul class="links">
                    <li><a href="FiberInicioAdmin.aspx">Inicio</a></li>
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
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <div class="col-md-12">
                <div class="col-md-offset-7">
                    <div class="col-md-10">
                        <asp:TextBox type="text" class="form-control" placeholder="Filtrar por referencia" ID="filtrador" onkeyup="filtrando();" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>
            </div>
            <div class="col-md-12" id="folder">
                <asp:Repeater ID="RepeaterImages" runat="server">
                    <ItemTemplate>
                        <div class="col-md-2" id='<%# Container.DataItem%>'>
                            <div class="thumbnail">
                                <a href="#" class="thumbnail">
                                    <asp:Image ID="Image" runat="server" ImageUrl='<%# string.Format("~/QR/{0}",(Container.DataItem)) %>' />
                                </a>
                                <asp:Label ID="Label" runat="server" Text='<%# Container.DataItem%>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <footer id="footer">
						Fiber&copy; Producto: HEXI
	</footer>
    <script src="jvscript/js1/skel.min.js"></script>
    <script src="jvscript/js1/jquery.min.js"></script>
    <script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script type="text/javascript">
        function filtrando() {
            var textoFiltro = $('#filtrador').val();
            if (textoFiltro == '') {
                $('div .col-md-2').css("display", "block");

            }
            else {
                $('div .col-md-2').each(function (index) {
                    if (this.id.indexOf(textoFiltro) != -1) {
                        $(this).css("display", "block");
                    } else {
                        $(this).css("display", "none");
                    }
                });
            }
        }
    </script>
    <script src="jvscript/bootstrap.js"></script>
</body>
</html>
