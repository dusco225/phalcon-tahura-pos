window.defaultUrl = `${baseUrl}kasir/`;
var diFilter = "";
var newFilter = "";
var kodeVoucher = "";  
var subtotal = ""; 
 
var totalHarga = parseInt(0);

var rupiahFields = [
    "harga",
  ];


$(document).ready(function() {
    let modal = $('#formModal');

    

    viewDataKategori();//panggil fungsi kategori
    viewDatacard();//panggil fungsi card data

// Your debounce function
function debounce(func, delay) {
  let timeout;
  return function () {
    const context = this;
    const args = arguments;
    clearTimeout(timeout);
    timeout = setTimeout(function () {
      func.apply(context, args);
    }, delay);
  };
}

// Your event handler
function handleKeyup() {
  newFilter = $('input[name=filter]').val();
  console.log('FILTER BRAY ' + newFilter);
  viewDatacard(newFilter);
}

// Attach the debounced event handler to the input element
$('input[name=filter]').on('keyup', debounce(handleKeyup, 1000)); // Adjust the delay (in milliseconds) as needed
;
//menghlangkan filter
$('#unfilter').on('click',function(){
            diFilter = '';
            console.log('YANG ININIH BRO: ' + diFilter);
            viewDatacard(diFilter);
        });


//voucher
$('input[name=voucher]').on('keyup insert', function(){
    kodeVoucher = $(this).val() ;
    console.log('VALIDASI VOUCHER BRAY '+ kodeVoucher);
    viewDataVoucher(kodeVoucher);//panggil fungsi voucher
});

    

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



//index.js

//fungsi tampilan kartu

function viewDatacard (filter){
    console.log('MASUK FUNGSI DATA CARD COYY');
    // Menghapus kartu yang ada sebelum menampilkan kartu yang baru
    $("#card-field").empty();

    $.ajax({
        url: defaultUrl + "datacard", // Ganti dengan URL aksi yang sesuai
        method: 'POST',
        dataType: 'json',
        data: {
        diFilter: diFilter,
        newFilter: newFilter, // Kirim diFilter sebagai parameter
        },
        success: function(data) {
            
            // console.log(data); // Menampilkan data dalam konsol
            // Selanjutnya, Anda dapat melakukan apa yang Anda inginkan dengan data ini
            if(data.message){
                //menampilkan pesan dari aksi datacardAction
                console.log("pemberitahuan", data.message,"success");
            }
            if(data.data && data.data.length > 0) {
                for (var i = 0; i < data.data.length; i++) {
                    var cardWrap = createCard(data.data[i]);
                    var filterCard = filter;
                    //tambahkan kartu ke elemen dengan ID
                    $("#card-field").append(cardWrap); //di elemen ID "card-field"
                    console.log('DARI MANA ' + filterCard);
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

    function createCard(data) {
        var cardWrap = $(`<div class='card-wrapper p-2 col-3'  data-card='${JSON.stringify(data)}' ></div>`); //bungkus kartu
        var card = $("<div class='card card-data bg-warning'></div>"); //kartu
        var cardImgWrap = $("<div class='card-data-img-wrapper container-fluid' style='widht:100%;'></div>"); //bungkus gambar
        var cardImg = $(`<img class='image' src='{{ url('assets') }}/image/hua.jpg' style='width: 100%;'alt='Gambar Produk'>`); //bungkus gambar
        var cardBody = $("<div class='card-body card-data-body'></div>");
        var cardTextWrap = $("<div class='card-text-wrapper'></div>"); // bungkus text
        var cardTitle = $("<h5 class='card-title'></h5>").text(data.nama); //judul 
        var cardCategories = $("<h6 class='card-categories'></h6>").text(data.kategori); //kategori
        var cardPrice = $("<h5 class='card-title'></h5>").text(formatRupiah(data.harga, "Rp. ")); //harga
        

        //pengelompokan kartu
        cardImgWrap.append(cardImg);
        cardTextWrap.append(cardTitle);
        cardTextWrap.append(cardCategories);
        cardTextWrap.append(cardPrice);
        cardBody.append(cardTextWrap);
        card.append(cardImgWrap);
        card.append(cardBody);
        cardWrap.append(card);

        // console.log("INI DATANYA COYY"+ data.nama);


        
        //klik untuk tambah kartu
        cardWrap.on('click',function(){
            console.log('KARTU DI CLICK BRO');
            var selectedCard = $(this).data('card');
            console.log(selectedCard);
            onCardClick(selectedCard);
            console.log('KARTU BERES DI TAMBAHIN BRO');   
            // var rCard = $('cart').data[selectedCard];
            // return rCard;
        });

        return cardWrap;

    }
    
    
}


    //fungsi saat kartu di klik
    function onCardClick(cardData) {
        console.log('MASUK FUNGI ON CARD CLICK');
        //tempat kartu mau dicetak
        var cart = $('.cart');
        
         // Mengecek apakah kartu dengan data yang sama sudah ada dalam keranjang
        var existCard = cart.find(`[data-card='${JSON.stringify(cardData)}']`);
        console.log('CEK JIKA ADA KARTU YANG SAMA' + cardData.nama);
        
        //jika tidak ada yang sama 
        if (existCard.length === 0) {
            var newCard = newCreateCard(cardData); // memanggil fungsi cetak kartu
            newCard.attr('data-card', JSON.stringify(cardData)); // menambah atribut pada kartu yang dicetak
            newCard.insertBefore(cart.find('.payment')); // mencetak kartu baru
            console.log(cardData.harga +' Dhar Petir ZIUS');
        } else  //jika ada yang sama
        { 
            console.log('KARTUNYA DUPLIKAT BRO');
        }

        //menumpulkan nilai subtotal
        subTotal = cardData.harga;
        // console.log("SPILL SUB TOTAL BLAY " + subTotal);
        //mentotal semua nilai sub total
         var total = parseInt(); 
        total += subTotal;
        //mengambil nilai diskon dari voucher
        diskon= parseInt();
        // totalPrice(total, diskon);

        //total harga semua produk dan ju
    }

    
    
    
    
//================
//---------------





function newCreateCard(data) {
    
    // console.log('MASUK FUNGSI TAMBAH KARTU BARU');
    
    var cardWrap = $(`<div class='card-wrapper container-fluid p-1'></div>`); //bungkus kartu
    var card = $("<div class='card card-data container-fluid p-1 bg-dark'></div>"); //kartu
    var cardBody = $("<div class='card-body  container-fluid card-data-body'></div>");
    var cardTextWrap = $("<div class='card-text-wrapper bg-warning container-fluid'></div>"); // bungkus text
    var cardTitle = $("<h5 class='card-title'></h5>").text(data.nama); //judul 
    var cardCategories = $("<h6 class='card-categories'></h6>").text(data.jumlah); //kategori
    var cardPrice = $("<h5 class='card-price'></h5>").text(formatRupiah(data.harga, "Rp. ")); //harga
    var cardQty = $(`<input type='number' id='qty' name='qty' class='container-fluid'>`).val('');

    var cardSubTotal = $(`<input type='hidden' name='subtotal'>`); //harga

    
    cardQty.on('input', function() {
        var qty = parseInt($(this).val());
        subTotal = data.harga * qty; 
        // var subtotalInput = $(this).closest('.card-wrapper').find('input[name=subtotal]');
        cardSubTotal.val(subTotal);
        // console.log(subTotal); 
        totalHarga();

    });

    totalKeranjang += parseInt(cardSubTotal);
    $('#total').val(totalKeranjang);


    
    // console.log(data);
    
    //pengelompokan kartu
    cardTextWrap.append(cardTitle);
    cardTextWrap.append(cardCategories);
    cardTextWrap.append(cardPrice);
    cardTextWrap.append(cardQty);
    cardTextWrap.append(cardSubTotal);
    cardBody.append(cardTextWrap);
    card.append(cardBody);
    cardWrap.append(card);69

    
    
    
    // console.log('KARTU BARU BERES DIBUAT');
    return cardWrap;

}

function totalHarga() {
    // Array.from($('form [name=subtotal]')).reduce((acc, i) => acc + Number(i.value), 0)
    // Array.from($('form [name=subtotal]')).reduce((total, el) => total + Number(el.value), 0)
    var total = 0;
    Array.from($('form [name=subtotal]')).forEach(function(el) {
        var subtotal = Number(el.value);
        total += subtotal;
    });
}










//fungsi tampil kategori
function viewDataKategori (){
    console.log('MASUK DUNGSI KATeGOrI COY');
    $.ajax({
        url: defaultUrl + "datakategori", // Ganti dengan URL aksi yang sesuai
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            // console.log(data); // Menampilkan data dalam konsol
            // Selanjutnya, Anda dapat melakukan apa yang Anda inginkan dengan data ini
            if(data.message){
                //menampilkan pesan dari aksi datacardAction
                console.log("pemberitahuan", data.message,"success");
            }
            if(data.data && data.data.length > 0) {
                for (var i = 0; i < data.data.length; i++) {
                    var filterKategori = createFilter(data.data[i]);
                    //tambahkan kartu ke elemen dengan ID
                    $(".page-kategori").append(filterKategori); //di elemen ID "card-field"
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
    //membuat kartu/card
    function createFilter(data) {
        // ----
        var tombol = $(`<button class="btn mr-1 btn-info mb-2 radius-2" data-toggle="modal" style="float:right"></button`);
        var icon = $(`<i class='fa ${data.icon} text-110 align-text-bottom mr-2'></i>`);
        var tebal = $(`<b></b>`).text(data.nama);
    
        // ===
        //pengelompokan kartu
        
        tombol.append(icon);
        tombol.append(tebal);
        console.log("NAMA KATEGORI: " + data.nama)

        tombol.on('click',function(){
            diFilter = data.nama.toLowerCase();
            console.log('YANG ININIH BRO: ' + diFilter);
            viewDatacard(diFilter);
        });
        

        // console.log(data);
        //klik untuk tambah kartu
        
        return tombol;

    }
    
}


//fungi validasi voucher
function viewDataVoucher (valid){
    $(".diskon").empty();
    console.log('MASUK DUNGSI VOUCHER COYY');
    $.ajax({
        url: defaultUrl + "datavoucher", // Ganti dengan URL aksi yang sesuai
        method: 'POST',
        dataType: 'json',
        data:{
            kodeVoucher: kodeVoucher,

        },
        success: function(data) {
            // console.log(data); // Menampilkan data dalam konsol
            
            if(data.message){
                //menampilkan pesan dari aksi datacardAction
                console.log("pemberitahuan", data.message,"success");
            }
            if(data.data && data.data.length > 0) {
                for (var i = 0; i < data.data.length; i++) {
                    var voucher = createVoucher(data.data[i]);
                    var validasi = valid;
                    //tambahkan kartu ke elemen dengan ID
                    console.log(`MASUK CETAK VOUCHER NIH` + voucher)
                    $(".diskon").append(voucher); //di elemen ID "card-field"
                    console.log('VALID GAK NIH' + validasi);
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
    //membuat card
    function createVoucher(data) {
        var tr = $('.diskon');
        var status = $("<td class='border p-1 border-dark'></td>").html('<h5><b>' + data.status + '</b></h5>');
        

        if(data.status == 'Aktif'){
            var persen = data.diskon * 100;
            var diskon = $("<td class='border p-1 border-dark'></td>").html('<h5><b>' + persen + '%</b></h5');
            tr.append(status);
            tr.append(diskon);
            return tr;

        }else{
            var valid = $("<td colspan='3' align='center' class='border p-1 border-dark'></td>").html('<h5><b>' + 'YAH GAK AKTIF' + '</b></h5>');
            tr.append(valid);
            return tr;
        }
        // Menggabungkan elemen-elemen ke dalam baris
            
    }
    
    
    
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


