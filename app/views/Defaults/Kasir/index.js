window.defaultUrl = `${baseUrl}kasir/`;



var rupiahFields = [
    "harga",
  ];


$(document).ready(function() {
    let modal = $('#formModal');

//---------------------------------------------------------------------------------------------
viewDatacard();//panggil funsi
//=============================================================================================

    dhar();

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


//---------------------------------------------------------------------------------------------
//index.js
    //funsi mengambil data server melalui permintaan ajax
    function viewDatacard(){
    
        $.ajax({
            url: defaultUrl + "datacard", // Ganti dengan URL aksi yang sesuai
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
                        var cardWrap = createCard(data.data[i]);
                        //tambahkan kartu ke elemen dengan ID
                        $("#card-field").append(cardWrap); //di elemen ID "card-field"
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
        function createCard(data) {
            var cardWrap = $(`<div class='card-wrapper p-2 col-3'  data-card='${JSON.stringify(data)}' ></div>`); //bungkus kartu
            var card = $("<div class='card card-data p-2 bg-warning'></div>"); //kartu
            var cardImgWrap = $("<div class='card-data-img-wrapper'></div>"); //bungkus gambar
            var cardImg = $("<img class='image' src='' alt='Gambar Produk'></img>"); //bungkus gambar
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
    
            

            console.log(data);
            //klik untuk tambah kartu
            cardWrap.on('click',function(){
                console.log('KARTU DI CLICK BRO');
                var selectedCard = $(this).data('card');
                console.log(selectedCard)
                onCardClick(selectedCard);
                console.log('KARTU BERES DI TAMBAHIN BRO');

                
                // var rCard = $('cart').data[selectedCard];
                // return rCard;
            });
            return cardWrap;

        }
        
    }

    //----------------
        //fungsi saat kartu di klik
        var totalHarga= 0;        
        function onCardClick(cardData) {
            cardHarga = parseInt(cardData.harga, 10);
            console.log('MASUK FUNGI ON CARD CLICK');
            console.log(cardData.harga + 'DHARR');
            var cart = $('.cart');
            var existCard = cart.find(`[data-card='${JSON.stringify(cardData)}']`);
            console.log('CEK JIKA ADA KARTU YANG SAMA' + existCard);
            if (existCard.length === 0) {
                totalHarga += cardHarga;
                $("#total").val(totalHarga);
                var newCard = newCreateCard(cardData); // memanggil fungsi cetak kartu
                newCard.attr('data-card', JSON.stringify(cardData)); // menambah atribut pada kartu yang dicetak
                newCard.insertBefore(cart.find('.payment')); // mencetak kartu baru
            } else {
                console.log('KARTUNYA DUPLIKAT BRO');
            }
        }
        
        
        
    //================
    //---------------
    function newCreateCard(data) {
        console.log('MASUK FUNGSI TAMBAH KARTU BARU');
        
        var cardWrap = $(`<div class='card-wrapper container-fluid p-2   row'></div>`); //bungkus kartu
        var card = $("<div class='card card-data container-fluid row p-2 bg-dark'></div>"); //kartu
        var cardImgWrap = $("<div class='card-data-img-wrapper bg-light container-fluid col-4'></div>"); //bungkus gambar
        var cardImg = $("<img class='image' src='' alt='Gambar'></img>"); //bungkus gambar
        var cardBody = $("<div class='card-body  container-fluid card-data-body col-8'></div>");
        var cardTextWrap = $("<div class='card-text-wrapper bg-warning container-fluid'></div>"); // bungkus text
        var cardTitle = $("<h5 class='card-title'></h5>").text(data.nama); //judul 
        var cardCategories = $("<h6 class='card-categories'></h6>").text(data.jumlah); //kategori
        var cardPrice = $("<h5 class='card-title'></h5>").text(formatRupiah(data.harga, "Rp. ")); //harga
        var cardQty = $(`<input type='number' id='qty' name='qty' class='container-fluid' value='1'>`);
        
        cardQty.on('input', function() {
            var qty = $(this).val(); // Ambil nilai kuantitas dari input
        
            // Hitung total harga dengan mengalikan harga per kartu dengan kuantitas
            var totalHarga = cardPrice * qty;
        
            // Perbarui nilai input total
            $("#total").val(totalHarga);
        });

        
        console.log(data);
        
        //pengelompokan kartu
        cardImgWrap.append(cardImg);
        cardTextWrap.append(cardTitle);
        cardTextWrap.append(cardCategories);
        cardTextWrap.append(cardPrice);
        cardTextWrap.append(cardQty);
        cardBody.append(cardTextWrap);
        card.append(cardImgWrap);
        card.append(cardBody);
        cardWrap.append(card);

        
        
        // if(!){}
        console.log('KARTU BARU BERES DIBUAT');
        return cardWrap;

    }


    
    //===============
    //=================================================================================================

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


function dhar(){
    console.log('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
}