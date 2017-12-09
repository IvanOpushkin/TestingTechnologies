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