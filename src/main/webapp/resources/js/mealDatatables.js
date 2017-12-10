var ajaxUrl = "ajax/profile/meals/";
var datatableApi;



function format ( d ) {
// `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;padding-right:50px;">'+
        '<tr>'+
        '<td>'+d.PartNumber+'</td>'+
        '<td><a href="' + d.PartUrl + '" target="_blank">View Product Page</td>'+
        '<td rowspan="4"><img src="' + d.Thumb + '"/></td>'+
        '</tr>'+
        '<tr>'+
        '<td>Category:</td>'+
        '<td>'+d.LongDesc+'</td>'+
        '</tr>'+
        '<tr>'+
        '<td>Location:</td>'+
        '<td>'+d.Location+'</td>'+
        '</tr>'+
        '<tr>'+
        '<td>Notes:</td>'+
        '<td>'+d.Notes+'</td>'+
        '</tr>'+
        '</table>';
}




//1.Сетевое
function updateTableSetevoe() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterSetevoe",
        data: $("#filterSetevoe").serialize(),
        success: updateTableByData
    });
}


function clearFilterSetevoe() {
    $("#filterSetevoe")[0].reset();
    $.get(ajaxUrl, updateTableByData);
}

//2.Сантекс
function updateTableSantex() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterSantex",
        data: $("#filterSantex").serialize(),
        success: updateTableByData
    });
}

function clearFilterSantex() {
    $("#filterSantex")[0].reset();
    $.get(ajaxUrl, updateTableByData);
}

//3.Защитный лоток
function updateTableZashitLotok() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterZashitLotok",
        data: $("#filterZashitLotok").serialize(),
        success: updateTableByData
    });
}

//4.Электрощитовое
function updateTableElectroshit() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterElectroShit",
        data: $("#filterElectroShit").serialize(),
        success: updateTableByData
    });
}

//5.Световое
function updateTableSvetovoe() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterSvetovoe",
        data: $("#filterSvetovoe").serialize(),
        success: updateTableByData
    });
}

//5.Коммуникационные шкафы
function updateTableCommun() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterCommun",
        data: $("#filterCommun").serialize(),
        success: updateTableByData
    });
}

//6.Компьютерное оборудование
function updateTableComp() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterComp",
        data: $("#filterComp").serialize(),
        success: updateTableByData
    });
}

//7.Телекомуникационные
function updateTableTelecom() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterTelecom",
        data: $("#filterTelecom").serialize(),
        success: updateTableByData
    });
}

//8.Офисное оборудование
function updateTableOffice() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterOffice",
        data: $("#filterOffice").serialize(),
        success: updateTableByData
    });
}

//9.Пожарно-охранное оборудование
function updateTablePozhar() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterPozhar",
        data: $("#filterPozhar").serialize(),
        success: updateTableByData
    });
}

//10.Цифровое
function updateTableCifro() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterCifro",
        data: $("#filterCifro").serialize(),
        success: updateTableByData
    });
}


//11.Электромонтажное
function updateTableElectromont() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterElectromont",
        data: $("#filterElectromont").serialize(),
        success: updateTableByData
    });
}


//12.Монтажное оборудование
function updateTableMont() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterMont",
        data: $("#filterMont").serialize(),
        success: updateTableByData
    });
}


//13.Аккумуляторы
function updateTableAkkamul() {
    $.ajax({
        type: "POST",
        url: ajaxUrl + "filterAkkamul",
        data: $("#filterAkkamul").serialize(),
        success: updateTableByData
    });
}


function clearFilterZashitLotok() {
    $("#filterZashitLotok")[0].reset();
    $.get(ajaxUrl, updateTableByData);
}

function clearFilterElectroshit() {
    $("#filterElectroShit")[0].reset();
    $.get(ajaxUrl, updateTableByData);
}

// http://api.jquery.com/jQuery.ajax/#using-converters
$.ajaxSetup({
    converters: {
        "text json": function (stringData) {
            var json = JSON.parse(stringData);
            $(json).each(function () {
                // console.log(this);
                this.dateTime = this.dateTime.replace('T', ' ').substr(0, 16);
            });
            return json;
        }
    }
});

$(function () {
    datatableApi = $('#datatable').DataTable(extendsOpts({
        "columns": [
            {
                "data": "picture",



               "render": function(data, type, row)
                {
                   return '<a href="https://s3.eu-central-1.amazonaws.com/photosnova/PhotoCablesMendeleev/'+data+'.jpg"><img src="https://s3.eu-central-1.amazonaws.com/photosnova/PhotoCablesMendeleev/'+data+'.jpg" style="height:240px;width:180px;"/></a>';
                }
            },
            {
                "data": "articul"
            },
            {
                "data": "type1"
            },
            {
                "data": "type2"
            },
            {
                "data": "cod"
            },
            {
                "data": "naimenovanie"
            },

            //proizvoditel, edizmereniya, kolvo, cena, primechanie, articul, picture
            {
                "data": "proizvoditel"
            },
            {
                "data": "edizmereniya"
            },
            {
                "data": "kolvo"
            },
            {
                "data": "cena"
            },
            {
                "data": "primechanie"
            },
            {
                "render": renderEditBtn,
                "defaultContent": "",
                "orderable": false
            },
            {
                "render": renderDeleteBtn,
                "defaultContent": "",
                "orderable": false
            }

        ],
        "order": [
            [
                0,
                "desc"
            ]
        ],
        "createdRow": function (row, data, dataIndex) {
            $(row).addClass(data.exceed ? 'exceeded' : 'normal');
        }
    }));

    $.datetimepicker.setLocale(localeCode);

//  http://xdsoft.net/jqplugins/datetimepicker/
    var startDate = $('#startDate');
    var endDate = $('#endDate');
    startDate.datetimepicker({
        timepicker: false,
        format: 'Y-m-d',
        formatDate: 'Y-m-d',
        onShow: function (ct) {
            this.setOptions({
                maxDate: endDate.val() ? endDate.val() : false
            })
        }
    });
    endDate.datetimepicker({
        timepicker: false,
        format: 'Y-m-d',
        formatDate: 'Y-m-d',
        onShow: function (ct) {
            this.setOptions({
                minDate: startDate.val() ? startDate.val() : false
            })
        }
    });

    $('#startTime, #endTime').datetimepicker({
        datepicker: false,
        format: 'H:i'
    });

    $('#dateTime').datetimepicker({
        format: 'Y-m-d H:i'
    });
});