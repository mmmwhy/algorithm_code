








{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Recharge Options</h1>
				<p>All your transactions will be made public on the <a href="/user/donate">【Donations】</a> page. If you do not want your purchases to be made public, please make them annonymous by chaning the settings on the the <a href="/user/donate">【Donations】</a>page。</p>
				<h4 class="content-heading">Current account balance：{$user->money} CNY</h4>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Recharge Code</p>
										<p>Current balance：{$user->money} CNY</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="code">Recharge Code</label>
											<input class="form-control" id="code" type="text">
										</div>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="code-update" ><span class="icon">check</span>&nbsp;Recharge</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					{if $pmw!=''}
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										{$pmw}
									</div>
									
								</div>
							</div>
						</div>
					</div>
					{/if}
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<div class="card-table">
											<div class="table-responsive">
												{$codes->render()}
												<table class="table table-hover">
													<tr>
														<th>ID</th>
														<th>Code</th>
														<th>Type</th>
														<th>Action</th>
														<th>Time of recharge</th>
														
													</tr>
													{foreach $codes as $code}
														{if $code->type!=-2}
															<tr>
																<td>#{$code->id}</td>
																<td>{$code->code}</td>
																{if $code->type==-1}
																<td>Balance top-up</td>
																{/if}
																{if $code->type==10001}
																<td>Data top-up</td>
																{/if}
																{if $code->type==10002}
																<td>Subsciption renewal</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>User grade renewal - Grade{$code->type}</td>
																{/if}
																{if $code->type==-1}
																<td>Recharged {$code->number} CNY</td>
																{/if}
																{if $code->type==10001}
																<td>Recharged {$code->number} GB Data</td>
																{/if}
																{if $code->type==10002}
																<td>Renewed for {$code->number} Days</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>Renewed Grade for {$code->number} Days</td>
																{/if}
																<td>{$code->usedatetime}</td>
															</tr>
														{/if}
													{/foreach}
												</table>
												{$codes->render()}
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					<div aria-hidden="true" class="modal modal-va-middle fade" id="readytopay" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">Connecting to Alipay...</h2>
								</div>
								<div class="modal-inner">
									<p id="title">Processing...</p>
								</div>
							</div>
						</div>
					</div>
					
					<div aria-hidden="true" class="modal modal-va-middle fade" id="alipay" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">Please scan with Alipay to recharge：</h2>
								</div>
								<div class="modal-inner">
									<p id="title">If you are using your phone, simply tap on the QR code and you will be redirected to the payment page</p>
									<p id="divide">-------------------------------------------------------------</p>
									<p id="qrcode"></p>
									<p id="info"></p>
								</div>
								
								<div class="modal-footer">
									<p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" id="alipay_cancel" type="button">Cancel</button></p>
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>

	$(document).ready(function () {
		$("#code-update").click(function () {
			$.ajax({
				type: "POST",
				url: "code",
				dataType: "json",
				data: {
					code: $("#code").val()
				},
				success: function (data) {
					if (data.ret) {
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
					} else {
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
					}
				},
				error: function (jqXHR) {
					$("#result").modal();
					$("#msg").html("Error：" + jqXHR.status);
				}
			})
		})
		
		$("#urlChange").click(function () {
			$.ajax({
				type: "GET",
				url: "code/f2fpay",
				dataType: "json",
				data: {
					time: timestamp
				},
				success: function (data) {
					if (data.ret) {
						$("#readytopay").modal();
					}
				}
				
			})
		});
      
		$("#alipay").click(function () {
			$.ajax({
				type: "GET",
				url: "code/pay91",
				dataType: "json",
				data: {
					time: timestamp
				},
				success: function (data) {
					if (data.ret) {
						$("#readytopay").modal();
					}
				}
				
			})
		});
      
		
		$("#readytopay").on('shown.bs.modal', function () {
			$.ajax({
				type: "POST",
				url: "code/f2fpay",
				dataType: "json",
				data: {
						amount: $("#type").find("option:selected").val()
					},
				success: function (data) {
					$("#readytopay").modal('hide');
					if (data.ret) {
						$("#qrcode").html(data.qrcode);
						$("#info").html("Your recharge ammount："+data.amount+" CNY。");
						$("#alipay").modal();
					} else {
						$("#result").modal();
						$("#msg").html(data.msg);
					}
				},
				error: function (jqXHR) {
					$("#readytopay").modal('hide');
					$("#result").modal();
					$("#msg").html(data.msg+"  error");
				}
			})
		});

		
	timestamp = {time()}; 
		
		
	function f(){
		$.ajax({
			type: "GET",
			url: "code_check",
			dataType: "json",
			data: {
				time: timestamp
			},
			success: function (data) {
				if (data.ret) {
					clearTimeout(tid);
					$("#alipay").modal('hide');
					$("#result").modal();
					$("#msg").html("SUCCESS！");
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}
			}
		});
		tid = setTimeout(f, 1000); //循环调用触发setTimeout
	}
	setTimeout(f, 1000);
})
</script>

