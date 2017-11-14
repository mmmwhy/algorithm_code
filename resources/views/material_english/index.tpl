{include file='header.tpl'}






	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-lg-push-0 col-sm-12 col-sm-push-0">
						<h1 class="content-heading">{$config["appName"]}</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
						<section class="content-inner margin-top-no">
						
					
								
							<div class="col-lg-12 col-sm-12">
								<div class="card">
									<div class="card-main">
										<div class="card-inner">
											<p>Welcome! </p>
										</div>
									</div>
								</div>
							</div>
						
						{if $user->isLogin}
							<div class="col-lg-12 col-sm-12">
								<div class="card card-brand">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">Dashboard</p>
											<p>
												Go to dashboard.
											</p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a class="btn btn-flat waves-attach waves-light waves-effect" href="/user"><span class="icon">airline_seat_recline_normal</span>&nbsp;Enter Dashboard</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						{else}
							<div class="col-lg-12 col-sm-12">
								<div class="card card-brand">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">Register</p>
											<p>
												Don't have an account? Register here.
											</p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a class="btn btn-flat waves-attach waves-light waves-effect" href="/auth/register"><span class="icon">pregnant_woman</span>&nbsp;Register</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-lg-12 col-sm-12">
								<div class="card card-brand-accent">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">Login</p>
											<p>
												Already have an account? Click below to login.
											</p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a class="btn btn-flat waves-attach waves-light waves-effect" href="/auth/login"><span class="icon">vpn_key</span>&nbsp;Login</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
								
						{/if}
							
							
							
						</section>

			
			
			
		</div>
	</main>


{include file='footer.tpl'}
