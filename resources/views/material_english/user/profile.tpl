


{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Account</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">My account</p>
										<dl class="dl-horizontal">
											<dt>Username</dt>
											<dd>{$user->user_name}</dd>
											<dt>Mail</dt>
											<dd>{$user->email}</dd>
										</dl>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<a class="btn btn-flat waves-attach" href="kill"><span class="icon">check</span>&nbsp;Delete my account</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-main">
								<div class="card-inner margin-bottom-no">
									<p class="card-heading">The last five minutes use IP</p>
									<p>Please confirm for their own IP, if any abnormal please modify the connection password.</p>
									<div class="card-table">
										<div class="table-responsive">
											<table class="table">
												<tr>

													<th>IP</th>
													<th>Attribution</th>
												</tr>
												{foreach $userip as $single=>$location}
													<tr>

														<td>{$single}</td>
														<td>{$location}</td>
													</tr>
												{/foreach}
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="card">
							<div class="card-main">
								<div class="card-inner margin-bottom-no">
									<p class="card-heading">Last 10 logon IP</p>
									<p>Please confirm for their own IP, if any, please change the password in time.</p>
									<div class="card-table">
										<div class="table-responsive">
											<table class="table">
												<tr>

													<th>IP</th>
													<th>Attribution</th>
												</tr>
												{foreach $userloginip as $single=>$location}
													<tr>

														<td>{$single}</td>
														<td>{$location}</td>
													</tr>
												{/foreach}
											</table>
										</div>
									</div>
								</div>

							</div>
						</div>



						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">Rebate record</p>
										<div class="card-table">
											<div class="table-responsive">
											{$paybacks->render()}
												<table class="table">
													<thead>
													<tr>
														<th>###</th>
														<th>Rebate user</th>
														<th>Amount of rebate</th>
													</tr>
													</thead>
													<tbody>
													{foreach $paybacks as $payback}
														<tr>
															<td><b>{$payback->id}</b></td>
															{if $payback->user()!=null}
																<td>{$payback->user()->user_name}
																</td>
																{else}
																<td>Has been canceled
																</td>
															{/if}
															</td>
															<td>{$payback->ref_get} CNY</td>
														</tr>
													{/foreach}
													</tbody>
												</table>
											{$paybacks->render()}
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
