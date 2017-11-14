{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Edit User #{$edit_user->id}</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-sm-12">
				<section class="content-inner margin-top-no">

					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="email">E-mail</label>
									<input class="form-control" id="email" type="email" value="{$edit_user->email}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="remark">Description (Only visible to admins)</label>
									<input class="form-control" id="remark" type="text" value="{$edit_user->remark}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="pass">Password (Leave blank if you don't want to change it)</label>
									<input class="form-control" id="pass" type="password">
								</div>

								<div class="form-group form-group-label">
									<div class="checkbox switch">
										<label for="is_admin">
											<input {if $edit_user->is_admin==1}checked{/if} class="access-hide" id="is_admin" type="checkbox"><span class="switch-toggle"></span>Make admin
										</label>
									</div>
								</div>

								<div class="form-group form-group-label">
									<div class="checkbox switch">
										<label for="enable">
											<input {if $edit_user->enable==1}checked{/if} class="access-hide" id="enable" type="checkbox"><span class="switch-toggle"></span>Active subscription
										</label>
									</div>
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="money">Account balance</label>
									<input class="form-control" id="money" type="text" value="{$edit_user->money}">
								</div>

								<div class="form-group form-group-label">
									<label for="is_multi_user">
										<label class="floating-label" for="sort">Single-port multi-user port</label>
										<select id="is_multi_user" class="form-control" name="is_multi_user">
											<option value="0" {if $edit_user->is_multi_user==0}selected{/if}>Not a SPMU port</option>
											<option value="1" {if $edit_user->is_multi_user==1}selected{/if}>Obfuscation SPMU Port</option>
											<option value="2" {if $edit_user->is_multi_user==2}selected{/if}>Protocol SPMU Port</option>
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
									<label class="floating-label" for="port">Server Port</label>
									<input class="form-control" id="port" type="text" value="{$edit_user->port}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="passwd">Server Password</label>
									<input class="form-control" id="passwd" type="text" value="{$edit_user->passwd}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="method">Custom encryption</label>
									<input class="form-control" id="method" type="text" value="{$edit_user->method}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="protocol">Custom protocol</label>
									<input class="form-control" id="protocol" type="text" value="{$edit_user->protocol}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="protocol_param">Custom protocol parameters</label>
									<input class="form-control" id="protocol_param" type="text" value="{$edit_user->protocol_param}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="obfs">Custom obfuscation</label>
									<input class="form-control" id="obfs" type="text" value="{$edit_user->obfs}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="obfs_param">Custom obfuscation parameters</label>
									<input class="form-control" id="obfs_param" type="text" value="{$edit_user->obfs_param}">
								</div>
							</div>
						</div>
					</div>


					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="transfer_enable">Total data allowance（GB）</label>
									<input class="form-control" id="transfer_enable" type="text" value="{$edit_user->enableTrafficInGB()}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="usedTraffic">Data used</label>
									<input class="form-control" id="usedTraffic" type="text" value="{$edit_user->usedTraffic()}" readonly>
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="auto_reset_day">Data reset day</label>
									<input class="form-control" id="auto_reset_day" type="number" value="{$edit_user->auto_reset_day}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="auto_reset_bandwidth">Reset data to (GB)</label>
									<input class="form-control" id="auto_reset_bandwidth" type="number" value="{$edit_user->auto_reset_bandwidth}">
								</div>
							</div>
						</div>
					</div>


					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="invite_num">Available Invitation Codes</label>
									<input class="form-control" id="invite_num" type="number" value="{$edit_user->invite_num}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="ref_by">Invited Users IDs</label>
									<input class="form-control" id="ref_by" type="text" value="{$edit_user->ref_by}" readonly>
								</div>
							</div>
						</div>
					</div>


					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="group">User Group（This user can only access servers belonging to this group and group 0）</label>
									<input class="form-control" id="group" type="number" value="{$edit_user->node_group}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="class">User Grade（This user can only access servers with the same or lower grade number）</label>
									<input class="form-control" id="class" type="number" value="{$edit_user->class}">
								</div>



								<div class="form-group form-group-label">
									<label class="floating-label" for="class_expire">User grade expiry date (If it hasn't expired, please don't change this value)</label>
									<input class="form-control" id="class_expire" type="text" value="{$edit_user->class_expire}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="expire_in">User account expiry date(If it hasn't expired, please don't change this value)</label>
									<input class="form-control" id="expire_in" type="text" value="{$edit_user->expire_in}">
								</div>

							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-main">
							<div class="card-inner">

								<div class="form-group form-group-label">
									<label class="floating-label" for="node_speedlimit">User speed limit, the user can only get a speed up to this number on all servers (0 means unlimited)(Mbps)</label>
									<input class="form-control" id="node_speedlimit" type="text" value="{$edit_user->node_speedlimit}">
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="node_connector">User connection limit (by IP address) (0 means unlimited)</label>
									<input class="form-control" id="node_connector" type="text" value="{$edit_user->node_connector}">
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-main">
							<div class="card-inner">

								<div class="form-group form-group-label">
									<label class="floating-label" for="node_speedlimit">Blocked IPs, one per line</label>
									<textarea class="form-control" id="forbidden_ip" rows="8">{$edit_user->get_forbidden_ip()}</textarea>
								</div>

								<div class="form-group form-group-label">
									<label class="floating-label" for="node_speedlimit">Blocked ports, one per line</label>
									<textarea class="form-control" id="forbidden_port" rows="8">{$edit_user->get_forbidden_port()}</textarea>
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

					{include file='dialog.tpl'}
			</div>



		</div>
	</main>











{include file='admin/footer.tpl'}


<script>
	//document.getElementById("class_expire").value="{$edit_user->class_expire}";
    $(document).ready(function () {
        function submit() {
			if(document.getElementById('is_admin').checked)
			{
				var is_admin=1;
			}
			else
			{
				var is_admin=0;
			}

			if(document.getElementById('enable').checked)
			{
				var enable=1;
			}
			else
			{
				var enable=0;
			}

            $.ajax({
                type: "PUT",
                url: "/admin/user/{$edit_user->id}",
                dataType: "json",
                data: {
                    email: $("#email").val(),
                    pass: $("#pass").val(),
										auto_reset_day: $("#auto_reset_day").val(),
                    auto_reset_bandwidth: $("#auto_reset_bandwidth").val(),
                    is_multi_user: $("#is_multi_user").val(),
                    port: $("#port").val(),
										group: $("#group").val(),
                    passwd: $("#passwd").val(),
                    transfer_enable: $("#transfer_enable").val(),
                    invite_num: $("#invite_num").val(),
										node_speedlimit: $("#node_speedlimit").val(),
                    method: $("#method").val(),
										remark: $("#remark").val(),
										money: $("#money").val(),
                    enable: enable,
                    is_admin: is_admin,
                    ref_by: $("#ref_by").val(),
                    forbidden_ip: $("#forbidden_ip").val(),
                    forbidden_port: $("#forbidden_port").val(),
										class: $("#class").val(),
										class_expire: $("#class_expire").val(),
										expire_in: $("#expire_in").val(),
										node_connector: $("#node_connector").val(),
										protocol: $("#protocol").val(),
										protocol_param: $("#protocol_param").val(),
										obfs: $("#obfs").val(),
										obfs_param: $("#obfs_param").val(),
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
