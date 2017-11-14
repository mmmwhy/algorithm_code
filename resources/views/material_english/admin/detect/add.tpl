


{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading"> Add Rule</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-sm-12">
				<section class="content-inner margin-top-no">
					<form id="main_form">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<div class="form-group form-group-label">
										<label class="floating-label" for="name">Name</label>
										<input class="form-control" id="name" name="name" type="text">
									</div>
									
									
									<div class="form-group form-group-label">
										<label class="floating-label" for="text">Description</label>
										<input class="form-control" id="text" name="text" type="text">
									</div>
									
									<div class="form-group form-group-label">
										<label class="floating-label" for="regex">Code</label>
										<input class="form-control" id="regex" name="regex" type="text">
									</div>
									
									
									
									<div class="form-group form-group-label">
										<div class="form-group form-group-label">
												<label class="floating-label" for="type">Type</label>
												<select id="type" class="form-control" name="type">
													<option value="1">Matching by data in plain text</option>
													<option value="2">Matching by hex code</option>
												</select>
											</div>
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
					</form>	
					{include file='dialog.tpl'}

			</div>
			
			
			
		</div>
	</main>

	
	
	
	






{include file='admin/footer.tpl'}


{literal}
<script>

	$('#main_form').validate({
		rules: {
		  name: {required: true},
		  text: {required: true},
		  regex: {required: true}
		},


		submitHandler: function() {
			
			
			
		$.ajax({

				type: "POST",
				url: "/admin/detect",
				dataType: "json",
				{/literal}
				data: {
					    name: $("#name").val(),
					    text: $("#text").val(),
					    regex: $("#regex").val(),
					    type: $("#type").val()
				{literal}
					},
					success: function (data) {
					    if (data.ret) {
						$("#result").modal();
						$("#msg").html(data.msg);
									{/literal}
						window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
									{literal}
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
		});

</script>

{/literal}

