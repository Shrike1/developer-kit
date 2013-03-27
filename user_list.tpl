<table class="table table-hover table-users">
	{if $bUsersUseOrder}
		<thead>
			<tr>
				<th class="cell-name"><a href="{$sUsersRootPage}?order=user_login&order_way={if $sUsersOrder=='user_login'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_login'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user}</span></a></th>
				<th class="cell-date">{$aLang.user_date_last}</th>
				<th class="cell-skill"><a href="{$sUsersRootPage}?order=user_skill&order_way={if $sUsersOrder=='user_skill'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_skill'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user_skill}</span></a></th>
				<th class="cell-rating"><a href="{$sUsersRootPage}?order=user_rating&order_way={if $sUsersOrder=='user_rating'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_rating'}class="{$sUsersOrderWay}"{/if}><span>{$aLang.user_rating}</span></a></th>
			</tr>
		</thead>
	{else}
		<thead>
			<tr>
				<th class="cell-name">{$aLang.user}</th>
				<th class="cell-date">{$aLang.user_date_last}</th>
				<th class="cell-skill">{$aLang.user_skill}</th>
				<th class="cell-rating">{$aLang.user_rating}</th>
			</tr>
		</thead>
	{/if}

	<tbody>
		{if $aUsersList}
			{foreach from=$aUsersList item=oUserList}
				{assign var="oSession" value=$oUserList->getSession()}
				{assign var="oUserNote" value=$oUserList->getUserNote()}
				<tr>
					<td class="cell-name">
						<a href="{$oUserList->getUserWebPath()}"><img src="{$oUserList->getProfileAvatarPath(48)}" alt="avatar" class="avatar visible-desktop" /></a>
						<div class="name {if !$oUserList->getProfileName()}no-realname{/if}">
							<p class="username">
								<a href="{$oUserList->getUserWebPath()}">{$oUserList->getLogin()}</a>
								{if $oUserNote}
									<i class="icon-comment js-infobox" title="{$oUserNote->getText()|escape:'html'}"></i>
								{/if}
							</p>
							{if $oUserList->getProfileName()}<p class="realname">{$oUserList->getProfileName()}</p>{/if}
						</div>
					</td>
					<td class="cell-date">
						{if $oSession}
							{date_format date=$oSession->getDateLast() hours_back="12" minutes_back="60" now="60" day="day H:i" format="d.m.y, H:i"}
						{/if}
					</td>
					<td class="cell-skill">{$oUserList->getSkill()}</td>
					<td class="cell-rating{if $oUserList->getRating() < 0} negative{/if}"><strong>{$oUserList->getRating()}</strong></td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="5">
					{if $sUserListEmpty}
						{$sUserListEmpty}
					{else}
						{$aLang.user_empty}
					{/if}
				</td>
			</tr>
		{/if}
	</tbody>
</table>

{include file='paging.tpl' aPaging=$aPaging}
