


{include file='user/header_info.tpl'}


{$ssr_prefer = URL::SSRCanConnect($user, $mu)}

	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点信息</h1>
				<h5 class="content-heading">【注意！】配置文件以及二维码请勿泄露！</h5>
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
										<p class="card-heading">扫描二维码</p>


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
												<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
											{/if}
										</div>
										<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_qrcode">
											{if URL::SSCanConnect($user, $mu)}
												<nav class="tab-nav margin-top-no">
													<ul class="nav nav-list">
														<li class="active">
															<a class="waves-attach" data-toggle="tab" href="#ss_qrcode_normal"><i class="icon icon-lg">android</i>&nbsp;手机</a>
														</li>
														<li>
															<a class="waves-attach" data-toggle="tab" href="#ss_qrcode_win"><i class="icon icon-lg">desktop_windows</i>&nbsp;电脑</a>
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
												<p>您好，您目前的 加密方式，混淆，或者协议设置在 Shadowsocks 客户端下无法连接。请您选用 ShadowsocksR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
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
										<p class="card-heading">！如果二维码扫描失败，请手动填写以下信息</p>
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
													<p>服务器地址：{$ssr_item['address']}<br>
													服务器端口：{$ssr_item['port']}<br>
													加密方式：{$ssr_item['method']}<br>
													密码：{$ssr_item['passwd']}<br>
													协议：{$ssr_item['protocol']}<br>
													协议参数：{$ssr_item['protocol_param']}<br>
													混淆：{$ssr_item['obfs']}<br>
													混淆参数：{$ssr_item['obfs_param']}<br></p>
												{else}
													<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
													<p>同时, ShadowsocksR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
												{/if}
											</div>
											<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="ss_info">
												{if URL::SSCanConnect($user, $mu)}
													{$ss_item = URL::getItem($user, $node, $mu, $relay_rule_id, 1)}
													<p>服务器地址：{$ss_item['address']}<br>
													服务器端口：{$ss_item['port']}<br>
													加密方式：{$ss_item['method']}<br>
													密码：{$ss_item['passwd']}<br>
													混淆：{$ss_item['obfs']}<br>
													混淆参数：{$ss_item['obfs_param']}<br></p>
												{else}
													<p>您好，您目前的 加密方式，混淆，或者协议设置在 Shadowsocks 客户端下无法连接。请您选用 ShadowsocksR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
												{/if}
											</div>
											
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
