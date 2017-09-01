<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FiberInicioAdmin.aspx.cs" Inherits="HEXI_ASP.NET.FiberInicioAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="shortcut icon" href="Imagenes/icono_pagina_fiber.png" type="image/png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta name="title" content="Fiber" />
<meta name="description" content="Software web a medida Fiber" />
<link href="css/bootstrap.css" rel="stylesheet"/>
<link href="css/styles2.css" rel="stylesheet"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Pragma" content="no-cache"/>
<!--    <script type="text/javascript">
if(history.forward(1))
location.replace(history.forward(1))
</script>-->
    <script>
        window.onload = function () {
            if (typeof history.pushState === "function") {
                history.pushState("jibberish", null, null);
                window.onpopstate = function () {
                    history.pushState('newjibberish', null, null);
                    // Handle the back (or forward) buttons here
                    // Will NOT handle refresh, use onbeforeunload for this.
                };
            }
            else {
                var ignoreHashChange = true;
                window.onhashchange = function () {
                    if (!ignoreHashChange) {
                        ignoreHashChange = true;
                        window.location.hash = Math.random();
                        // Detect and redirect change here
                        // Works in older FF and IE9
                        // * it does mess with your hash symbol (anchor?) pound sign
                        // delimiter on the end of the URL
                    }
                    else {
                        ignoreHashChange = false;
                    }
                };
            }
        };

    </script>
    <title>Fiber|Inicio</title>
</head>
<body>
    <canvas id="bg" ></canvas>
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

				<li id="inventario" runat="server">
						<div class="ch-item">				
							<div class="ch-info">
								<div class="ch-info-front ch-img-1"></div>
								<div class="ch-info-back">
                                    <a href="PprincipalInventariosAdmin.aspx"><h3>Inventario</h3>
									<p>Fiber</p>
                                        </a>
								</div>	
							</div>
						</div>
					</li>
                  <li id="patrones" runat="server">
						<div class="ch-item">
							<div class="ch-info">
								<div class="ch-info-front ch-img-2"></div>
								<div class="ch-info-back">
                                    <a href="PDesignPatrones.aspx"><h3>Patrones</h3>
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

						Fiber&copy; Producto: HEXI


			</footer>
    <script src="jvscript/js1/skel.min.js"></script>
	<script src="jvscript/js1/jquery.min.js"></script>
	<script src="jvscript/js1/jquery.scrollex.min.js"></script>
    <script src="jvscript/js1/util.js"></script>
    <script src="jvscript/js1/main.js"></script>
    <script src="jvscript/jquery-3.1.0.js"></script>
    <script src="jvscript/bootstrap.js"></script>
    <script src="jvscript/animacion.js"></script>
    
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
   <!-- <script>var foo = {foo: true}; // state object
        history.pushState(foo, "unused argument", "#newInitialUri");

        var bar = {bar: true}
        history.pushState(bar, "unused argument", "#newStateOfWebApp");
        window.onpopstate = function(event){
 
            var baz = {baz: true}
            history.pushState(baz, "unused argument", "#baseState");
        };</script>-->
</body>
</html>
