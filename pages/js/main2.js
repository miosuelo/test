$(document).ready(function () {
    console.log("ready");
    iniciale();



    $('#AgregarV').submit(function (e) {
        const datosAgrega = {
            tipo: $('#Tipo').val(),
            patente: $('#Patente').val()


        };
        $.ajax({
            method: "POST",
            url: "AgregarVe.php",
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
            url: 'listaVe.php',
            type: 'GET',
            success: function (respuesta) {
                let cuerpin = JSON.parse(respuesta);
                let template = '';
                var contador = 0;
                cuerpin.forEach(cuerpin => {
                    contador++;
                    template += `
        <tr idcosa="${cuerpin.idd}">
            <td><input class="form-control" type="text" id="inpId${contador}" disabled="true"  value="${cuerpin.id}"></td>
            <td><input class="form-control" type="text" id="inpTipo${contador}"   value="${cuerpin.tipo}"></td>
            <td><input class="form-control" type="text" id="inpPatente${contador}"  value="${cuerpin.patente}"></td>
           
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
    const editaleV = {

        vid: ($("#inpId" + numeroFila).val()),
        vtip: ($("#inpTipo" + numeroFila).val()),
        vpat: ($("#inpPatente" + numeroFila).val()).toString()


    };



    $.ajax({
        method: "POST",
        data: editaleV,
        url: "EditVe.php",
        success: function (msg) {
            alert("" + msg);


        }

    })



    return false;

}

