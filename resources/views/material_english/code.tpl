



{include file='header.tpl'}






	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-lg-push-0 col-sm-12 col-sm-push-0">
						<h1 class="content-heading">Invitation code</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
				<section class="content-inner margin-top-no">
				
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>{$config["appName"]} 的邀请码，没了的话就烧纸吧。</p>
							</div>
						</div>
					</div>
				
					
					
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner margin-bottom-no">
								<p class="card-heading">Invitation code</p>
								<div class="card-table">
									<div class="table-responsive">
										<table class="table">
											<thead>
											<tr>
												<th>###</th>
												<th>Invitation code (Click the invitation code to enter the registration page)</th>
												<th>status</th>
											</tr>
											</thead>
											<tbody>
											{foreach $codes as $code}
											<tr>
												<td>{$code->id}</td>
												<td><a href="/auth/register?code={$code->code}">{$code->code}</a></td>
												<td>Available</td>
											</tr>
											{/foreach}
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				
					
					
					
							
			
			
		</div>
	</main>


{include file='footer.tpl'}