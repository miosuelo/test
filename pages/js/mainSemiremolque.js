$(document).ready(function () {
    console.log("ready");
    iniciale();
    $(window).resize(function () {
        iniciale();
    });

    $('#AgregarV').submit(function (e) {
        const datosAgrega = {
            tipo: $('#Tipo').val(),
            patente: $('#Patente').val()


        };
        $.ajax({
            method: "POST",
            url: "AgregarSe.php",
            data: datosAgrega,
            success: function (msg) {
                alert("" + msg);
                $('#AgregarU').trigger('reset');
                iniciale();
            }

        })

        e.preventDefault();
    });


});

function iniciale() {


    $.ajax({
        url: 'listaSe.php',
        type: 'GET',
        success: function (respuesta) {
            let cuerpin = JSON.parse(respuesta);

            $("#semiTable").DataTable().destroy();
            $("#semiTable").DataTable({
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
            url: "EditStateSe.php",
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


function clickEditar(boton) {
    var numeroFila = $(boton).attr("numeroFila");
    const editaleS = {

        sid: ($("#inpId" + numeroFila).val()),
        stip: ($("#inpTipo" + numeroFila).val()),
        spat: ($("#inpPatente" + numeroFila).val()).toString()


    };


    $.ajax({
        method: "POST",
        data: editaleS,
        url: "EditSe.php",
        success: function (msg) {
            alert("" + msg);


        }

    })


    return false;

}

