{% extends 'template/dashboard.volt' %}
{% block title %}Kasir
{% endblock %}
{% block content %}
	
	<div class="page-content container-fluid container-plus">
		<div class="row">
			<div class="col-12 p-0 pl-3 pr-3">
				<div class="ccard d-flex flex-column mx-1 mb-4 px-2 py-1">
					<div class="flex-grow-1 mb-1 ml-3">
						<div class="row">
							<div class="col-10">
								<div class="text-nowrap text-140 font-bold text-dark-l2 mt-2" id="title_dashboard">
									MENU
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="page-content col-8">
						<div class="card ccard mx-auto" style="width: 98%; position: sticky;">
							<div class="card-header pb-1 align-middle border-t-3 brc-primary-tp3" style="border-top-left-radius: 0.4rem;
											border-top-right-radius: 0.4rem;border-bottom: 1px solid #e0e5e8 !important;">

								<div class="page-kategori page-tools mt-3 mt-sm-0 mb-sm-n1 card-toolbar">
									<!-- tombol netral filter -->
									<button id="unfilter" class="btn mr-1 kategori mb-2 radius-2" data-toggle="modal" style="float:right">
										<i class='fa fa-align-justify text-110 align-text-bottom mr-2'></i>
										<b>Semua</b>
									</button>
									<!-- CATEGORI DARI AJAX KATEGORI -->

								</div>
								<div class="page-filter">
									<input type="text" name="filter" id="">
								</div>
							</div>

							<div class="card-body bg-light p-3">
								<div class="row">
									<div class="col-md-12">
										<div class="table-responsive-md">

											<div id="card-field" class="card-field row p-3">
												
												{# hasil dari ajax cardata disini #}
											</div>
										</div>

									</div>
								</div>
							</div>

						</div>
					</div>

					{# ________________________________________________________________________________________________ #}
					<div class="page-content col-4 ">
						<div class="card card mx-auto border-success" style="width: 98%; position: sticky;">
							<div class="card-header pb-1 align-middle border-t-3	 bg-white" style="border-top-left-radius: 0.4rem;
											border-top-right-radius: 0.4rem;border-bottom: 1px solid #e0e5e8 !important;">
								<h4><b>Order</b></h4>
								
							</div>

							<div class="card-body p-2 ">
								<div class="row">
									<div class="col-md-12 ">
										
										{# --------------------------------------------------------------- #}
										
										<div class="cart container-fluid p-1" >
											<style>
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
													color: #ef6768;
												}
												.kategori{
													border: 1px solid #f05a59;
												}
												.kategori i , .kategori b {
													color:#f05a59;
												}

												.img-wrapper img {
													max-width: 100%;
													max-height: 100%;
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
												.qty-box input{
													width: 50%;
													border: none;
													background-color: transparent;
													padding: 4px;
													text-align: center;
												}
												

											</style>
											<form action="" id="formForm" class="container-fluid">

			
											 <div id="order" class="container-fluid p-1 bg-danger">
											 </div>

											
											

											

											<div class="payment border border-dark">
												<table border="2">
													<tr id="voucher">
														<td><h5><b>Voucher</b></h5></td>
														<td><input type="text"  class="container-fluid" name="voucher" id="voucher"></td>
													</tr>
													<input type="hidden" name="diskon" value="0">
													<input type="hidden" id="potongan" name="potongan" value="0">

													<tr class="diskon">

													</tr>
													<tr>
														<td><h5><b>Total</b></h5></td>
														<td><input type="text" name="total" id="total" value="0" disabled required></td>
													</tr>
													<tr>
														<td><h5><b>Bayar</b></h5></td>
														<td><input type="text" name="tunai" id="tunai" value="0" required></td>
													</tr>
													<tr>
														<td><h5><b>Kembalian</b></h5></td>
														<td><input type="text" name="kembalian" id="kembalian" value="0" disabled required></td>
													</tr>
													<tr>
														<td><button name='submit' id="submit"><h5><b>OKE</b></h5></button></td>
														<td><button type="reset" id="btn-batal"><h5><b>BATAL</b></h5></button></td>
													</tr>
												</table>
											</div>
										</form>
										</div>
										{# ============================================================== #}
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>

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
