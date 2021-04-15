function gene(id, nombre, fecha, patenteSemiRemolque, patenteVehiculo, tipoForm) {
    var doc = new jsPDF('p', 'pt', 'letter');
    var htmlstring = '';
    var tempVarToCheckPageHeight = 0;
    var pageHeight = 0;
    pageHeight = doc.internal.pageSize.height;
    specialElementHandlers = {
        // element with id of "bypass" - jQuery style selector
        '#bypassme': function (element, renderer) {
            // true = "handled elsewhere, bypass text extraction"
            return true
        }
    };
    margins = {
        top: 150,
        bottom: 60,
        left: 40,
        right: 40,
        width: 600
    };
    var y = 20;
    doc.setLineWidth(2);

    doc.text(200, y = y + 30, "Check List de " + tipoForm);


    var bodyDatos = [
        ["Realizado por: " + nombre, " Fecha: " + fecha],
        ["Semiremorque: " + patenteSemiRemolque, "Vehiculo: " + patenteVehiculo]
    ]
    doc.autoTable({
        body: bodyDatos, startY: y = y + 20, theme: 'grid', tableWidth: 'auto'
    })


    var head = [['Deficiencia', 'Evaluacion']]
    var body = []
    var element = [];

    $("#" + id).find(".pregunta").each(function () {
        var target = $(this);

        if (target.is("label")) {
            element[0] = target.text();

        } else {
            element[1] = target.val()
            body.push(element);
            element = [];

        }


    })
    doc.autoTable({
        head: head, body: body, theme: 'grid', startY: doc.lastAutoTable.finalY + 30, bodyStyles: {lineColor: [0, 0, 0]}
    })

    doc.save("hola.pdf")
}