window.defaultUrl = `${baseUrl}/master/produk/`;
var table;
var rupiahFields = [
    "hpp",
    "hargajual",
    "total",
    "hargajual",
  ];

var bahanData = [];
var dataToSend;

  var order = 1;
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

    $("#btn-search").click(function () {
        $('#filterModal').modal('show');
    });

    

    $('#btn-edit').click(function () {
        let selected = table.row({
            selected: true
        }).data();
        if(_.isEmpty(selected)) {
            notification("warning", "Pilih Data Terlebih Dahulu");
            return false;
        };
        if (selected) {
            modal.find('input[name=_type]').val('edit');
            modal.find('input[name=id]').val(selected.id);
            modal.find('input[name=nama]').val(selected.nama);
            modal.find('input[name=hpp').val(selected.hpp);
            $("select[name=kategori_id]").select2("trigger", "select", { data: { id: selected.kategori_id, text : selected.kategori} });
            convertRupiah();
            resetErrors();
            modal.modal('show');
        }
    });

    $('#btn-delete').on('click', async function() {
        let selected = table.row({
            selected: true
        }).data();
        if(_.isEmpty(selected)) {
            notification("warning", "Pilih Data Terlebih Dahulu");
            return false;
        };
        if (selected && (await confirmDelete()).value) {
            $.post(defaultUrl + "delete?id=" + selected.id)
                .done(function() {
                    notification('success', "Data berhasil dihapus");
                    table.ajax.reload();
                    $('#btn-edit').addClass('disabled');
                    $('#btn-delete').addClass('disabled');
                })
                .fail(function() {
                    notification('danger', "Data gagal dihapus");
                });
        }
    });




