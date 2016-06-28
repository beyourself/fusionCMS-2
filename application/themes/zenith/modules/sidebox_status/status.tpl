{foreach from=$realms item=realm}
	<div class="realm">
		<div class="realm_online">
			{if $realm->isOnline()}
				{$realm->getOnline()} / {$realm->getCap()}
			{else}
				Offline
			{/if}
		</div>
		<a data-tip="View the currently online players listing!" href="{$url}online" style="font-weight: bold;">{$realm->getName()}</a>
		
		<div class="realm_bar">
			{if $realm->isOnline()}
				<div class="realm_bar_fill" style="width:{$realm->getPercentage()}%"></div>
			{/if}
		<br>
		<font color="#10ABF3"> Top <font size="3">100:</font> </font> <a data-tip="View a honorable killers ranking!" href="{$url}top100hkillers">Honorable Killers</a>
		<p>
		<font color="#10ABF3"> Top <font size="3">100:</font> </font> <a data-tip="View an arena teams ranking!" href="{$url}top100arenateams">Arena Teams</a>


		<!--
			Other values, for designers:

			$realm->getOnline("horde")
			$realm->getPercentage("horde")

			$realm->getOnline("alliance")
			$realm->getPercentage("alliance")
		-->

	</div>

	<div class="side_divider"></div>
{/foreach}
<div id="realmlist">set realmlist {$realmlist}</div>