





{include file='user/header_info.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Node information</h1>
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
										<p class="card-heading">Warning!</p>
										<p>The following is your PAC configuration.</p>
									</div>
									
								</div>
							</div>
						</div>			
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Configuration information</p>
										<p>{$json_show}</p>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Configuration method</p>
										<p>Android: Open the settings -WLAN-long press the wifi- pop-up window to use - click Modify Network - expand the Advanced Options - Proxy box to select the proxy auto configuration - PAC URL to fill in the configuration information given by the address - save. The connection will be prompted to enter the user name password, according to the configuration information can be input.</p>
                                        <p>iOS: Open Settings - Wireless LAN - Click the wifi to be used on the right side of the blue to modify the button - in the newly opened page - HTTP proxy select the auto -URL box to fill in the configuration information given by the address - save. The connection will be prompted to enter the user name password, according to the configuration information can be input.</p>
                                        <p>Windows: Open the Control Panel - select the small icon or large icon in the view mode - open the Internet option - on the Connection tab, click LAN Settings - select the automatic script in the auto configuration and fill in the address given in the configuration information To the address bar - and then click OK - Apply. The connection will be prompted to enter the user name password, according to the configuration information can be input.</p>
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




