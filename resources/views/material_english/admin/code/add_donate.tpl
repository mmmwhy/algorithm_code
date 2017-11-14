


{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Add Donations or Payment Record</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-md-12">
				<section class="content-inner margin-top-no">
					
					
					
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
							
								<div class="form-group form-group-label">
									<label class="floating-label" for="number">Type</label>
									<select id="type" class="form-control" name="type">
										<option value="-1">Donation</option>
										<option value="-2">Payment</option>
									</select>
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="number">Description</label>
									<input class="form-control" id="code" type="text" >
								</div>
								<div class="form-group form-group-label">
									<label class="floating-label" for="amount">Amount</label>
									<input class="form-control" id="amount" type="text" >
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
											<button id="submit" type="submit" class="btn btn-block btn-brand waves-attach waves-light">Add</button>
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
            $.ajax({
                type: "POST",
                url: "/admin/donate",
                dataType: "json",
                data: {
                    amount: $("#amount").val(),
                    code: $("#code").val(),
                    type: $("#type").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
                    } else {
                        $("#msg-error").hide(10);
                        $("#msg-error").show(100);
                        $("#msg-error-p").html(data.msg);
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
