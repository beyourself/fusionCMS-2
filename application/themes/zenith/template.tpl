{$head}
    <body>
        <link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <ul class='social'>
        <!-- insert links -->
	</ul>
        <!--[if lte IE 8]>
            <style type="text/css">
                body {
                    background-image:url(images/bg.jpg);
                    background-position:top center;
                }
            </style>
        <![endif]-->
        <section id="wrapper">
            {$modals}
            <div id="header">
                <div class="top_container">
                    <div class="login_box_top">
                        <div class="actions_cont">
                            {if $isOnline}
                            <div class="account_info">
                                <div class="avatar_top"> <!-- Avatar -->
                                    <img src="{$CI->user->getAvatar()}" width="50" height="50"/>
                                </div>
                                <div class="left"> <!-- Welcome & VP/DP -->
                                    <p>Welcome back, <span><a href="profile/{$id}" data-tip="View profile">{$CI->user->getNickname()}</span></a>!</p>
                                    <div class="vpdp">
                                        <div class="vp">
                                                <img src="{$url}application/images/icons/lightning.png" align="absmiddle" width="12" height="12" /> V. Points
                                            <span>{$CI->user->getVp()}</span>
                                        </div>
                                        <div class="dp">
                                                <img src="{$url}application/images/icons/coins.png" align="absmiddle" width="12" height="12"  /> D. Points
                                            <span>{$CI->user->getDp()}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="right">
                                    <a href="{$url}ucp" class="nice_button">User Panel</a>
                                    <a href="{$url}vote" class="nice_button">Vote</a>
                                    <a href="{$url}logout" class="nice_button">Log out</a>
                                </div>
                            </div>
                            {else}
                            <div class="login_form_top">
                                {form_open('login')}
                                    <input type="text" name="login_username" id="login_username" value="" placeholder="Username">
                                    <input type="password" name="login_password" id="login_password" value="" placeholder="Password">
                                    <input type="submit" name="login_submit" value="Login">
                                </form>
                            </div>
                            {/if}
                        </div>
                    </div>
                    <div class="top_menu">
                        <ul id="top_menu">
                            {foreach from=$menu_top item=menu_1}
                                <li><a {$menu_1.link}>{$menu_1.name}</a></li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
                <a id="server_logo" href="./" title="{$serverName}"><p>{$serverName}</p></a>
            </div>
            <div class="top_border"></div>
            <div id="main">
                <aside id="left">
                    {if $isOnline}
                    <a href="{$url}vote" id="vote_banner"><p>Vote for us</p></a>
                    {else}
                    <a href="{$url}register" id="register_banner"><p>Create Account</p></a>
                    {/if}
                    <article>
                        <ul id="left_menu">
                            {foreach from=$menu_side item=menu_2}
                            <li><a {$menu_2.link}><img src="{$image_path}bullet.png">{$menu_2.name}</a><p></p></li>
                            {/foreach}
                            <li class="bot_shadow"></li>
                        </ul>
                    </article>
                    {foreach from=$sideboxes item=sidebox}
                    <article class="sidebox">
                        <h1 class="top"><p>{$sidebox.name}</p></h1>
                        <section class="body">
                            {$sidebox.data}
                        </section>
                    </article>
                    {/foreach}
                </aside>
                <aside id="right">
                    <section id="slider_bg" {if !$show_slider}style="display:none;"{/if}>
                        <div id="slider">
                            <div class="overlay"></div>
                            {foreach from=$slider item=image}
                                <a href="{$image.link}"><img src="{$image.image}" title="{$image.text}"/></a>
                            {/foreach}
                        </div>
                        <h1 id="news_title"><p>Latest News</p></h1>
                    </section>
                    {$page}
                </aside>
                <div class="clear"></div>
            </div>
            <footer>
                All multimedia components of this website are sole property of the appropriate owner and their use is attributed only to the entertainment of the visitor.</br>
                Copyright 2009 - 2016 <a href="http://klimax-wow.com/">www.klimax-wow.com</a> and its content are in no way affiliated with, associated with or endorsed by <a href="http://blizzard.com/">Blizzard Entertainment</a>!<br/>
                <a href="http://battle.net/wow/">World of Warcraft©</a> and <a href="http://blizzard.com/">Blizzard Entertainment©</a> are all trademarks and/or registered trademarks of <a href="http://blizzard.com/">Blizzard Entertainment</a> in the United States and/or other countries.<br/>
                No financial amenities are sought from the success of this multimedia website.
{literal}
<script>   (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){   (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),   m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)   })(window,document,'script','http://www.google-analytics.com/analytics.js','ga');    ga('create', 'UA-77240659-1', 'auto');   ga('send', 'pageview');  </script>
{/literal}
            </footer>
        </section>
    </body>
</html>
