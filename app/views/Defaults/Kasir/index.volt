{% extends 'template/dashboard.volt' %}
{% block title %}Kasir
{% endblock %}
{% block content %}

	<style>
		.cardp{
			max-height: max-content;
		}
		.card-data-img-wrapper{
			min-height: 144px;
			max-height: 144px;
			display: flex;
			align-items: center;
			justify-content: center;
			
		}
		.card-data-img-wrapper img{
			margin: 15px;
			padding: 15px;
		}
		.produk-data{
			max-height: 82px;
			min-height: 81px;
		}
		.produk-left{
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.select2-container--bootstrap4 .select2-selection--single {
													height: calc(3em) !important;
												}
/* CSS */
.price {
	float: right;
}
*{
	box-sizing: border-box;
	  font-family: "Roboto", Arial, sans-serif;
}
.order{
	text-align: center;
	margin: 10px;
}
.produk {
    border-radius: 10px;
    cursor: pointer;
}
.price{
	color: #765827;
}
.kategori{
	border: 1px solid #f05a59;
}
.kategori i , .kategori b {
	color:#f05a59;
}
.img-wrapper img {
	/* max-width: 100%;
	max-height: 100%; */
}
.kartu-wrapper{
	
	margin: 10px;
	padding: 10px;
}

.kartu{
	max-width: 342px;	
	padding: 10px;
}
.kartu-left, .kartu-middle,  .kartu-right{
	max-width: 342px;
	height: 90px;
	padding: 1;
	box-sizing: border-box;
}
.produk-data {
    position: relative;
    padding: 10px; /* Sesuaikan sesuai kebutuhan */
}
.produk-right{
	padding: 10px;
}
.btn-x {
    position: absolute;
    top: 0;
    right: 0;
    margin: 5px;
    /* background-c	olor: red; Sesuaikan warna sesuai kebutuhan */
    color: white;
    border: none;
	width: 9%;
    padding: 1px;
    cursor: pointer;
}
.qty-box .btn {
    font-size: 45%;
    border-radius: 8px; /* Ubah ke nilai yang lebih rendah untuk membuatnya lebih persegi */
    padding: 3px;
}
.qty-box i {
	padding: 0;
	margin: 0;
	/* font-size: 50%; */
}
.produk-price{
	color:#f05a59;
	margin-top: 15px;
}
.qty-box{
	/* background-color: aqua; */
	width: 40%;
	display: flex;
	align-items: center;
	justify-content: center;
	position: absolute;
	margin: 5px;
	right: 0;
	bottom: 10px;
}
.harga{
	text-align: right;
}
.qty-box input{
	width: 50%;
	border: none;
	background-color: transparent;
	padding: 4px;
	text-align: center;
}



	</style>
	<div class="page-content container-fluid container-plus bg-dark">
	<div class="row ">
		<div class="col-8 " style="background-color: #ECE3CE ;">
			
			<div class="content">
				<div class="filter row p-2 bg-secondary" >
					<div class="left col-6 p-2 bg-info">
						<input type="text" name="filter" id="" class="w-100">
					</div>
					<div class="right col-6 p-2 bg-success">
						<div class="page-kategori page-tools mt-3 mt-sm-0 mb-sm-n1 card-toolbar">
																			 <!-- tombol netral filter  -->
								<button id="unfilter" class="btn mr-1 kategori mb-2 radius-2" data-toggle="modal" style="float:right">
									<i class='fa fa-align-justify text-110 align-text-bottom mr-2'></i>
									<b>Semua</b>
								</button>
															 <!-- CATEGORI DARI AJAX KATEGORI  -->
						
								</div>
						</div>
				</div>
				<div class="produk">
					<div id="card-field" class="card-field row p-3">
												{# hasil dari ajax cardata disini #}
					</div>
				</div>
					
			</div>
		</div>
		<div class="col-4 bg-light">
			<div class="title p-2 border-bottom row ">
				<div class="text col-8">
					<h1 class="m-2 u "><b>Cart</b></h1>

				</div>
					
				
			</div>
			<form action="" id="formForm" class=" ">

			
				<div id="order" class="container-fluid overflow-auto" style="min-height: 290px; max-height: 290px;">
				</div>

				<div class="payment border">
					<table border="0" class="w-100 bg-light">
						<tr id="voucher">
							<td><h5><b>Voucher</b></h5></td>
							<td><input type="text"  class="container-fluid bg-none border-none " name="voucher"  id="voucher"></td>
						</tr>
						<input type="hidden" name="diskon" value="0">
						<input type="hidden" id="potongan" name="potongan" value="0">
 
						<tr class="diskon">
 
						</tr>
						<tr>
							<td><h5><b>Total</b></h5></td>
							<td><input type="text" name="total" id="total" value="0" class="w-100 input bg-none border-none harga" disabled required></td>
						</tr>
						<tr>
							<td><h5><b>Bayar</b></h5></td>
							<td><input type="text" name="tunai" id="tunai"  class="w-100 input   harga" required></td>
						</tr>
						<tr>
							<td><h5><b>Kembalian</b></h5></td>
							<td><input type="text" name="kembalian" id="kembalian" value="0" class="w-100 input bg-none border-none  harga" disabled required></td>
						</tr>
						<tr style="text-align: right; " >
							<td colspan="2">
								
								
							</td>
						</tr>
					  
					</table>
					  <div class="kirim p-1">
						 <button name='submit' id="submit" class="btn btn-danger rounded-pill " style=" width:100%;	"><h5><b>OKE</b></h5></button>
						</div>
						<div class="batal p-1">
						 <button type="reset" id="btn-batal" class="btn btn-warning rounded-pill " style=" width:100%;" ><h5><b>BATAL</b></h5></button>
						</div>
						
				</div>
			   </form>
			
		</div>
	</div>	

	</div>


	{# ________________________________________________________________________________________________ #}



	{% endblock %}
{% block inline_script %}
	<script>
		{% include 'Defaults/Kasir/index.js' %}
	</script>
{% endblock %}
