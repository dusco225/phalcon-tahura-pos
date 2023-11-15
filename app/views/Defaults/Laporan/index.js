window.defaultUrl = `${baseUrl}laporan/`;
var table;

$(document).ready(function() {
    let modal = $('#formModal');
    viewDatatable();
    select2data();

    $("#btn-refresh-data").click(function () {
        $('#filterModal').find('input[type=checkbox]').prop("checked", false);
        $('input[name=search_kode]').val('');
        $('input[name=search_kode]').prop('disabled', true);
        $('input[name=search_nama]').val('');
        $('input[name=search_nama]').prop('disabled', true);
        $("select[name=kategori_id_search]").val('').trigger('change');
        $("select[name=kategori_id_search]").prop('disabled', true);
        table.ajax.reload();
    });



modal.find('form').on('submit', function(e) {
    e.preventDefault();

    $(`input[name="bahan[]"]`).each(function (i){
        var bahan = $(this).val();
        var jumlah = $(`input[name="jumlah[]"]`).eq(index).val();

        bahanData.push({bahan: bahan, jumlah: jumlah});
    });

    dataToSend = {
        nama : $('input[name="nama"]').val(),
        kategori : $('input[name="kategori"]').val(),
        hpp : $(`input[name="hpp"]`).val(),
        harga_jual : $(`input[name="hargajual"]`),
        bahan_data: bahanData
    };

    $.ajax({
        url: defaultUrl + "store",
        method: 'POST',
        data: dataToSend,
        succes: function(response){
            console.log(response);
        },
        error: function(xhr, status, error){
            console.error('Error: ', error);
            console.error('Status: ', status);
            console.error('XHR Response: ', xhr);
        }
    });
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
                data: 'nama'
            },
            {
                data: 'kategori'
            },
            {
                data: 'gambar',
                render: function(data){
                    return data;
                }
            }, 
            {
                data: 'hpp',
                render: function(data){
                    return '<span class="price">' + formatRupiah(data, "Rp. ") + '</span>';
                }
            }, 
            {
                data: 'harga',
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

    })
}



function select2data(){
    $('.select2kasir').select2({
        allowClear: true,
        theme: "bootstrap4",
        width: 'auto',
        ajax: {
            url: "{{ url('panel/referensi/getKasir') }}",
            data: function (params) {
                return {
                    q: params.term,
                    page: params.page || 1
                };
            },
            processResults: function (response) {
                var data = JSON.parse(response);
                console.log(data);
                return {
                    results: data.data.map(function (i) {
                    i.id = i.id;
                    i.text = i.nama;
                    // $('#isinya').text(i.id);                    
                    // console.log(i);
                    return i;
                    }),
                    pagination: {
                        more: data.has_more
                    }
                }
            }
        }
        
    });
}


function resetErrors() {
    $('.form-control').each(function(i, el) {
        $(el).removeClass('brc-danger-m2');
        $(el).next().text('').hide();
        $(el).prev().removeClass('text-danger-d1');
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
    element.addEventListener("change", function (e) {
      element.value = formatRupiah(this.value, "Rp. ");
    });
  });
