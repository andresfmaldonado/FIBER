<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="HEXI_ASP.NET.History" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles2.css" rel="stylesheet" />
    <title>Fiber|Historial</title>
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
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-street-view" aria-hidden="true"></i> Historial</h3>
                        </div>
                        <asp:BulletedList ID="BulletedList1" runat="server" class="list-group  text-center"></asp:BulletedList>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <footer id="footer">
						Fiber&copy; Producto: HEXI
	</footer>
</body>
</html>
