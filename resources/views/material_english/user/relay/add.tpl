


{include file='user/main.tpl'}




	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading"> Add a transit rule</h1>
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
										<label class="floating-label" for="source_node">Original Server</label>
										<select id="source_node" class="form-control" name="source_node">
											<option value="0">Please select the first hop</option>
											{foreach $source_nodes as $source_node}
												<option value="{$source_node->id}">{$source_node->name}</option>
											{/foreach}
										</select>
									</div>


									<div class="form-group form-group-label">
										<label class="floating-label" for="dist_node">Target Server</label>
										<select id="dist_node" class="form-control" name="dist_node">
											<option value="-1">Not redirected</option>
											{foreach $dist_nodes as $dist_node}
												<option value="{$dist_node->id}">{$dist_node->name}</option>
											{/foreach}
										</select>
									</div>

									<div class="form-group form-group-label">
										<label class="floating-label" for="port">Port</label>
										<select id="port" class="form-control" name="port">
											{foreach $ports as $port}
												<option value="{$port}">{$port}</option>
											{/foreach}
										</select>
									</div>



									<div class="form-group form-group-label">
										<label class="floating-label" for="priority">Priority</label>
										<input class="form-control" id="priority" name="priority" type="text" value="0">
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
				<section>

			</div>



		</div>
	</main>











{include file='user/footer.tpl'}


{literal}
<script>

	$('#main_form').validate({
		rules: {
		  priority: {required: true}
		},


		submitHandler: function() {



		$.ajax({

				type: "POST",
				url: "/user/relay",
				dataType: "json",
				{/literal}
				data: {
						source_node: $("#source_node").val(),
						dist_node: $("#dist_node").val(),
						port: $("#port").val(),
						priority: $("#priority").val()
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
						$("#msg").html(data.msg+"  An error occurred.");
					}
					});
				}
		});

</script>

{/literal}
