$(document).ready(function () {

    console.log("ready");
    iniciale();

    /* Agrega usuarios */

    $('#AgregarU').submit(function (e) {
        const datosAgrega = {
            rut: $('#Rut').val(),
            nombre: $('#Nombre').val(),
            contrasena: $('#Contrasena').val(),
            jerarquia: $('#Jerarquia').val()

        };
        $.ajax({
            method: "POST",
            url: "AgregarUs.php",
            data: datosAgrega,
            success: function (msg) {
                alert("" + msg);
                $('#AgregarU').trigger('reset');
                iniciale();
            }

        })

        e.preventDefault();
    });

    function iniciale() {


        $.ajax({
            url: 'listaUs.php',
            type: 'GET',
            success: function (respuesta) {
                let cuerpin = JSON.parse(respuesta);
                let template = '';
                var contador = 0;
                cuerpin.forEach(cuerpin => {
                    contador++;
                    template += `
        <tr idcosa="${cuerpin.idd}">
            <td><input class="form-control" type="text" id="inpId${contador}" disabled="true"  value="${cuerpin.idd}"></td>
            <td><input class="form-control" type="text" id="inpNombre${contador}"   value="${cuerpin.namem}"></td>
            <td><input class="form-control" type="text" id="inpContrasena${contador}"  value="${cuerpin.pass}"></td>
            <td><input class="form-control" type="text" id="inpJerarquia${contador}" value="${cuerpin.jer}"></td>
            <td>
            <button class="editing btn btn-warning " numeroFila="${contador}" type="" onclick="clickEditar(this)"  >Editar</button>
            </td>
        </tr>
         `
                    contador++;
                });
                $('#cuerpin').html(template);
            }

        })

    }







});


function clickEditar(boton) {
    var numeroFila = $(boton).attr("numeroFila");
    const editale = {

        erut: ($("#inpId" + numeroFila).val()),
        enombre: ($("#inpNombre" + numeroFila).val()),
        econtrasena: ($("#inpContrasena" + numeroFila).val()).toString(),
        ejerarquia: ($("#inpJerarquia" + numeroFila).val())

    };



    $.ajax({
        method: "POST",
        data: editale,
        url: "EditUs.php",
        success: function (msg) {
           alert("" + msg);


        }

    })



    return false;

}

