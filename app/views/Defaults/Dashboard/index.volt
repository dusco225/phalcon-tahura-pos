{% extends 'template/dashboard.volt' %} {% block title %} Dashboard {% endblock %} {% block content %}
<style>
	*{
		/* box-sizing: border-box; */
	}
	input.ace-switch.ace-switch-onoff::before {
		padding-right: 0.5rem;
		content: "TIDAK";
	}

	input.ace-switch.ace-switch-onoff:checked::before {
		content: "YA";
	}

	input.ace-switch.input-lg {
		width: 5rem;
	}

	.small-card {
		/* Blue 1 */

		background: #2F80ED;
		/* Gray 5 */

		border: 1px solid #E0E0E0;
		box-sizing: border-box;
		border-radius: 15px;
		margin-top: 10px;
	}

	.small-card-secondary {
		/* Blue 1 */
		background: #29B6F6;
		/* Gray 5 */
		border: 1px solid #E0E0E0;
		box-sizing: border-box;
		border-radius: 15px;
		margin-top: 10px;
	}

	.title-text {
		font-style: normal;
		font-weight: 600;
		font-size: 20px;
		line-height: 25px;
		color: #FFFFFF;
	}

	.desc-text {
		font-style: normal;
		font-weight: 600;
		font-size: 12px;
		line-height: 15px;
		color: #FFFFFF;
	}

	.foot-text {
		font-style: normal;
		font-weight: bold;
		font-size: 15px;
		line-height: 15px;
		color: #FFFFFF;
	}

	.count-desc-text {
		font-style: normal;
		font-weight: 600 bold;
		font-size: 10px;
		line-height: 60px;
		color: #41464D;
	}

	.count-text {
		font-style: normal;
		font-weight: 600;
		font-size: 14px;
		line-height: 60px;
		color: #41464D;
	}

	.left .list-group-item {
		padding-top: 1.18rem !important;
		padding-bottom: 1.18rem !important;
	}

	.right .list-group-item {
		padding-top: 1.52rem !important;
		padding-bottom: 1.52rem !important;
	}
	.isi-nya .card-field, .isi-nya .card-wrap{
		width: 100%;
		margin: auto;
		/* color: red; */

	}

	.top .card, .bottom .card{
		border-left: 5px solid;
		 border-top: none;
		  border-right: none;
		   border-bottom: none;
	}
	.bt{
		border-top: 5px solid;
		 border-left: none;
		  border-right: none;
		   border-bottom: none;

	}
	/* Menggeser dropdown ke kanan */
.dataTables_length {
    /* float: right; */
	text-align: right;
    /* Atur margin atau padding sesuai kebutuhan */
    /* margin-right: ; Contoh pengaturan margin ke kanan */
}

	
	

	.isi-nya{
		margin: 0;
		padding: 0px;
		width:100%;
	}
	.middle{
		padding: 10px;

	}

	/* .middle .content{
		padding: 10px;
		border: 5px solid black;
		/* margin: 10px; */
	/* } */ 

	
	.highcharts-figure{
		width: 100%;
		
	}

	/* .easy-pie-chart,
		.easyPieChart {
			position: relative;
			text-align: center;
		}

		.percentage {
			font-size: 14px;
			display: inline-block;
			vertical-align: top;
		} */
