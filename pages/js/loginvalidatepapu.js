$(document).ready(function () {

    $("#btnLogin").click(function () {
        var rut = $("#inputID");
        var pass = $("#inputPass");

        var drut = $("#login_inpDRut");

        if (drut.val().length == 0) {
            inputValid(drut, 2, "El rut es un campo obligatorio")
            retorno = false;
        } else {
            inputValid(drut, 1, "")
            retorno = true;
        }
        if (rut.val().length == 0) {
            inputValid(rut, 2, "El rut es un campo obligatorio")
            retorno = false;
        } else {
            inputValid(rut, 1, "")
            retorno = true;
            if (Valida_Rut(rut.val() + drut.val())) {
                inputValid(rut, 2, "")
                inputValid(drut, 2, "Rut invalido")
                retorno = false;
            } else {
                inputValid(rut, 1, "")
                inputValid(drut, 1, "");
                retorno = true;
            }
        }


        if (pass.val().length == 0) {
            inputValid(pass, 2, "La contraseña es un campo obligatorio")
            retorno = false;
        } else {
            inputValid(pass, 1, "");
            retorno = true;
        }

        return retorno;

    })
});