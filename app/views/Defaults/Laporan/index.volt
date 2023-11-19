{% extends 'template/dashboard.volt' %}
{% block title %}Laporan Transaksi
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
 form table{
	box-sizing: border-box;
 }

</style>

<div class="page-content" >
	<div class="col-12 p-0 pl-3 pr-3">
		<div class="ccard d-flex flex-column mx-1 mb-4 px-2 py-1">
			<div class="flex-grow-1 mb-1 ml-3">
				<div class="row">
					<div class="col-10">
						<div class="text-nowrap text-140 font-bold text-dark-l2 mt-2" id="title_dashboard">
							Laporan Transaksi
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="card ccard mx-auto" style="width: 98%; position: sticky;">
				<div class="card-header pb-1 align-middle border-t-3 brc-primary-tp3" style="border-top-left-radius: 0.4rem;
				border-top-right-radius: 0.4rem;border-bottom: 1px solid #e0e5e8 !important;" >

					<h4 class="card-title text-dark-m3 mt-2">

					</h4>
					<div class="page-tools mt-3 mt-sm-0 mb-sm-n1 card-toolbar">
					
						<a href="#" class="btn mr-1 btn-success mb-2 radius-2" id="btn-refresh-data">
							<i class="fa fa-sync text-110 align-text-bottom mr-2"></i>
							Perbarui
						</a>
					
						<a href="#" class="btn btn-danger mr-1 mb-2 radius-2 btn-detail" id="btn-pdf" >
							<i class="fa fa-file-alt text-140 align-text-bottom mr-2"></i>
							Download
						</a>
					
					</div>
				</div>
				 
					<!-- Modal Search -->
					
						 

							<!-- Modal content-->
							
								
								<div class="form-filter w-50 border">
									<h4>Filter Laporan</h4>

									<form class="form-horizontal w-100 " id="form-filter">
										
										<div class="input-group mb-2 input-filter">
											<div class="input-group-prepend" style="width : 10% !important">
												<span class="input-group-text">
													<input type="checkbox" class="ace-switch">
												</span>
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text">
													Nama Kasir
												</span>
											</div>
											<input type="text" name="nama_kasir" id="nama_kasir" disabled >
											<select type="text" id="kasir" name="kasir" class="select2 select2kasir" disabled=""></select>
										</div>
										
										<div class="input-group mb-2 input-filter">
											<div class="input-group-prepend" style="width : 10% !important">
												<span class="input-group-text">
													<input type="checkbox" class="ace-switch">
												</span>
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text">
													Tanggal
												</span>
											</div>
											<input type="date" name="date_from" class="form-control" disabled="">
											<div style="width: 7%;" class="input-group-prepend ">
												<span class="input-group-text">
													s.d
												</span>
											</div>
											<input type="date" name="date_until" class="form-control" disabled="" required>
										</div>

										

										<div class="input-group mb-2 input-filter">
											<div class="input-group-prepend" style="width : 10% !important">
												<span class="input-group-text">
													<input type="checkbox" class="ace-switch">
												</span>
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text">
													Transaksi Id
												</span>
											</div>
											<select type="text" id="transaksi" name="transaksi" class="select2 select2transaksi" disabled=""></select>
										</div>
									</form>
									<div class="tombol" style="display: flex; justify-content: right; align-items: center;">
										<button type="button" class="btn btn-warning text-120 radius-2" id="btn-reset">Reset</button>
										<button type="button" class="btn btn-default submit-filter text-120 radius-2" data-dismiss="modal">Cari Data</button>
									</div>
								</div>
								
							
					
				
			
				<div class="card-body p-3">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive-md">
								<table id="datatable" class="table table-bordered border-0 w-100 table-striped-secondary text-dark-m1 mb-0">
									<thead>
										<tr class="bgc-info text-white text-center brc-black-tp10">
											<th style="vertical-align: middle;" >#</th>
											<th style="vertical-align: middle;">Tanggal</th>
											<th style="vertical-align: middle;">Id Transaksi</th>
											<th style="vertical-align: middle;">Kode Kasir</th>
											<th style="vertical-align: middle;">Produk</th>
											<th style="vertical-align: middle;">Jumlah</th>
											<th style="vertical-align: middle;">Harga</th>
											<th style="vertical-align: middle;">Sub Total</th>
											<th style="vertical-align: middle;">Kode Voucher</th>
											<th style="vertical-align: middle;">Diskon</th>
											<th style="vertical-align: middle;">Potongan</th>
											<th style="vertical-align: middle;">Total</th>

										</tr>
									</thead>
									<tbody></tbody>
								
								</table>
							</div>
						
						</div>
					</div>
				</div>
			
			</div>
	</div>
</div>

	

	<!-- Modal Search -->
	<div id="filterModal" class="modal fade" role="dialog">
		<div class="modal-dialog radius-4">

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
	{% include 'Defaults/Laporan/index.js' %}
</script>
{% endblock %}

