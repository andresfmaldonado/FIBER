<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreguntasFrecuentes.aspx.cs" Inherits="HEXI_ASP.NET.PreguntasFrecuentes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Fiber|Preguntas Frecuentes</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/styles2.css" rel="stylesheet"/>
</head>
<body>
    <div id="page-wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<a href="PAsistencia.aspx"><h1><img class="atras" src="Iconos/Material%20Iconse5c41024.png"/></h1></a>
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
    <form class="form-horizontal"  id="form1" runat="server">
    <div class="col-md-6 col-md-offset-3">    
               <p class="nota"><strong>Nota:</strong> 
Haga clic en el texto de los encabezados para obtener mayor información.</p>
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">1.  QUÉ ES FIBER?</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <p>Es una gran idea que dinamizará el campo textil de tejido plano. El software FIBER esta diseñado para apoyar el área de diseño textil, dandole un enfoque interactivo y de fácil uso,permitiendo visualizar los diseños en 3D; además ofrece una administración eficaz de su bodega o almacen por medio de un sistema de inventarios,el cual se aprende a manejar en un muy corto lapso de tiempo.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">2. DE DÓNDE NACE EL NOMBRE "FIBER"?</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>Se da dicho nombre a la aplicación web ya que ésta será un desarrollo a la medida para el área de tejido plano, en donde el unsimo principal es e hilo, concepto al cual se le traduce en la lengua inglesa como FIBER.</p>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">3. CUÁNDO NACIÓ FIBER?</a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body">
                    <p>Esta idea nacío en abril/15/2016, en compañia de la instructora Durley Lópes Alzate, perteneciente al área de las TIC'S. Desde dicho momento la idea empezó a ser desarrollada por apredices del SENA, con base a todas las etapas necesarias en el ciclo de vida de un software como miras al exito.</p>
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
    <script src="jvscript/js1/skel.min.js"></script>
	<script src="jvscript/js1/jquery.min.js"></script>
	<script src="jvscript/js1/jquery.scrollex.min.js"></script>
	<script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/bootstrap.js"></script>
</body>
</html>
