window.defaultUrl = `${baseUrl}/master/produk/`;
var table;
var rupiahFields = [
  ];
// var bahanData = [];
// var dataToSend;
var bahanData = [];
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
            $("select[name=satuan]").select2("trigger", "select", { data: { id: selected.id_satuan, text : selected.nama_satuan} });
            $("select[name=kategori_id]").select2("trigger", "select", { data: { id: selected.kategori_id, text : selected.kategori} });
            convertRupiah();
            resetErrors();
            modal.modal('show');
        }
    });
    $('#btn-detail').on('click', function(){
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
            
            $("select[name=kategori]").select2("trigger", "select", { data: { id: selected.kategori_id, text : selected.kategori} });
            modal.find('input[name=hpp').val(selected.hpp);
            viewBahan(selected.id);
            modal.find('input[name=harga_jual').val(selected.harga);
            
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
    modal.find(`input[name="jumlah[]"]`).val('1');
    modal.find(`input[name="hpp"]`).val('');
    modal.find(`input[name="hargajual"]`).val('');
    modal.find(`input[name="_type"]`).val('create');
    dataUntung();
    tambahBahan();
    resetErrors();
    $('#formModal').modal('show');
});

$('#tambah').on('click', function() {
    tambahBahan();
});

modal.find('form').on('submit', function(e) {
    e.preventDefault();

    let bahanData = []; // Inisialisasi variabel bahanData
    let formData = new FormData(); // Buat objek FormData untuk mengirim data termasuk gambar

    modal.find(`select[name="bahan[]"]`).each(function (index){
        var bahan = $(this).val();
        var jumlah = $(`input[name="jumlah[]"]`).eq(index).val();
        var total = $(`input[name="total[]"]`).eq(index).val();

        bahanData.push({bahan: bahan, jumlah: jumlah, total: total});
    });

    console.log(bahanData);

    // Tambahkan data bahan ke FormData
    formData.append('bahan_data', JSON.stringify(bahanData));

    // Tambahkan data lain ke FormData
    formData.append('nama', $('input[name="nama"]').val());
    formData.append('kategori', $('select[name="kategori"]').val());
    formData.append('hpp', $(`input[name="hpp"]`).val());
    formData.append('harga_jual', $(`input[name="hargajual"]`).val());

    // Ambil file gambar dari input dengan id 'gambar'
    let gambarFile = $('input[name="filename"]')[0].files[0]; // Ganti 'gambar' dengan id yang sesuai

    // Tambahkan file gambar ke FormData
    formData.append('gambar', gambarFile);

    $.ajax({
        url: defaultUrl + "store",
        method: 'POST',
        data: formData,
        processData: false, // Set false agar FormData tidak diproses secara otomatis
        contentType: false, // Set false agar tipe konten tidak diatur secara otomatis
        success: function(response){
            console.log(response);
        },
        error: function(xhr, status, error){
            console.error('Error: ', error);
            console.error('Status: ', status);
            console.error('XHR Response: ', xhr);
        }
    });
});

// modal.find("form").on("submit", function (ev) {
//     ev.preventDefault();
  
//     let submitButton = $(this).find("[type=submit]");
//     let originalContent = submitButton.html();
  
//     let type = $("[name=_type]").val();
//     let id = $("[name=id]").val();
//     let url = type == "create" ? defaultUrl + "store" : defaultUrl + "update";
  
//     // Menggunakan FormData untuk menyimpan data formulir, termasuk file gambar
//              modal.find(`select[name="bahan[]"]`).each(function (index){
//                 var bahan = $(this).val();
//                 var jumlah = $(`input[name="jumlah[]"]`).eq(index).val();
//                 var total = $(`input[name="total[]"]`).eq(index).val();
        
//                 bahanData.push({bahan: bahan, jumlah: jumlah, total: total});
//             });
        
//             console.log(bahanData);
        
//             dataToSend = {
//                 nama : $('input[name="nama"]').val(),
//                 kategori : $('select[name="kategori"]').val(),
//                 hpp : $(`input[name="hpp"]`).val(),
//                 harga_jual : $(`input[name="hargajual"]`).val(),
//                 bahan_data: bahanData
//             };
//     var formData = new FormData();
//     formData.append("filename", $("#filename").prop("files")[0]); // Mengambil file gambar dari input dengan id 'filename'
  