$('#btn-add').click(function() {
    modal.find(`input[name="nama"]`).val('');
    modal.find(`select[name="kategori"]`).val(null).trigger('change'); // Reset select2
    // modal.find(`select[name="bahan[]"]`).val(null).trigger('change'); // Reset select2
    modal.find(`input[name="jumlah[]"]`).val('');
    modal.find(`input[name="hpp"]`).val('');
    modal.find(`input[name="hargajual"]`).val('');
    modal.find(`input[name="_type"]`).val('create');
    resetErrors();
    $('#formModal').modal('show');
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


    // modal.find('form').on('submit', function(ev) {
    //     ev.preventDefault();
    //     rupiahFields.forEach(function (field) {
    //         var element = document.getElementById(field);
    //         var value = element.value.replace(/[^0-9]/g, ""); // Remove non-numeric characters
    //         element.value = value;
    //       });
    //     let submitButton = $(this).find('[type=submit]');
    //     let originalContent = submitButton.html();
    //     submitButton.html('<i class="fa fa-spin fa-spinner"></i> Menyimpan...');
    //     submitButton.prop('disabled', true);

    //     let type = $('[name=_type]').val();
    //     let id = $('[name=id]').val();
    //     let url = type == 'create' ?
    //         defaultUrl + "store" :
    //         (defaultUrl + "update");

    //     $.post(url, $(this).serialize())
    //         .done(function(response) {
    //             notification('success', "Data berhasil disimpan");
    //             modal.modal('hide');
    //             table.ajax.reload();
    //         })
    //         .fail(function(jqXHR) {
    //             if (jqXHR && jqXHR.responseJSON && jqXHR.responseJSON.errors) {
    //                 let errors = jqXHR.responseJSON.errors;
    //                 for (let field in errors) {
    //                     let el = $(`[name=${field}]`);
    //                     el.toggleClass('brc-danger-m2');
    //                     el.next().text(errors[field]).show();
    //                     el.prev().toggleClass('text-danger-d1');
    //                 }
    //             }
    //         })
    //         .always(function() {
    //             submitButton.html(originalContent);
    //             submitButton.prop('disabled', false);
    //         });
    // });

    
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
                
            }

    }).on( 'click', 'tr', function () {
		if ($(this).hasClass('selected')) {
			$('#btn-edit').removeClass("disabled");
			$('#btn-delete').removeClass("disabled");
		} else {
			$('#btn-edit').addClass("disabled");
			$('#btn-delete').addClass("disabled");
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

function confirmDelete() {
    let swalWithBootstrapButtons = Swal.mixin({
        buttonsStyling: false,
    });

    return swalWithBootstrapButtons.fire({
        title: 'Apakah anda yakin?',
        type: 'warning',
        showCancelButton: true,
        scrollbarPadding: false,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
        customClass: {
            confirmButton: 'btn btn-success mx-2 px-3 radius-2',
            cancelButton: 'btn btn-danger mx-2 px-3 radius-2'
        }
    });
}


//form action

$('#komposisi select[name="bahan"]').on('change', function() {
    var selectedData = $(this).select2('data')[0];
    
    console.log(selectedData);
    if (selectedData) {
        var tempat = $(this);
        var inputId = $(`<input type="hidden" name="id[]">`).val(selectedData.id);
        var inputJumlah = $(`<input type="hidden" name="jumlah">`).val(selectedData.jumlah);
        var inputHarga = $(`<input type="hidden" name="harga">`).val(selectedData.harga);
        
        tempat.append(inputId);
        tempat.append(inputJumlah);
        tempat.append(inputHarga);

    }
});

var order = 1;

$('#tambah').on('click', function() {
    console.log('tambah bro');
    var newRow = $(`
        <tr>
            <input type='hidden' name="total[]">
            <td><select name="bahan" class="select2 select2bahan" required></select></td>
            <td><input type="number" name="jumlah[]" required></td>
            <td><input type="text" id="total" name="subtotal[]" disabled></td>
        </tr>
    `);

    // Tambahkan atribut id ke setiap elemen dalam baris baru
    newRow.find('select').attr('id', 'bahan' + order);
    newRow.find('input[type="number"]').attr('id', 'jumlah' + order);
    newRow.find('input[type="text"]').attr('id', 'subtotal' + order);

    // Masukkan baris baru setelah baris dengan ID 'komposisi'
    $('#komposisi').after(newRow);

    // Lakukan penyesuaian nomor urutan untuk id berikutnya
    order++;

    // Inisialisasi Select2 pada elemen yang baru
    select2data();
});


$('#kurang').on('click', function() {
    console.log('kurang bro');
    var jumlahRow = $('#komposisi').length;
    if(jumlahRow > 1){
        // Menghapus baris terakhir
        $('#komposisi:last').remove();
    }else{
        alert('Harus Ada Bahan')
    }
});


$(`input[name="jumlah[]"]`).on('input', function(){

    var total = $(`input[name="total[]"]`).val(''); 
    var subTotal = $(`#harga`); 
    var diPakai = $(`input[name="jumlah[]"]`).val();
    var jumlah = $(`input[name="jumlah"]`).val();
    var harga = $(`input[name="harga"]`).val();
    
    var hasil = harga / jumlah * diPakai;
    
    total.val(hasil);
    var angka = formatRupiah(hasil, "Rp. ")
    subTotal.innerHtml('<p>' + hasil + '</p>');
    


});




function select2data(){
    $('.select2bahan').select2({
        allowClear: true,
        theme: "bootstrap4",
        width: 'auto',
        ajax: {
            url: "{{ url('panel/referensi/getBahan') }}",
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
                    i.jumlah = i.jumlah;
                    i.harga = i.harga;
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

    $('.select2kategori').select2({
        allowClear: true,
        theme: "bootstrap4",
        width: 'auto',
        ajax: {
            url: "{{ url('panel/referensi/getKategori') }}",
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

function convertRupiah(){
    rupiahFields.forEach(function (field) {
      var element = document.getElementById(field);
      element.value = formatRupiah(element.value, "Rp. ");
    });
}