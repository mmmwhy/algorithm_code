 {include file='admin/main.tpl'}







<main class="content">
	<div class="content-header ui-content-header">
		<div class="container">
			<h1 class="content-heading">Filtering Logs</h1>
		</div>
	</div>
	<div class="container">
		<div class="col-lg-12 col-md-12">
			<section class="content-inner margin-top-no">

				<div class="card">
					<div class="card-main">
						<div class="card-inner">
							<p>All filtering records</p>
							<p>Show:
								{include file='table/checkbox.tpl'}
							</p>
						</div>
					</div>
				</div>

				<div class="table-responsive">
					{include file='table/table.tpl'}
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