//     // Menambahkan data formulir lainnya ke FormData
//     $(this)
//       .serializeArray()
//       .forEach((item) => formData.append(item.name, item.value));
  
//     // Melakukan permintaan AJAX dengan menggunakan FormData
//     $.ajax({
//       url,
//       data: formData,
//       processData: false, // Memastikan FormData tidak diolah secara otomatis
//       contentType: false, // Memastikan tipe konten tidak diatur secara otomatis
//       type: "POST",
//     })
//       .done(function (response) {
//         notification("success", "Data berhasil disimpan");
//         modal.modal("hide");
//         table.ajax.reload();
//       })
//       .fail(function (jqXHR) {
//         if (jqXHR && jqXHR.responseJSON && jqXHR.responseJSON.errors) {
//           let errors = jqXHR.responseJSON.errors;
//           for (let field in errors) {
//             let el = $("[name=" + field + "]");
//             el.toggleClass("brc-danger-m2");
//             el.next().text(errors[field]).show();
//             el.prev().toggleClass("text-danger-d1");
//           }
//         }
//       })
//       .always(function () {
//         submitButton.html(originalContent);
//         submitButton.prop("disabled", false);
//       });
//   });
  


// modal.find("form").on("submit", function (ev) {
//     ev.preventDefault();

//     let submitButton = $(this).find("[type=submit]");
//     let originalContent = submitButton.html();

//     let type = $("[name=_type]").val();
//     let id = $("[name=id]").val();
//     let url = type == "create" ? defaultUrl + "store" : defaultUrl + "update";
//     var formData = new FormData();
//     formData.append("filename", $("#filename").prop("files")[0]);
//     $(this)
//       .serializeArray()
//       .forEach((item) => formData.append(item.name, item.value));

//     $.ajax({ url, data: formData, processData: false, contentType: false, type: "POST" })
//       .done(function (response) {
//         notification("success", "Data berhasil disimpan");
//         modal.modal("hide");
//         table.ajax.reload();
//       })
//       .fail(function (jqXHR) {
//         if (jqXHR && jqXHR.responseJSON && jqXHR.responseJSON.errors) {
//           let errors = jqXHR.responseJSON.errors;
//           for (let field in errors) {
//             let el = $([name=${field}]);
//             el.toggleClass("brc-danger-m2");
//             el.next().text(errors[field]).show();
//             el.prev().toggleClass("text-danger-d1");
//           }
//         }
//       })
//       .always(function () {
//         submitButton.html(originalContent);
//         submitButton.prop("disabled", false);
//       });
//   });


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

function viewBahan (id){
    
    $.ajax({
        url: defaultUrl + "databahan",
        method: 'POST',
        dataType: 'json',
        data: { id: id }, 
        success: function(data) {
            if(data.message){
                //menampilkan pesan dari aksi datacardAction
                console.log("pemberitahuan", data.message,"success");
            }
            if(data.data && data.data.length > 0) {
                for (var i = 0; i < data.data.length; i++) {
                    console.log(data.data[i]);
                    tambahBahan(data.data[i]);
                    
                }
            }
        },
        //menampilkan pesan kesalahan
        error: function(xhr, status, error) {
            console.error('Error:', error);
            console.error('Status:', status);
            console.error('XHR Response:', xhr.responseText);
            // Tampilkan pesan kesalahan atau tindakan lain yang sesuai
        }
    });
    //membuat kartu atau card 
    
}

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
                data: "gambar",
                render: function (data, type, row) {
                  if (type === "display" && data) {
                    return `<img src="{{url('UploadImage')}}/` + data + '" width="150px" height="100px" />';
                  } else {
                    return data;
                  }
                },
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


//fungsi tampil kategori
function dataUntung (){
    $.ajax({
        url: defaultUrl + "datauntung", // Ganti dengan URL aksi yang sesuai
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            if(data.data && data.data.length > 0) {
                for (var i = 0; i < data.data.length; i++) {
                    createUntung(data.data[i]);
                }
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            console.error('Status:', status);
            console.error('XHR Response:', xhr.responseText)
        }
    });
    //membuat kartu/card
    function createUntung(data) {

        var untung = $(`<input type="hidden" name="untung" value="${data.margin}">`);

        $('#komposisi').after(untung);
        console.log('DICETAK BOR');

    }
    
}



