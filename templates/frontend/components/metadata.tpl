{**
 * templates/rt/metadata.tpl
 *
 * Copyright (c) 2016 Western Theological Seminary
 * Copyright (c) 2016 Stephen E. Michaels
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article reading tools -- article metadata page.
 *
 *}

<div class="panel panel-default metadata">
<div class="panel-heading"><a onclick="$('.panel-body.metadata').toggle();">{translate key="article.metadata"}</a></div>

<div class="panel-body metadata" style="display:none;">

<table class="listing table table-striped table-responsive table-bordered">

	<tr valign="top">
		<th class="heading" width="25%">{translate key="rt.metadata.dublinCore"}</th>
		<th class="heading" width="25%">{translate key="rt.metadata.pkpItem"}</th>
		<th class="heading" width="50%">{translate key="rt.metadata.forThisDocument"}</th>
	</tr>

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.title"}</td>
	<td>{translate key="rt.metadata.pkp.title"}</td>
	<td>{$article->getLocalizedTitle()|strip_unsafe_html}</td>
</tr>
{foreach from=$article->getAuthors() item=author}

<tr valign="top">
	<td width="25%">{translate key="rt.metadata.dublinCore.primaryAuthor"}</td>
	<td>{translate key="rt.metadata.pkp.primaryAuthor"}</td>
	<td>
		{$author->getFullName()|escape}{if $author->getLocalizedAffiliation()}; {$author->getLocalizedAffiliation()|escape}{/if}{if $author->getCountry()} ({$author->getCountryLocalized()|escape}){/if}
		</td>
</tr>
{/foreach}

{if $article->getLocalizedDiscipline()}
<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.subject"}</td>
	<td>{translate key="rt.metadata.pkp.discipline"}</td>
	<td>{$article->getLocalizedDiscipline()|escape}</td>
</tr>
{/if}

{if $article->getLocalizedSubject()}
<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.subject"}</td>
	<td>{translate key="rt.metadata.pkp.subject"}</td>
	<td>{$article->getLocalizedSubject()|escape}</td>
</tr>
{/if}

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.description"}</td>
	<td>{translate key="rt.metadata.pkp.abstract"}</td>
	<td>{if $article->getLocalizedAbstract()}{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}{/if}</td>
</tr>

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.publisher"}</td>
	<td>{translate key="rt.metadata.pkp.publisher"}</td>
	{assign var=pubUrl value=$currentJournal->getSetting('publisherUrl')|escape}
	<td>{if $pubUrl}<a target="_new" href="{$pubUrl}">{/if}{$currentJournal->getSetting('publisherInstitution')|escape}{if $pubUrl}</a>{/if}</td>
</tr>
{if $article->getLocalizedSponsor()}

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.contributor"}</td>
	<td>{translate key="rt.metadata.pkp.sponsors"}</td>
	<td>{$article->getLocalizedSponsor()|escape}</td>
</tr>
{/if}

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.date"}</td>
	<td>{translate key="rt.metadata.pkp.date"}</td>
	<td>
		{if $article->getDatePublished()}
			{$article->getDatePublished()|date_format:$dateFormatShort}
		{elseif $issue && $issue->getDatePublished()}
			{$issue->getDatePublished()|date_format:$dateFormatShort}
		{elseif $issue}
			{$issue->getYear()|escape}
		{else}
			&mdash;
		{/if}
	</td>
</tr>

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.type"}</td>
	<td>{translate key="rt.metadata.pkp.genre"}</td>
	<td>{if $section && $section->getLocalizedIdentifyType()}{$section->getLocalizedIdentifyType()|escape}{else}{translate key="rt.metadata.pkp.peerReviewed"}{/if}</td>
</tr>
{if $article->getLocalizedType()}

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.type"}</td>
	<td>{translate key="rt.metadata.pkp.type"}</td>
	<td>{$article->getLocalizedType()|escape}</td>
</tr>
{/if}

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.format"}</td>
	<td>{translate key="rt.metadata.pkp.format"}</td>
	<td>
		{foreach from=$article->getGalleys() item=galley name=galleys}
			{$galley->getGalleyLabel()|escape}{if !$smarty.foreach.galleys.last}, {/if}
		{/foreach}
	</td>
</tr>

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.identifier"}</td>
	<td>{translate key="rt.metadata.pkp.uri"}</td>
	<td><a target="_new" href="{url page=$page op="view" path=$parentId|to_array:$galley->getBestGalleyId($currentJournal)}">{url op="view" path=$galley->getBestGalleyId()}</a></td>
</tr>

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.source"}</td>
	<td>{translate key="rt.metadata.pkp.source"}</td>
	<td>{$journal->getLocalizedName()}{if $issue}; {$issue->getIssueIdentification()|strip_unsafe_html|nl2br}{/if}</td>
</tr>

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.language"}</td>
	<td>{translate key="rt.metadata.pkp.language"}</td>
	<td>{$article->getLanguage()|escape}</td>
</tr>

<tr valign="top">
	<td>{translate key="rt.metadata.dublinCore.rights"}</td>
	<td>{translate key="rt.metadata.pkp.copyright"}</td>
	<td>
		{translate key="submission.copyrightStatement" copyrightHolder=$article->getLocalizedCopyrightHolder()|escape copyrightYear=$article->getCopyrightYear()|escape}<br/>
		{if $ccLicenseBadge}
			{$ccLicenseBadge}
		{elseif $article->getLicenseURL()}
			<a href="{$article->getLicenseURL()|escape}">{$article->getLicenseURL()|escape}</a>
		{/if}
	</td>
</tr>
</table>
</div>
</div>

