{% extends 'template/dashboard.volt' %}
{% block title %}Master Voucher
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
	<div class="page-content">
		<div class="card ccard mx-auto" style="width: 98%; position: sticky;">
			<div class="card-header pb-1 align-middle border-t-3 brc-primary-tp3" style="border-top-left-radius: 0.4rem;
							border-top-right-radius: 0.4rem;border-bottom: 1px solid #e0e5e8 !important;">
				<h4 class="card-title text-dark-m3 mt-2">
					Master - Voucher
				</h4>
				<div class="page-tools mt-3 mt-sm-0 mb-sm-n1 card-toolbar">

					<button class="btn mr-1 btn-info mb-2 radius-2" data-toggle="modal" style="float:right" id="btn-search">
						<i class="fa fa-search text-110 align-text-bottom mr-2"></i>
						Pencarian
					</button>

					<a href="#" class="btn mr-1 btn-success mb-2 radius-2" id="btn-refresh-data">
						<i class="fa fa-sync text-110 align-text-bottom mr-2"></i>
						Perbarui
					</a>
					<a href="#" class="btn mr-1 btn-primary mb-2 radius-2" id="btn-add">
						<i class="fa fa-plus text-110 align-text-bottom mr-2"></i>
						Tambah
					</a>

					<a href="#" class="btn mr-1 btn-warning mb-2 radius-2" id="btn-edit">
						<i class="fa fa-pencil-alt text-140 align-text-bottom mr-2"></i>
						Edit
					</a>
					<a href="#" class="btn mr-1 btn-danger mb-2 radius-2" id="btn-delete">
						<i class="fa fa-trash-alt text-140 align-text-bottom mr-2"></i>
						Hapus
					</a>
				</div>
			</div>

			<div class="card-body p-3">
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive-md">
							<table id="datatable" class="table table-bordered border-0 w-100 table-striped-secondary text-dark-m1 mb-0">
								<thead>
									<tr class="bgc-info text-white text-center brc-black-tp10">
										<th style="vertical-align: middle;">#</th>
										<th style="vertical-align: middle;">Kode</th>
										<th style="vertical-align: middle;">Diskon</th>
										<th style="vertical-align: middle;">Tersedia</th>
										<th style="vertical-align: middle;">Dari</th>
										<th style="vertical-align: middle;">Sampai</th>
										<th style="vertical-align: middle;">status</th>
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

	<!-- Modal Form -->
	<div id="formModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="formModalLabel" aria-hidden="true">
		<div class="modal-dialog radius-4">

			<!-- Modal content-->
			<div class="modal-content radius-4">
				<div class="modal-header bgc-primary radius-t-4">
					<h4 class="modal-title text-white">
						<i class="fa fa-list text-white"></i>&nbsp;&nbsp; Form - Voucher</h4>
					<button type="button" class="close text-white" data-dismiss="modal">&times;</button>
				</div>
				<form class="form-horizontal" action="javascript:;">
					<div class="modal-body">
						<input type="hidden" name="_type" value="create">
						<input type="hidden" name="id" value="">

                   

                        <div class="row form-group">
                            <div class="col-sm-12" style="margin-bottom : 5px;">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="width: 150px;">kode</span>
                                    </div>
                                    <input type="text" id="kode" name="kode" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row form-group">
                            <div class="col-sm-12" style="margin-bottom : 5px;">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="width: 150px;">Diskon</span>
                                    </div>
                                    <input type="text" id="diskon" name="diskon" class="form-control" required>
                                </div>
                            </div>
                        </div>

						<div class="row form-group">
                            <div class="col-sm-12" style="margin-bottom : 5px;">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="width: 150px;">Jumlah</span>
                                    </div>
                                    <input type="text" id="qty" name="qty" class="form-control" required>
                                </div>
                            </div>
                        </div>


                        <div class="row form-group">
                            <div class="col-sm-12" style="margin-bottom : 5px;">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="width: 150px;">Dari</span>
                                    </div>
                                    <input type="date" id="active_at" name="active_at" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-sm-12" style="margin-bottom : 5px;">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" style="width: 150px;">Sampai</span>
                                    </div>
                                    <input type="date" id="expired_at" name="expired_at" class="form-control" required>
                                </div>
                            </div>
                        </div>

					</div>
					<div class="modal-footer  radius-b-4">
						<button type="button" class="btn btn-danger px-4 radius-2" data-dismiss="modal">
							<i class="fas fa-times"></i>
							Tutup
						</button>
						<button type="submit" class="btn btn-success radius-2">
							<i class="fas fa-save"></i>
							Simpan
						</button>
					</div>
				</form>
			</div>

		</div>
	</div>

	<!-- Modal Search -->
	<div id="filterModal" class="modal fade" role="dialog">
		<div
			class="modal-dialog radius-4">

			<!-- Modal content-->
			<div class="modal-content radius-4">
				<div class="modal-header bgc-primary radius-t-4">
					<h4 class="modal-title text-white">
						<i class="fa fa-search text-white"></i>&nbsp;&nbsp; Filter - Voucher</h4>
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
									Statis
								</span>
							</div>
							<input type="text" name="status" class="form-control" disabled="">
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
		{% include 'Defaults/Master/Voucher/index.js' %}</script>
{% endblock %}

