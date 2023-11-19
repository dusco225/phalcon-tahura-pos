{% extends 'template/dashboard.volt' %} {% block title %} Dashboard {% endblock %} {% block content %}
<style>
	*{
		box-sizing: border-box;
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
			<div class="content p-2">
				<div class="top  bg-warning p-2">
					<div class="card-field row w-100 p-2">

						<div class="card-wrapper bg-danger col-4">
							<div class="card mb-3  m-4" style="max-width: 540px;">
								<div class="row no-gutters">
								  <div class="col-md-4">
									<h1>
										<i class="fas fa-tag w-100" style="width: 100px;"></i>
	
									</h1>
								  </div>
								  <div class="col-md-8">
									<div class="card-body">
										<h5>X</h5>
										<h5 class="card-title">Voucher Aktif</h5>
									</div>
								  </div>
								</div>
							</div>
						</div>

						<div class="card-wrapper bg-danger col-4">
							<div class="card mb-3  m-4" style="max-width: 540px;">
								<div class="row no-gutters">
								  <div class="col-md-4">
									<h1>
										<i class="fas fa-tag w-100" style="width: 100px;"></i>
	
									</h1>
								  </div>
								  <div class="col-md-8">
									<div class="card-body">
										<h5>X</h5>
										<h5 class="card-title">Terjual Hari Ini</h5>
									</div>
								  </div>
								</div>
							</div>
						</div>

						<div class="card-wrapper bg-danger col-4">
							<div class="card mb-3 col-4 m-4" style="max-width: 540px;">
								<div class="row no-gutters">
								  <div class="col-md-4">
									<h1>
										<i class="fas fa-tag w-100" style="width: 100px;"></i>
	
									</h1>
								  </div>
								  <div class="col-md-8">
									<div class="card-body">
										<h5>X</h5>
										<h5 class="card-title">Voucher Aktif</h5>
									</div>
								  </div>
								</div>
							</div>
						</div>

						
					
					
					
					</div>

				</div>
				<div class="middle row">
					<div class="content content-left col-8">
						<figure class="highcharts-figure">
							<div id="container"></div>
							<p class="highcharts-description">
								Basic line chart showing trends in a dataset. This chart includes the
								<code>series-label</code> module, which adds a label to each line for
								enhanced readability.
							</p>
						</figure>
					</div>
					<div class="content content-right col-4">
						<figure class="highcharts-figure">
							<div id="container-pie"></div>
							<p class="highcharts-description">
								This pie chart shows how the chart legend can be used to provide
								information about the individual slices.
							</p>
						</figure>
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