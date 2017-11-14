
{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Edit Product</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-sm-12">
				<section class="content-inner margin-top-no">

					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>You can fill in one or multiple parameters. Multiple parameters will be automatically combined into a package.</p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="name">Name</label>
									<input class="form-control" id="name" type="text" value="{$shop->name}">
								</div>


								<div class="form-group form-group-label">
									<label class="floating-label" for="price">Price</label>
									<input class="form-control" id="price" type="text" value="{$shop->price}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="auto_renew">Days between automatic renewals (0 means no automatic renewals. A number tells the system when to automatically deduct from the user's balance for renewal of purchased package.)</label>
									<input class="form-control" id="auto_renew" type="text" value="{$shop->auto_renew}">
								</div>



							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-main">
							<div class="card-inner">

								<div class="form-group form-group-label">
									<label class="floating-label" for="bandwidth">Data Cap（GB）</label>
									<input class="form-control" id="bandwidth" type="text" value="{$shop->bandwidth()}">
								</div>


								<div class="form-group form-group-label">
									<div class="checkbox switch">
										<label for="auto_reset_bandwidth">
											<input {if $shop->auto_reset_bandwidth==1}checked{/if} class="access-hide" id="auto_reset_bandwidth" type="checkbox"><span class="switch-toggle"></span>Automatically reset data cap to the above upon renewal
										</label>
									</div>
								</div>

							</div>
						</div>
					</div>


					<div class="card">
						<div class="card-main">
							<div class="card-inner">

								<div class="form-group form-group-label">
									<label class="floating-label" for="expire">Subscription length in days</label>
									<input class="form-control" id="expire" type="text" value="{$shop->expire()}">
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-main">
							<div class="card-inner">

								<div class="form-group form-group-label">
									<label class="floating-label" for="class">Grade</label>
									<input class="form-control" id="class" type="text" value="{$shop->user_class()}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="class_expire">Grade activated for x days</label>
									<input class="form-control" id="class_expire" type="text" value="{$shop->class_expire()}">
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="reset_exp">Data to be used within x days</label>
									<input class="form-control" id="reset_exp" type="number" value="{$shop->reset_exp()}">
								</div>


								<div class="form-group form-group-label">
									<label class="floating-label" for="reset">Data reset after x days</label>
									<input class="form-control" id="reset" type="number" value="{$shop->reset()}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="reset_value">Reset to x GBs</label>
									<input class="form-control" id="reset_value" type="number" value="{$shop->reset_value()}">
								</div>
							</div>
						</div>
					</div>


					<div class="card">
						<div class="card-main">
							<div class="card-inner">

								<div class="form-group">
									<div class="row">
										<div class="col-md-10 col-md-push-1">
											<button id="submit" type="submit" class="btn btn-block btn-brand waves-attach waves-light">Save</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					{include file='dialog.tpl'}




			</div>



		</div>
	</main>











{include file='admin/footer.tpl'}



<script>
    $(document).ready(function () {
        function submit() {
			if(document.getElementById('auto_reset_bandwidth').checked)
			{
				var auto_reset_bandwidth=1;
			}
			else
			{
				var auto_reset_bandwidth=0;
			}

            $.ajax({
                type: "PUT",
                url: "/admin/shop/{$shop->id}",
                dataType: "json",
                data: {
                    name: $("#name").val(),
                    auto_reset_bandwidth: auto_reset_bandwidth,
                    price: $("#price").val(),
                    auto_renew: $("#auto_renew").val(),
                    bandwidth: $("#bandwidth").val(),
                    expire: $("#expire").val(),
                    class: $("#class").val(),
										class_expire: $("#class_expire").val(),
										reset: $("#reset").val(),
										reset_value: $("#reset_value").val(),
										reset_exp: $("#reset_exp").val(),
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/admin/shop'", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                        $("#msg").html(data.msg+"  error");
                }
            });
        }

        $("html").keydown(function (event) {
            if (event.keyCode == 13) {
                login();
            }
        });
        $("#submit").click(function () {
            submit();
        });
    })
</script>
