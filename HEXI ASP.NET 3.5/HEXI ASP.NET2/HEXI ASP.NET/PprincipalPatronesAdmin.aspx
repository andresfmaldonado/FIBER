<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PprincipalPatronesAdmin.aspx.cs" Inherits="HEXI_ASP.NET.PprincipalPatronesAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
    <title>Fiber|Patrones</title>
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

				<li id="historial" runat="server">
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front ch-img-3"></div>
								<div class="ch-info-back">
                                    <a href="#"><h3>Historial</h3>
									<p>Fiber</p>
                                        </a>
								</div>	
							</div>
						</div>
					</li>
                  <li id="cohorte" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-4"></div>
								<div class="ch-info-back">
                                    <a href="PFormularioCohorte.aspx"><h3>Cohorte</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
					</li>
                  <li id="programa" runat="server">
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front ch-img-5"></div>
								<div class="ch-info-back">
                                    <a href="PFormularioPrograma.aspx"><h3>Programa</h3>
									<p>Fiber</p>
                                        </a>
								</div>	
							</div>
						</div>
					</li>
                    <li id="destrezas" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-6"></div>
								<div class="ch-info-back">
                                    <a href="PFormularioDestrezas.aspx"><h3>Destrezas</h3>
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

				<li id="resultados" runat="server">
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front ch-img-7"></div>
								<div class="ch-info-back">
                                    <a href="PFormularioResultados.aspx"><h3>Resultados</h3>
									<p>Fiber</p>
                                        </a>
								</div>	
							</div>
						</div>
					</li>
                  <li id="diseños" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-8"></div>
								<div class="ch-info-back">
                                    <a href="#"><h3>Diseños</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
					</li>
                  <li id="visualizar" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-9"></div>
								<div class="ch-info-back">
                                    <a href="#"><h3>Visualizar</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
					</li>
                    <li id="calificar" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-10"></div>
								<div class="ch-info-back">
                                    <a href="#"><h3>Calificar</h3>
									<p>Fiber</p>
                                        </a>
								</div>
							</div>
						</div>
					</li>          
                </ul>
            </section>

      <footer id="footer">

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
