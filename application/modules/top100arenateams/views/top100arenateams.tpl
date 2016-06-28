<section id="statistics_wrapper">

	<section id="checkout"></section>

	<section id="statistics">

        {if $realms_count > 0}
        
            <section id="statistics_top">
                <section id="statistics_realms">
                    <div style="float: right;">
                        <select style="width: 200px;" id="realm-changer" onchange="return RealmChange();">
                            {foreach from=$realms item=realm key=realmId}
                                <option value="{$realmId}" {if $selected_realm == $realmId}selected="selected"{/if}>{$realm.name}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="clear"></div>
                </section>
    
                <div class="clear"></div>
            </section>
		
        	<section id="statistics_title" style="margin-top: 10px;">
            	<div style=""><h3>Top 100: Arena Teams</h3></div>
            </section>
        
        	<section id="statistics_top_arena_teams">
            
                <div class="statistics_arena_box">
                	<div class="statistics_arena_head">2v2</div>
                    {if $Teams2}
                        {foreach from=$Teams2 key=key item=team}
                            <div class="statistics_arena_item">
                                <div id="rank">{$key + 1}</div>
                                <div id="stats">
                                	<span id="team-name">{$team.name}</span><br />
                                	<span id="team-rating">{$team.rating} Rating</span><br />
                                    <div id="team-members">
                                    	{if $team.members}
                                            {foreach from=$team.members key=key item=member}
                                                <a href="{$url}character/{$selected_realm}/{$member.guid}" data-tip="<font style='font-weight: bold;'>{$member.name}</font><br />Games played: {$member.games}<br />Games won: {$member.wins}<br />Personal Rating: {$member.rating}" id="team-member">
                                                    <img src='{$url}application/images/stats/{$member.class}.gif' align='absbottom'/>
                                                </a>
                                            {/foreach}
                                        {/if}
                                        <div class="clear"></div>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        {/foreach}
                    {else}
                    	<div class="statistics_arena_item">
                        	<br />There are no 2v2 Teams.<br /><br />
                        </div>
                    {/if}
                </div>

                <div class="statistics_arena_box">
                	<div class="statistics_arena_head">3v3</div>
                    {if $Teams3}
                        {foreach from=$Teams3 key=key item=team}
                        	<div class="statistics_arena_item">
                                <div id="rank">{$key + 1}</div>
                                <div id="stats">
                                	<span id="team-name">{$team.name}</span><br />
                                	<span id="team-rating">{$team.rating} Rating</span><br />
                                    <div id="team-members">
                                    	{if $team.members}
                                            {foreach from=$team.members key=key item=member}
                                                <a href="{$url}character/{$selected_realm}/{$member.guid}" data-tip="<font style='font-weight: bold;'>{$member.name}</font><br />Games played: {$member.games}<br />Games won: {$member.wins}<br />Personal Rating: {$member.rating}" id="team-member">
                                                    <img src='{$url}application/images/stats/{$member.class}.gif' align='absbottom'/>
                                                </a>
                                            {/foreach}
                                        {/if}
                                        <div class="clear"></div>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        {/foreach}
                    {else}
                    	<div class="statistics_arena_item">
                        	<br />There are no 3v3 Teams.<br /><br />
                        </div>
                    {/if}
                </div>
                
                <div class="statistics_arena_box" style="margin-right: 0;">
                	<div class="statistics_arena_head">5v5</div>
                    {if $Teams5}
                        {foreach from=$Teams5 key=key item=team}
                        	<div class="statistics_arena_item">
                                <div id="rank">{$key + 1}</div>
                                <div id="stats">
                                	<span id="team-name">{$team.name}</span><br />
                                	<span id="team-rating">{$team.rating} Rating</span><br />
                                    <div id="team-members">
                                    	{if $team.members}
                                            {foreach from=$team.members key=key item=member}
                                                <a href="{$url}character/{$selected_realm}/{$member.guid}" data-tip="<font style='font-weight: bold;'>{$member.name}</font><br />Games played: {$member.games}<br />Games won: {$member.wins}<br />Personal Rating: {$member.rating}" id="team-member">
                                                    <img src='{$url}application/images/stats/{$member.class}.gif' align='absbottom'/>
                                                </a>
                                            {/foreach}
                                        {/if}
                                        <div class="clear"></div>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        {/foreach}
                    {else}
                    	<div class="statistics_arena_item">
                        	<br />There are no 5v5 Teams.<br /><br />
                        </div>
                    {/if}
                </div>
                
                <div class="clear"></div>
         	</section>
        
        {/if}<!-- End.If we have realms -->
        
	</section>
</section>