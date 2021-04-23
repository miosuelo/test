$(document).ready(function () {
    $(window).resize(function () {
        iniciale();
    });
    console.log("hola")


    var now = new Date();

    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear() + "-" + (month) + "-" + (day);
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

        var rut = $('#inpUsuarioRut').val();
        rut = rut.toString().replace('.', '');
        rut = rut.toString().replace('.', '');
        rut = rut.toString().replace('-', '');
        console.log(rut)

        if (Valida_Rut(rut)) {
            const datosAgrega = {
                rut: rut,
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
        } else {
            alert("Rut no valido")
        }
        e.preventDefault();
    });


});

function iniciale() {

    $.ajax({
        url: 'listaUs.php',
        type: 'GET',
        success: function (respuesta) {

            let cuerpin = JSON.parse(respuesta);
            $("#userTable").DataTable().destroy();
            $("#userTable").DataTable({
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
            iniciale()

        }
    })


    return false;

}

function changeState(switchV, row) {
    var id = $("#inpId" + row).val();
    id = id.replaceAll('.','');
    id = id.replaceAll('-','');
    console.log(id);
    if ($(switchV).is(':checked')) {
        const data = {
            state: 1,
            id: id
        }
        $.ajax({
            method: "POST",
            data: data,
            url: "EditStateUs.php",
            success: function (msg) {



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
            url: "EditStateUs.php",
            success: function (msg) {


            }
        })
    }
}

function guionRut(objeto) {
    var rut = $(objeto).val();
    if (rut.length > 2) {
        const newRut = rut.replace(/\./g, '').replace(/\-/g, '').trim().toLowerCase();
        const lastDigit = newRut.substr(-1, 1);
        const rutDigit = newRut.substr(0, newRut.length - 1)
        let format = '';
        for (let i = rutDigit.length; i > 0; i--) {
            const e = rutDigit.charAt(i - 1);
            format = e.concat(format);
            if (i % 3 === 0) {
                format = '.'.concat(format);
            }
        }
        $(objeto).val(format.concat('-').concat(lastDigit));
    }


}


function Valida_Rut(Objeto) {
    Objeto = Objeto.replaceAll(".", "");
    if(Objeto.length < 6){
        return false;
    }

    var cuerpoRut = Objeto.substr(0, Objeto.length - 1);
    var digitoRut = Objeto.substr(Objeto.length - 1, Objeto.length);

    var cuerpoRutInvers = "";


    for (var i = cuerpoRut.length; i >= 0; i--) {
        cuerpoRutInvers += cuerpoRut.charAt(i);
    }


    var suma = 0;
    var contador = 0;


    for (var i = 2; contador < cuerpoRutInvers.length; i++) {

        var numero = cuerpoRutInvers.charAt(contador);

        suma = suma + i * numero;

        contador++;
        if (i == 7) {
            i = 1;
        }


    }
    console.log("Suma: " + suma)


    var division = Math.floor(suma / 11);


    var resultado = suma - (11 * division);


    resultado = 11 - resultado;


    var digitoResultado = "";
    if (resultado == 11) {
        digitoResultado = "0";
    }
    if (resultado == 10) {
        digitoResultado = "K";
    }

    if (resultado != 11 && resultado != 10) {
        digitoResultado = resultado;
    }


    if (digitoResultado.toString().toUpperCase() == digitoRut.toUpperCase()) {
        return true;
    } else {
        return false

    }
}