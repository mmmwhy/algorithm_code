 {include file='admin/main.tpl'}







<main class="content">
	<div class="content-header ui-content-header">
		<div class="container">
			<h1 class="content-heading">Invitation Codes</h1>
		</div>
	</div>
	<div class="container">
		<section class="content-inner margin-top-no">

			<div class="card">
				<div class="card-main">
					<div class="card-inner">
						<p>For Public Inviation Codes（Type 0）Please <a href="/code">click here</a>.</p>
					</div>
				</div>
			</div>


			<div class="card">
				<div class="card-main">
					<div class="card-inner">
						<div class="form-group form-group-label">
							<label class="floating-label" for="prefix">Invitation code prefix</label>
							<input class="form-control" id="prefix" type="text">
						</div>

						<div class="form-group form-group-label">
							<label class="floating-label" for="uid">Invitation code type (0 means public. Other numbers refer to user ID, or enter the full email address of the user)</label>
							<input class="form-control" id="uid" type="text">
						</div>

						<div class="form-group form-group-label">
							<label class="floating-label" for="prefix">Amount of invitation codes to create</label>
							<input class="form-control" id="num" type="number">
						</div>


					</div>

					<div class="card-action">
						<div class="card-action-btn pull-left">
							<a class="btn btn-flat waves-attach" id="invite"><span class="icon">check</span>&nbsp;Create</a>
						</div>
					</div>
				</div>
			</div>

			<div class="card margin-bottom-no">
				<div class="card-main">
					<div class="card-inner">
						<p class="card-heading">Rebate records</p>
						<p>Show: {include file='table/checkbox.tpl'}
						</p>
						<div class="card-table">
							<div class="table-responsive">
								{include file='table/table.tpl'}
							</div>
						</div>


					</div>
				</div>
			</div>

			{include file='dialog.tpl'}


	</div>



</main>










{include file='admin/footer.tpl'}

<script>
{include file='table/js_1.tpl'}

$("#invite").click(function () {
    $.ajax({
        type: "POST",
        url: "/admin/invite",
        dataType: "json",
        data: {
            prefix: $("#prefix").val(),
            uid: $("#uid").val(),
            num: $("#num").val()
        },
        success: function (data) {
            if (data.ret) {
                $("#result").modal();
                $("#msg").html(data.msg);
                window.setTimeout("location.href='/admin/invite'", {$config['jump_delay']});
						}
            else
						{
							$("#result").modal();
	                        $("#msg").html(data.msg+"。");
						}

            // window.location.reload();
        },
        error: function (jqXHR) {
            alert("error：" + jqXHR.status);
        }
    })
});

$(document).ready(function(){
 	{include file='table/js_2.tpl'}
});
</script>
