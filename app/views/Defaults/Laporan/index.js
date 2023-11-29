window.defaultUrl = `${baseUrl}laporan/`;
var table;
var formatField = $(`#formatField`);
var  tableDetail;
var format;
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

    $("#btn-pdf").on('click', function(){
         formData = $("#form-filter").serializeArray();
         console.log(formData);
         window.open(defaultUrl + "laporanPdf?" + $.param(formData), '_blank');            
        
    });

    
$('#btn-detail').on('click', function(){
    // viewDatatableDetail();
    let selected = table.row({
        selected: true
    }).data();
    if(_.isEmpty(selected)) {
        notification("warning", "Pilih Data Terlebih Dahulu");
        return false;
    };
    if (selected) {
     
        if ($.fn.DataTable.isDataTable('#datatabledetail')) {
            $('#datatabledetail').DataTable().destroy();
        }

// inisialisasi kembali tabel detail dengan data yang baru
        viewDatatableDetail(selected.id);

        resetErrors();
        modal.modal('show');
    }
});


    $(`form [name="format"]`).on('input', function(){
        isi = $(this).val()
        formatField = $(`#format-field`);
        if(isi == ''){
            console.log('ini kosong');
            format = `<h1>ini kosong</h1>`;
            $(`#format-field`).empty();
            

        }else if(isi == 'harian'){
            console.log('ini harian');
            format = `
            <div class="input-group mb-2 input-filter">
           
            <div class="input-group-prepend">
                <span class="input-group-text">
                    Tanggal
                </span>
            </div>
            <input type="date" id="bulan" name="bulan" class="form-control">
        </div>
            `;
            $(`#format-field`).empty();
            $(`#format-field`).append(format);


        }else if(isi == 'bulanan'){
            console.log('ini bulanan');
            format = `
            <div class="input-group mb-2 input-filter">
            
            <div class="input-group-prepend">
                <span class="input-group-text">
                    Bulan
                </span>
            </div>
            <input type="month" id="bulan" name="bulan" class="form-control">
        </div>
            `;
            $(`#format-field`).empty();
            $(`#format-field`).append(format);

        }else if(isi == 'tahunan'){
            console.log('ini tahunan');
            format = `
            <div class="input-group mb-2 input-filter">
     
            <div class="input-group-prepend">
                <span class="input-group-text">
                    Tahun
                </span>
            </div>
            <input type="number" id="tahun" name="tahun" min="1900" max="2100" step="1">
                    </div>
            `;
            $(`#format-field`).empty();
            $(`#format-field`).append(format);
        }else if(isi == 'rentang_tanggal'){
            console.log('ini rentang tanggal');
            format = `
            <div class="input-group mb-2 input-filter">
									
											<div class="input-group-prepend">
												<span class="input-group-text">
													Tanggal
												</span>
											</div>
											<input type="date" name="date_from" class="form-control" >
											<div style="width: 7%;" class="input-group-prepend ">
												<span class="input-group-text">
													s.d
												</span>
											</div>
											<input type="date" name="date_until" class="form-control"  required>
										</div>
            `;
            $(`#format-field`).empty();
            $(`#format-field`).append(format);
        }
    })

    $(`form [name="kasir"]`).on('change', function(){
        $(`form [name="nama_kasir"]`).val('');
        var selectedData = $(this).select2('data')[0];
        if((selectedData == 0) || (selectedData == '')){
            console.log('belum select');
        }else{
            $(`form [name="nama_kasir"]`).val(selectedData.text);
        }
    
    });
    
    $(`form [name="date_until"]`).on('change', function(){
        var dari = $(`form [name="date_from"]`).val();
        var sampai = $(this).val();
        if(new Date(sampai) < new Date(dari)){
            alert('Tanggal Tidak Valid');
            var sampai = $(this).val('');
        }
    });
    
    $(`#btn-reset`).on('click', function(){
        console.log('pencet euy');
        $('form')[0].reset(); // Menggunakan [0] untuk mengakses elemen DOM
        $(`form select`).val(null).trigger('change');
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
                data: 'id'
            },
            {
                data: 'kode_kasir'
            },
            
            {
                data: 'nama_kasir'
            },
            {
                data: 'total',
                render: function(data){
                    return '<span class="price">' + formatRupiah(data, "Rp. ") + '</span>';
                }
            }, 
            {
                data: 'voucher_kode'
            },
            {
                data: 'diskon',
                render: function(data){
                    diskon = parseFloat(data) * 100;
                    return '<span class="price">' + diskon +"%" + '</span>';
                }
            }, 
            {
                data: 'grand_total',
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




function viewDatatableDetail(datanya){
    tableDetail;
    tableDetail = $("#datatabledetail").DataTable({
        ajax: {
            url: defaultUrl + "datatabledetail",
            "type": "post",
			"data": {
                id : datanya,
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
                data: 'nama_produk'
            },
            
            {
                data: 'qty'
            },
             
            {
                data: 'harga',
                render: function(data){
                    return '<span class="price">' + formatRupiah(data, "Rp. ") + '</span>';
                }
            }, 
            {
                data: 'total',
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
                
                
                
            }

    });

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
                    i.id = i.kode;
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
    $('.select2transaksi').select2({
        allowClear: true,
        theme: "bootstrap4",
        width: 'auto',
        ajax: {
            url: "{{ url('panel/referensi/getTrans') }}",
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
                    i.text = i.id;
                    
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

