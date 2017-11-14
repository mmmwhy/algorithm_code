 {include file='admin/main.tpl'}







<main class="content">
	<div class="content-header ui-content-header">
		<div class="container">
			<h1 class="content-heading">Recharge Code {if $config['enable_donate']=='true'}and Donations{/if} Management</h1>
		</div>
	</div>
	<div class="container">
		<div class="col-lg-12 col-md-12">
			<section class="content-inner margin-top-no">

				<div class="card">
					<div class="card-main">
						<div class="card-inner">
							<p>All transactions in the system</p>
							<p>Show:
								{include file='table/checkbox.tpl'}
							</p>
						</div>
					</div>
				</div>

				<div class="table-responsive">
					{include file='table/table.tpl'}
				</div>


				<div class="fbtn-container">
					<div class="fbtn-inner">
						<a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light" href="/admin/code/create">+</a>

					</div>
				</div>


				<div class="fbtn-container">
					<div class="fbtn-inner">
						<a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light" data-toggle="dropdown"><span class="fbtn-ori icon">add</span><span class="fbtn-sub icon">close</span></a>
						<div class="fbtn-dropup">
							<a class="fbtn fbtn-brand waves-attach waves-circle waves-light" href="/admin/code/create"><span class="fbtn-text fbtn-text-left">Recharge Code</span><span class="icon">code</span></a> {if $config['enable_donate']=='true'}
							<a class="fbtn fbtn-green waves-attach waves-circle waves-light" href="/admin/donate/create"><span class="fbtn-text fbtn-text-left">Donations and Payments</span><span class="icon">attach_money</span></a> {/if}
						</div>
					</div>
				</div>


		</div>



	</div>
</main>






{include file='admin/footer.tpl'}

<script>
{include file='table/js_1.tpl'}

$(document).ready(function(){
	{include file='table/js_2.tpl'}
});
</script>
