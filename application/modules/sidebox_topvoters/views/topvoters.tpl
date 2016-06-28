<div id="toppvp">
    {if $accounts}
        {foreach from=$accounts key=key item=account}
            <div class="toppvp_character">
                <div style="float:right"><font color="#DFB32B">{$account.count} votes.</font></div>
                <font color="#DFB32B"><b>{$key + 1}.</b></font>
                <a 
				{if $account.is_gm}
		    	    data-tip="View team member profile."
		        {else}
			        data-tip="View member profile."
		        {/if}
                href="{$url}profile/{$account.user_id}">{$account.nickname}</a> 
            </div>
        {/foreach}
    {else}
    <br/>There are no voters to display yet.<br/><br/>
    {/if}
    
</div>