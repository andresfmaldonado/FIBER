<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="HEXI_ASP.NET.SitioWebBootstrap4.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="title" content="HEXI" />
    <meta name="description" content="HEXI developers diseño de sitios web, desarrollo de software y asesoría tecnológica. En busca de superar sus expectativas . Servicio excepcional . Fiber " />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="SitioWeb/css/bootstrap.css"/>
    <!--Carga de fuentes de Font Awesome-->
    <link rel="stylesheet" href="SitioWeb/css/font-awesome.min.css"/>
    <!--Logo-->
    <link rel="stylesheet" href="SitioWeb/css/Logo.css"/>
    <!-- animation -->
    <link rel="stylesheet" href="SitioWeb/css/animate.css"/>
    <!--Alerta-->
    <link rel="stylesheet" href="SitioWeb/css/noty.css"/>
    <!--Carga de estilos personalizados-->
    <link rel="stylesheet" href="SitioWeb/css/estilos.css"/>
    <!--Window Icon Logo-->
    <link rel="shortcut icon" href="Imagenes/icono_pagina_hexi.png" type="image/png" />
    <title>HEXI</title>
</head>
<body data-spy="scroll" data-target="#head">
      <section class="bienvenidos" id="inicio">
        <div class="container">
            <header class="encabezado">
                <nav class="navbar navbar-toggleable-md navbar-light fixed-top navbar-fixed-top" id="head">
                    <button class="navbar-toggler navbar-toggler-right page-scroll" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
                        aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="fa fa-bars" aria-hidden="true"></span>
  </button>
                    <a class="navbar-brand" href="#"><span class="icon-Recurso-1h"></span> HEXI</a>

                    <div class="collapse navbar-collapse top-nav-collapse" id="navbarTogglerDemo02">
                        <ul class="navbar-nav ml-auto mt-2 mt-md-0">
                            <li class="nav-item ">
                                <a class="nav-link" href="#inicio">Inicio <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link " href="#quienes">Nosotros</a>
                            </li>
                            <li class="nav-item page-scroll">
                                <a class="nav-link page-scroll" href="#servic">Servicios</a>
                            </li>
                            <li class="nav-item page-scroll">
                                <a class="nav-link page-scroll" href="#productos">Proyectos</a>
                            </li>
                            <li class="nav-item page-scroll">
                                <a class="nav-link" data-toggle="modal" data-target="#contacto">Contacto</a>
                            </li>
                            <li class="nav-item page-scroll">
                                <a class="nav-link" data-toggle="modal" data-target="#login">Fiber | Iniciar sesión</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <div class="texto-bienvenido text-center display-4">
                <p><span class="icon-Recurso-1h"></span></p>
                <h3 class="h1">UN MUNDO SIN LÍMITES</h3>
                <a data-toggle="modal" data-target="#contacto" class="btn btn-primary btn-lg"><i class="fa fa-paper-plane" aria-hidden="true"></i> Ponte en contacto</a>
                <p><a href="#quienes"><img src="SitioWeb/images/circle.png" class="mt-5 animated infinite bounce"/></a></p>
            </div>
        </div>
    </section>
    <section class="quienes-somos py-5" id="quienes">
        <div class="container text-center">
            <img src="SitioWeb/images/nosotros.svg" alt="Responsive image" class="rounded" />
            <h2 class="h2">¿Quiénes somos?</h2>
            <p> Somos una compañía comprometida con las necesidades de nuestros clientes, siempre en busca de superar sus expectativas 
                y prestar un servicio excepcional. Nuestro equipo de trabajo lo compone personas con alto grado de humildad, responsabilidad y compromiso. Asumimos cada proyecto como un reto, enfocando su desarrollo a lograr la satisfacción total, aportando para ello dedicación, profesionalidad y soluciones con excelencia tecnológica.
            </p>
            <a href="#servic"><img src="SitioWeb/images/circle.png" class="mt-5 animated infinite bounce img"/></a>
        </div>
    </section>
    <section class="servicios py-5" id="servic">
        <div class="container text-center mt-2">
            <h2 class="h2 mb-5">Nuestros servicios</h2>
            <div class="row">
                <div class="col-md-4 col-lg-4">
                    <img src="SitioWeb/images/desarrollosf.svg" alt="Responsive image" class=" rounded mb-4 img" />
                    <h3 class="mb-3">Desarrollo de software</h3>
                    <p class="mb-4">Nos enfocamos en desarrollar soluciones únicas y adaptadas a las necesidades de nuestros clientes aplicando 
                        los procedimientos y controles de nuestro sistema de gestión de la calidad. Buscamos utilidad y eficacia a la hora de 
                        garantizar perfectos resultados.</p>
                </div>
                <div class="col-md-4 col col-lg-4">
                    <img src="SitioWeb/images/diseñoweb.svg" alt="Responsive image" class=" rounded mb-4 img" />
                    <h3 class="mb-3">Desarrollo web</h3>
                    <p class="mb-4">Enfocamos el desarrollo de soluciones web en las necesidades de la empresa y orientamos el diseño hacia el 
                        usuario que lo va a usar para dar la mejor experiencia, poder optimizar procesos y ofrecer nuevos servicios a través de 
                        internet de manera segura.</p>
                </div>
                <div class="col-md-4 col-lg-4">
                    <img src="SitioWeb/images/asesoría.svg" alt="Responsive image" class=" rounded mb-4 img" />
                    <h3 class="mb-3">Asesoría tecnológica</h3>
                    <p class="mb-4">Tenemos como objetivo principal suministrar a las empresas y otras organizaciones toda la información necesaria
                         para la toma de decisiones en el proceso de creación y/o evolución de la misma.  Promovemos una cultura de innovación  tecnológica 
                         empresarial.</p>
                </div>
            </div>
            <a href="#productos"><img src="SitioWeb/images/circleblack.png" class="mt-5 animated infinite bounce down"/></a>
        </div>
    </section>
    <section class="ultimos-proyectos py-5" id="productos">
        <div class="container-fluid text-center mt-3">
            <h2 class="h2 mb-5">Últimos proyectos</h2>
            <div class="row mt-4">
                <div class="col-md-6 col-lg-6 mb-5">
                    <div class="card">
                        <img class="card-img-top img-fluid" src="SitioWeb/images/patrones.jpg" alt="Card image cap"/>
                        <div class="card-block">
                            <h4 class="card-title">Fiber Patrones</h4>
                            <p class="card-text">
                                FIBER ofrece una simulación de modo similar a la tela lograda en el telar, que la convierte en
                                la herramienta perfecta para demostrar la creatividad de sus diseñadores. Las simulaciones son
                                de una gran calidad y realismo. Facilita el diseño de una tela de una manera gráfica.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="card">
                        <img class="card-img-top img-fluid" src="SitioWeb/images/inventario.png" alt="Card image cap"/>
                        <div class="card-block">
                            <h4 class="card-title">Fiber Inventarios</h4>
                            <p class="card-text">
                                Logre un control perfecto de las materias primas y productos manejados en su organización, 
                                llegando a manejar “justo a tiempo” estos costosos recursos. FIBER posee varias herramientas para
                                que los procesos que sustentan el suministro y el almacenamiento sea más óptmio.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer class="footer py-5" id="piep">
       <div class="container">
           <div class="row">
           <div class="col-md-6 col-lg-6 text-left">
               <ul>
                   <li><h4>Mapa de navegación</h4></li>
                   <li><a href="#inicio"><i class="fa fa-angle-right" aria-hidden="true"></i> Inicio</a></li>
                   <li><a href="#quienes"><i class="fa fa-angle-right" aria-hidden="true"></i> Nosotros</a></li>
                   <li><a href="#servic"><i class="fa fa-angle-right" aria-hidden="true"></i> Servicios</a></li>
                   <li><a href="#productos"><i class="fa fa-angle-right" aria-hidden="true"></i> Proyectos</a></li>
                   <li><a data-toggle="modal" data-target="#contacto"><i class="fa fa-angle-right" aria-hidden="true"></i> Contacto</a></li>
                   <li><a data-toggle="modal" data-target="#login"><i class="fa fa-angle-right" aria-hidden="true"></i> Fiber | Iniciar sesión</a></li>
                   <li><a data-toggle="modal" data-target="#recucontrase"><i class="fa fa-angle-right" aria-hidden="true"></i> Fiber | Recuperar contraseña</a></li>
               </ul>
           </div>
           <div class="col-md-6 col-lg-6 text-left">
               <ul>
                   <li><h4>Información de contacto</h4></li>
                   <li><i class="fa fa-map-marker" aria-hidden="true"></i> Calle 54 # 45-76 </li>
                   <li><i class="fa fa-phone" aria-hidden="true"></i> 000-00-00 - 3146584176</li>
                   <li><a href="mailto:hexi@outlook.es"><i class="fa fa-envelope" aria-hidden="true"></i> Correo: hexi@outlook.es</a></li>
                   <li><a href="#" target="black"><i class="fa fa-facebook-square" aria-hidden="true"></i> Facebook</a></li>
                   <li><a href="#" target="black"><i class="fa fa-instagram" aria-hidden="true"></i> Instagram</a></li>
                   <li><a href="#" target="black"><i class="fa fa-twitter-square" aria-hidden="true"></i> Twitter</a></li>
               </ul>
            </div>
            <div class="col-sm-12">
           <p class="mt-4">HEXI&copy; 2017 | Todos los derechos reservados</p>
            </div>
       </div>
       </div>
    </footer>
    <!-- Modal Contacto-->
    <div class="modal fade" id="contacto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Contáctenos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="name" class="form-control-label">Nombre:</label>
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
             <div class="input-group-addon btn btn-primary"><i class="fa fa-id-card-o" aria-hidden="true"></i></div>
            <input type="text" class="form-control" id="name" onkeyup="validacion('name');" placeholder="Ingrese su nombre"/>
          </div>
          <div class="form-control-feedback"></div>
          </div>
          <div class="form-group">
            <label for="email" class="form-control-label">Correo:</label>
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
             <div class="input-group-addon btn btn-primary"><i class="fa fa-envelope-o" aria-hidden="true"></i></div>
            <input type="email" class="form-control" id="email" onkeyup="validacion('email');" placeholder="Ingrese su correo"/>
          </div>
          <div class="form-control-feedback"></div>
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label">Mensaje:</label>
            <div class="input-group mb-2 mr-sm-2 mb-sm-0">
             <div class="input-group-addon btn btn-primary"><i class="fa fa-comment-o" aria-hidden="true"></i></div>
            <textarea class="form-control" id="message" onkeyup="validacion('message');" placeholder="Ingrese un mensaje corto"></textarea>
          </div>
          <div class="form-control-feedback"></div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="vcontact();" id="contact"><i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar</button>
      </div>
    </div>
  </div>
