<div itemscope itemtype="https://schema.org/ScholarlyArticle">
<meta itemprop="headline" content="{$article->getLocalizedTitle()|strip_unsafe_html|truncate}" xml:lang="{$currentLocale|String_substr:0:2|escape}" />
<meta itemprop="name" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$article->getLocalizedTitle()|strip_unsafe_html|escape:'htmlall'}" />
{foreach from=$article->getAuthorString()|explode:", " key=i item=sc_author}
        {if $i == 0}
        <span itemscope itemprop="author" itemtype="https://schema.org/Person">
        <meta itemprop="name" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$sc_author|escape}" />
        </span>
        {else}
        <span itemprop="contributor" itemscope itemtype="http//schema.org/Person">
        <meta itemprop="name" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$sc_author|escape}" />
        </span>
        {/if}
{/foreach}
{if is_a($article, 'PublishedArticle') && $article->getDatePublished()}
        <meta itemprop="datePublished" content="{$article->getDatePublished()|date_format:"%Y-%m-%d"}"/>
{/if}
{if is_a($article, 'PublishedArticle') && $article->getDateStatusModified()}
        <meta itemprop="dateModified" content="{$article->getDateStatusModified()|date_format:"%Y-%m-%d"}"/>
{/if}
{if $article->getLocalizedAbstract()}
<meta itemprop="description" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$article->getLocalizedAbstract()|strip_tags|escape:'htmlall'}" />
{/if}
{if $article->getSubject(null)}
{foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
	{foreach from=$metaValue|explode:"; " item=scSubject}
		{if $scSubject}
	<meta itemprop="about"  lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$scSubject|escape}" />
		{/if}
	{/foreach}
{/foreach}
{/if}
{if $issue->getNumber()}
<div itemscope itemprop="isPartOf" itemtype="https://schema.org/PublicationIssue">
<meta itemprop="issueNumber" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$issue->getNumber()}" />
{/if}
{if $issue->getVolume()}
 <div itemscope itemprop="isPartOf" itemtype="https://schema.org/PublicationVolume">
 <meta itemprop="volumeNumber" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$issue->getVolume()}" />
{/if}

<div itemscope itemprop="isPartOf" itemtype="https://schema.org/Periodical">
<span itemscope itemprop="Publisher" itemtype="https://schema.org/Organization" xml:lang="{$currentLocale|String_substr:0:2|escape}">
{if $currentJournal->getSetting('publisherInstitution')}{foreach from=$currentJournal->getSetting('publisherInstitution') key=metaLocale item=metaValue}
<meta itemprop="name" content="{$metaValue|strip_tags|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" />
{/foreach}{/if}
<meta itemprop="logo" content="{$baseUrl}/themes/2014_Website_Theme/images/header/logo.png" />
{if $currentJournal->getSetting('publisherUrl')}{foreach from=$currentJournal->getSetting('publisherUrl') key=metaLocale item=metaValue}
<meta itemprop="url" content="{$metaValue|strip_tags|escape}" />
{/foreach}{/if}
</span>
{if $displayPageHeaderTitle}
  <meta itemprop="name" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$displayPageHeaderTitle}" />
{elseif $alternatePageHeader}
  <meta itemprop="name" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$alternatePageHeader}" />
{elseif $siteTitle}
  <meta itemprop="name" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$siteTitle}" />
{/if}
{if $currentJournal->getSetting('printIssn')}
  <meta itemprop="issn" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$currentJournal->getSetting('printIssn')|strip_tags|escape}"/>
{/if}
{if $currentJournal->getSetting('onlineIssn')}
  <meta itemprop="issn" lang="{$currentLocale|String_substr:0:2|escape}" xml:lang="{$currentLocale|String_substr:0:2|escape}" content="{$currentJournal->getSetting('onlineIssn')|strip_tags|escape}"/>
{/if}
</div>
{if $issue->getVolume()}
</div>
{/if}
{if $issue->getNumber()}
</div>
{/if}
</div>