</style>
<input type="hidden" id="tahun-sekarang" value="{{tahun}}">
<div class="page-content container-fluid container-plus">
	<div class="row">
		<div class="col-12 p-0 pl-3 pr-3">
			<div class="ccard d-flex flex-column mx-1 mb-4 px-2 py-1">
				<div class="flex-grow-1 mb-1 ml-3">
					<div class="row">
						<div class="col-10">
							<div class="text-nowrap text-140 font-bold text-dark-l2 mt-2" id="title_dashboard">
								Dashboard
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--  -->
			<div class="content isi-nya container-fluid p-2">
				<div class="top m-2 row">

					

						<div class="card-wrapper col-3">
							<div class="card  border-info left shadow  py-2" >
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2"> 
											<div class="text-xs font-weight-bold text-primary text-uppercase  ">
												<h4><b>Voucher Aktif</b></h4>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800 " ><h4 id="voucher"></h3></div>
											<div class="row">
											</div>
										</div>
										<div class="col-auto ">
											<h1>
												<i class="fas fa-tag"></i>

											</h1>

										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card-wrapper col-3">
							<div class="card  border-info left shadow  py-2" >
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2"> 
											<div class="text-xs font-weight-bold text-primary text-uppercase  ">
												<h4><b>Bulan Ini</b></h4>
											</div>
											<div class=" mb-0 font-weight-bold text-gray-800 " ><h4 id="voucher">Rp. 1.000.000.000</h4></div>
											<div class="row">
											</div>
										</div>
										<div class="col-auto ">
											<h1>
												<i class="fas fa-tag"></i>

											</h1>

										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="card-wrapper col-3">
							<div class="card  border-info left shadow  py-2" >
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2"> 
											<div class="text-xs font-weight-bold text-primary text-uppercase  ">
												<h4><b>Voucher Aktif</b></h4>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800 " ><h4 id="voucher">X</h4></div>
											<div class="row">
											</div>
										</div>
										<div class="col-auto ">
											<h1>
												<i class="fas fa-tag"></i>

											</h1>

										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card-wrapper col-3">
							<div class="card  border-info left shadow  py-2" >
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2"> 
											<div class="text-xs font-weight-bold text-primary text-uppercase  ">
												<h4><b>Voucher Aktif</b></h4>
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800 " ><h4 id="voucher">X</h4></div>
											<div class="row">
											</div>
										</div>
										<div class="col-auto ">
											<h1>
												<i class="fas fa-tag"></i>

											</h1>

										</div>
									</div>
								</div>
							</div>
						</div>
						
						
					</div>
					
				</div>
				<div class="middle row  m-2">
						<div class="content content-left col-8  ">
							<figure class="highcharts-figure shadow  rounded " style="border-radius: 20px;">
								<div class="title  bg-light p-2 text-xs font-weight-bold text-primary text-uppercase " style="width: 100%;" >
									<h3 style="width: 100%;"><b>Pendapatan</b></h3>
								</div>
								<div id="container"></div>
								
							</figure>
						</div>
						<div class="content content-right  col-4 ">
							<figure class="highcharts-figure  shadow rounded ">
								<div class="title  bg-light p-2 text-xs font-weight-bold text-primary text-uppercase " style="width: 100%;" >
									<h3 style="width: 100%;"><b>Produk Ter Laris</b></h3>
								</div>
								<div id="container-pie"></div>
								
							</figure>
						</div>
				</div>
	
	
					
						
					<div class="bottom">
						<div class="title rounded-top bt bg-light p-2" style="">
							<h3>Live Transaksi</h3>
						</div>
						<div class="row">
							<div class="left col-9 p-2">
								<div class="row p-2">
									<div class="col-md-12">
										<div class="table-responsive-md">
											<div class="title"> HHH</div>
											<!-- <div class="row">
												<div class="col-sm-12 col-md-6">
													<div class="dataTables_length" id="datatable_length">
														<label>
															<select name="datatable_length" aria-controls="datatable" class="custom-select custom-select-sm form-control form-control-sm">
																<option value="10">10</option>
																<option value="20">20</option>
																<option value="30">30</option>
																<option value="50">50</option>
																<option value="100">100</option>
																<option value="200">200</option>
																<option value="300">300</option>
															</select>
															 data
															</label>
														</div>
													</div>
													<div class="col-sm-12 col-md-6"></div>
												</div> -->
											<table id="datatable" class="table table-sm table-bordered border-0 w-100 table-striped-secondary text-dark-m1 mb-0">
												
												<thead>
													<tr class="bgc-info text-white text-center brc-black-tp10">
														<th style="vertical-align: middle;" >#</th>
														<th style="vertical-align: middle;">Kasir</th>
														<th style="vertical-align: middle;">Voucher</th>
														<th style="vertical-align: middle;">Total</th>
														<th style="vertical-align: middle;">Bayar</th>
														<th style="vertical-align: middle;">Kembalian</th>
													</tr>
												</thead>
												<tbody></tbody>
											
											</table>
										</div>
					
									</div>
								</div>
							</div>
							<div class="right col-3 m-2	">
								
								<div class="card-wrapper p-2">
									<div class="card  border-info left shadow  py-2" >
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2"> 
													<div class="text-xs font-weight-bold text-primary text-uppercase  ">
														<h4><b>Voucher Aktif</b></h4>
													</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800 " ><h4 id="voucher">X</h4></div>
													<div class="row">
													</div>
												</div>
												<div class="col-auto ">
													<h1>
														<i class="fas fa-tag"></i>
		
													</h1>
		
												</div>
											</div>
										</div>
									</div>
								</div>
						
								<div class="card-wrapper p-2">
									<div class="card  border-info left shadow  py-2" >
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2"> 
													<div class="text-xs font-weight-bold text-primary text-uppercase  ">
														<h4><b>Voucher Aktif</b></h4>
													</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800 " ><h4 id="voucher">X</h4></div>
													<div class="row">
													</div>
												</div>
												<div class="col-auto ">
													<h1>
														<i class="fas fa-tag"></i>
		
													</h1>
		
												</div>
											</div>
										</div>
									</div>
								</div>
								
							
								
							</div>

						</div>
					</div>
					
	
				
			</div>
		</div>

	</div>

</div>


{% endblock %} {% block inline_script %}
<script src="{{ url('assets') }}/js/src/highcharts/modules/exporting.js"></script>
<script>
	{% include 'Defaults/Dashboard/index.js' %}

	$(document).ready(function () {
		$('#dtVerticalScrollExample').DataTable({
			"scrollY": "200px",
			"scrollCollapse": true,
		});
		$('.dataTables_length').addClass('bs-select');
	});


</script>

{% endblock %}