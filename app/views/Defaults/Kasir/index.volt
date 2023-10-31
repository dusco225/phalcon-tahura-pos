{% extends 'template/dashboard.volt' %}
{% block title %}Master  Bahan
{% endblock %}
{% block content %}
	<style>
		.select2-container--bootstrap4 .select2-selection--single {
			height: calc(3em) !important;
		}
		/* CSS */
		.price {
			float: right;
		}
	</style>
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

								<div class="page-tools mt-3 mt-sm-0 mb-sm-n1 card-toolbar">

									<button class="btn mr-1 btn-info mb-2 radius-2" data-toggle="modal" style="float:right" id="btn-search">
										<i class="fa fa-search text-110 align-text-bottom mr-2"></i>
										Makanan
									</button>

									<button class="btn mr-1 btn-info mb-2 radius-2" data-toggle="modal" style="float:right" id="btn-search">
										<i class="fa fa-search text-110 align-text-bottom mr-2"></i>
										Minuman
									</button>

									<button class="btn mr-1 btn-info mb-2 radius-2" data-toggle="modal" style="float:right" id="btn-search">
										<i class="fa fa-search text-110 align-text-bottom mr-2"></i>
										Desert
									</button>

								</div>
							</div>

							<div class="card-body p-3">
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
					<div class="page-content col-4 h-10000">
						<div class="card ccard mx-auto" style="width: 98%; position: sticky;">
							<div class="card-header pb-1 align-middle border-t-3 brc-primary-tp3" style="border-top-left-radius: 0.4rem;
											border-top-right-radius: 0.4rem;border-bottom: 1px solid #e0e5e8 !important;">
								<h4><b>Keranjang</b></h4>
								

							</div>

							<div class="card-body p-5">
								<div class="row">
									<div class="col-md-12 ">
										{# --------------------------------------------------------------- #}
										<div class="cart container-fluid p-2" style" width : 100px;">
											<div>
												
											</div>
											<div class="payment">
												voucher<input type="number" name="" id="">
												<input type="number" name="" id="">
												total<input type="number" name="" id="">
												<button>Kirim</button>
											</div>
										</div>
										{# =============================================================== #}
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


	<!-- Modal Search -->
	<div id="filterModal" class="modal fade" role="dialog">
		<div
			class="modal-dialog radius-4">

			<!-- Modal content-->
			<div class="modal-content radius-4">
				<div class="modal-header bgc-primary radius-t-4">
					<h4 class="modal-title text-white">
						<i class="fa fa-search text-white"></i>&nbsp;&nbsp; Pencarian - Barang</h4>
					<button type="button" class="close text-white" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<form class="form-horizontal" id="form-filter">

						<div class="input-group mb-2 input-filter">
							<div class="input-group-prepend" style="width : 10% !important">
								<span class="input-group-text">
									<input type="checkbox" class="ace-switch">
								</span>
							</div>
							<div class="input-group-prepend">
								<span class="input-group-text">
									Kode
								</span>
							</div>
							<input type="text" name="search_kode" class="form-control" disabled="">
						</div>

						<div class="input-group mb-2 input-filter">
							<div class="input-group-prepend" style="width : 10% !important">
								<span class="input-group-text">
									<input type="checkbox" class="ace-switch">
								</span>
							</div>
							<div class="input-group-prepend">
								<span class="input-group-text">
									Nama
								</span>
							</div>
							<input type="text" name="search_nama" class="form-control" disabled="">
						</div>

						<div class="input-group mb-2 input-filter">
							<div class="input-group-prepend" style="width : 10% !important">
								<span class="input-group-text">
									<input type="checkbox" class="ace-switch">
								</span>
							</div>
							<div class="input-group-prepend">
								<span class="input-group-text">
									Kategori
								</span>
							</div>
							<select type="text" id="kategori_id_search" name="kategori_id_search" class="select2 select2kategori" disabled=""></select>
						</div>


					</form>
				</div>
				<div class="modal-footer radius-b-4">
					<button type="button" class="btn btn-default submit-filter text-120 radius-2" data-dismiss="modal">Cari Data</button>
				</div>
			</div>
		</div>
	</div>
{% endblock %}
{% block inline_script %}
	<script>
		{% include 'Defaults/Kasir/index.js' %}</script>
{% endblock %}
