





{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Observation window</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Warning</p>
										<p>Only recent {$hour} hours are shown.</p><b>The test node comes from <a href="http://speedtest.net">Speedtest</a>, The data for reference only ~</b>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Observation window</p>
										<div class="card-table">
											<div class="table-responsive">
												<table class="table">
													<tr>
														<th>Node</th>
														<th>China Telecom delays</th>
														<th>China Telecom download speed</th>
														<th>China Telecom update speed</th>
														<th>China Unicom delay</th>
														<th>China Unicom download speed</th>
														<th>China Unicom upload speed</th>
														<th>China Mobile Delay</th>
														<th>China Mobile download speed</th>
														<th>China Mobile upload speed</th>
													</tr>
													{foreach $speedtest as $single}
														<tr>
															<td>{$single->node()->name}</td>
															<td>{$single->telecomping}</td>
															<td>{$single->telecomeupload}</td>
															<td>{$single->telecomedownload}</td>
															<td>{$single->unicomping}</td>
															<td>{$single->unicomupload}</td>
															<td>{$single->unicomdownload}</td>
															<td>{$single->cmccping}</td>
															<td>{$single->cmccupload}</td>
															<td>{$single->cmccdownload}</td>
														</tr>
													{/foreach}
												</table>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}