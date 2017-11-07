








{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Recharge</h1>
			</div>
		</div>
      
      
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
				<!--		<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Recharge code</p>
                                      <p>Recharge step 1: sweep money transfer money to be charged and note the mailbox</p>
                                      <p>Recharge step 2: the system will send a recharge code to your mailbox, please make sure the mailbox is available</p>
                                      <p>Refill Step 3: Enter the recharge code to recharge successfully</p>
                                      <p>If the mailbox is not received please submit<a href="/user/ticket" >Work order</a>Alipay transfer time and order number + amount</p>
										<p>Current balance：{$user->money} Yuan</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="code">Recharge code</label>
											<input class="form-control" id="code" type="text">
										</div>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="code-update" ><span class="icon">check</span>&nbsp;Recharge</button>
										</div>
									</div>
								</div>
							</div> -->
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
														<th>Operate</th>
														<th>Usage time</th>
														
													</tr>
													{foreach $codes as $code}
														{if $code->type!=-2}
															<tr>
																<td>#{$code->id}</td>
																<td>{$code->code}</td>
																{if $code->type==-1}
																<td>amount of recharge</td>
																{/if}
																{if $code->type==10001}
																<td>Traffic recharge</td>
																{/if}
																{if $code->type==10002}
																<td>User renewal</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>Level renewal - rank{$code->type}</td>
																{/if}
																{if $code->type==-1}
																<td>Recharge {$code->number} CNY</td>
																{/if}
																{if $code->type==10001}
																<td>Recharge {$code->number} GB Flow</td>
																{/if}
																{if $code->type==10002}
																<td>Extended account validity period {$code->number} days</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>Extended grade validity period {$code->number} days</td>
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
					$("#msg").html("unknown error: " + jqXHR.status + ", Please refresh the page to see if the balance is correct");
				}
			})
		})
		
		
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
					$("#result").modal();
					$("#msg").html("Recharge success！");
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}
			}
		});
		tid = setTimeout(f, 1000); //循环调用触发setTimeout
	}
	setTimeout(f, 1000);
})
</script>

