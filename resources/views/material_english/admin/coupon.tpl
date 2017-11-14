





{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Coupons</h1>
			</div>
		</div>
		<div class="container">
				<section class="content-inner margin-top-no">



					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="prefix">Coupon code prefix</label>
									<input class="form-control" id="prefix" type="text">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="credit">Rebate amount(In percentage，for 10% off, type 10)</label>
									<input class="form-control" id="credit" type="text">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="expire">Validity Period (hours)</label>
									<input class="form-control" id="expire" type="number" value="1">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="shop">Product ID. Leave blank if you want this coupon to be available for all products. If you want it to be used for multiple products, seperate the IDs with commas</label>
									<input class="form-control" id="shop" type="text">
								</div>

								<div class="form-group form-group-label">
									<div class="checkbox switch">
										<label for="onetime">
											<input class="access-hide" id="onetime" type="checkbox"><span class="switch-toggle"></span>Single use. Not a reccuring discount.
										</label>
									</div>
								</div>


								<div class="form-group">
									<div class="row">
										<div class="col-md-10 col-md-push-1">
											<button id="coupon" type="submit" class="btn btn-block btn-brand waves-attach waves-light">Create</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card margin-bottom-no">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading">Coupons</p>
								<p>Show:
									{include file='table/checkbox.tpl'}
								</p>
								<div class="card-table">
									<div class="table-responsive">
										{include file='table/table.tpl'}
									</div>
								</div>
							</div>
						</div>
					</div>

					{include file='dialog.tpl'}


			</div>



	</main>












{include file='admin/footer.tpl'}





<script>

{include file='table/js_1.tpl'}

$(document).ready(function () {
		{include file='table/js_2.tpl'}

		$("#coupon").click(function () {

				if(document.getElementById('onetime').checked)
				{
						var onetime=1;
				}
				else
				{
						var onetime=0;
				}

	      $.ajax({
		          type: "POST",
		          url: "/admin/coupon",
		          dataType: "json",
		          data: {
		          prefix: $("#prefix").val(),
		          credit: $("#credit").val(),
							shop: $("#shop").val(),
							onetime: onetime,
		          expire: $("#expire").val()
		          },
		          success: function (data) {
		              if (data.ret) {
		                  $("#result").modal();
		                  $("#msg").html(data.msg);
		                  window.setTimeout("location.href='/admin/coupon'", {$config['jump_delay']});
		              }
		              // window.location.reload();
		          },
		          error: function (jqXHR) {
		              alert("error：" + jqXHR.status);
		          }
	      })
		})
})
</script>
