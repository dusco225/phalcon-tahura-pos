window.defaultUrl = `${baseUrl}/master/bahan/`;
var table;
var card;
var rupiahFields = [
    "harga",
  ];


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

    $('#btn-add').click(function() {
        modal.find('input[name=nama]').val('');
        modal.find('input[name=jumlah]').val('');
        modal.find("select[name=satuan_id]").val('').trigger('change');
        modal.find('input[name=harga]').val('');
        modal.find('input[name=_type]').val('create');
        resetErrors();
        $('#formModal').modal('show')
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
            modal.find('input[name=jumlah').val(selected.jumlah);
            $("select[name=satuan]").select2("trigger", "select", { data: { id: selected.id_satuan, text : selected.nama_satuan} });
            modal.find('input[name=harga').val(selected.harga);
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

    modal.find('form').on('submit', function(ev) {
        ev.preventDefault();
        rupiahFields.forEach(function (field) {
            var element = document.getElementById(field);
            var value = element.value.replace(/[^0-9]/g, ""); // Remove non-numeric characters
            element.value = value;
          });
        let submitButton = $(this).find('[type=submit]');
        let originalContent = submitButton.html();
        submitButton.html('<i class="fa fa-spin fa-spinner"></i> Menyimpan...');
        submitButton.prop('disabled', true);

        let type = $('[name=_type]').val();
        let id = $('[name=id]').val();
        let url = type == 'create' ?
            defaultUrl + "store" :
            (defaultUrl + "update");

        $.post(url, $(this).serialize())
            .done(function(response) {
                notification('success', "Data berhasil disimpan");
                modal.modal('hide');
                table.ajax.reload();
            })
            .fail(function(jqXHR) {
                if (jqXHR && jqXHR.responseJSON && jqXHR.responseJSON.errors) {
                    let errors = jqXHR.responseJSON.errors;
                    for (let field in errors) {
                        let el = $(`[name=${field}]`);
                        el.toggleClass('brc-danger-m2');
                        el.next().text(errors[field]).show();
                        el.prev().toggleClass('text-danger-d1');
                    }
                }
            })
            .always(function() {
                submitButton.html(originalContent);
                submitButton.prop('disabled', false);
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
                data: 'jumlah'
            },
            {
                data: 'nama_satuan'
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
                console.log(data);
                $("#card").html(data);
                $("#card").text(data);
                // $("#card").write(data);
                $("#card").append("<p>",data.id,"</p>");
                console.log(data);
                $("#card").append(data.nama,`<div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
              </div>`);
                $("#card").text(JSON.stringify(data));

                // data.serializeArray()


                // var texts = data.map(function(item) {
                //     return item.nama + " - " + item.harga;
                // });
                
                // $("#card").html(texts.join("<br>"));
                
                // var isi = "";
                // data.forEach(function(item) {
                //     isi += item.nama + " - " + item.harga + "<br>";
                // });
                // $("#card").text(isi);



               //--------------------------------------------------------------------
            //    function(){
            //    var text = "";

            //     data.forEach(function(data) {
            //         text += item.nama + " - " + item.harga + "<br>";
            //     });

            //     $("#card").html(text);
            // }
            //==================================================================
            //-----------------------------------------------------------------
            //    $(data).serializeArray().forEach((data) => $("#card").text(data.nama,data.harga));
            //=========================================================================

               //---------------------------------------------------
            //    var formData = new FormData();
            //    formData.append("filename", $("#filename").prop("files")[0]);
            //    $(this)
            //      .serializeArray()
            //      .forEach((item) => formData.append(item.name, item.value));
               //-----------------------------------------------------
            },

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

//------------------------
function viewCard() {
    card = {
        show: function () {
            $("#card-field").html(""); // Perhatikan penggunaan tanda "#" untuk ID elemen
            $.ajax({
                url: defaultUrl + "datatable",
                type: "post",
                // data: {}
                data: function (d) {
                    var formData = $("#form-filter").serializeArray();
                    $.each(formData, function (key, val) { // Menggunakan variabel "val" dalam loop
                        d[val.name] = val.value;
                        $("#card-field").append(`
                            <div class="card-wrapper col-3 p-3 m-3 bg-dark">
                                <div class="card p-3 m-3" style="width: 18rem;">
                                    <img id="gambar" src="..." class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 id="nama_produk" class="card-title">${val.nama}</h5> <!-- Menggunakan "val.nama" untuk mengakses data -->
                                        <p id="kategori" class="card-text">${val.jumlah}</p>
                                        <p id="harga" class="card-text">${val.nama_satuan}</p> <!-- Menggunakan "val.nama_satuan" untuk mengakses data -->
                                    </div>
                                </div>
                            </div>
                        `);console.log(val.nama);
                    });
                } 
            });
        } 
    }
}

viewCard();

//=======================
//''''''''''''''
// $(document).ready(function(){
//     var app = {
//     show: function(){
//         $("tbody").html("")
//         $.ajax({
//             url: 'data.php',
//             method : 'POST',
//             data: {type: 'tampil'},
//             success: function(response){
    //                 var todos = JSON.parse(response);
    // // todos.forEach(function(value, index){
//                     $("tbody").append(`
//                     <tr>
//                         <td>${value.title}</td>
//                         <td>${value.body}</td>
//                         <td>${value.created_at}</td>
//                     </tr>`);	
//                 })
//             }
//         })	
//     }
//     }
//     })
//'''''''''''''''''
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

function select2data(){
    $('.select2produk').select2({
        allowClear: true,
        theme: "bootstrap4",
        width: 'auto',
        ajax: {
            url: "{{ url('panel/referensi/getProduk') }}",
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

    $('.select2satuan').select2({
        allowClear: true,
        theme: "bootstrap4",
        width: 'auto',
        ajax: {
            url: "{{ url('panel/referensi/getSatuan') }}",
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