<!DOCTYPE html>
<html lang="en" class="main">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<title>{$config["appName"]}</title>
	<link rel="icon" type="image/png" href="/theme/sk/img/favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="/theme/sk/img/favicon-16x16.png" sizes="16x16" />
	<!-- css -->
	<link href="/theme/sk/css/main.min.css" rel="stylesheet">

	<!-- favicon -->
	<!-- ... -->
</head>
<body>
	<header class="header header-orange header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<div>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg text-white">menu</span>
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
									<a class="padding-right-lg waves-attach" href="/user" class="padding-right-lg waves-attach"><i class="icon icon-lg margin-right">recent_actors</i>&nbsp;用户中心</a>
								</li>
								<li>
									<a class="padding-right-lg waves-attach" href="/user/profile"><i class="icon icon-lg margin-right">info</i>&nbsp;账户信息</a>
								</li>
								<li>
									<a class="padding-right-lg waves-attach" href="/user/edit"><i class="icon icon-lg margin-right">info</i>&nbsp;修改</a>
								</li>
								<li>
									<a class="padding-right-lg waves-attach" href="/user/invite"><i class="icon icon-lg margin-right">loyalty</i>&nbsp;邀请码</a>
								</li>
								<li>
									<a class="padding-right-lg waves-attach" href="/user/logout"><span class="icon icon-lg margin-right">exit_to_app</span>登出</a>
								</li>								
							</ul>
						{else}
							<span class="access-hide">未登录</span>
							<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="/theme/material/images/users/avatar-001.jpg"></span>
							</a>
							<ul class="dropdown-menu dropdown-menu-right">
								<li>
									<a class="padding-right-lg waves-attach" href="/auth/login"><span class="icon icon-lg margin-right">account_box</span>登录</a>
								</li>
								<li>
									<a class="padding-right-lg waves-attach" href="/auth/register"><span class="icon icon-lg margin-right">pregnant_woman</span>注册</a>
								</li>
							</ul>
						{/if}
							
					</div>
				</ul>
		
	</header>
	<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">

				<ul class="nav">
					<li>
						<a class="waves-attach sub" data-toggle="collapse" href="#ui_menu_me">我的</a>
						<ul class="menu-collapse collapse in" id="ui_menu_me">
							<li>
								<a href="/user" class="padding-right-lg waves-attach"><i class="icon icon-lg">recent_actors</i>&nbsp;用户中心</a>
							</li>							
						</ul>


						<a class="waves-attach sub" data-toggle="collapse" href="#ui_menu_help">产品购买</a>
						<ul class="menu-collapse collapse in" id="ui_menu_help">
						
							<li>
								<a href="/user/code">
									<i class="icon icon-lg">code</i>&nbsp; 1-充值
								</a>
							</li>
							<li>
								<a href="/user/shop">
									<i class="icon icon-lg">shop</i>&nbsp; 2-购买套餐
								</a>
							</li>
							<li>
								<a href="/user/node"><i class="icon icon-lg">router</i>&nbsp; 3-节点/教程/流量</a>
							</li>
						</ul>
						
						
						{if $user->isAdmin()}
						<a class="waves-attach sub" data-toggle="collapse" href="#ui_menu_use">使用</a>
						<ul class="menu-collapse collapse in" id="ui_menu_use">
							
							<li>
								<a href="/user/lookingglass">
									<i class="icon icon-lg">youtube_searched_for</i>&nbsp;观察窗
								</a>
							</li>
							<li>
								<a href="/user/relay">
									<i class="icon icon-lg">compare_arrows</i>&nbsp;中转规则
								</a>
							</li>							

						</ul>
						{/if}

						<!--
						<a class="waves-attach" data-toggle="collapse" href="#ui_menu_detect">审计</a>
						<ul class="menu-collapse collapse in" id="ui_menu_detect">
							<li><a href="/user/detect"><i class="icon icon-lg">account_balance</i>&nbsp;审计规则</a></li>
							<li><a href="/user/detect/log"><i class="icon icon-lg">assignment_late</i>&nbsp;审计记录</a></li>
						</ul>
						-->
						
						<a class="waves-attach sub" data-toggle="collapse" href="#ui_menu_trade">帮助</a>
						<ul class="menu-collapse collapse in" id="ui_menu_trade">
							<li>
								<a href="/user/ticket">
									<i class="icon icon-lg">question_answer</i>&nbsp;联系我们
								</a>
							</li>
							<li>
								<a href="/user/announcement">
									<i class="icon icon-lg">announcement</i>&nbsp;公告
								</a>
							</li>
							<li><a href="/user/bought"><i class="icon icon-lg">shopping_cart</i>&nbsp;交易记录</a></li>
							<!--<li>
								<a href="/user/trafficlog"><i class="icon icon-lg">traffic</i>&nbsp;流量记录</a>
							</li>-->
						</ul>

						
						{if $user->isAdmin()}
							<li>
								<a href="/admin" class="admin">
									<i class="icon icon-lg">person_pin</i>&nbsp;管理面板Admin
								</a>
							</li>
						{/if}


						

						
					</li>
				</ul>
			</div>
		</div>
	</nav>
