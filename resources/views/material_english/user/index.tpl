





{include file='user/main.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Dashboard</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Latest Announcements</p>
										<p><a href="/user/announcement"/>Click here</a>  for other announcements.</p>
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Shadowsocks Setup</p>
										<p>You can view your connection details here.<br>You will also find the setup instructions for all common OS, as well as the downloadable app files.</p>
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
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_info"><i class="icon icon-lg">info_outline</i>&nbsp;Connection details</a>
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

															<p><dt>Custom Obfuscation</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>Your current encryption type, obfuscation type, or protocol will not work with the ShadowsocksR client. Please use the Shadowsocks client to connect, or go to the "edit my account" page to change them to compatible types before coming back here.</p>

															<p>If you are using the ShadowsocksR single-port multi-user connection type, then you can skip this message.</p>

															<p>Please note that your current SSR subscription link has expired in the current state. You can not import the server details using this link until you change the settings to a mode compatible with SSR.</p>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ssr_windows">
														<p><a href="/ssr-download/ssr-win.7z">Download</a> and unzip the file. Double-click on the ShadowsocksR file to start the app. You now have three ways to import the servers:<br>
															(1) Depending on your setup, download <a href="/user/getpcconf?is_mu=0&is_ss=0"> this file (default)</a> or <a href="/user/getpcconf?is_mu=1&is_ss=0">this file (single-port multi-user)</a>. Right-click on the small paper airplane icon on the bottom right corner of your screen. Go to servers -> "import servers from file" and select this file.<br>
															(2) Click on <a class="copy-text" data-clipboard-text="{$ssr_url_all}">this link (default)</a> or <a class="copy-text" data-clipboard-text="{$ssr_url_all}">this link (single-port multi-user)</a>. Right-click the paper airplane icon. Select "import SSR links from clipboard"<br>
															(3) (Recommended) Right-click the paper airplane icon. Go to servers subscribe -> Subscribe Settings. Set the subscription address to the following address, leave the other parameters blank, and then refresh the SSR server subscription.<br>
															Once you have entered all the servers, select a suitable server, set Mode to "Global", and you will be connected.</p>

														<p>SSR Subscription address:<br>
															Ordinary port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															Single port multiuser port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_mac">
														<p><a href="/ssr-download/ssr-mac.dmg">Download</a>, install, and then download <a href="/user/getpcconf?is_mu=0&is_ss=0">this (default)</a> or <a  href="/user/getpcconf?is_mu=1&is_ss=0">this (single-port multi-user)</a>. Run the vpn software. You should see a small paper airplane icon on the top right of your screen. Right-click it, and go to servers -> "import bunch JSON file".</p>
														<p>If that doesnt work, you can go to the server list to find the qr codes and scan them in by going to servers -> "scan QR code from screen"</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_ios">
														<p>We recommend you download <a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>. It is third party and costs an additional $3 if you want to purchase it for yourself. If not, we have already purchased it on the US APP STORE with the Apple ID:<code>shz7348@icloud.com</code> and password <code>Qq654321.</code>Pay attention to special symbols and case, login to the store account to download and install, and then open in Safari <a href="{$ssr_url_all}">this link (default)</a> or <a href="{$ssr_url_all_mu}">this link (single-port multi-user)</a>. Click OK to add all the servers.</p>
														<p>If it doesn't automatically open in Shadowrocket, you may need to open the app yourself. A popup should come up asking you whether you want to import the server or not. Click OK. </p>
														<p>You can also copy the link below to add the servers in automatically. Simlpy copy the link, go to shadowrocket, click on the + button, and select "subscribe" as the type instead of shadowsocks. Then paste the link in the url section and click "Done".</p>
														<p>SSR Subscription address:<br>
															Normal port and address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															Single port multiuser port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_android">
														<p><a href="/ssr-download/ssr-android.apk">Download</a>, install, and then open your default browser and click on <a href="{$ssr_url_all}">this link (default)</a> or <a href="{$ssr_url_all_mu}">this link (single port multiuser)</a>. Afterward, click OK to add the servers. Select the server you want, and connect by clicking the paper airplane icon.</p>
														<p>SSR Subscription address: You can add a server subscription link to automatically update the servers:<br>
															Normal port and address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															Single port multiuser port address:<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_router">
														<p>Flash your router with <a href="http://www.right.com.cn/forum/thread-161324-1-1.html">this firmware</a>, Then SSH login into your router and execute the following command (import ordinary port)<br>
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
																<a class="waves-attach" data-toggle="tab" href="#all_ss_info"><i class="icon icon-lg">info_outline</i>&nbsp;Connection details</a>
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
															<p>To get indovidual servers' addresses, please go to the server list!</p>


															<p><dt>port</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>Password</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>Custom encryption</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>Custom Obfuscation</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>Your current encryption type, obfuscation type, or protocol will not work with the Shadowsocks client. Please use the ShadowsocksR client to connect, or to the "edit my account" page to change them to compatible types before coming back here.</p>
															<p>If you are using the Shadowsocks single-port multi-user connection type, then it will not be affected by your settings, and you can use the corresponding client to connect without problem ~</p>
														{/if}
													</div>
													<div class="tab-pane fade" id="all_ss_windows">
														<p><a href="/ssr-download/ss-win.zip">Download</a>, extract, and run the program. You have two ways to import all nodes:<br>
															(1)Download <a href="/user/getpcconf?is_mu=0&is_ss=1">this (default) </a>, and place it in the same directory of the app you just downloaded. Open the app.<br>
															(2)Click<a class="copy-text" data-clipboard-text="{$ss_url_all_win}"> here (default)</a>, then right click on the small paper airplane icon and click on "import URL from clipboard".<br>
													</div>
													<div class="tab-pane fade" id="all_ss_mac">
														<p><a href="/ssr-download/ss-mac.zip">Download</a>, Install, and then download<a href="/user/getpcconf?is_mu=0&is_ss=1"> this (default)</a>or <a href="/user/getpcconf?is_mu=1&is_ss=1">this (single-port multi-user)</a>. Run the program, then right click on the small paper airplane icon on the bottom right. Select from the server list submenu "import server configuration file ...". Import this file, and then select a suitable server to connect.</p>
													</div>
													<div class="tab-pane fade" id="all_ss_ios">
														<p>We recommend you download <a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>. It is a third party app that costs an additional $3. If you don't want to purchase it for yourself, we have purchased this software from the US store. You can login using this Apple ID:<code>shz7348@icloud.com</code> and password <code>Qq654321.</code> Pay attention to special symbols and case, login to download and install, and then open this page in Safari and open <a href="{$ss_url_all}">this (default)</a>or<a href="{$ss_url_all_mu}"> this (single-port multi-user)</a>. Click OK to add all the servers.</p>
														<p>iOS download <a href="/link/{$ios_token}?is_ss=1">this (default）</a>or <a href="/link/{$ios_token}?is_ss=1&is_mu=1">this (single-port multi-user)</a>. Paste it into the app, and all the servers will be automatically added.</p>
													</div>
													<div class="tab-pane fade" id="all_ss_android">
														<p>Download <a href="/ssr-download/ss-android.apk">the basic version</a> or <a href="/ssr-download/ss-android-obfs.apk">the one with obfuscation</a>. Install, and then click on <a class="copy-text" data-clipboard-text="{$ss_url_all}">this link (default)</a> or <a class="copy-text" data-clipboard-text="{$ss_url_all_mu}">this link (single port multi-user port)</a>. Copy to the clipboard, then open the Shadowsocks app, select from "import from clipboard" from the top menu to import all the servers. Finally, select a server and click on the paper airplane icon to connect.</p>
													</div>
													<div class="tab-pane fade" id="all_ss_router">
														<p>Flash the router with <a href="http://www.right.com.cn/forum/thread-161324-1-1.html">This firmware</a>, Then SSH login router, execute the following command (import ordinary port)<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														Or this single-port multi-user<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														After the router has been installed, you can choose a Shadowsocks server to connect.</p>
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
										<p class="card-heading">Account Details</p>
										<dl class="dl-horizontal">
											<p><dt>Account level</dt>
											<dd>{$user->class}</dd></p>

											<p><dt>Level expiration date</dt>
											<dd>{$user->class_expire}</dd></p>

											<p><dt>Account expiration date</dt>
											<dd>{$user->expire_in}</dd>

											<p><dt>Speed ​​limit</dt>
											{if $user->node_speedlimit!=0}
											<dd>{$user->node_speedlimit}Mbps</dd>
											{else}
											<dd>Not limited</dd>
											{/if}</p>
											
											 <p><dt>Connected devices</dt>
											<dd>{$user->online_ip_count()}</dd></p>
                                          
                                            <p><dt>Limit on number of simultaneous connections</dt>
											{if $user->node_connector!=0}
											<dd>{$user->node_connector}</dd>
											{else}
                                            <dd>No limit</dd>
											{/if}</p>

											<p><dt>Last connected</dt>
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
													text: "Data Usage",
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
															y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, legendText:"Left {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "Left {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
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
										<p class="card-heading">Check in to get Additional Data</p>
											<p>Data will not be reset, but you will get additional free data.</p>

											<p>Each time you check in, you can get {$config['checkinMin']}~{$config['checkinMax']}MB Data.</p>

											<p>You can only check in once each day. You can click the button below or shake the phone to check in.</p>

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
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;Check in</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;Already checked in</a></p>
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
