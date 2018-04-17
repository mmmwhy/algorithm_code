




{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">公告</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
					
						<div class="col-lg-12 col-md-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">优惠码</p>
										<div class="card-table">
										<div class="table-responsive">
											{$coupons->render()}
											<table class="table">
												<thead>
												<tr>
													<th>###</th>
													<th>优惠码</th>
													<th>额度</th>
													<th>过期时间</th>
													<th>可用商品ID</th>
												</tr>
												</thead>
												<tbody>
												{foreach $coupons as $code}
													<tr>
														<td><b>{$code->id}</b></td>
														<td>{$code->code}
														</td>
														<td>{$code->credit} %</td>
                            {if $code->expire()<date("Y-m-d H:i:s")}
                            <td>过期</td>
                            {else}
														<td>{$code->expire()}</td>
                            {/if}
                            {if $code->shop}
														<td>{$code->shop}</td>
                            {else}
                            <td>全部商品ID可用</td>
                            {/if}
													</tr>
												{/foreach}
												</tbody>
											</table>
											{$coupons->render()}
										</div>
									</div>
									</div>
									
								</div>
							</div>
							
						
				
							
						
						{include file='dialog.tpl'}
						
					</div>
						
					
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}
