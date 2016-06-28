<section id="statistics_wrapper">
    <!-- <section id="checkout"></section> -->
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
            <section id="statistics_title" style="margin-top: 40px; margin-bottom: 10px;">
                <div><h3>Top 100: Honorable Killers</h3></div>
            </section>
            <section class="statistics_top_hk" style="display:block;">
                <table class="nice_table" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="10%" align="center">Rank</td>
                        <td width="15%" align="center">Kills</td>
                        <td width="15%">Character</td>
                        <td width="15%" align="center">Level</td>
                        <td width="15%" align="center">Race</td>
                        <td width="15%" align="center">Class</td>
                    </tr>
                    
                    {if $TopHK}
                        {foreach from=$TopHK item=character}
                        <tr>
                            <td width="10%" align="center">{$character.rank}</td>
                            <td width="15%" align="center">{$character.kills}</td>
                            <td width="15%"><a data-tip="View character profile" href="{$url}character/{$selected_realm}/{$character.guid}">{$character.name}</a></td>
                            <td width="15%" align="center">{$character.level}</td>
                            <td width="15%" align="center"><img src="{$url}application/images/stats/{$character.race}-{$character.gender}.gif" /></td>
                            <td width="15%" align="center"><img src="{$url}application/images/stats/{$character.class}.gif" /></td>
                        </tr>
                        {/foreach}
                      {else}
                        <tr>
                            <td colspan="5"><center>There are no players with honorable kills</center></td>
                        </tr>
                    {/if}
                </table>
            </section>
        {/if}<!-- End.If we have realms -->
    </section>
</section>