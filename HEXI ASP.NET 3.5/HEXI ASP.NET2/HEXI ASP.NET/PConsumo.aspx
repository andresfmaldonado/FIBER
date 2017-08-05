<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PConsumo.aspx.cs" Inherits="HEXI_ASP.NET.PConsumo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
    <title>Fiber|Consumos</title>
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
    <img class = "img" src = "Iconos/Fiber.png"/>
</div>
      </div>
      <section class="main">
			  <ul class="ch-grid">

				<li>
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front ch-img-17"></div>
								<div class="ch-info-back">
                                    <a href="IFormularioConsumoProductos.aspx"><h3>Productos</h3>
									<p>Fiber</p>
                                        </a>
								</div>	
							</div>
						</div>
					</li>
                  <li>
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-18"></div>
								<div class="ch-info-back">
                                    <a href="IFormularioConsumoHilos.aspx"><h3>Hilos</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
					</li>
                </ul>
            </section>
  
      <footer id="footer">

				<!-- Icons -->
				<!-- Menu -->

						Fiber&copy; Producto: <a href="#">HEXI</a>


			</footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="jvscript/js1/skel.min.js"></script>
	<script src="jvscript/js1/jquery.min.js"></script>
	<script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
