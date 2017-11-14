


{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Edit account details</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
             


					<div class="col-lg-6 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Change Login Password</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="oldpwd">Current password</label>
											<input class="form-control" id="oldpwd" type="password">
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="pwd">New password</label>
											<input class="form-control" id="pwd" type="password">
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="repwd">Confirm new password</label>
											<input class="form-control" id="repwd" type="password">
										</div>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="pwd-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Change VPN/Shadowsocks Password</p>
										<p>Current password: {$user->passwd}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="sspwd">New password</label>
											<input class="form-control" id="sspwd" type="text">
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="ss-pwd-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Change encryption type</p>
										<p>Note: Not all encryption types work with both Shadowsocks and ShadowsocksR.</p>
										<p>Current encryption: {$user->method}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="method">Encryption</label>
											<select id="method" class="form-control">
												{$method_list = $config_service->getSupportParam('method')}
												{foreach $method_list as $method}
													<option value="{$method}" {if $user->method == $method}selected="selected"{/if}>[Supports {if URL::CanMethodConnect($method) == 2}SS{else}SS/SSR{/if}] {$method}</option>
												{/foreach}
											</select>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button disabled="disabled" class="btn btn-flat waves-attach" id="method-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div> 

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Change Contact Details</p>
										<p>Current contact：
										{if $user->im_type==1}
										Wechat
										{/if}

										{if $user->im_type==2}
										QQ
										{/if}

										{if $user->im_type==3}
										Google+
										{/if}

										{if $user->im_type==4}
										Telegram
										{/if}

										{$user->im_value}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="imtype">How may we reach you?</label>
											<select class="form-control" id="imtype">
												<option></option>
												<option value="1">Wechat</option>
												<option value="2">QQ</option>
												<option value="3">Google+</option>
												<option value="4">Telegram</option>
											</select>
										</div>

										<div class="form-group form-group-label">
											<label class="floating-label" for="wechat">Enter your contact here</label>
											<input class="form-control" id="wechat" type="text">
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="wechat-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Protocol & Obfuscation</p>
										<p>Current protocol：{$user->protocol}</p>
										<p>Note 1: If you need the protocol to be compatible with the original version of Shadowsocks, Please only choose  _compatible options.</p>
										<p>Note 2: If you only use the original Shadowsocks client here please set it directly as origin.</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="protocol">Protocol</label>
											<select id="protocol" class="form-control">
												{$protocol_list = $config_service->getSupportParam('protocol')}
												{foreach $protocol_list as $protocol}
													<option value="{$protocol}" {if $user->protocol == $protocol}selected="selected"{/if}>[Supports {if URL::CanProtocolConnect($protocol) == 3}SS/SSR{else}SSR{/if}] {$protocol}</option>
												{/foreach}
											</select>
										</div>

									</div>

									<div class="card-inner">
										<p>Current obfuscation: {$user->obfs}</p>
										<p>Note 1: If you need it to be compatible with the original version of Shadowsocks, Please only choose _compatible options.</p>
										<p>Note 2: SS and SSR support different obfuscation types, simple_obfs_ * types will only work with the original version of Shadowsocks, while the rest will only work on ShadowsocksR.</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="obfs">Obfuscation type</label>
											<select id="obfs" class="form-control">
												{$obfs_list = $config_service->getSupportParam('obfs')}
												{foreach $obfs_list as $obfs}
													<option value="{$obfs}" {if $user->obfs == $obfs}selected="selected"{/if}>[Supports {if URL::CanObfsConnect($obfs) >= 3}SS/SSR{else}{if URL::CanObfsConnect($obfs) == 1}SSR{else}SS{/if}{/if}] {$obfs}</option>
												{/foreach}
											</select>
										</div>
									</div>

									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button disabled="disabled" class="btn btn-flat waves-attach" id="ssr-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>







						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Change website language/look</p>
										<p>Current theme：{$user->theme}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="theme">Theme</label>
											<select id="theme" class="form-control">
												{foreach $themes as $theme}
													<option value="{$theme}">{$theme}</option>
												{/foreach}
											</select>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="theme-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>  


					<div class="col-lg-6 col-md-6">

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">IP Blocking</p>
										<p>Current state：{$Block}</p>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="unblock" ><span class="icon">check</span>&nbsp;Unblock this IP</button>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Daily status updates by email</p>
										<p>Current setting：{if $user->sendDailyMail==1} send {else} Do not send {/if}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="mail">Send settings</label>
											<select id="mail" class="form-control">
												<option value="1">Send</option>
												<option value="0">Do not send</option>
											</select>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="mail-update" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Two-step Verification</p>
										<p>Please download Goodle's two step verification engine, and scan the qr code below.</p>
										<p><i class="icon icon-lg" aria-hidden="true">android</i><a href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2">&nbsp;Android</a></p>
										<p><i class="icon icon-lg" aria-hidden="true">tablet_mac</i><a href="https://itunes.apple.com/cn/app/google-authenticator/id388497605?mt=8">&nbsp;iOS</a></p>
										<p>If you haven't completed the two step verificatoin procedure, please do not enable.</p>
										<p>Current settings：{if $user->ga_enable==1} enabled {else} disabled {/if}</p>
										<p>Current time：{date("Y-m-d H:i:s")}</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="ga-enable">Enable/disable</label>
											<select id="ga-enable" class="form-control">
												<option value="0">Disable</option>
												<option value="1">Enable</option>
											</select>
										</div>


										<div class="form-group form-group-label">
											<div class="text-center">
												<div id="ga-qr"></div>
												Verification Token：{$user->ga_token}
											</div>
										</div>


										<div class="form-group form-group-label">
											<label class="floating-label" for="code">Test</label>
											<input type="text" id="code" placeholder="Input the code here" class="form-control">
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-brand-accent btn-flat waves-attach" href="/user/gareset" ><span class="icon">format_color_reset</span>&nbsp;Reset</a>
											<button class="btn btn-flat waves-attach" id="ga-test" ><span class="icon">extension</span>&nbsp;Test</button>
											<button class="btn btn-brand btn-flat waves-attach" id="ga-set" ><span class="icon">perm_data_setting</span>&nbsp;Setup</button>
										</div>
									</div>
								</div>
							</div>
						</div>    

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">Change Server Port</p>
										<p>Current port：{$user->port}</p>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="portreset" ><span class="icon">check</span>&nbsp;Change port (random)</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Customize ACL / PAC / Surge</p>
										<p>You can add Gfwlist rules here. PLEASE DO NOT EDIT THIS IF YOU DO NOT KNOW WHAT IT DOES!</p>
										<p>For the format see <a href="https://adblockplus.org/zh_CN/filters">https://adblockplus.org/zh_CN/filters</a></p>
										<p>IP segment please use | 127.0.0.0/8 format</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="pac">Additional rules</label>
											<textarea class="form-control" id="pac" rows="8">{$user->pac}</textarea>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="setpac" ><span class="icon">check</span>&nbsp;submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						{if $config['enable_telegram'] == 'true'}
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Telegram Bind</p>
										<p>Telegram Add a robot account <a href="https://t.me/{$telegram_bot}">@{$telegram_bot}</a>, Photographed the following two-dimensional code issued to it.</p>
										<div class="form-group form-group-label">
											<div class="text-center">
												<div id="telegram-qr"></div>
												{if $user->telegram_id != 0} Current binding：<a href="https://t.me/{$user->im_value}">@{$user->im_value}</a>{/if}
											</div>
										</div>

									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-brand-accent btn-flat waves-attach" href="/user/telegram_reset" ><span class="icon">format_color_reset</span>&nbsp;Unbundled</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						{/if}
					</div>




					{include file='dialog.tpl'}

			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>
    $(document).ready(function () {
        $("#portreset").click(function () {
            $.ajax({
                type: "POST",
                url: "resetport",
                dataType: "json",
                data: {

                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#setpac").click(function () {
            $.ajax({
                type: "POST",
                url: "pacset",
                dataType: "json",
                data: {
                   pac: $("#pac").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "password",
                dataType: "json",
                data: {
                    oldpwd: $("#oldpwd").val(),
                    pwd: $("#pwd").val(),
                    repwd: $("#repwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                         $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script src=" /assets/public/js/jquery.qrcode.min.js "></script>
<script>
	var ga_qrcode = '{$user->getGAurl()}';
	jQuery('#ga-qr').qrcode({
		"text": ga_qrcode
	});

	{if $config['enable_telegram'] == 'true'}
	var telegram_qrcode = 'mod://bind/{$bind_token}';
	jQuery('#telegram-qr').qrcode({
		"text": telegram_qrcode
	});
	{/if}
</script>


<script>
    $(document).ready(function () {
        $("#wechat-update").click(function () {
            $.ajax({
                type: "POST",
                url: "wechat",
                dataType: "json",
                data: {
                    wechat: $("#wechat").val(),
					imtype: $("#imtype").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#ssr-update").click(function () {
            $.ajax({
                type: "POST",
                url: "ssr",
                dataType: "json",
                data: {
                    protocol: $("#protocol").val(),
					obfs: $("#obfs").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#relay-update").click(function () {
            $.ajax({
                type: "POST",
                url: "relay",
                dataType: "json",
                data: {
                    relay_enable: $("#relay_enable").val(),
					relay_info: $("#relay_info").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#unblock").click(function () {
            $.ajax({
                type: "POST",
                url: "unblock",
                dataType: "json",
                data: {
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ga-test").click(function () {
            $.ajax({
                type: "POST",
                url: "gacheck",
                dataType: "json",
                data: {
                    code: $("#code").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ga-set").click(function () {
            $.ajax({
                type: "POST",
                url: "gaset",
                dataType: "json",
                data: {
                    enable: $("#ga-enable").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#ss-pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                 success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html("Succeeded");
                    } else {
                        $("#result").modal();
						$("#msg").html("Failed");
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#mail-update").click(function () {
            $.ajax({
                type: "POST",
                url: "mail",
                dataType: "json",
                data: {
                    mail: $("#mail").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#theme-update").click(function () {
            $.ajax({
                type: "POST",
                url: "theme",
                dataType: "json",
                data: {
                    theme: $("#theme").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>



<script>
    $(document).ready(function () {
        $("#method-update").click(function () {
            $.ajax({
                type: "POST",
                url: "method",
                dataType: "json",
                data: {
                    method: $("#method").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
						$("#msg").html("Succeeded");
                    } else {
                        $("#result").modal();
						$("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
					$("#msg").html(data.msg+"     There are some errors。");
                }
            })
        })
    })
</script>
