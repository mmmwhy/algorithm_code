
{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Add Server</h1>
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
										<label class="floating-label" for="name">Server name</label>
										<input class="form-control" id="name" type="text" name="name">
									</div>


									<div class="form-group form-group-label">
										<label class="floating-label" for="server">Server address</label>
										<input class="form-control" id="server" type="text" name="server">
									</div>

									<div class="form-group form-group-label">
										<label class="floating-label" for="server">Server IP(If you dont enter anything here, the system will get it automatically. Please follow <a href="https://github.com/esdeathlove/ss-panel-v3-mod/wiki/%E8%8A%82%E7%82%B9IP%E5%A1%AB%E5%86%99%E8%A7%84%E5%88%99">these guidelines</a> when entering an IP)</label>
										<input class="form-control" id="node_ip" name="node_ip" type="text">
									</div>

									<div class="form-group form-group-label" hidden="hidden">
										<label class="floating-label" for="method">Encryption Method</label>
										<input class="form-control" id="method" type="text" name="method" value="aes-256-cfb">
									</div>

									<div class="form-group form-group-label">
										<label class="floating-label" for="rate">Data Ratio</label>
										<input class="form-control" id="rate" type="text" name="rate">
									</div>

									<div class="form-group form-group-label" hidden="hidden">
										<div class="checkbox switch">
											<label for="custom_method">
												<input  class="access-hide" id="custom_method" type="checkbox" name="custom_method" checked="checked" disabled><span class="switch-toggle"></span>Custom Encryption Method
											</label>
										</div>
									</div>

									<div class="form-group form-group-label" hidden="hidden">
										<div class="checkbox switch">
											<label for="custom_rss">
												<input  class="access-hide" id="custom_rss" type="checkbox" name="custom_rss" checked="checked" disabled><span class="switch-toggle"></span>Custom Protocol and Obfuscation
											</label>
										</div>
									</div>

									<div class="form-group form-group-label">
										<label for="mu_only">
											<label class="floating-label" for="sort">Single-port Multi-user Options</label>
											<select id="mu_only" class="form-control" name="is_multi_user">
												<option value="0">Single port multiuser and normal ports</option>
												<option value="-1">Normal connections only</option>
												<option value="1">Single port multi-user only</option>
											</select>
										</label>
									</div>


								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<div class="form-group form-group-label">
										<div class="checkbox switch">
											<label for="type">
												<input checked class="access-hide" id="type" type="checkbox" name="type"><span class="switch-toggle"></span>Make this server public?
											</label>
										</div>
									</div>


									<div class="form-group form-group-label">
										<label class="floating-label" for="status">Server Status</label>
										<input class="form-control" id="status" type="text" name="status">
									</div>

									<div class="form-group form-group-label">
										<div class="form-group form-group-label">
												<label class="floating-label" for="sort">Server Typ</label>
												<select id="sort" class="form-control" name="sort">
													<option value="0">Shadowsocks</option>
													<option value="1">VPN/Radius Basic</option>
													<option value="2">SSH</option>
													<option value="3">PAC</option>
													<option value="4">APN File Link</option>
													<option value="5">Anyconnect</option>
													<option value="6">APN</option>
													<option value="7">PAC PLUS(Socks Proxy Will Auto-create PAC)</option>
													<option value="8">PAC PLUS PLUSHTTPS Proxy Will Auto-create PAC)</option>
													<option value="9">Shadowsocks Single-port Multi-user</option>
													<option value="10">Shadowsocks Transit Serve</option>
												</select>
											</div>
									</div>

									<div class="form-group form-group-label">
										<label class="floating-label" for="info">Server Description</label>
										<input class="form-control" id="info" type="text" name="info">
									</div>

									<div class="form-group form-group-label">
										<label class="floating-label" for="class">Server Class/Grade（If you don't want to give a grade, type 0; otherwise, type a number）</label>
										<input class="form-control" id="class" type="text" value="0" name="class">
									</div>


									<div class="form-group form-group-label">
										<label class="floating-label" for="group">Server Group（Enter a number; If it doesn't belong to any group, type 0）</label>
										<input class="form-control" id="group" type="text" value="0" name="group">
									</div>


									<div class="form-group form-group-label">
										<label class="floating-label" for="node_bandwidth_limit">Maximum Available Data（Type 0 to disable cap））（GB）</label>
										<input class="form-control" id="node_bandwidth_limit" type="text" value="0" name="node_bandwidth_limit">
									</div>

									<div class="form-group form-group-label">
										<label class="floating-label" for="bandwidthlimit_resetday"Server Data Cap Reset Day</label>
										<input class="form-control" id="bandwidthlimit_resetday" type="text" value="0" name="bandwidthlimit_resetday">
									</div>

									<div class="form-group form-group-label">
										<label class="floating-label" for="node_speedlimit">Server Bandwidth Cap (For each user)（Mbps）</label>
										<input class="form-control" id="node_speedlimit" type="text" value="0" name="node_speedlimit">
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
												<button id="submit" type="submit" class="btn btn-block btn-brand waves-attach waves-light">Submit</button>
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
		  server: {required: true},
		  method: {required: true},
		  rate: {required: true},
		  info: {required: true},
		  group: {required: true},
		  status: {required: true},
		  node_speedlimit: {required: true},
		  sort: {required: true},
		  node_bandwidth_limit: {required: true},
		  bandwidthlimit_resetday: {required: true}
		},

		submitHandler: function() {
			if(document.getElementById('custom_method').checked)
			{
				var custom_method=1;
			}
			else
			{
				var custom_method=0;
			}

			if(document.getElementById('type').checked)
			{
				var type=1;
			}
			else
			{
				var type=0;
			}
			{/literal}
			if(document.getElementById('custom_rss').checked)
			{
				var custom_rss=1;
			}
			else
			{
				var custom_rss=0;
			}


            $.ajax({
                type: "POST",
                url: "/admin/node",
                dataType: "json",
                data: {
                    name: $("#name").val(),
                    server: $("#server").val(),
										node_ip: $("#node_ip").val(),
                    method: $("#method").val(),
                    custom_method: custom_method,
                    rate: $("#rate").val(),
                    info: $("#info").val(),
                    type: type,
										group: $("#group").val(),
                    status: $("#status").val(),
										node_speedlimit: $("#node_speedlimit").val(),
                    sort: $("#sort").val(),
										class: $("#class").val(),
										node_bandwidth_limit: $("#node_bandwidth_limit").val(),
										bandwidthlimit_resetday: $("#bandwidthlimit_resetday").val(),
										custom_rss: custom_rss,
										mu_only: $("#mu_only").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href=top.document.referrer", {$config['jump_delay']});
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
