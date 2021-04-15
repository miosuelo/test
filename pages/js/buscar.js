$(document).ready(function () {

    /AUTOCOMPLETAR/
    $('#buscale').keyup(function(busqueda, resultado){

        var input = ($(this).val().trim() != "") ? $(this).val().trim() : "";

        $.ajax({
            url: "consulta.php",
            data: input,
            dataType: "json",
            type: "POST",
            success: function (data) {
                resultado($.map(data, function (item) {
                    return item;
                }));
            },
            error: function (request, status, error) {
                console.log(request.responseText);
            }
        });

    });



    /* FIN DOCUMENT READY*/
});