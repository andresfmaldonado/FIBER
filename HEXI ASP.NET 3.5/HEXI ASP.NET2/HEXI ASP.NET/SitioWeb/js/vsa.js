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
             //ajax envío correo
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
         if (v7 === false ) {
             return false;
         } else {
             //ajax envío correo
            restablec();
           return true;
         }
     }

 function identify(){
             var mensj;
             var tp;
             $('#luser').attr('onclick','');
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
                              
                        if (response.idenuResult[0]=="1") {
                            $.post('FiberInicioAdmin.aspx?mode=ajax', 
                            {'id_usuario':response.idenuResult[1],
                            'rol':userrol,
                            'passw':userpass
                            } );
                             $('#correo').val('');
                             $('#password').val('');
                             $('#roles').selectedIndex=0;
                             $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                             $('#luser').attr('onclick','verificar();');
                             window.location.href = "FiberInicioAdmin.aspx";                          
                        }

                         if (response.idenuResult[0]=="2") {
                             $('#correo').val('');
                             $('#password').val('');
                             $('#roles').selectedIndex=0;
                             mensj = '<b>Resultado:</b><br/>Usuario deshabilitado!';
                             tp = 'warning';
                             $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                             $('#luser').attr('onclick','verificar();');  
                             alerta(mensj,tp);                       
                        }

                        if (response.idenuResult[0]=="3") {
                             $('#password').val('');
                             mensj = '<b>Resultado:</b><br/>Contraseña icorrecta!';
                             tp = 'info';
                             $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                             $('#luser').attr('onclick','verificar();');  
                             alerta(mensj,tp);                       
                        }

                        if (response.idenuResult[0]=="10") {
                             $('#roles').selectedIndex=0;
                             mensj = '<b>Resultado:</b><br/>Rol incorrecto!';
                             tp = 'info';
                             $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                             $('#luser').attr('onclick','verificar();'); 
                             alerta(mensj,tp);                        
                        }

                        if (response.idenuResult[0]=="0") {
                             $('#correo').val('');
                             $('#password').val('');
                             $('#roles').selectedIndex=0;
                             mensj = '<b>Resultado:</b><br/>Este usuario no existe!';
                             tp = 'error';
                             $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                             $('#luser').attr('onclick','verificar();');    
                             alerta(mensj,tp);                     
                        }

                     }else{
                          mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                          tp = 'error';
                          $('#luser').empty().append('<i class="fa fa-sign-in" aria-hidden="true"></i> Ingresar');
                          $('#luser').attr('onclick','verificar();');
                          alerta(mensj,tp);
                     }
                 },
                 error: function (err) {
                          mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                          tp = 'error';
                          $('#luser').empty().append('<i class="fa fa-paper-plane" aria-hidden="true"></i> Enviar');
                          $('#luser').attr('onclick','verificar();');
                          alerta(mensj,tp);
                          console.log(err.responseText);
                 }
             });
 }

 function sendmss(){
             var mensj;
             var tp;
             $('#contact').attr('onclick','');
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
                              
                        if (responsec.contactoResult=="true") {
                             $('#name').val('');
                             $('#email').val('');
                             $('#message').val('');
                             $('#contact').empty().append('<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar');
                             $('#contact').attr('onclick','vcontact();');
                             mensj = '<b>Resultado:</b><br/>Mensaje enviado!';
                             tp = 'success';  
                             alerta(mensj,tp);           
                        }

                         if (responsec.contactoResult=="false") {
                             $('#contact').empty().append('<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar');
                             $('#contact').attr('onclick','vcontact();');
                             mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                             tp = 'error';  
                             alerta(mensj,tp);                       
                        }

                     }else{
                             $('#contact').empty().append('<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar');
                             $('#contact').attr('onclick','vcontact();');
                             mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                             tp = 'error';  
                             alerta(mensj,tp);
                     }
                 },
                 error: function (erroc) {
                           $('#contact').empty().append('<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Enviar');
                           $('#contact').attr('onclick','vcontact();');
                           mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                           tp = 'error';  
                           alerta(mensj,tp);
                           console.log(erroc.responseText);
                 }
             });
 }


 function restablec(){
             var mensj;
             var tp;
             $('#recupa').attr('onclick','');
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
                              
                        if (responser.recupResult=="correcto") {
                             $('#correou').val('');
                             $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                             $('#recupa').attr('onclick','vrecup();');
                             mensj = '<b>Resultado:</b><br/>La nueva contraseña está viajando a su correo!';
                             tp = 'success';  
                             alerta(mensj,tp);           
                        }

                         if (responser.recupResult=="error") {
                             $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                             $('#recupa').attr('onclick','vrecup();');
                             mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                             tp = 'error';  
                             alerta(mensj,tp);                       
                        }

                        if (responser.recupResult=="noexiste") {
                             $('#correou').val('');
                             $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                             $('#recupa').attr('onclick','vrecup();');
                             mensj = '<b>Resultado:</b><br/>Este usuario no existe!';
                             tp = 'warning';  
                             alerta(mensj,tp);                       
                        }

                     }else{
                             $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                             $('#recupa').attr('onclick','vrecup();');
                             mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                             tp = 'error';  
                             alerta(mensj,tp);    
                     }
                 },
                 error: function (error) {
                           $('#recupa').empty().append('<i class="fa fa-refresh" aria-hidden="true"></i> Restablecer');
                           $('#recupa').attr('onclick','vrecup();');
                           mensj = '<b>Resultado:</b><br/>Oops, ocurrió un error inesperado!';
                           tp = 'error';  
                           alerta(mensj,tp);  
                           console.log(error.responseText);
                 }
             });
 }

 
 function alerta(textmensj,tpmensj){
          new Noty({
                 text: textmensj,
                 type: tpmensj,
                 layout: 'center',
                 theme: 'metroui',
                 timeout: 5000,
                 progressBar: true,
                 animation: {
                     open: function (promise) {
                         var n = this;
                         var Timeline = new mojs.Timeline();
                         var body = new mojs.Html({
                             el: n.barDom,
                             x: {
                                 500: 0,
                                 delay: 0,
                                 duration: 500,
                                 easing: 'elastic.out'
                             },
                             isForce3d: true,
                             onComplete: function () {
                                 promise(function (resolve) {
                                     resolve();
                                 })
                             }
                         });

                         var parent = new mojs.Shape({
                             parent: n.barDom,
                             width: 200,
                             height: n.barDom.getBoundingClientRect().height,
                             radius: 0,
                             x: {
                                 [150]: -150
                             },
                             duration: 1.2 * 500,
                             isShowStart: true
                         });

                         n.barDom.style['overflow'] = 'visible';
                         parent.el.style['overflow'] = 'hidden';

                         var burst = new mojs.Burst({
                             parent: parent.el,
                             count: 10,
                             top: n.barDom.getBoundingClientRect().height + 75,
                             degree: 90,
                             radius: 75,
                             angle: {
                                 [-90]: 40
                             },
                             children: {
                                 fill: '#EBD761',
                                 delay: 'stagger(500, -50)',
                                 radius: 'rand(8, 25)',
                                 direction: -1,
                                 isSwirl: true
                             }
                         });

                         var fadeBurst = new mojs.Burst({
                             parent: parent.el,
                             count: 2,
                             degree: 0,
                             angle: 75,
                             radius: {
                                 0: 100
                             },
                             top: '90%',
                             children: {
                                 fill: '#EBD761',
                                 pathScale: [.65, 1],
                                 radius: 'rand(12, 15)',
                                 direction: [-1, 1],
                                 delay: .8 * 500,
                                 isSwirl: true
                             }
                         });

                         Timeline.add(body, burst, fadeBurst, parent);
                         Timeline.play();
                     },
                     close: function (promise) {
                         var n = this;
                         new mojs.Html({
                             el: n.barDom,
                             x: {
                                 0: 500,
                                 delay: 10,
                                 duration: 500,
                                 easing: 'cubic.out'
                             },
                             skewY: {
                                 0: 10,
                                 delay: 10,
                                 duration: 500,
                                 easing: 'cubic.out'
                             },
                             isForce3d: true,
                             onComplete: function () {
                                 promise(function (resolve) {
                                     resolve();
                                 })
                             }
                         }).play();
                     }
                 }
             }).show();
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
          if (campo==='password'){
                contrase = document.getElementById(campo).value;
                if( contrase == null || contrase.length == 0 ) {
                 $('#' + campo).parent().parent().removeClass("has-danger has-success");
                 $('#' + campo).removeClass('form-control-danger form-control-success');
                 $('#' + campo).addClass('form-control-danger');
                 $('#' + campo).parent().parent().addClass("has-danger");
                 $('#' + campo).parent().parent().find('div.form-control-feedback').text("Ingrese su contraseña").show();
                    return false;
                }
                else{
                     $('#' + campo).parent().parent().removeClass("has-danger has-success");
                     $('#' + campo).removeClass('form-control-danger form-control-success');
                     $('#' + campo).addClass('form-control-success');
                     $('#' + campo).parent().parent().addClass("has-success");
                     $('#' + campo).parent().parent().find('div.form-control-feedback').hide();
                    return true;

                }
            }
         if (campo==='roles'){
                indice = document.getElementById(campo).selectedIndex;
                if( indice == null || indice == 0 ) {
                 $('#' + campo).parent().parent().removeClass("has-danger has-success");
                 $('#' + campo).removeClass('form-control-danger form-control-success');
                 $('#' + campo).addClass('form-control-danger');
                 $('#' + campo).parent().parent().addClass("has-danger");
                 $('#' + campo).parent().parent().find('div.form-control-feedback').text("Seleccione un rol").show();
                    return false;
                }
                else{
                     $('#' + campo).parent().parent().removeClass("has-danger has-success");
                     $('#' + campo).removeClass('form-control-danger form-control-success');
                     $('#' + campo).addClass('form-control-success');
                     $('#' + campo).parent().parent().addClass("has-success");
                     $('#' + campo).parent().parent().find('div.form-control-feedback').hide();
                    return true;

                }
            }
     }

     $('#forgetpassword').click(function(){
        $('#login').modal('hide');
        $('#recucontrase').modal('show');
     });