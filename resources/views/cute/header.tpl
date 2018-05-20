<!DOCTYPE html>
<html lang="en" class="login-in">
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
<body class="page-brand">
	<header class="header header-transparent header-waterfall ui-header">		
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
				{if $user->isLogin}
					<span class="access-hide">{$user->user_name}</span>
					<!--<span class="avatar avatar-sm"><img src="{$user->gravatar}"></span>-->
					<span class="avatar avatar-sm"><img src="/theme/sk/img/icon.png"></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li>
							<a class="padding-right-lg waves-attach" href="/user/"><span class="icon icon-lg margin-right">account_box</span>&nbsp;用户中心</a>
						</li>
						<li>
							<a class="padding-right-lg waves-attach" href="/user/logout"><span class="icon icon-lg margin-right">exit_to_app</span>&nbsp;登出</a>
						</li>
					</ul>
				{else}
					<span class="access-hide">未登录</span>
					<span class="avatar avatar-sm"><img src="/theme/sk/img/icon.png"></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li>
							<a class="padding-right-lg waves-attach" href="/auth/login"><span class="icon icon-lg margin-right">account_box</span>&nbsp;登录</a>
						</li>
						<li>
							<a class="padding-right-lg waves-attach" href="/auth/register"><i class="icon icon-lg margin-right">code</i>&nbsp;注册</a>
						</li>
					</ul>
				{/if}
					
			</li>
		</ul>
	</header>

	{if $user->isLogin}
	<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
		<div class="menu-scroll">
			<div class="menu-content">				
				<ul class="nav">
					<li>
						<a  href="/user"><i class="icon icon-lg">bookmark_border</i>&nbsp;首页</a>
					</li>
					<li>
						<a  href="/tos"><i class="icon icon-lg">text_format</i>&nbsp;TOS</a>
					</li>
					<li>
						<a  href="/user/logout"><i class="icon icon-lg">call_missed_outgoing</i>&nbsp;退出</a>
					</li>
					
					<!--
					<li>
						<a  href="/auth/login"><i class="icon icon-lg">vpn_key</i>&nbsp;登录</a>
					</li>
					<li>
						<a  href="/auth/register"><i class="icon icon-lg">pregnant_woman</i>&nbsp;注册</a>
					</li>
					-->

				</ul>
			</div>
		</div>
	</nav>
	{else}
	{/if}