</div>
<!--Modal Login-->
    <!-- Modal-->
    <div class="modal fade " id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fiber | Iniciar sesión</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form1" runat="server">
          <div class="form-group">
              <label for="correo" class="form-control-label">Correo:</label>
              <div class="input-group mb-2 mr-sm-2 mb-sm-0">
             <div class="input-group-addon btn btn-primary"><i class="fa fa-at" aria-hidden="true"></i></div>
            <input type="email" class="form-control" id="correo" onkeyup="validacion('correo');" placeholder="Ingrese su correo"/>
              </div>
              <div class="form-control-feedback"></div>
          </div>
          <div class="form-group">
              <label for="password" class="form-control-label">Contraseña:</label>
              <div class="input-group mb-2 mr-sm-2 mb-sm-0">
             <div class="input-group-addon btn btn-primary"><i class="fa fa-key" aria-hidden="true"></i></div>
            <input type="password" class="form-control" id="password" onkeyup="validacion('password');" placeholder="Ingrese su contraseña"/>
          </div>
          <div class="form-control-feedback"></div>
          </div>
          <div class="form-group">
            <label for="rol" class="form-control-label">Rol:</label>
              <div class="input-group mb-2 mr-sm-2 mb-sm-0">
             <div class="input-group-addon btn btn-primary"><i class="fa fa-id-badge" aria-hidden="true"></i></div>
              <asp:DropDownList ID="roles" runat="server" class="form-control" onchange="validacion('roles');"></asp:DropDownList>
          </div>
          <div class="form-control-feedback"></div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <a class="form-control-static float-left mr-auto"  id="forgetpassword" ><span>¿Olvidó la contraseña?</span></a>
        <button type="button" class="btn btn-primary" onclick="verificar();" id="luser"><i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar</button>
      </div>
    </div>
  </div>
</div>
<!--Modal Recuperar Contraseña-->
<div class="modal fade bd-example-modal-sm" tabindex="-2" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="recucontrase" data-backdrop="static">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
       <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fiber | Recuperar Contraseña</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
              <label for="correo" class="form-control-label">Correo:</label>
              <div class="input-group mb-2 mr-sm-2 mb-sm-0">
             <div class="input-group-addon btn btn-primary"><i class="fa fa-at" aria-hidden="true"></i></div>
            <input type="email" class="form-control" id="correou" onkeyup="validacion('correou');" placeholder="Ingrese su correo"/>
              </div>
              <div class="form-control-feedback"></div>
          </div>
           </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="vrecup();" id="recupa"><i class="fa fa-refresh" aria-hidden="true"></i> Restablecer</button>
      </div>
    </div>
  </div>
