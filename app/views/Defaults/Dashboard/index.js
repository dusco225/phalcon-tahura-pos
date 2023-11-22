window.defaultUrl = `${baseUrl}dashboard/`;

$(document).ready(function () {

viewDatatable();

$("")

$.get(defaultUrl + "voucherAktif", function (data) {
    $("#voucher").text(data);
  });
$.get(defaultUrl + "transaksiHari", function (data) {
    $("#terjual").text(data);
  });
$.get(defaultUrl + "pendapatanHari", function (data) {
    $("#pendapatan").text(formatRupiah(data));
  });

var tp = <?= json_encode($total_pendapatan) ?>;
var bp = <?= json_encode($bulan_pendapatan) ?>;
var pr = <?= json_encode($produk_dibeli) ?>;

console.log('AHAHA'+ JSON.stringify(tp));
console.log('AHIIHI'+ JSON.stringify(bp));

var bulanPendapatan = bp.map(item => item.bulan);
var totalValues = tp.map(item => parseInt(item.total));
var produk = JSON.stringify(pr);
console.log('ini data produk' + produk);
// Ubah struktur data yang dimiliki ke dalam format yang diharapkan oleh Highcharts
var newData = pr.map(item => {
    return {
        name: item.produk,
        y: parseFloat(item.qty)
    };
});
console.log(newData);
// var bulanValues1 = bulan1.map(item => item.bulan);
// var totalValues1 = total1.map(item => parseInt(item.nik));



Highcharts.chart('container', {
    title: {
        text: null,
        align: 'left'
    },
    // subtitle: {
    //     text: 'Source: ',
    //     align: 'left'
    // },
    yAxis: {
        title: {
            text: null
        }
    },
    xAxis: {
        accessibility: {
            rangeDescription: bulanPendapatan
        },
        categories: bulanPendapatan
    },
    // legend: {
    //     nu,
    //     layout: 'horizontal',
    //     align: 'center',
    //     verticalAlign: 'bottom'
    // },
    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            },
            pointStart: 0
        }
    },
    series: [{
        name: 'Pendapatan',
        data: totalValues
    }],
    responsive: {
        rules: [{
            condition: {
                maxWidth: 300
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }
});



//++++++++++++++++++++++++++++++++++++++++++++++
// Data retrieved from https://netmarketshare.com/
// Build the chart
Highcharts.chart('container-pie', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: null,
        align: 'left'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
        point: {
            valueSuffix: '%'
        }
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: false
            },
            showInLegend: true
        }
    },
    series: [{
        name: 'Brands',
        colorByPoint: true,
        data: newData,
    }]
});


});


function viewDatatable(){
    table = $("#datatable").DataTable({
        ajax: {
            url: defaultUrl + "datatable",
            "type": "post",
			"data": function (d) {
				var formData = $("#form-filter").serializeArray();
                $.each(formData, function (key, val) {
					d[val.name] = val.value;
				});
			}
        },
        serverSide: true,
        processing: true,
        responsive: true,
        selected: false,
        aaSorting: [],
        columnDefs: [{
            searchable: false,
            targets: [0]
        }],
        columns: [{
                data: 'id',
                orderable: false,
                render: function(data, index, row, meta) {
                    return meta.row + meta.settings._iDisplayStart + 1 + ".";
                },
            },
            {
                data: 'kode_kasir'
            },
            {
                data: 'voucher_kode'
            },
             
            {
                data: 'total',
                render: function(data){
                    return '<span class="price">' + formatRupiah(data, "Rp. ") + '</span>';
                }
            }, 
            {
                data: 'bayar',
                render: function(data){
                    return '<span class="price">' + formatRupiah(data, "Rp. ") + '</span>';
                }
            }, 
            {
                data: 'kembalian',
                render: function(data){
                    return '<span class="price">' + formatRupiah(data, "Rp. ") + '</span>';
                }
            },
            
        ],
            "createdRow": function (row, data, index) {
                $(row).attr('data-value', encodeURIComponent(JSON.stringify(data)));
                $("thead").css({ "vertical-align": "middle", "text-align": "center", });
                $("td", row).css({ "vertical-align": "middle", padding: "0.5em", 'cursor': 'pointer' });
                $("td", row).first().css({ width: "3%", "text-align": "center", });
                //Default
                $('td', row).eq(1).css({ 'text-align': 'left', 'font-weight': 'normal' });
                 $('td', row).eq(-1).css({ 'text-align': 'center', width: "9%" });
                
                
            }

    }).on( 'click', 'tr', function () {
		if ($(this).hasClass('selected')) {
			$('#btn-detail').removeClass("disabled");
			$('#btn-delete').removeClass("disabled");
		} else {
			$('#btn-detail').addClass("disabled");
			$('#btn-delete').addClass("disabled");
        }
	});

}







function formatRupiah(angka, prefix) {
    var number_string = angka.replace(/[^,\d]/g, "").toString(),
        split = number_string.split(","),
        sisa = split[0].length % 3,
        rupiah = split[0].substr(0, sisa),
        ribuan = split[0].substr(sisa).match(/\d{3}/gi);

    if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
    }

    rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
    return prefix == undefined ? rupiah : prefix + rupiah;
}
rupiahFields.forEach(function (field) {
    var element = document.getElementById(field);
    element.addEventListener("keyup", function (e) {
      element.value = formatRupiah(this.value, "Rp. ");
    });
  });

function convertRupiah(){
    rupiahFields.forEach(function (field) {
      var element = document.getElementById(field);
      element.value = formatRupiah(element.value, "Rp. ");
    });
}


