<!DOCTYPE html>
<html>
	<head>
		<title>Authorize - Klimax Administration</title>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 

		<link rel="shortcut icon" href="{$url}application/themes/admin/images/favicon.png" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/login.css" type="text/css" />

		<script type="text/javascript" src="{if $cdn}//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js{else}{$path}js/html5shiv.min.js{/if}"></script>
		<script type="text/javascript" src="{if $cdn}//cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js{else}{$path}js/jquery.min.js{/if}"></script>

		<script type="text/javascript">
			function getCookie(c_name)
			{
				var i, x, y, ARRcookies = document.cookie.split(";");

				for(i = 0; i < ARRcookies.length;i++)
				{
					x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
					y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
					x = x.replace(/^\s+|\s+$/g,"");
					
					if(x == c_name)
					{
						return unescape(y);
					}
				}
			}

			var Config = {
				URL: "{$url}",
				CSRF: getCookie('csrf_cookie_name'),
			};
		</script>

		<script src="{$url}application/js/require.js" type="text/javascript" ></script>
		<script type="text/javascript">

			var scripts = [
				"{$url}application/js/jquery.placeholder.min.js",
				"{$url}application/js/jquery.transit.min.js",
				"{$url}application/themes/admin/js/login.js"
			];

			require(scripts, function()
			{
				$('input[placeholder], textarea[placeholder]').placeholder();
			});
		</script>
	</head>

	<body>
		<div id="wrap">
			<div id="fixer">
				<div id="content">
					<h1>Authenticate</h1>

					<form onSubmit="Login.send(this); return false">
						<input type="text" placeholder="Username" {if $isOnline}disabled value="{$username}"{/if} id="username"/>
						<img src="{$url}application/themes/admin/images/icons/user.png" /><input type="password" placeholder="Password" {if $isOnline}disabled value="Password"{/if} id="password"><img src="{$url}application/themes/admin/images/icons/lock.png" /><input type="password" placeholder="Security code" id="security_code" />
						<img src="{$url}application/themes/admin/images/icons/star.png" />
						<input type="submit" value="Authorize" />
					</form>
				</div>
			</div>
		</div>
	</body>
</html>