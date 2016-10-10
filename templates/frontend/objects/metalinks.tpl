{**
 * templates/article/metalinks.tpl
 *
 * Copyright (c) 2014-2015 Western Theological Seminary
 * Copyright (c) 2004-2015 Stephen E. Michaels
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * An article search by interface.
 *}

{if $article->getAuthorString() && $article->getAuthorString() != $currentJournal->getLocalizedTitle()}
<div class="panel panel-default searchlinks">
<div class="panel panel-heading">Authors</div>
<div class="panel panel-body">
<ul>
{foreach from=$article->getAuthors() key=i item=link_author}
    {if $link_author != $currentJournal->getLocalizedTitle()}
        <li ><a href="{url page="search" op="search"}?authors={$link_author->getFirstName()|escape:'url'}{if $link_author->getMiddleName()}%20{$link_author->getMiddleName()|escape:'url'}{/if}%20{$link_author->getLastName()|escape:'url'}">{$link_author->getFirstName()|escape}{if $link_author->getMiddleName()} {$link_author->getMiddleName()|escape}{/if} {$link_author->getLastName()|escape}</a></li>
    {/if}
{/foreach}
</ul>
</div>
</div>
{/if}


{if $article->getSubjectClass(null)}
    {foreach from=$article->getSubjectClass(null) key=metaLocale item=metaValue}
        {if $metaValue}
<div class="panel panel-default searchlinks">
<div class="panel panel-heading">Subjects</div>
        {/if}
<div class="panel panel-body">
<ul>
	{foreach from=$metaValue|explode:"; " item=linkSubject}
		{if $linkSubject}
			<li><a href="{url page="search" op="search"}?subject={$linkSubject|escape:'url'}">{$linkSubject|escape}</a>
			{if $article->getSectionId() == 2}
			<!--br /><a href="http://www.worldcat.org/search?q=kw%3A{$linkSubject|escape:'url'}" target="_blank">Find this book in a library</a-->
			{/if}
</li>
		{/if}
	{/foreach}
</ul>
</div>
</div>
    {/foreach}
{/if}
