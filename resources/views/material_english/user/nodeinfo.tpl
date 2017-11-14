


{include file='user/header_info.tpl'}


{$ssr_prefer = URL::SSRCanConnect($user, $mu)}




	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Server information</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Important!</p>
										<p>Do not share/post these details and QR codes anywhere.</p>
									</div>

								</div>
							</div>
						</div>


						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Server Configurations</p>
										<div class="tab-content">

											<nav class="tab-nav margin-top-no">
												<ul class="nav nav-list">
													<li {if $ssr_prefer}class="active"{/if}>
														<a class="waves-attach" data-toggle="tab" href="#ssr_info"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
													</li>
													<li {if !$ssr_prefer}class="active"{/if}>
														<a class="waves-attach" data-toggle="tab" href="#ss_info"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
													</li>
												</ul>
											</nav>
											<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="ssr_info">
												{if URL::SSRCanConnect($user, $mu)}
													{$ssr_item = URL::getItem($user, $node, $mu, $relay_rule_id, 0)}
													<p>Server address：{$ssr_item['address']}<br>
													Server port：{$ssr_item['port']}<br>
													Encryption：{$ssr_item['method']}<br>
													Password：{$ssr_item['passwd']}<br>
													Protocol：{$ssr_item['protocol']}<br>
													Protocol parameters：{$ssr_item['protocol_param']}<br>
													Obfuscation：{$ssr_item['obfs']}<br>
													Obfuscation parameters：{$ssr_item['obfs_param']}<br></p>
												{else}
													<p>Your current encryption type, obfuscation type, or protocol will not work with the ShadowsocksR client. Please use the Shadowsocks client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
													<p>If you are using the ShadowsocksR single-port multi-user connection type, then it will not be affected by your settings, and you can use the corresponding client to connect without problem ~</p>
												{/if}
											</div>
											<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_info">
												{if URL::SSCanConnect($user, $mu)}
													{$ss_item = URL::getItem($user, $node, $mu, $relay_rule_id, 1)}
													<p>Server address：{$ss_item['address']}<br>
													Server port：{$ss_item['port']}<br>
													Encryption：{$ss_item['method']}<br>
													Password：{$ss_item['passwd']}<br>
													Obfuscation：{$ss_item['obfs']}<br>
													Obfuscation parameters：{$ss_item['obfs_param']}<br></p>
												{else}
													<p>Your current encryption type, obfuscation type, or protocol will not work with the Shadowsocks client. Please use the ShadowsocksR client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
												{/if}
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">App Downloads</p>


										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#ssr_download"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
												</li>
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#ss_download"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
											</ul>
										</nav>
										<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="ssr_download">
											{if URL::SSRCanConnect($user, $mu)}
												<p><i class="icon icon-lg">desktop_windows</i>&nbsp;<a href="/ssr-download/ssr-win.7z">Windows</a></p>
												<p><i class="icon icon-lg">laptop_mac</i>&nbsp;<a href="/ssr-download/ssr-mac.dmg">Mac OS X</a></p>
												<p><i class="icon icon-lg">laptop_windows</i>&nbsp;<a href="https://github.com/breakwa11/shadowsocks-rss/wiki/Python-client">Linux</a></p>
												<p><i class="icon icon-lg">android</i>&nbsp;<a href="/ssr-download/ssr-android.apk">Android</a></p>
												<p><i class="icon icon-lg">phone_iphone</i>&nbsp;<a href="https://itunes.apple.com/us/app/shadowrocket/id932747118">iOS</a></p>
											{else}
												<p>Your current encryption type, obfuscation type, or protocol will not work with the ShadowsocksR client. Please use the Shadowsocks client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
											{/if}
										</div>
										<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_download">
											{if URL::SSCanConnect($user, $mu)}
												<p><i class="icon icon-lg">desktop_windows</i>&nbsp;<a href="/ssr-download/ss-win.7z">Windows</a></p>
												<p><i class="icon icon-lg">laptop_mac</i>&nbsp;<a href="/ssr-download/ss-mac.zip">Mac OS X</a></p>
												<p><i class="icon icon-lg">laptop_windows</i>&nbsp;<a href="https://shadowsocks.org/en/download/clients.html">Linux</a></p>
												<p><i class="icon icon-lg">android</i>&nbsp;<a href="/ssr-download/ss-android.apk">Android</a></p>
												<p><i class="icon icon-lg">android</i>&nbsp;<a href="/ssr-download/ss-android-obfs.apk">Android Obfs Plugin</a></p>
												<p><i class="icon icon-lg">phone_iphone</i>&nbsp;<a href="https://itunes.apple.com/us/app/shadowrocket/id932747118">iOS</a></p>
											{else}
												<p>Your current encryption type, obfuscation type, or protocol will not work with the Shadowsocks client. Please use the ShadowsocksR client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
											{/if}
										</div>

									</div>

								</div>
							</div>
						</div>

						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Configuration Json File</p>

										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#ssr_json"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
												</li>
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#ss_json"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
											</ul>
										</nav>
										<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="ssr_json">
											{if URL::SSRCanConnect($user, $mu)}
												<textarea class="form-control" rows="6">
{
    "server": "{$ssr_item['address']}",
    "local_address": "127.0.0.1",
    "local_port": 1080,
    "timeout": 300,
    "workers": 1,
    "server_port": {$ssr_item['port']},
    "password": "{$ssr_item['passwd']}",
    "method": "{$ssr_item['method']}",
    "obfs": "{$ssr_item['obfs']}",
    "obfs_param": "{$ssr_item['obfs_param']}",
    "protocol": "{$ssr_item['protocol']}",
    "protocol_param": "{$ssr_item['protocol_param']}"
}
												</textarea>
											{else}
												<p>Your current encryption type, obfuscation type, or protocol will not work with the ShadowsocksR client. Please use the Shadowsocks client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
											{/if}
										</div>
										<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_json">
											{if URL::SSCanConnect($user, $mu)}
											<textarea class="form-control" rows="6">
{
		"server": "{$ss_item['address']}",
		"local_address": "127.0.0.1",
		"local_port": 1080,
		"timeout": 300,
		"workers": 1,
		"server_port": {$ss_item['port']},
		"password": "{$ss_item['passwd']}",
		"method": "{$ss_item['method']}",
		"plugin": "{URL::getJsonObfs($ss_item)}"
}
											</textarea>
											{else}
												<p>Your current encryption type, obfuscation type, or protocol will not work with the Shadowsocks client. Please use the ShadowsocksR client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
											{/if}
										</div>

									</div>

								</div>
							</div>
						</div>

						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Configuration link</p>

										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#ssr_url"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
												</li>
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#ss_url"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
											</ul>
										</nav>
										<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="ssr_url">
											{if URL::SSRCanConnect($user, $mu)}
												<p><a href="{URL::getItemUrl($ssr_item, 0)}"/>For Android: open this link in your default browser to enter your servers into the app (to ShadowsocksR APP)</a></p>
												<p><a href="{URL::getItemUrl($ssr_item, 0)}"/>For iOS: open with Safari and open the link in (to Shadowrocket)</a></p>
											{else}
												<p>Your current encryption type, obfuscation type, or protocol will not work with the ShadowsocksR client. Please use the Shadowsocks client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
											{/if}
										</div>
										<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_url">
											{if URL::SSCanConnect($user, $mu)}
												<p><a href="{URL::getItemUrl($ss_item, 1)}"/>For Android: open this link in your default browser to enter your servers into the app (to Shadowsocks APP)</a></p>
												<p><a href="{URL::getItemUrl($ss_item, 1)}"/>For iOS: open with Safari and open the link in (to Shadowrocket)</a></p>
											{else}
												<p>Your current encryption type, obfuscation type, or protocol will not work with the Shadowsocks client. Please use the ShadowsocksR client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
											{/if}
										</div>
									</div>

								</div>
							</div>
						</div>

						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Configure QR Code</p>


										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#ssr_qrcode"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
												</li>
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#ss_qrcode"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
											</ul>
										</nav>
										<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="ssr_qrcode">
											{if URL::SSRCanConnect($user, $mu)}
												<div class="text-center">
													<div id="ss-qr-n"></div>
												</div>
											{else}
												<p>Your current encryption type, obfuscation type, or protocol will not work with the ShadowsocksR client. Please use the Shadowsocks client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
											{/if}
										</div>
										<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_qrcode">
											{if URL::SSCanConnect($user, $mu)}
												<nav class="tab-nav margin-top-no">
													<ul class="nav nav-list">
														<li class="active">
															<a class="waves-attach" data-toggle="tab" href="#ss_qrcode_normal"><i class="icon icon-lg">android</i>&nbsp;Other platforms</a>
														</li>
														<li>
															<a class="waves-attach" data-toggle="tab" href="#ss_qrcode_win"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
														</li>
													</ul>
												</nav>
												<div class="tab-pane fade active in" id="ss_qrcode_normal">
													<div class="text-center">
														<div id="ss-qr"></div>
													</div>
												</div>
												<div class="tab-pane fade" id="ss_qrcode_win">
													<div class="text-center">
														<div id="ss-qr-win"></div>
													</div>
												</div>
											{else}
												<p>Your current encryption type, obfuscation type, or protocol will not work with the Shadowsocks client. Please use the ShadowsocksR client to connect, or to the edit details page to change them to compatible types before coming back here.</p>
											{/if}
										</div>
									</div>

								</div>
							</div>
						</div>



					</div>
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script src="/assets/public/js/jquery.qrcode.min.js"></script>
<script>
	{if URL::SSCanConnect($user, $mu)}
	var text_qrcode = '{URL::getItemUrl($ss_item, 1)}';
	jQuery('#ss-qr').qrcode({
		"text": text_qrcode
	});

	var text_qrcode_win = '{URL::getItemUrl($ss_item, 2)}';
	jQuery('#ss-qr-win').qrcode({
		"text": text_qrcode_win
	});
	{/if}

	{if URL::SSRCanConnect($user, $mu)}
	var text_qrcode2 = '{URL::getItemUrl($ssr_item, 0)}';
	jQuery('#ss-qr-n').qrcode({
		"text": text_qrcode2
	});
	{/if}


</script>
