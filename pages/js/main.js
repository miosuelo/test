$(document).ready(function () {
    var now = new Date();

    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    $("#inpDesde").val(today)
    $("#inpHasta").val(today)
    $(".desdeHasta").change(function () {
        var desde = new Date();
        desde.setTime(Date.parse($("#inpDesde").val().toString().replace(/-/g, '\/')));
        var hasta = new Date();
        hasta.setTime(Date.parse($("#inpHasta").val().toString().replace(/-/g, '\/')));

        if (desde > hasta) {
            $("#errorDate").html("Fecha <b>Desde</b> debe ser menor a la fecha <b>Hasta</b>");
            $("#errorDate").removeClass("d-none");
        } else {
            var hoy = new Date();

            if (hasta > hoy) {
                $("#errorDate").html("Fecha <b>Hasta</b> debe ser menor a la fecha <b>actual </b>");
                $("#errorDate").removeClass("d-none");
            } else {
                $("#errorDate").addClass("d-none");
                $(".fecha").each(function () {
                    var fecha = new Date($(this).text().replace(/-/g, '\/'));

                    if (fecha >= desde && fecha <= hasta) {

                        $(this).parent("p").parent("div").parent("div").show()
                    } else {
                        $(this).parent("p").parent("div").parent("div").hide()
                    }
                });
            }
        }
    });
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

