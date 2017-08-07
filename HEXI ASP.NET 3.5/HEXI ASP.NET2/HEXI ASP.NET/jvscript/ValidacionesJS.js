var v = true;
$("#codigo_programa").hide();
$("span.help-block").hide();
$("#GdvProgramas").show();
$("#GdvInfoProgramas").hide();
$('#Button1').click(verificar);
$('#Button2').click(verificarmodifi);
$('#Button5').click(buscar);
function verificarmodifi() {

    var c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;
    c1 = validacion('dni_programa');
    c2 = validacion('nombre_programa');
    c3 = validacion('competencias');
    c4 = validacion('cantid_horas');
    c5 = selecompetenciasmodifi();
    if (c1 === false || c2 === false || c3 === false || c4 === false || c5 === false) {
        $("#exito").hide();
        $("#error").show();
        return false;
    } else {
        var lista = document.getElementById("competencias");
        var opciones = lista.options;
        var option = 1;
        for (i = 0; i < opciones.length; i++) {

            if (opciones[i].selected == true) {

                var grupos = opciones[i].value;

                if (option == 1) {
                    document.getElementById("TextBox7").value = grupos;
                }
                else {
                    document.getElementById("TextBox7").value = (document.getElementById("TextBox7").value) + ',' + grupos;
                }
                option++;
            }
        }
        //$("#error").hide();
        //$("#exito").show();
        return true;
    }

}
function verificar() {

    var v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0;
    v1 = validacion('dni_programa');
    v2 = validacion('nombre_programa');
    v3 = validacion('competencias');
    v4 = selecompetencias();
    v5 = validacion('cantid_horas');
    if (v1 === false || v2 === false || v3 === false || v4 === false || v5 === false) {
        $("#exito").hide();
        $("#error").show();
        return false;
    } else {
        var lista = document.getElementById("competencias");
        var opciones = lista.options;
        var option = 1;
        for (i = 0; i < opciones.length; i++) {

            if (opciones[i].selected == true) {

                var grupos = opciones[i].value;

                if (option == 1) {
                    document.getElementById("TextBox7").value = grupos;
                }
                else {
                    document.getElementById("TextBox7").value = (document.getElementById("TextBox7").value) + ',' + grupos;
                }
                option++;
            }
        }
        //$("#error").hide();
        //$("#exito").show();
        return true;
    }

}
function buscar() {

    var e1 = 0;
    e1 = validacion('busqueda');
    if (e1 === false) {
        $("#exito").hide();
        $("#errorbusqueda").show();
        return false;
    } else {
        //$("#error").hide();
        //$("#exito").show();
        return true;
    }
}
function selecompetencias() {
    if ($("#competencias option:selected").val() == null) {
        $("#glypcn" + 'competencias').remove();
        $('#competencias').parent().parent().attr("class", "form-group has-error");
        $('#competencias').parent().children('span').text("Seleccione los integrantes de la cohorte.").show();
        return false;
    } else {
        $("#glypcn" + 'competencias').remove();
        $('#competencias').parent().parent().attr("class", "form-group has-success has-feedback");
        $('#competencias').parent().children('span').hide();
        return true;
    }
}
function selecompetenciasmodifi() {
    if ($("#competencias option:selected").val() == 0) {
        $("#glypcn" + 'competencias').remove();
        $('#competencias').parent().parent().attr("class", "form-group has-error");
        $('#competencias').parent().children('span').text("Seleccione los integrantes de la cohorte.").show();
        return false;
    } else {
        $("#glypcn" + 'competencias').remove();
        $('#competencias').parent().parent().attr("class", "form-group has-success has-feedback");
        $('#competencias').parent().children('span').hide();
        return true;

    }
}
function selecGV() {
    selectgv = document.getElementById('tipogv').selectedIndex;
    if (selectgv == 0) {
        $("#GdvInfoProgramas").hide();
        $("#GdvProgramas").show();
    }
    else {
        if (selectgv == 1) {
            $("#GdvProgramas").hide();
            $("#GdvInfoProgramas").show();
        }
    }
}
function validacion(campo) {
    var a = 0;

    if (campo === 'dni_programa') {
        dni = document.getElementById(campo).value;
        if (dni == null || dni.length == 0 || /^\s+$/.test(dni)) {
            $("#glypcn" + campo).remove();
            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
            $('#' + campo).parent().children('span').text("Ingrese el DNI del programa.").show();
            $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            return false;

        }
        else {
            if (isNaN(dni)) {

                $("#glypcn" + campo).remove();
                $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");


                return false;
            }
            else {

                $("#glypcn" + campo).remove();
                $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                $('#' + campo).parent().children('span').hide();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");

                return true;
            }


        }

    }
    if (campo === 'nombre_programa') {
        name = document.getElementById(campo).value;
        if (name == null || name.length == 0 || /^\s+$/.test(name)) {

            $("#glypcn" + campo).remove();
            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
            $('#' + campo).parent().children('span').text("Ingrese el nombre del resultado").show();
            $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            return false;

        } else {
            if (/^[A-Za-z áÁéÉíÍóÓúÚñÑüÜ\s]+$/.test(name) == false) {
                $("#glypcn" + campo).remove();
                $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Solo se admiten caracteres alfabéticos").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                return false;
            }
            else {
                $("#glypcn" + campo).remove();
                $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                $('#' + campo).parent().children('span').hide();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                return true;

            }
        }
    }
    if (campo === 'competencias') {
        var lista = document.getElementById(campo);
        var opciones = lista.options;
        for (i = 0; i < opciones.length; i++) {
            if (opciones[i].selected == true) {
                var indice = opciones[i].value;
                if (indice == null || indice == 0) {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Solo se admiten caracteres alfabéticos").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
                    return false;

                }
                else {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                    $('#' + campo).parent().children('span').hide();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");
                    return true;
                }
            }
        }
    }
    if (campo === 'cantid_horas') {
        horas = document.getElementById(campo).value;
        if (horas == null || horas.length == 0 || /^\s+$/.test(horas)) {
            $("#glypcn" + campo).remove();
            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
            $('#' + campo).parent().children('span').text("Ingrese la cantidad de horas del resultado").show();
            $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            return false;

        }
        else {
            if (isNaN(horas)) {

                $("#glypcn" + campo).remove();
                $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Solo se admiten números").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");


                return false;
            } else {
                if (horas == 0 || horas == "0") {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                    $('#' + campo).parent().children('span').text("Ingrese la cantidad de horas del resultado").show();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");

                } else {

                    $("#glypcn" + campo).remove();
                    $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                    $('#' + campo).parent().children('span').hide();
                    $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");

                    return true;
                }

            }

        }
    }
    if (campo === 'busqueda') {
        buscar = document.getElementById(campo).value;
        if (buscar == null || buscar.length == 0 || /^\s+$/.test(buscar)) {
            $("#glypcn" + campo).remove();
            $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
            $('#' + campo).parent().children('span').text("Ingrese el DNI de la cohorte.").show();
            $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            return false;

        }
        else {
            if (isNaN(buscar)) {

                $("#glypcn" + campo).remove();
                $('#' + campo).parent().parent().attr("class", "form-group has-error has-feedback");
                $('#' + campo).parent().children('span').text("Solo se admiten números.").show();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-remove form-control-feedback'></span>");


                return false;
            }
            else {

                $("#glypcn" + campo).remove();
                $('#' + campo).parent().parent().attr("class", "form-group has-success has-feedback");
                $('#' + campo).parent().children('span').hide();
                $('#' + campo).parent().append("<span id='glypcn" + campo + "' class='glyphicon glyphicon-ok form-control-feedback'></span>");

                return true;
            }
        }
    }


}

function tabla(opciont) {
    selectabla = document.getElementById(opciont).selectedIndex;
    if (selectabla == 1) {
        $('#tabla').show();
    }
    if (selectabla == 2) {
        $('#tabla').hide();
    }
}