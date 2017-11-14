


{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Data Transit Rules</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-md-12">
				<section class="content-inner margin-top-no">

					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>All data transit rules</p>
								<p>Show:
	                {include file='table/checkbox.tpl'}
	              </p>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="search"> Enter User ID to search for all the rules for that particular user</label>
									<input class="form-control" id="search" type="text">
								</div>
							</div>
							<div class="card-action">
								<div class="card-action-btn pull-left">
									<a class="btn btn-flat waves-attach waves-light" id="search_button"><span class="icon">search</span>&nbsp;Search</a>
								</div>
							</div>
						</div>
					</div>

					<div class="table-responsive">
						{include file='table/table.tpl'}
					</div>

					<div class="fbtn-container">
						<div class="fbtn-inner">
							<a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light" href="/admin/relay/create">+</a>

						</div>
					</div>

					<div aria-hidden="true" class="modal modal-va-middle fade" id="delete_modal" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">Are you sure you want to delete this rule?</h2>
								</div>
								<div class="modal-inner">
									<p>Please confirm</p>
								</div>
								<div class="modal-footer">
									<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" type="button">Cancel</button><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="delete_input" type="button">Delete</button></p>
								</div>
							</div>
						</div>
					</div>

					{include file='dialog.tpl'}


			</div>



		</div>
	</main>






{include file='admin/footer.tpl'}




<script>
function delete_modal_show(id) {
	deleteid=id;
	$("#delete_modal").modal();
}

{include file='table/js_1.tpl'}

$(document).ready(function(){

	{include file='table/js_2.tpl'}

	function delete_id(){
		$.ajax({
			type:"DELETE",
			url:"/admin/relay",
			dataType:"json",
			data:{
				id: deleteid
			},
			success:function(data){
				if(data.ret){
					$("#result").modal();
					$("#msg").html(data.msg);
					{include file='table/js_delete.tpl'}
				}else{
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error:function(jqXHR){
				$("#result").modal();
				$("#msg").html(data.msg+"  error");
			}
		});
	}

	$("#delete_input").click(function(){
		delete_id();
	});

	function search(){
		window.location="/admin/relay/path_search/"+$("#search").val();
	}

	$("#search_button").click(function(){
		if($("#search").val()!="")
		{
			search();
		}
	});
})

</script>
