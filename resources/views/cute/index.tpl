{include file='auth/header-login.tpl'}

<main class="content index">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner">

							<div class="logo-login">
								<em></em> {$config["appName"]}
							</div>

								<div class="con-index">
									<a href="/auth/login">登录</a> / <a href="/auth/register">注册</a>
								</div>

					</section>
				</div>
			</div>
		</div>
</main>

{include file='footer.tpl'}