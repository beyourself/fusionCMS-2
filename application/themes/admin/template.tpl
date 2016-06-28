<!DOCTYPE html>
<html>    
    <head>
        <title>{if $title}{$title}{/if}Klimax Administration</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 

        <link rel="shortcut icon" href="{$url}application/themes/admin/images/favicon.png" />
        <link rel="stylesheet" href="{$url}application/themes/admin/css/main.css" type="text/css" />
        {if $extra_css}<link rel="stylesheet" href="{$url}application/{$extra_css}" type="text/css" />{/if}

        <script type="text/javascript" src="{if $cdn}//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js{else}{$path}js/html5shiv.min.js{/if}"></script>
        <script type="text/javascript" src="{if $cdn}//cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js{else}{$path}js/jquery.min.js{/if}"></script>

        <script type="text/javascript">
        
            if(!window.console)
            {
                var console = {
                
                    log: function()
                    {
                        // Prevent stupid browsers from doing stupid things
                    }
                };
            }

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
                isACP: true,
                defaultLanguage: "{$defaultLanguage}",
                languages: [ {foreach from=$languages item=language}"{$language}",{/foreach} ]
            };
        </script>

        <script src="{$url}application/themes/admin/js/router.js" type="text/javascript"></script>
        <script src="{$url}application/js/require.js" type="text/javascript" ></script>
        
        <script type="text/javascript">

            var scripts = [
                "{$url}application/js/jquery.placeholder.min.js",
                "{$url}application/js/jquery.transit.min.js",
                "{$url}application/js/ui.js",
                "{$url}application/js/fusioneditor.js"
                {if $extra_js},"{$url}application/{$extra_js}"{/if}
            ];

            require(scripts, function()
            {
                $(document).ready(function()
                {
                    UI.initialize();

                    {if $extra_css}
                        Router.loadedCSS.push("{$extra_css}");
                    {/if}

                    {if $extra_js}
                        Router.loadedJS.push("{$extra_js}");
                    {/if}
                });
            });

        </script>

        <!--[if IE]>
            <style type="text/css">
            #main .right h2 img {
                position:relative;
            }
            </style>
        <![endif]-->

        <!--[if LTE IE 7]>
            <style type="text/css">
            #main .right .statistics span {
                width:320px;
            }
            </style>
        <![endif]-->
    </head>

    <body>
        <div id="popup_bg"></div>

        <!-- confirm box -->
        <div id="confirm" class="popup">
            <h1 class="popup_question" id="confirm_question"></h1>

            <div class="popup_links">
                <a href="javascript:void(0)" class="popup_button" id="confirm_button"></a>
                <a href="javascript:void(0)" class="popup_hide" id="confirm_hide" onClick="UI.hidePopup()">
                    Cancel
                </a>
                <div style="clear:both;"></div>
            </div>
        </div>

        <!-- alert box -->
        <div id="alert" class="popup">
            <h1 class="popup_message" id="alert_message"></h1>

            <div class="popup_links">
                <a href="javascript:void(0)" class="popup_button" id="alert_button">Okay</a>
                <div style="clear:both;"></div>
            </div>
        </div>

        <!-- Top bar -->
        <header>
            <div class="center_1020">
                <a href="{$url}admin/" class="logo"></a>

                <!-- Top menu -->
                <aside class="right">
                    <nav>
                        <a target="_blank" href="{$url}ucp" data-hasevent="1">
                            <div class="icon logout"></div>
                            Go back
                        </a>

                        {if hasPermission("editSystemSettings", "admin")}
                            <a href="{$url}admin/settings" {if $current_page == "admin/settings"}class="active"{/if}>
                                <div class="icon settings"></div>
                                Settings
                            </a>
                        {/if}

                        <a href="{$url}admin/" {if $current_page == "admin/"}class="active"{/if}>
                            <div class="icon dashboard"></div>
                            Dashboard
                        </a>
                    </nav>

                    <div class="welcome">
                        Welcome, <b>{$nickname}</b>
                    </div>
                </aside>
            </div>
        </header>

        <!-- Main content -->
        <section id="wrapper">
            <div id="top_spacer"></div>
            <div class="center_1020" id="main">

                <!-- Main Left column -->
                <aside class="left">
                    <nav>
                        {foreach from=$menu item=group key=text}
                            {if count($group.links)}
                                <a><div class="icon {$group.icon}"></div> {$text}</a>

                                <section class="sub">
                                    {foreach from=$group.links item=link}
                                        <a href="{$url}{$link.module}/{$link.controller}" {if isset($link.active)}class="active"{/if}><div class="icon {$link.icon}"></div> {$link.text}</a>
                                    {/foreach}
                                </section>
                            {/if}
                        {/foreach}
                    </nav>

                    <article>
                        <h1>Who Are We?</h1>
                        <b>Klimax</b> is an online social <b>Community</b>, ran by a team of young individuals. We make our union into the creation of a private server for the game World of Warcraft. The server is built with the purpose of increasing our management, social, programming, media and other valuable sets of skills found in the modern world. We have chosen to do this whilst we play our favorite game, as we believe that we're most creative in an environment we enjoy.</br> <b>Klimax</b> does not stand as a professional private server, as instead we create our own ideas, providing quality, quantity and originality in our own way of understanding and expressing, at our own grounds. If you share your aims with ours, at our creation, we wish you great times inside the <b>Community</b> of <b>Klimax</b>!
                        <div class="clear"></div>
                    </article>
                    <div class="spacer"></div>
                </aside>

                <!-- Main right column -->
                <aside class="right">
                    {$page}
                </aside>

                <div class="clear"></div>
            </div>
        </section>
    </body>
</html>