</div>
    <!-- jQuery first, then Bootstrap JS. -->
    <script src="SitioWeb/js/jquery-3.2.1.js"></script>
    <script src="SitioWeb/js/bootstrap.js"></script>
    <script src="SitioWeb/js/mo.min.js"></script>
    <script src="SitioWeb/js/noty.js"></script>
    <!--<script src="SitioWeb/js/scrolling-nav.js"></script>
    <script src="SitioWeb/js/jquery.easing.min.js"></script>-->
    <!--<script src="SitioWeb/js/vsaencode.js"></script>-->
    <script>
        $(document).ready(function () {

            $('#navbarTogglerDemo02 a').click(function () {
                $('#head').find('button[aria-expanded]').attr('aria-expanded', false);
                $('#head').find('button[aria-expanded]').addClass('collapsed')
                $('#head').find('div[aria-expanded]').attr('aria-expanded', false);
                $('#head').find('div[aria-expanded]').removeClass('show');
            });

            $('#navbarTogglerDemo02 a').click(function () {
                desmarcar($(this).parent());
            });

            function desmarcar(etiqueta) {
                $('.navbar li').each(function (index) {
                    $(this).find('a').removeClass("position");
                });
                $(etiqueta).find('a').addClass('position');
            }
      if ((navigator.userAgent.indexOf("MSIE") != -1) || (!!document.documentMode == true)) {
          $('#login').find('a').removeClass('mr-auto');
      }

        });
        
        /*var _0x73fc = ["\x63\x6F\x72\x72\x65\x6F", "\x70\x61\x73\x73\x77\x6F\x72\x64", "\x72\x6F\x6C\x65\x73", "\x6E\x61\x6D\x65", "\x65\x6D\x61\x69\x6C", "\x6D\x65\x73\x73\x61\x67\x65", "\x63\x6F\x72\x72\x65\x6F\x75", "\x6F\x6E\x63\x6C\x69\x63\x6B", "", "\x61\x74\x74\x72", "\x23\x6C\x75\x73\x65\x72", "\x76\x61\x6C", "\x23\x63\x6F\x72\x72\x65\x6F", "\x23\x70\x61\x73\x73\x77\x6F\x72\x64", "\x74\x65\x78\x74", "\x6F\x70\x74\x69\x6F\x6E\x3A\x73\x65\x6C\x65\x63\x74\x65\x64", "\x66\x69\x6E\x64", "\x23\x72\x6F\x6C\x65\x73", "\x3C\x69\x20\x63\x6C\x61\x73\x73\x3D\x22\x66\x61\x20\x66\x61\x2D\x73\x70\x69\x6E\x6E\x65\x72\x22\x20\x61\x72\x69\x61\x2D\x68\x69\x64\x64\x65\x6E\x3D\x22\x74\x72\x75\x65\x22\x3E\x3C\x2F\x69\x3E\x20\x50\x72\x6F\x63\x65\x73\x61\x6E\x64\x6F\x2E\x2E\x2E", "\x61\x70\x70\x65\x6E\x64", "\x65\x6D\x70\x74\x79", "\x50\x4F\x53\x54", "\x6A\x73\x6F\x6E", "\x53\x65\x72\x76\x69\x63\x65\x4C\x65\x63\x74\x6F\x72\x51\x52\x2E\x73\x76\x63\x2F\x69\x64\x65\x6E\x75", "\x73\x74\x72\x69\x6E\x67\x69\x66\x79", "\x61\x70\x70\x6C\x69\x63\x61\x74\x69\x6F\x6E\x2F\x6A\x73\x6F\x6E\x3B\x20\x63\x68\x61\x72\x73\x65\x74\x3D\x75\x74\x66\x2D\x38", "\x69\x64\x65\x6E\x75\x52\x65\x73\x75\x6C\x74", "\x31", "\x46\x69\x62\x65\x72\x49\x6E\x69\x63\x69\x6F\x41\x64\x6D\x69\x6E\x2E\x61\x73\x70\x78\x3F\x6D\x6F\x64\x65\x3D\x61\x6A\x61\x78", "\x70\x6F\x73\x74", "\x73\x65\x6C\x65\x63\x74\x65\x64\x49\x6E\x64\x65\x78", "\x3C\x69\x20\x63\x6C\x61\x73\x73\x3D\x22\x66\x61\x20\x66\x61\x2D\x73\x69\x67\x6E\x2D\x69\x6E\x22\x20\x61\x72\x69\x61\x2D\x68\x69\x64\x64\x65\x6E\x3D\x22\x74\x72\x75\x65\x22\x3E\x3C\x2F\x69\x3E\x20\x49\x6E\x67\x72\x65\x73\x61\x72", "\x76\x65\x72\x69\x66\x69\x63\x61\x72\x28\x29\x3B", "\x68\x72\x65\x66", "\x6C\x6F\x63\x61\x74\x69\x6F\x6E", "\x46\x69\x62\x65\x72\x49\x6E\x69\x63\x69\x6F\x41\x64\x6D\x69\x6E\x2E\x61\x73\x70\x78", "\x32", "\x3C\x62\x3E\x52\x65\x73\x75\x6C\x74\x61\x64\x6F\x3A\x3C\x2F\x62\x3E\x3C\x62\x72\x2F\x3E\x55\x73\x75\x61\x72\x69\x6F\x20\x64\x65\x73\x68\x61\x62\x69\x6C\x69\x74\x61\x64\x6F\x21", "\x77\x61\x72\x6E\x69\x6E\x67", "\x33", "\x3C\x62\x3E\x52\x65\x73\x75\x6C\x74\x61\x64\x6F\x3A\x3C\x2F\x62\x3E\x3C\x62\x72\x2F\x3E\x43\x6F\x6E\x74\x72\x61\x73\x65\xF1\x61\x20\x69\x63\x6F\x72\x72\x65\x63\x74\x61\x21", "\x69\x6E\x66\x6F", "\x31\x30", "\x3C\x62\x3E\x52\x65\x73\x75\x6C\x74\x61\x64\x6F\x3A\x3C\x2F\x62\x3E\x3C\x62\x72\x2F\x3E\x52\x6F\x6C\x20\x69\x6E\x63\x6F\x72\x72\x65\x63\x74\x6F\x21", "\x30", "\x3C\x62\x3E\x52\x65\x73\x75\x6C\x74\x61\x64\x6F\x3A\x3C\x2F\x62\x3E\x3C\x62\x72\x2F\x3E\x45\x73\x74\x65\x20\x75\x73\x75\x61\x72\x69\x6F\x20\x6E\x6F\x20\x65\x78\x69\x73\x74\x65\x21", "\x65\x72\x72\x6F\x72", "\x3C\x62\x3E\x52\x65\x73\x75\x6C\x74\x61\x64\x6F\x3A\x3C\x2F\x62\x3E\x3C\x62\x72\x2F\x3E\x4F\x6F\x70\x73\x2C\x20\x6F\x63\x75\x72\x72\x69\xF3\x20\x75\x6E\x20\x65\x72\x72\x6F\x72\x20\x69\x6E\x65\x73\x70\x65\x72\x61\x64\x6F\x21", "\x3C\x69\x20\x63\x6C\x61\x73\x73\x3D\x22\x66\x61\x20\x66\x61\x2D\x70\x61\x70\x65\x72\x2D\x70\x6C\x61\x6E\x65\x22\x20\x61\x72\x69\x61\x2D\x68\x69\x64\x64\x65\x6E\x3D\x22\x74\x72\x75\x65\x22\x3E\x3C\x2F\x69\x3E\x20\x45\x6E\x76\x69\x61\x72", "\x72\x65\x73\x70\x6F\x6E\x73\x65\x54\x65\x78\x74", "\x6C\x6F\x67", "\x61\x6A\x61\x78", "\x23\x63\x6F\x6E\x74\x61\x63\x74", "\x23\x6E\x61\x6D\x65", "\x23\x65\x6D\x61\x69\x6C", "\x23\x6D\x65\x73\x73\x61\x67\x65", "\x53\x65\x72\x76\x69\x63\x65\x4C\x65\x63\x74\x6F\x72\x51\x52\x2E\x73\x76\x63\x2F\x63\x6F\x6E\x74\x61\x63\x74\x6F", "\x63\x6F\x6E\x74\x61\x63\x74\x6F\x52\x65\x73\x75\x6C\x74", "\x74\x72\x75\x65", "\x3C\x69\x20\x63\x6C\x61\x73\x73\x3D\x22\x66\x61\x20\x66\x61\x2D\x70\x61\x70\x65\x72\x2D\x70\x6C\x61\x6E\x65\x2D\x6F\x22\x20\x61\x72\x69\x61\x2D\x68\x69\x64\x64\x65\x6E\x3D\x22\x74\x72\x75\x65\x22\x3E\x3C\x2F\x69\x3E\x20\x45\x6E\x76\x69\x61\x72", "\x76\x63\x6F\x6E\x74\x61\x63\x74\x28\x29\x3B", "\x3C\x62\x3E\x52\x65\x73\x75\x6C\x74\x61\x64\x6F\x3A\x3C\x2F\x62\x3E\x3C\x62\x72\x2F\x3E\x4D\x65\x6E\x73\x61\x6A\x65\x20\x65\x6E\x76\x69\x61\x64\x6F\x21", "\x73\x75\x63\x63\x65\x73\x73", "\x66\x61\x6C\x73\x65", "\x23\x72\x65\x63\x75\x70\x61", "\x23\x63\x6F\x72\x72\x65\x6F\x75", "\x53\x65\x72\x76\x69\x63\x65\x4C\x65\x63\x74\x6F\x72\x51\x52\x2E\x73\x76\x63\x2F\x72\x65\x63\x75\x70", "\x72\x65\x63\x75\x70\x52\x65\x73\x75\x6C\x74", "\x63\x6F\x72\x72\x65\x63\x74\x6F", "\x3C\x69\x20\x63\x6C\x61\x73\x73\x3D\x22\x66\x61\x20\x66\x61\x2D\x72\x65\x66\x72\x65\x73\x68\x22\x20\x61\x72\x69\x61\x2D\x68\x69\x64\x64\x65\x6E\x3D\x22\x74\x72\x75\x65\x22\x3E\x3C\x2F\x69\x3E\x20\x52\x65\x73\x74\x61\x62\x6C\x65\x63\x65\x72", "\x76\x72\x65\x63\x75\x70\x28\x29\x3B", "\x3C\x62\x3E\x52\x65\x73\x75\x6C\x74\x61\x64\x6F\x3A\x3C\x2F\x62\x3E\x3C\x62\x72\x2F\x3E\x4C\x61\x20\x6E\x75\x65\x76\x61\x20\x63\x6F\x6E\x74\x72\x61\x73\x65\xF1\x61\x20\x65\x73\x74\xE1\x20\x76\x69\x61\x6A\x61\x6E\x64\x6F\x20\x61\x20\x73\x75\x20\x63\x6F\x72\x72\x65\x6F\x21", "\x6E\x6F\x65\x78\x69\x73\x74\x65", "\x76\x61\x6C\x75\x65", "\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64", "\x6C\x65\x6E\x67\x74\x68", "\x74\x65\x73\x74", "\x68\x61\x73\x2D\x64\x61\x6E\x67\x65\x72\x20\x68\x61\x73\x2D\x73\x75\x63\x63\x65\x73\x73", "\x72\x65\x6D\x6F\x76\x65\x43\x6C\x61\x73\x73", "\x70\x61\x72\x65\x6E\x74", "\x23", "\x66\x6F\x72\x6D\x2D\x63\x6F\x6E\x74\x72\x6F\x6C\x2D\x64\x61\x6E\x67\x65\x72\x20\x66\x6F\x72\x6D\x2D\x63\x6F\x6E\x74\x72\x6F\x6C\x2D\x73\x75\x63\x63\x65\x73\x73", "\x66\x6F\x72\x6D\x2D\x63\x6F\x6E\x74\x72\x6F\x6C\x2D\x64\x61\x6E\x67\x65\x72", "\x61\x64\x64\x43\x6C\x61\x73\x73", "\x68\x61\x73\x2D\x64\x61\x6E\x67\x65\x72", "\x73\x68\x6F\x77", "\x49\x6E\x67\x72\x65\x73\x65\x20\x73\x75\x20\x6E\x6F\x6D\x62\x72\x65\x20\x63\x6F\x6D\x70\x6C\x65\x74\x6F", "\x64\x69\x76\x2E\x66\x6F\x72\x6D\x2D\x63\x6F\x6E\x74\x72\x6F\x6C\x2D\x66\x65\x65\x64\x62\x61\x63\x6B", "\x53\x6F\x6C\x6F\x20\x73\x65\x20\x61\x64\x6D\x69\x74\x65\x6E\x20\x63\x61\x72\x61\x63\x74\x65\x72\x65\x73\x20\x61\x6C\x66\x61\x62\xE9\x74\x69\x63\x6F\x73", "\x66\x6F\x72\x6D\x2D\x63\x6F\x6E\x74\x72\x6F\x6C\x2D\x73\x75\x63\x63\x65\x73\x73", "\x68\x61\x73\x2D\x73\x75\x63\x63\x65\x73\x73", "\x68\x69\x64\x65", "\x49\x6E\x67\x72\x65\x73\x65\x20\x73\x75\x20\x63\x6F\x72\x72\x65\x6F", "\x49\x6E\x67\x72\x65\x73\x65\x20\x75\x6E\x20\x63\x6F\x72\x72\x65\x6F\x20\x76\xE1\x6C\x69\x64\x6F", "\x49\x6E\x67\x72\x65\x73\x65\x20\x65\x6C\x20\x6D\x65\x6E\x73\x61\x6A\x65", "\x49\x6E\x67\x72\x65\x73\x65\x20\x73\x75\x20\x63\x6F\x6E\x74\x72\x61\x73\x65\xF1\x61", "\x53\x65\x6C\x65\x63\x63\x69\x6F\x6E\x65\x20\x75\x6E\x20\x72\x6F\x6C", "\x6D\x6F\x64\x61\x6C", "\x23\x6C\x6F\x67\x69\x6E", "\x23\x72\x65\x63\x75\x63\x6F\x6E\x74\x72\x61\x73\x65", "\x63\x6C\x69\x63\x6B", "\x23\x66\x6F\x72\x67\x65\x74\x70\x61\x73\x73\x77\x6F\x72\x64", "\x63\x65\x6E\x74\x65\x72", "\x6D\x65\x74\x72\x6F\x75\x69"]; function verificar() { var _0x433ex2 = 0, _0x433ex3 = 0, _0x433ex4 = 0; _0x433ex2 = validacion(_0x73fc[0]); _0x433ex3 = validacion(_0x73fc[1]); _0x433ex4 = validacion(_0x73fc[2]); if (_0x433ex2 === false || _0x433ex3 === false || _0x433ex4 === false) { return false } else { identify(); return true } } function vcontact() { var _0x433ex6 = 0, _0x433ex7 = 0, _0x433ex8 = 0; _0x433ex6 = validacion(_0x73fc[3]); _0x433ex7 = validacion(_0x73fc[4]); _0x433ex8 = validacion(_0x73fc[5]); if (_0x433ex6 === false || _0x433ex7 === false || _0x433ex8 === false) { return false } else { sendmss(); return true } } function vrecup() { var _0x433exa = 0; _0x433exa = validacion(_0x73fc[6]); if (_0x433exa === false) { return false } else { restablec(); return true } } function identify() { var _0x433exc; var _0x433exd; $(_0x73fc[10])[_0x73fc[9]](_0x73fc[7], _0x73fc[8]); var _0x433exe = $(_0x73fc[12])[_0x73fc[11]](); var _0x433exf = $(_0x73fc[13])[_0x73fc[11]](); var _0x433ex10 = $(_0x73fc[17])[_0x73fc[16]](_0x73fc[15])[_0x73fc[14]](); var _0x433ex11 = { "\x63": _0x433exe, "\x70": _0x433exf, "\x72": _0x433ex10 }; $(_0x73fc[10])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[18]); $[_0x73fc[51]]({ type: _0x73fc[21], dataType: _0x73fc[22], url: _0x73fc[23], data: JSON[_0x73fc[24]](_0x433ex11), contentType: _0x73fc[25], processdata: true, success: function (_0x433ex12) { if (_0x433ex12[_0x73fc[26]][0] != null) { if (_0x433ex12[_0x73fc[26]][0] == _0x73fc[27]) { $[_0x73fc[29]](_0x73fc[28], { "\x69\x64\x5F\x75\x73\x75\x61\x72\x69\x6F": _0x433ex12[_0x73fc[26]][1], "\x72\x6F\x6C": _0x433ex10, "\x70\x61\x73\x73\x77": _0x433exf }); $(_0x73fc[12])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[13])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[17])[_0x73fc[30]] = 0; $(_0x73fc[10])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[31]); $(_0x73fc[10])[_0x73fc[9]](_0x73fc[7], _0x73fc[32]); window[_0x73fc[34]][_0x73fc[33]] = _0x73fc[35] }; if (_0x433ex12[_0x73fc[26]][0] == _0x73fc[36]) { $(_0x73fc[12])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[13])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[17])[_0x73fc[30]] = 0; _0x433exc = _0x73fc[37]; _0x433exd = _0x73fc[38]; $(_0x73fc[10])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[31]); $(_0x73fc[10])[_0x73fc[9]](_0x73fc[7], _0x73fc[32]); alerta(_0x433exc, _0x433exd) }; if (_0x433ex12[_0x73fc[26]][0] == _0x73fc[39]) { $(_0x73fc[13])[_0x73fc[11]](_0x73fc[8]); _0x433exc = _0x73fc[40]; _0x433exd = _0x73fc[41]; $(_0x73fc[10])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[31]); $(_0x73fc[10])[_0x73fc[9]](_0x73fc[7], _0x73fc[32]); alerta(_0x433exc, _0x433exd) }; if (_0x433ex12[_0x73fc[26]][0] == _0x73fc[42]) { $(_0x73fc[17])[_0x73fc[30]] = 0; _0x433exc = _0x73fc[43]; _0x433exd = _0x73fc[41]; $(_0x73fc[10])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[31]); $(_0x73fc[10])[_0x73fc[9]](_0x73fc[7], _0x73fc[32]); alerta(_0x433exc, _0x433exd) }; if (_0x433ex12[_0x73fc[26]][0] == _0x73fc[44]) { $(_0x73fc[12])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[13])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[17])[_0x73fc[30]] = 0; _0x433exc = _0x73fc[45]; _0x433exd = _0x73fc[46]; $(_0x73fc[10])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[31]); $(_0x73fc[10])[_0x73fc[9]](_0x73fc[7], _0x73fc[32]); alerta(_0x433exc, _0x433exd) } } else { _0x433exc = _0x73fc[47]; _0x433exd = _0x73fc[46]; $(_0x73fc[10])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[31]); $(_0x73fc[10])[_0x73fc[9]](_0x73fc[7], _0x73fc[32]); alerta(_0x433exc, _0x433exd) } }, error: function (_0x433ex13) { _0x433exc = _0x73fc[47]; _0x433exd = _0x73fc[46]; $(_0x73fc[10])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[48]); $(_0x73fc[10])[_0x73fc[9]](_0x73fc[7], _0x73fc[32]); alerta(_0x433exc, _0x433exd); console[_0x73fc[50]](_0x433ex13[_0x73fc[49]]) } }) } function sendmss() { var _0x433exc; var _0x433exd; $(_0x73fc[52])[_0x73fc[9]](_0x73fc[7], _0x73fc[8]); var _0x433ex15 = $(_0x73fc[53])[_0x73fc[11]](); var _0x433ex16 = $(_0x73fc[54])[_0x73fc[11]](); var _0x433ex17 = $(_0x73fc[55])[_0x73fc[11]](); var _0x433ex18 = { "\x6E\x61\x6D\x65": _0x433ex15, "\x65\x6D\x61\x69\x6C": _0x433ex16, "\x6D\x65\x6E\x73\x61\x6A\x65": _0x433ex17 }; $(_0x73fc[52])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[18]); $[_0x73fc[51]]({ type: _0x73fc[21], dataType: _0x73fc[22], url: _0x73fc[56], data: JSON[_0x73fc[24]](_0x433ex18), contentType: _0x73fc[25], processdata: true, success: function (_0x433ex19) { if (_0x433ex19[_0x73fc[57]] != null) { if (_0x433ex19[_0x73fc[57]] == _0x73fc[58]) { $(_0x73fc[53])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[54])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[55])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[52])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[59]); $(_0x73fc[52])[_0x73fc[9]](_0x73fc[7], _0x73fc[60]); _0x433exc = _0x73fc[61]; _0x433exd = _0x73fc[62]; alerta(_0x433exc, _0x433exd) }; if (_0x433ex19[_0x73fc[57]] == _0x73fc[63]) { $(_0x73fc[52])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[59]); $(_0x73fc[52])[_0x73fc[9]](_0x73fc[7], _0x73fc[60]); _0x433exc = _0x73fc[47]; _0x433exd = _0x73fc[46]; alerta(_0x433exc, _0x433exd) } } else { $(_0x73fc[52])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[59]); $(_0x73fc[52])[_0x73fc[9]](_0x73fc[7], _0x73fc[60]); _0x433exc = _0x73fc[47]; _0x433exd = _0x73fc[46]; alerta(_0x433exc, _0x433exd) } }, error: function (_0x433ex1a) { $(_0x73fc[52])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[59]); $(_0x73fc[52])[_0x73fc[9]](_0x73fc[7], _0x73fc[60]); _0x433exc = _0x73fc[47]; _0x433exd = _0x73fc[46]; alerta(_0x433exc, _0x433exd); console[_0x73fc[50]](_0x433ex1a[_0x73fc[49]]) } }) } function restablec() { var _0x433exc; var _0x433exd; $(_0x73fc[64])[_0x73fc[9]](_0x73fc[7], _0x73fc[8]); var _0x433ex1c = $(_0x73fc[65])[_0x73fc[11]](); var _0x433ex1d = { "\x63\x6F\x72\x72\x65\x6F\x75": _0x433ex1c }; $(_0x73fc[64])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[18]); $[_0x73fc[51]]({ type: _0x73fc[21], dataType: _0x73fc[22], url: _0x73fc[66], data: JSON[_0x73fc[24]](_0x433ex1d), contentType: _0x73fc[25], processdata: true, success: function (_0x433ex1e) { if (_0x433ex1e[_0x73fc[67]] != null) { if (_0x433ex1e[_0x73fc[67]] == _0x73fc[68]) { $(_0x73fc[65])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[64])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[69]); $(_0x73fc[64])[_0x73fc[9]](_0x73fc[7], _0x73fc[70]); _0x433exc = _0x73fc[71]; _0x433exd = _0x73fc[62]; alerta(_0x433exc, _0x433exd) }; if (_0x433ex1e[_0x73fc[67]] == _0x73fc[46]) { $(_0x73fc[64])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[69]); $(_0x73fc[64])[_0x73fc[9]](_0x73fc[7], _0x73fc[70]); _0x433exc = _0x73fc[47]; _0x433exd = _0x73fc[46]; alerta(_0x433exc, _0x433exd) }; if (_0x433ex1e[_0x73fc[67]] == _0x73fc[72]) { $(_0x73fc[65])[_0x73fc[11]](_0x73fc[8]); $(_0x73fc[64])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[69]); $(_0x73fc[64])[_0x73fc[9]](_0x73fc[7], _0x73fc[70]); _0x433exc = _0x73fc[45]; _0x433exd = _0x73fc[38]; alerta(_0x433exc, _0x433exd) } } else { $(_0x73fc[64])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[69]); $(_0x73fc[64])[_0x73fc[9]](_0x73fc[7], _0x73fc[70]); _0x433exc = _0x73fc[47]; _0x433exd = _0x73fc[46]; alerta(_0x433exc, _0x433exd) } }, error: function (_0x433ex1f) { $(_0x73fc[64])[_0x73fc[20]]()[_0x73fc[19]](_0x73fc[69]); $(_0x73fc[64])[_0x73fc[9]](_0x73fc[7], _0x73fc[70]); _0x433exc = _0x73fc[47]; _0x433exd = _0x73fc[46]; alerta(_0x433exc, _0x433exd); console[_0x73fc[50]](_0x433ex1f[_0x73fc[49]]) } }) } function validacion(_0x433ex21) { if (_0x433ex21 === _0x73fc[3]) { name = document[_0x73fc[74]](_0x433ex21)[_0x73fc[73]]; if (name == null || name[_0x73fc[75]] == 0 || /^\s+$/[_0x73fc[76]](name)) { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[82]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[84]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[14]](_0x73fc[86])[_0x73fc[85]](); return false } else { if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ\s]+$/[_0x73fc[76]](name) == false) { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[82]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[84]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[14]](_0x73fc[88])[_0x73fc[85]](); return false } else { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[89]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[90]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[91]](); return true } } }; if (_0x433ex21 === _0x73fc[4] || _0x433ex21 === _0x73fc[0] || _0x433ex21 === _0x73fc[6]) { email = document[_0x73fc[74]](_0x433ex21)[_0x73fc[73]]; if (email == null || email[_0x73fc[75]] == 0 || /^\s+$/[_0x73fc[76]](email)) { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[82]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[84]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[14]](_0x73fc[92])[_0x73fc[85]](); return false } else { if (!(/\S+@\S+\.\S+/[_0x73fc[76]](email))) { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[82]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[84]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[14]](_0x73fc[93])[_0x73fc[85]](); return false } else { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[89]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[90]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[91]](); return true } } }; if (_0x433ex21 === _0x73fc[5]) { mensaje = document[_0x73fc[74]](_0x433ex21)[_0x73fc[73]]; if (mensaje == null || mensaje[_0x73fc[75]] == 0 || /^\s+$/[_0x73fc[76]](mensaje)) { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[82]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[84]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[14]](_0x73fc[94])[_0x73fc[85]](); return false } else { if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ?¿¡!"()-_°,;.\s]+$/[_0x73fc[76]](mensaje) == false) { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[82]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[84]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[14]](_0x73fc[88])[_0x73fc[85]](); return false } else { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[89]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[90]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[91]](); return true } } }; if (_0x433ex21 === _0x73fc[1]) { contrase = document[_0x73fc[74]](_0x433ex21)[_0x73fc[73]]; if (contrase == null || contrase[_0x73fc[75]] == 0) { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[82]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[84]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[14]](_0x73fc[95])[_0x73fc[85]](); return false } else { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[89]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[90]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[91]](); return true } }; if (_0x433ex21 === _0x73fc[2]) { indice = document[_0x73fc[74]](_0x433ex21)[_0x73fc[30]]; if (indice == null || indice == 0) { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[82]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[84]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[14]](_0x73fc[96])[_0x73fc[85]](); return false } else { $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[78]](_0x73fc[77]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[78]](_0x73fc[81]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[83]](_0x73fc[89]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[83]](_0x73fc[90]); $(_0x73fc[80] + _0x433ex21)[_0x73fc[79]]()[_0x73fc[79]]()[_0x73fc[16]](_0x73fc[87])[_0x73fc[91]](); return true } } } $(_0x73fc[101])[_0x73fc[100]](function () { $(_0x73fc[98])[_0x73fc[97]](_0x73fc[91]); $(_0x73fc[99])[_0x73fc[97]](_0x73fc[85]) }); function alerta(_0x433ex23, _0x433ex24) { new Noty({ text: _0x433ex23, type: _0x433ex24, layout: _0x73fc[102], theme: _0x73fc[103], timeout: 5000, progressBar: true })[_0x73fc[85]]() } */
        function verificar() {

            var v1 = 0,
                v2 = 0,
                v3 = 0;
            v1 = validacion('correo');
            v2 = validacion('password');
            v3 = validacion('roles');
            if (v1 === false || v2 === false || v3 === false) {
                return false;
            } else {
                
                identify();
                return true;
            }
        }

        function vcontact() {

            var v4 = 0,
                v5 = 0,
                v6 = 0;
            v4 = validacion('name');
            v5 = validacion('email');
            v6 = validacion('message');
            if (v4 === false || v5 === false || v6 === false) {
                return false;
            } else {
                //ajax envío correo
                sendmss();
                return true;
            }
        }

        function vrecup() {

            var v7 = 0;
            v7 = validacion('correou');
            if (v7 === false) {
                return false;
            } else {
                //ajax envío correo
                restablec();
                return true;
            }
        }

        function identify() {
            var mensj;
            var tp;
            $('#luser').attr('onclick', '');
            var usercorreo = $('#correo').val();
            var userpass = $('#password').val();
            var userrol = $('#roles').find('option:selected').text();
            var dataString = {
                "c": usercorreo,
                "p": userpass,
                "r": userrol
            };
            $('#luser').empty().append('<i class="fa fa-spinner" aria-hidden="true"></i> Procesando...');
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "ServiceLectorQR.svc/idenu",
                data: JSON.stringify(dataString),
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (response) {

                    if (response.idenuResult[0] != null) {

                        if (response.idenuResult[0] == "1") {
                            $.post('FiberInicioAdmin.aspx?mode=ajax',
                            {
                                'id_usuario': response.idenuResult[1],
                                'rol': userrol,
                                'passw': userpass
                            }).done(function() {
                                $('#correo').val('');
                                $('#password').val('');
                                $('#roles').selectedIndex = 0;
                                $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                                $('#luser').attr('onclick', 'verificar();');
                                window.location.href = "FiberInicioAdmin.aspx";
                              })
                              .fail(function() {
                                   mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado! Recarge la página y vuelva a intentarlo';
                                   tp = 'error';
                                   $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                                   $('#luser').attr('onclick', 'verificar();');
                                   alerta(mensj, tp);
                               });
                            
                        }

                        if (response.idenuResult[0] == "2") {
                            $('#correo').val('');
                            $('#password').val('');
                            $('#roles').selectedIndex = 0;
                            mensj = '<b>Resultado:</b><br/>Usuario deshabilitado!';
                            tp = 'warning';
                            $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                            $('#luser').attr('onclick', 'verificar();');
                            alerta(mensj, tp);
                        }

                        if (response.idenuResult[0] == "3") {
                            $('#password').val('');
                            mensj = '<b>Resultado:</b><br/>Contraseña incorrecta!';
                            tp = 'info';
                            $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                            $('#luser').attr('onclick', 'verificar();');
                            alerta(mensj, tp);
                        }

                        if (response.idenuResult[0] == "10") {
                            $('#roles').selectedIndex = 0;
                            mensj = '<b>Resultado:</b><br/>Rol incorrecto!';
                            tp = 'info';
                            $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                            $('#luser').attr('onclick', 'verificar();');
                            alerta(mensj, tp);
                        }

                        if (response.idenuResult[0] == "0") {
                            $('#correo').val('');
                            $('#password').val('');
                            $('#roles').selectedIndex = 0;
                            mensj = '<b>Resultado:</b><br/>Este usuario no existe!';
                            tp = 'error';
                            $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                            $('#luser').attr('onclick', 'verificar();');
                            alerta(mensj, tp);
                        }

                    } else {
                        mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado! Recarge la página y vuelva a intentarlo';
                        tp = 'error';
                        $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                        $('#luser').attr('onclick', 'verificar();');
                        alerta(mensj, tp);
                    }
                },
                error: function (err) {
                    mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado! Recarge la página y vuelva a intentarlo';
                    tp = 'error';
                    $('#luser').empty().append('<i class="fa fa-paper-plane" aria-hidden="true"></i> Enviar');
                    $('#luser').attr('onclick', 'verificar();');
                    alerta(mensj, tp);
                    console.log(err.responseText);
                }
            });
        }

        function sendmss() {
            var mensj;
            var tp;
            $('#contact').attr('onclick', '');
            var clientname = $('#name').val();
            var clientemail = $('#email').val();
            var clientmessage = $('#message').val();
            var dataStringm = {
                "name": clientname,
                "email": clientemail,
                "mensaje": clientmessage
            };
            $('#contact').empty().append('<i class="fa fa-spinner" aria-hidden="true"></i> Procesando...');
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "ServiceLectorQR.svc/contacto",
                data: JSON.stringify(dataStringm),
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (responsec) {

                    if (responsec.contactoResult != null) {

                        if (responsec.contactoResult == "true") {
                            $('#name').val('');
                            $('#email').val('');
                            $('#message').val('');
                            $('#contact').empty().append('<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar');
                            $('#contact').attr('onclick', 'vcontact();');
                            mensj = '<b>Resultado:</b><br/>Mensaje enviado!';
                            tp = 'success';
                            alerta(mensj, tp);
                        }

                        if (responsec.contactoResult == "false") {
                            $('#contact').empty().append('<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar');
                            $('#contact').attr('onclick', 'vcontact();');
                            mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                            tp = 'error';
                            alerta(mensj, tp);
                        }

                    } else {
                        $('#contact').empty().append('<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar');
                        $('#contact').attr('onclick', 'vcontact();');
                        mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                        tp = 'error';
                        alerta(mensj, tp);
                    }
                },
                error: function (erroc) {
                    $('#contact').empty().append('<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar');
                    $('#contact').attr('onclick', 'vcontact();');
                    mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                    tp = 'error';
                    alerta(mensj, tp);
                    console.log(erroc.responseText);
                }
            });
        }


        function restablec() {
            var mensj;
            var tp;
            $('#recupa').attr('onclick', '');
            var correorest = $('#correou').val();
            var dataStringr = {
                "correou": correorest
            };
            $('#recupa').empty().append('<i class="fa fa-spinner" aria-hidden="true"></i> Procesando...');
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "ServiceLectorQR.svc/recup",
                data: JSON.stringify(dataStringr),
                contentType: "application/json; charset=utf-8",
                processdata: true,
                success: function (responser) {
                    if (responser.recupResult != null) {

                        if (responser.recupResult == "correcto") {
                            $('#correou').val('');
                            $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                            $('#recupa').attr('onclick', 'vrecup();');
                            mensj = '<b>Resultado:</b><br/>La nueva contraseña está viajando a su correo!';
                            tp = 'success';
                            alerta(mensj, tp);
                        }

                        if (responser.recupResult == "error") {
                            $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                            $('#recupa').attr('onclick', 'vrecup();');
                            mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                            tp = 'error';
                            alerta(mensj, tp);
                        }

                        if (responser.recupResult == "noexiste") {
                            $('#correou').val('');
                            $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                            $('#recupa').attr('onclick', 'vrecup();');
                            mensj = '<b>Resultado:</b><br/>Este usuario no existe!';
                            tp = 'warning';
                            alerta(mensj, tp);
                        }

                    } else {
                        $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                        $('#recupa').attr('onclick', 'vrecup();');
                        mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                        tp = 'error';
                        alerta(mensj, tp);
                    }
                },
                error: function (error) {
                    $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                    $('#recupa').attr('onclick', 'vrecup();');
                    mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                    tp = 'error';
                    alerta(mensj, tp);
                    console.log(error.responseText);
                }
            });
        }


        function validacion(campo) {
            if (campo === 'name') {
                name = document.getElementById(campo).value;
                if (name == null || name.length == 0 || /^\s+$/.test(name)) {
                    $('#' + campo).parent().parent().removeClass("has-danger has-success");
                    $('#' + campo).removeClass('form-control-danger form-control-success');
                    $('#' + campo).addClass('form-control-danger');
                    $('#' + campo).parent().parent().addClass("has-danger");
                    $('#' + campo).parent().parent().find('div.form-control-feedback').text("Ingrese su nombre completo").show();

                    return false;

                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ\s]+$/.test(name) == false) {
                        $('#' + campo).parent().parent().removeClass("has-danger has-success");
                        $('#' + campo).removeClass('form-control-danger form-control-success');
                        $('#' + campo).addClass('form-control-danger');
                        $('#' + campo).parent().parent().addClass("has-danger");
                        $('#' + campo).parent().parent().find('div.form-control-feedback').text("Solo se admiten caracteres alfabéticos").show();
                        return false;
                    } else {
                        $('#' + campo).parent().parent().removeClass("has-danger has-success");
                        $('#' + campo).removeClass('form-control-danger form-control-success');
                        $('#' + campo).addClass('form-control-success');
                        $('#' + campo).parent().parent().addClass("has-success");
                        $('#' + campo).parent().parent().find('div.form-control-feedback').hide();
                        return true;

                    }
                }
            }

            if (campo === 'email' || campo === 'correo' || campo === 'correou') {
                email = document.getElementById(campo).value;
                if (email == null || email.length == 0 || /^\s+$/.test(email)) {
                    $('#' + campo).parent().parent().removeClass("has-danger has-success");
                    $('#' + campo).removeClass('form-control-danger form-control-success');
                    $('#' + campo).addClass('form-control-danger');
                    $('#' + campo).parent().parent().addClass("has-danger");
                    $('#' + campo).parent().parent().find('div.form-control-feedback').text("Ingrese su correo").show();

                    return false;

                } else {
                    if (!(/\S+@\S+\.\S+/.test(email))) {
                        $('#' + campo).parent().parent().removeClass("has-danger has-success");
                        $('#' + campo).removeClass('form-control-danger form-control-success');
                        $('#' + campo).addClass('form-control-danger');
                        $('#' + campo).parent().parent().addClass("has-danger");
                        $('#' + campo).parent().parent().find('div.form-control-feedback').text("Ingrese un correo válido").show();
                        return false;
                    } else {
                        $('#' + campo).parent().parent().removeClass("has-danger has-success");
                        $('#' + campo).removeClass('form-control-danger form-control-success');
                        $('#' + campo).addClass('form-control-success');
                        $('#' + campo).parent().parent().addClass("has-success");
                        $('#' + campo).parent().parent().find('div.form-control-feedback').hide();

                        return true;
                    }
                }

            }
            if (campo === 'message') {
                mensaje = document.getElementById(campo).value;
                if (mensaje == null || mensaje.length == 0 || /^\s+$/.test(mensaje)) {

                    $('#' + campo).parent().parent().removeClass("has-danger has-success");
                    $('#' + campo).removeClass('form-control-danger form-control-success');
                    $('#' + campo).addClass('form-control-danger');
                    $('#' + campo).parent().parent().addClass("has-danger");
                    $('#' + campo).parent().parent().find('div.form-control-feedback').text("Ingrese el mensaje").show();
                    return false;

                } else {
                    if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ?¿¡!"()-_°,;.\s]+$/.test(mensaje) == false) {

                        $('#' + campo).parent().parent().removeClass("has-danger has-success");
                        $('#' + campo).removeClass('form-control-danger form-control-success');
                        $('#' + campo).addClass('form-control-danger');
                        $('#' + campo).parent().parent().addClass("has-danger");
                        $('#' + campo).parent().parent().find('div.form-control-feedback').text("Solo se admiten caracteres alfabéticos").show();
                        return false;
                    } else {
                        $('#' + campo).parent().parent().removeClass("has-danger has-success");
                        $('#' + campo).removeClass('form-control-danger form-control-success');
                        $('#' + campo).addClass('form-control-success');
                        $('#' + campo).parent().parent().addClass("has-success");
                        $('#' + campo).parent().parent().find('div.form-control-feedback').hide();
                        return true;

                    }
                }
            }
            if (campo === 'password') {
                contrase = document.getElementById(campo).value;
                if (contrase == null || contrase.length == 0) {
                    $('#' + campo).parent().parent().removeClass("has-danger has-success");
                    $('#' + campo).removeClass('form-control-danger form-control-success');
                    $('#' + campo).addClass('form-control-danger');
                    $('#' + campo).parent().parent().addClass("has-danger");
                    $('#' + campo).parent().parent().find('div.form-control-feedback').text("Ingrese su contraseña").show();
                    return false;
                }
                else {
                    $('#' + campo).parent().parent().removeClass("has-danger has-success");
                    $('#' + campo).removeClass('form-control-danger form-control-success');
                    $('#' + campo).addClass('form-control-success');
                    $('#' + campo).parent().parent().addClass("has-success");
                    $('#' + campo).parent().parent().find('div.form-control-feedback').hide();
                    return true;

                }
            }
            if (campo === 'roles') {
                indice = document.getElementById(campo).selectedIndex;
                if (indice == null || indice == 0) {
                    $('#' + campo).parent().parent().removeClass("has-danger has-success");
                    $('#' + campo).removeClass('form-control-danger form-control-success');
                    $('#' + campo).addClass('form-control-danger');
                    $('#' + campo).parent().parent().addClass("has-danger");
                    $('#' + campo).parent().parent().find('div.form-control-feedback').text("Seleccione un rol").show();
                    return false;
                }
                else {
                    $('#' + campo).parent().parent().removeClass("has-danger has-success");
                    $('#' + campo).removeClass('form-control-danger form-control-success');
                    $('#' + campo).addClass('form-control-success');
                    $('#' + campo).parent().parent().addClass("has-success");
                    $('#' + campo).parent().parent().find('div.form-control-feedback').hide();
                    return true;

                }
            }
        }

        $('#forgetpassword').click(function () {
            $('#login').modal('hide');
            $('#recucontrase').modal('show');
        });


        function alerta(textmensj, tpmensj) {
            new Noty({
                text: textmensj,
                type: tpmensj,
                layout: 'center',
                theme: 'metroui',
                timeout: 5000,
                progressBar: true
            }).show();
        }
    </script>
</body>
</html>
