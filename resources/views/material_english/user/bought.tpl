


{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Purchase History</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-sm-12">
				<section class="content-inner margin-top-no">
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>purchase record in the system。</p>
							</div>
						</div>
					</div>
					
					<div class="table-responsive">
						{$shops->render()}
						<table class="table ">
                            <tr>
								<th>Operating</th>
                                <th>ID</th>
                                <th>Product name</th>
								<th>Content</th>
								<th>Price</th>
                                <th>Renewal time</th>
								<th>Restores traffic when renewing</th>
                                
                            </tr>
                            {foreach $shops as $shop}
                            <tr>
								<td>
                                    <a class="btn btn-brand" {if $shop->renew==0}disabled{else} href="javascript:void(0);" onClick="delete_modal_show('{$shop->id}')"{/if}>Unsubscribe</a>
                                </td>
                                <td>#{$shop->id}</td>
                                <td>{$shop->shop()->name}</td>
								<td>{$shop->shop()->content()}</td>
								<td>{$shop->price} Yuan</td>
								{if $shop->renew==0}
                                <td>Not automatically renew</td>
								{else}
								<td>在 {$shop->renew_date()} Renewal</td>
								{/if}
								
								{if $shop->shop()->auto_reset_bandwidth==0}
                                <td>Not reset automatically</td>
								{else}
								<td>Automatic reset</td>
								{/if}
                                
                            </tr>
                            {/foreach}
                        </table>
						{$shops->render()}
					</div>
					
					
					<div aria-hidden="true" class="modal modal-va-middle fade" id="delete_modal" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">Are you sure you want to unsubscribe?</h2>
								</div>
								<div class="modal-inner">
									<p>Please confirm.</p>
								</div>
								<div class="modal-footer">
									<p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal" type="button">Cancel</button><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="delete_input" type="button">Determine</button></p>
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}

							
			</div>
			
			
			
		</div>
	</main>






{include file='user/footer.tpl'}




<script>
function delete_modal_show(id) {
	deleteid=id;
	$("#delete_modal").modal();
}

$(document).ready(function(){
	function delete_id(){
		$.ajax({
			type:"DELETE",
			url:"/user/bought",
			dataType:"json",
			data:{
				id: deleteid
			},
			success:function(data){
				if(data.ret){
					$("#result").modal();
					$("#msg").html(data.msg);
					window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
				}else{
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error:function(jqXHR){
				$("#result").modal();
				$("#msg").html(data.msg+"  发生错误了。");
			}
		});
	}
	$("#delete_input").click(function(){
		delete_id();
	});
})
	
</script>







