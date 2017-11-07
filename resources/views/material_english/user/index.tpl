





{include file='user/main.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">User Center</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">latest announcement in the system</p>
										<p>Please refer to the <a href="/user/announcement"/>announcement</a>  for other announcements.</p>
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Download and Configure Center</p>
										<p>You can view your connection information here.<br>At the same time, here to provide you with an automated configuration file generation, including all the Shadowsocks server information, allowing you to quickly add a lot of servers, fast switching.</p>
										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ssr"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
												</li>
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ss"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
											</ul>
										</nav>
										<div class="card-inner">
											<div class="tab-content">
												<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="all_ssr">
													{$pre_user = URL::cloneUser($user)}

													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_info"><i class="icon icon-lg">info_outline</i>&nbsp;Connection information</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_router"><i class="icon icon-lg">router</i>&nbsp;router</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ssr_info">
														{$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
														{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
														{if URL::SSRCanConnect($user)}
														<dl class="dl-horizontal">
															<p><dt>port</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>password</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>Custom encryption</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>Custom protocol</dt>
															<dd>{$user->protocol}</dd></p>

															<p><dt>Custom confusion</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>Hello, your current encryption method, confusing, or protocol settings can not be connected under the ShadowsocksR client. Please use the Shadowsocks client to connect, or to the data editing page to modify and then check here.</p>

															<p>At the same time, ShadowsocksR single-port multi-user connection is not affected by your settings, you can use the corresponding client to connect here ~</p>

															<p>Please note that your current SSR subscription link has expired in the current state and you can not import the node in this way.</p>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ssr_windows">
														<p><a href="/ssr-download/ssr-win.7z">download</a>，Unzip, run the program, and then you have three ways to import all nodes<br>
															(1)Download<a href="/user/getpcconf?is_mu=0&is_ss=0">This (ordinary port)</a>or<a href="/user/getpcconf?is_mu=1&is_ss=0">This (single-port multi-user)</a>,Right-click the small aircraft server - from the configuration file into the server, select this file,<br>
															(2)Click on<a class="copy-text" data-clipboard-text="{$ssr_url_all}">This (ordinary port)</a>or<a class="copy-text" data-clipboard-text="{$ssr_url_all}">This (single-port multi-user)</a>, Then right-click the airplane - copy the address from the clipboard<br>
															(3)(Recommended) Right-click Aircraft-Server-SSR Server Subscription Settings, set the subscription address to the following address, leave the other parameters blank, and then update the SSR server subscription.<br>
															And then select a suitable server, proxy rules selected "bypass the LAN and the mainland", and then you can access.</p>

														<p>SSR Subscription address:<br>
															Ordinary port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															Single port multiuser port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_mac">
														<p><a href="/ssr-download/ssr-mac.dmg">Download</a>, Install, and then download<a href="/user/getpcconf?is_mu=0&is_ss=0">This (ordinary port)</a>or<a  href="/user/getpcconf?is_mu=1&is_ss=0">This (single-port multi-user)</a>, Run the program, the small aircraft on the right server list submenu "import server configuration file ..." import this file, and then select a suitable server, update the PAC, and then open the system agent to the Internet.</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_ios">
														<p>Recommended download<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>, Has purchased this software for the US store Apple ID:<code>shz7348@icloud.com</code> password<code>Qq654321.</code>Pay attention to special symbols and case, switch the store account to download and install, and then click in Safari<a href="{$ssr_url_all}">This (ordinary port)</a>or<a href="{$ssr_url_all_mu}">This (single-port multi-user)</a>, And then click OK, you can add nodes in bulk.</p>
														<p>SSR Subscription address:<br>
															Ordinary port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															Single port multiuser port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_android">
														<p><a href="/ssr-download/ssr-android.apk">download</a>, Install, and then click on the default browser on the<a href="{$ssr_url_all}">This link (Ordinary port)</a>or<a href="{$ssr_url_all_mu}">This link (single port multiuser)</a>, And then click OK, batch add nodes, and then select the routing around the mainland, the upper right corner can open the Internet. While providing an ACL address,<a href="/link/{$acl_token}">Long press to copy the address</a>To the client can be applied.</p>
														<p>SSR Subscription address:You can add a subscription at the node list to automatically update the node:<br>
															Ordinary port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															Single port multiuser port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_router">
														<p>router is brushed<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">this firmware</a>, Then SSH login router, execute the following command (import ordinary port)<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														Or this single-port multi-user<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														After the implementation of the router can be set up the panel to choose Shadowsocks server to connect.</p>
													</div>

												</div>
												<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="all_ss">
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ss_info"><i class="icon icon-lg">info_outline</i>&nbsp;Connection information</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_ios"><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_router"><i class="icon icon-lg">router</i>&nbsp;Router</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ss_info">
														{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}

														{if URL::SSCanConnect($user)}
														<dl class="dl-horizontal">
															<p>The address of each node, please go to the node list to see!</p>


															<p><dt>port</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>Password</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>Custom encryption</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>Custom confusion</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>Hello, your current encryption method, confusion, or protocol settings can not be connected under the SS client. Please use the SSR client to connect, or to the data editing page to modify and then check here.</p>
															<p>At the same time, Shadowsocks single-port multi-user connection is not affected by your settings, you can use the corresponding client to connect here ~</p>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ss_windows">
														<p><a href="/ssr-download/ss-win.zip">download</a>, Extract, run the program, and then you have two ways to import all nodes<br>
															(1)Download<a href="/user/getpcconf?is_mu=0&is_ss=1">This (ordinary port) </a>, placed in the directory of small aircraft, and then open the small plane.<br>
															(2)Click<a class="copy-text" data-clipboard-text="{$ss_url_all_win}">Here (ordinary port)</a>, Then right click on the small aircraft - import the URL from the clipboard<br>
													</div>
													<div class="tab-pane fade" id="all_ss_mac">
														<p><a href="/ssr-download/ss-mac.zip">download</a>, Install, and then download<a href="/user/getpcconf?is_mu=0&is_ss=1">This (ordinary port)</a>or<a href="/user/getpcconf?is_mu=1&is_ss=1">This (single-port multi-user)</a>, Run the program, the small aircraft on the right server list submenu "import server configuration file ..." import this file, and then select a suitable server, update the PAC, and then open the system agent to the Internet.</p>
													</div>
													<div class="tab-pane fade" id="all_ss_ios">
														<p>Recommended download<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>, Has purchased this software for the US store Apple ID:<code>shz7348@icloud.com</code> password<code>Qq654321.</code>Pay attention to special symbols and case, switch the store account to download and install, and then click in Safari<a href="{$ss_url_all}">This (ordinary port)</a>or<a href="{$ss_url_all_mu}">This (single-port multi-user)</a>, And then click OK, you can add nodes in bulk.</p>
														<p>iOS download<a href="/link/{$ios_token}?is_ss=1">This (ordinary port）</a>or<a href="/link/{$ios_token}?is_ss=1&is_mu=1">This (single-port multi-user)</a>, Into the Surge, and then you can freely switch the server online.</p>
													</div>
													<div class="tab-pane fade" id="all_ss_android">
														<p><a href="/ssr-download/ss-android.apk">download</a>，and<a href="/ssr-download/ss-android-obfs.apk">download</a>, Then install, and then click on the phone<a class="copy-text" data-clipboard-text="{$ss_url_all}">This link (normal port)</a>or<a class="copy-text" data-clipboard-text="{$ss_url_all_mu}">This link (single port multi-user port)</a>Copy to the clipboard, open the Shadowsocks client, select from the clipboard import, and then select a node, set the route to bypass the mainland, click on the plane can access the Internet.</p>
													</div>
													<div class="tab-pane fade" id="all_ss_router">
														<p>The router is brushed<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">This firmware</a>, Then SSH login router, execute the following command (import ordinary port)<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														Or this single-port multi-user<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														After the implementation of the router can be set up the panel to choose Shadowsocks server to connect.</p>
													</div>
												</div>
											</div>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<p><a class="btn btn-brand btn-flat waves-attach" href="/user/url_reset"><span class="icon">close</span>&nbsp;Reset all links</a></p>
											</div>
										</div>
									</div>

								</div>
							</div>

						</div>

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Account usage</p>
										<dl class="dl-horizontal">
											<p><dt>Account level</dt>
											<dd>{$user->class}</dd></p>

											<p><dt>Level expiration time</dt>
											<dd>{$user->class_expire}</dd></p>

											<p><dt>Account expiration time</dt>
											<dd>{$user->expire_in}</dd>

											<p><dt>Speed ​​limit</dt>
											{if $user->node_speedlimit!=0}
											<dd>{$user->node_speedlimit}Mbps</dd>
											{else}
											<dd>Not limited</dd>
											{/if}</p>

											<p><dt>Last used</dt>
											<dd>{$user->lastSsTime()}</dd></p>
										</dl>
									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">

										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>

										<script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",
											{
												title:{
													text: "Data Flow usage",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													type: "doughnut",
													showInLegend: true,
													dataPoints: [
														{if $user->transfer_enable != 0}
														{
															y: {$user->last_day_t/$user->transfer_enable*100}, legendText:"Used {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}", indexLabel: "Used {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}"
														},
														{
															y: {($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}, legendText:"Today {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}", indexLabel: "Today {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}"
														},
														{
															y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, legendText:"Margin {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "Margin {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
														}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>

									</div>

								</div>
							</div>



							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Check to get Flow</p>
											<p>Flow will not be reset, you can get through the check to get Flow.</p>

											<p>Each check can get {$config['checkinMin']}~{$config['checkinMax']}MB Data Flow。</p>

											<p>Check once every day. You can click the button or shake the phone to Check.</p>

											<p>Last check-in ：<code>{$user->lastCheckInTime()}</code></p>


											<p id="checkin-msg"></p>

											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
									</div>

									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;Check</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;Has been checked</a></p>
											{/if}
										</div>
									</div>

								</div>
							</div>


						{if $enable_duoshuo=='true'}

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Forum</p>
											<div class="ds-thread" data-thread-key="0" data-title="index" data-url="{$baseUrl}/user/"></div>
											<script type="text/javascript">
											var duoshuoQuery = {

											short_name:"{$duoshuo_shortname}"


											};
												(function() {
													var ds = document.createElement('script');
													ds.type = 'text/javascript';ds.async = true;
													ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
													ds.charset = 'UTF-8';
													(document.getElementsByTagName('head')[0]
													 || document.getElementsByTagName('body')[0]).appendChild(ds);
												})();
											</script>
									</div>

								</div>
							</div>

						{/if}

						{include file='dialog.tpl'}

					</div>


				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}

<script src="/theme/material/js/shake.js/shake.js"></script>


<script>

$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("Has been copied to your clipboard, please continue to the next operation.");
});

{if $geetest_html == null}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("An error occurred：" + jqXHR.status);
                }
            });
    }
};


$(document).ready(function () {
	$("#checkin").click(function () {
		$.ajax({
			type: "POST",
			url: "/user/checkin",
			dataType: "json",
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("An error occurred：" + jqXHR.status);
			}
		})
	})
})


{else}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        c.show();
    }
};



var handlerPopup = function (captchaObj) {
	c = captchaObj;
	captchaObj.onSuccess(function () {
		var validate = captchaObj.getValidate();
		$.ajax({
			url: "/user/checkin", // 进行二次验证
			type: "post",
			dataType: "json",
			data: {
				// 二次验证所需的三个值
				geetest_challenge: validate.geetest_challenge,
				geetest_validate: validate.geetest_validate,
				geetest_seccode: validate.geetest_seccode
			},
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("An error occurred：" + jqXHR.status);
			}
		});
	});
	// 弹出式需要绑定触发验证码弹出按钮
	captchaObj.bindOn("#checkin");
	// 将验证码加到id为captcha的元素里
	captchaObj.appendTo("#popup-captcha");
	// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};

initGeetest({
	gt: "{$geetest_html->gt}",
	challenge: "{$geetest_html->challenge}",
	product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
	offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
}, handlerPopup);



{/if}


</script>
