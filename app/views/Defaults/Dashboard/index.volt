{% extends 'template/dashboard.volt' %} {% block title %} Dashboard {% endblock %} {% block content %}
<style>
	*{
		/* box-sizing: border-box; */
	}
	.price {
		float: right;
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

	.top .card {
		border-left: 3px solid;
		 border-top: none;
		  border-right: none;
		   border-bottom: none;
	}
	.bt{
		border-top: 3px solid;
		 border-left: none;
		  border-right: none;
		   border-bottom: none;

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
			<div class="content isi-nya container-fluid p-2 ">
				<div class="top row m-2 ">
					<div class="left col-8 ">
	
						
						<div class="card-field row mb-2  ">
	
							<div class="card-wrapper col-4 ">
								<div class="content border rounded">
									<div class="card  border-info left shadow  py-2" >
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2"> 
													<div class="text-xs font-weight-bold text-primary text-uppercase  ">
														<h6><b>Voucher Aktif</b></h6>
													</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800 b " ><h4><b id="voucher">x</b></h4></div>
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
						
	
							<div class="card-wrapper col-4">
								<div class="content border rounded">
									<div class="card  border-info left shadow  py-2" >
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2"> 
													<div class="text-xs font-weight-bold text-primary text-uppercase  ">
														<h6><b>Transaksi (Bulanan)</b></h6>
													</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800 " ><h4 ><b id="transaksi">x</b></h4></div>
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
						
	
							<div class="card-wrapper col-4">
								<div class="content border rounded">
									<div class="card  border-info left shadow  py-2" >
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2"> 
													<div class="text-xs font-weight-bold text-primary text-uppercase  ">
														<h6><b>Pendapatan (bulanan)</b></h6>
													</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800 " ><h4 ><b id="pendapatan">x</b></h4></div>
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
						<div class="highchart mt-2 p-3">
							<div class="content content-left   ">
								<figure class="highcharts-figure shadow border rounded-lg pb-1  " style="border-radius: 20px;">
									<div class="title  bg-light p-2 text-xs rounded	 border-info  bt font-weight-bold text-primary text-uppercase " style="width: 100%;" >
										<h4 style="width: 100%;"><b id="pendapatan-tahun">Pendapatan - </b></h4>
									</div>
									<div id="container"></div>
									
								</figure>
							</div>
						</div>
						
	
							
							
						</div>
						
						<div class="right col-4 p-0 m-0" >
								
								<div class="content content-right " style="height: 96%; padding: 0; margin: 0;" >
									<figure class="highcharts-figure shadow border rounded-lg pb-1  " style="height: 100%;" >
										<div class="title  bg-light p-2 text-xs rounded	 border-info  bt font-weight-bold text-primary text-uppercase " style="width: 100%;" >
											<h4 style="width: 100%;"><b>Produk Ter Laris</b></h4>
										</div>
										<div id="container-pie" class="" style="height: 93%;"></div>
										
									</figure>
								</div>
						</div>
				</div>

					<div class="bottom m-2 row">
						
						<div class="left col-12 ">
							<div class="card ccard mx-auto" style="width: 98%; position: sticky;">
								<div class="card-header pb-1 align-middle border-t-3 brc-primary-tp3" style="border-top-left-radius: 0.4rem;
												border-top-right-radius: 0.4rem;border-bottom: 1px solid #e0e5e8 !important;">
									<h4 class="card-title text-dark-m3 mt-2  font-weight-bold text-primary text-uppercase ">
										Live -Transaksi
									</h4>
								</div>
								<div class="card-body p-3">
									<div class="row">
										<div class="col-md-12">
											<div class="table-responsive-md">
												<table id="datatable" class="table table-bordered border-0 w-100 table-striped-secondary text-dark-m1 mb-0">
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

