<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PprincipalInventariosAdmin.aspx.cs" Inherits="HEXI_ASP.NET.PproncipalInventariosAdmin" %>

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
    <title>Fiber|Inventarios</title>
</head>
<body>
    <div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<a href="FiberInicioAdmin.aspx"><h1><img class="atras" src="Iconos/Material%20Iconse5c41024.png"/></h1></a>
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
    <img class = "img" src = "Iconos/Fiber.png"/>
</div>
      </div>
     <section class="main">
			  <ul class="ch-grid">
                  <li id="productos" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-11"></div>
								<div class="ch-info-back">
                                    <a href="IFormularioProductos.aspx"><h3>Productos</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
					</li>
                  <li id="consumos" runat="server">
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front ch-img-12"></div>
								<div class="ch-info-back">
                                    <a href="PConsumo.aspx"><h3>Consumos</h3>
									<p>Fiber</p>
                                        </a>
								</div>	
							</div>
						</div>
					</li>
                   <li id="pedidos" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-13"></div>
								<div class="ch-info-back">
                                    <a href="PPedidos.aspx"><h3>Pedidos</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
                  </li>
                </ul>
            </section>
           <section class="main">
			  <ul class="ch-grid">
                  <li id="hilos" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-14"></div>
								<div class="ch-info-back">
                                    <a href="IFormularioHilos.aspx"><h3>Hilos</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
					</li>
                  <li id="scanner" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-15"></div>
								<div class="ch-info-back">
                                    <a href="QR.aspx"><h3>Scanner</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
					</li>
                  	<li id="inventario" runat="server">
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front ch-img-16"></div>
								<div class="ch-info-back">
                                    <a href="IFormularioInventario.aspx"><h3>Inventario</h3>
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
    <script>$('[data-toggle="tooltip"]').tooltip(); </script>
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
