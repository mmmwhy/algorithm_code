<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#f44336">
	<title>{$config["appName"]}</title>



	<!-- css -->
	<link href="/theme/material/css/base.css" rel="stylesheet">
	<link href="/theme/material/css/project.css" rel="stylesheet">
	<link href="//fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="//cdn.staticfile.org/material-design-lite/1.1.0/material.min.css" rel="stylesheet">
	<link href="//cdn.staticfile.org/datatables/1.10.13/css/dataTables.material.min.css" rel="stylesheet">



	<!-- favicon -->
	<!-- ... -->
</head>

<body class="page-red">
	<header class="header header-red header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<div>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</div>
		</ul>

		<ul class="nav nav-list pull-right">
			<div class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
				{if $user->isLogin}
					<span class="access-hide">{$user->user_name}</span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="{$user->gravatar}"></span>
					</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li>
						<a class="padding-right-lg waves-attach" href="/user/"><span class="icon icon-lg margin-right">account_box</span>User Dashboard</a>
					</li>
					<li>
						<a class="padding-right-lg waves-attach" href="/user/logout"><span class="icon icon-lg margin-right">exit_to_app</span>Log out</a>
					</li>
				</ul>
				{else}
				<span class="access-hide">Logged out</span>
				<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="/theme/material/images/users/avatar-001.jpg"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li>
						<a class="padding-right-lg waves-attach" href="/auth/login"><span class="icon icon-lg margin-right">account_box</span>Login</a>
					</li>
					<li>
						<a class="padding-right-lg waves-attach" href="/auth/register"><span class="icon icon-lg margin-right">pregnant_woman</span>Register</a>
					</li>
				</ul>
				{/if}

			</div>
		</ul>
	</header>
	<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">
				<a class="menu-logo" href="/"><i class="icon icon-lg">person_pin</i>&nbsp;Control Panel</a>
				<ul class="nav">
					<li>
						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_me">My Site</a>
						<ul class="menu-collapse collapse in" id="ui_menu_me">
							<li><a href="/admin"><i class="icon icon-lg">business_center</i>&nbsp;System Overview</a></li>
							<li><a href="/admin/announcement"><i class="icon icon-lg">announcement</i>&nbsp;Annoucements</a></li>
							<li><a href="/admin/ticket"><i class="icon icon-lg">question_answer</i>&nbsp;Support Tickets</a></li>
							<li><a href="/admin/auto"><i class="icon icon-lg">flash_auto</i>&nbsp;Send Server Command</a></li>
						</ul>

						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_node">Servers</a>
						<ul class="menu-collapse collapse in" id="ui_menu_node">
							<li><a href="/admin/node"><i class="icon icon-lg">router</i>&nbsp;Server List</a></li>
							<li><a href="/admin/trafficlog"><i class="icon icon-lg">traffic</i>&nbsp;Data Usage</a></li>
							<li><a href="/admin/block"><i class="icon icon-lg">dialer_sip</i>&nbsp;Banned IPs</a></li>
							<li><a href="/admin/unblock"><i class="icon icon-lg">dialer_sip</i>&nbsp;White-listed IPs</a></li>
						</ul>

						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_user">Users</a>
						<ul class="menu-collapse collapse in" id="ui_menu_user">
							<li><a href="/admin/user"><i class="icon icon-lg">supervisor_account</i>&nbsp;User List</a></li>
							<li><a href="/admin/relay"><i class="icon icon-lg">compare_arrows</i>&nbsp;Data Redirect Rules</a></li>
							<li><a href="/admin/invite"><i class="icon icon-lg">loyalty</i>&nbsp;Invitation Codes and Rebates</a></li>
							<li><a href="/admin/login"><i class="icon icon-lg">text_fields</i>&nbsp;Login History</a></li>
							<li><a href="/admin/alive"><i class="icon icon-lg">important_devices</i>&nbsp;Online IPs</a></li>
						</ul>

						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_detect">Filtering</a>
						<ul class="menu-collapse collapse in" id="ui_menu_detect">
							<li><a href="/admin/detect"><i class="icon icon-lg">account_balance</i>&nbsp;Filtering Rules</a></li>
							<li><a href="/admin/detect/log"><i class="icon icon-lg">assignment_late</i>&nbsp;Filtering History</a></li>
						</ul>


						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_trade">Transactions</a>
						<ul class="menu-collapse collapse in" id="ui_menu_trade">
							<li><a href="/admin/code"><i class="icon icon-lg">code</i>&nbsp;Recharge Codes {if $config['enable_donate']=='true'}and Donations{/if}</a></li>
							<li><a href="/admin/shop"><i class="icon icon-lg">shop</i>&nbsp;Product List</a></li>
							<li><a href="/admin/coupon"><i class="icon icon-lg">card_giftcard</i>&nbsp;Coupons</a></li>
							<li><a href="/admin/bought"><i class="icon icon-lg">shopping_cart</i>&nbsp;Purchase History</a></li>
						</ul>

						<li><a href="/user"><i class="icon icon-lg">person</i>&nbsp;User Dashboard</a></li>
					</li>



				</ul>
			</div>
		</div>
	</nav>
