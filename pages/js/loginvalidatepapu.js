$(document).ready(function () {
    console.log("welcome")
    $("#inputID").keyup(function () {
        guionRut(this)
    })
    $("#formLogin").submit(function () {

        var rut = $("#inputID").val();


        rut = rut.toString().replace('.', '');
        rut = rut.toString().replace('.', '');
        rut = rut.toString().replace('-', '');
        console.log(rut)
        if (Valida_Rut(rut)) {
            return true
        } else {
            alert("Rut invalido")

        }

        return false;
    })
});

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
    try {
        Objeto = Objeto.replaceAll(".", "");
        if (Objeto.length < 6) {
            return false;
        }

        Objeto.substr(0, Objeto.length - 1);

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
    } catch (error) {
        console.log(error)
        return false;
    }
}