//form action




function tambahBahan(datanya){
    if(datanya != 0 && datanya != '' && datanya != null){
        console.log(datanya.bahan_id);
        console.log(datanya.bahan);
        var siu = { data: { id: datanya.bahan_id, text : datanya.bahan, jumlah : datanya.jumlah_bahan , harga : datanya.harga_bahan} }
        console.log(siu);
    var tr = $("<tr></tr>");
    var tdBahan = $(`<td></td>`);
    var bahan = $(`<select style="width: 100%;" name="bahan[]" class="select2 select2bahan" required><option value='${datanya.bahan_id}'>${datanya.bahan}</option></select>`); // .select2("trigger", "select", { data: { id: datanya.bahan_id } });
    var tdJumlah = $(`<td></td>`);
    var jumlah = $(`<input style="width: 100%;" type="number" name="jumlah[]" | value="${datanya.jumlah}" required>`);
    var tdTotal = $(`<td></td>`);
    var total = $(`<input style="width: 100%;" type="text" id="total" name="total[]" value="${datanya.harga}" disabled>`);
    var aksi = $(`<td><b style=" width: 80%;" id="kurang" class="btn btn-danger"><i class="fas fa-minus"></i></b></td>`);
    }else{
        console.log('tambah bro');
        var tr = $("<tr></tr>");
        var tdBahan = $(`<td></td>`);
        var bahan = $(`<select style="width: 100%;" name="bahan[]" class="select2 select2bahan" required></select>`);
        var tdJumlah = $(`<td></td>`);
        var jumlah = $(`<input style="width: 100%;" type="number" name="jumlah[]" | value="1" required>`);
        var tdTotal = $(`<td></td>`);
        var total = $(`<input style="width: 100%;" type="text" id="total" name="total[]"  disabled>`);
        var aksi = $(`<td><b style=" width: 80%;" id="kurang" class="btn btn-danger"><i class="fas fa-minus"></i></b></td>`);
    }

    //mengambil data option yang dipilih
    bahan.on('change', function() {
        var selectedData = $(this).select2('data')[0];
        bahanHarga = selectedData.harga / selectedData.jumlah;
        digunakan = jumlah.val();
        
        $(this).attr('data-harga', bahanHarga);
        console.log('DATANYA BRO '+ bahanHarga);
        total.val(bahanHarga * digunakan);
        hPP();
    });
    //------------------------------------
    //mengambil data jumlah digunakan
    jumlah.on('input', function(){
        var digunakan = $(this).val();
        var dataBahan = bahan.data('harga');

        subtotal = dataBahan * digunakan;
        total.val(subtotal);
        hPP();
    });
    //-------------------------------
    //menghapus tr
    aksi.on(`click`,function(){
        tr.remove();
        hPP();

    });
    //--------------------------------
    
    tdBahan.append(bahan);
    tdJumlah.append(jumlah);
    tdTotal.append(total);
    tr.append(tdBahan);
    tr.append(tdJumlah);
    tr.append(tdTotal);
    tr.append(aksi);
    // Masukkan baris baru setelah baris dengan ID 'komposisi'
    $('#komposisi').after(tr);

    
    // Inisialisasi Select2 pada elemen yang baru
    select2data();
}

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


function hPP(){
    var hpp = 0;
    var keuntungan = parseFloat($(`input[name="untung"]`).val());
    console.log(keuntungan)
    Array.from($(`form [name="total[]"]`)).forEach(function(el){
        total = Number(el.value);
        hpp += total;
    });
    
    var hargaJual = hpp * keuntungan + hpp;

    $(`form [name="hpp"]`).val(hpp);
    $(`form [name="hargajual"]`).val(hargaJual);
}




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



// <a href="#" class="btn mr-1 btn-warning mb-2 radius-2"id="btn-edit">
// <i class="fa fa-pencil-alt text-140 align-text-bottom mr-2"></i>
// Edit
// </a>