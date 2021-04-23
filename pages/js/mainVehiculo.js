$(document).ready(function () {
    console.log("ready");
    $(window).resize(function () {
        iniciale();
    });
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

        console.log("iniciale");
        $.ajax({
            url: 'listaVe.php',
            type: 'GET',
            success: function (respuesta) {

                let cuerpin = JSON.parse(respuesta);

                $("#vehicleTable").DataTable().destroy();
                $("#vehicleTable").DataTable({
                    "language": {
                        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
                    },
                    "data": cuerpin,
                    "destroy": true,
                    "responsive": true,
                    "searching": false
                })
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

function changeState(switchV, row) {
    var id = $("#inpId" + row).val();

    console.log(id);
    if ($(switchV).is(':checked')) {
        const data = {
            state: 1,
            id: id
        }
        $.ajax({
            method: "POST",
            data: data,
            url: "EditStateVe.php",
            success: function (msg) {

                console.log(msg)

            }
        })

    } else {
        const data = {
            state: 0,
            id: id
        }
        $.ajax({
            method: "POST",
            data: data,
            url: "EditStateVe.php",
            success: function (msg) {
                console.log(msg)

            }
        })
    }
}
