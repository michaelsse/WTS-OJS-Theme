{**
 * templates/frontend/objects/json-ld.tpl
 *
 * Copyright (c) 2016 Western Theological Seminary
 * Copyright (c) 2016 Stephen E. Michaels
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header <head> tag and contents.
 *}

<script type="application/ld+json">
{ldelim}{literal}"@context":{/literal} "http://schema.org",
 {literal}"@graph":{/literal} [
 {ldelim}
   {literal}"@id":{/literal} "#issue",
   "type": "PublicationIssue",
   "issueNumber": "{$issue->getNumber()}",
   {if is_a($article, "PublishedArticle") && $article->getDatePublished()}
   "datePublished": "{$article->getDatePublished()|date_format:"%Y-%m-%d"}",
   {/if}
   {if is_a($article, "PublishedArticle") && $article->getDateStatusModified()}
   "dateModified": "{$article->getDateStatusModified()|date_format:"%Y-%m-%d"}",
   {/if}
   "isPartOf": {ldelim}
   {literal}"@id":{/literal} "#periodical",
   {literal}"@type":{/literal} [
      "PublicationVolume",
      "Periodical"
      ],
      "volumeNumber": "{$issue->getVolume()}",
      "name": "{$displayPageHeaderTitle}",
      "publisher": [
        {if $currentJournal->getSetting("publisherInstitution")}
        {foreach from=$currentJournal->getSetting("publisherInstitution") key=metaLocale item=metaValue}
        "{$metaValue|strip_tags|escape}"{if !$smarty.foreach.metaValue.last},
        {/if}
        {/foreach}
        {else}
        "",
        {/if}
      ],
      "issn": [
        {if $currentJournal->getSetting("printIssn")}"{$currentJournal->getSetting("printIssn")}"{if $currentJournal->getSetting("onlineIssn")},{/if}{/if}
        {if $currentJournal->getSetting("onlineIssn")}"{$currentJournal->getSetting("onlineIssn")}"{/if}
      ],
      {if $currentJournal->getSetting("publisherUrl")}
      "publisherUrl": [
         {foreach from=$currentJournal->getSetting("publisherUrl") key=metaLocale item=metaValue}
         "{$metaValue|strip_tags|escape}"{if !$smarty.foreach.metaValue.last},
         {/if}
         {/foreach}
      ]
      {/if}
   {rdelim},
   
 {rdelim}
  {ldelim}{literal}"@type":{/literal} "ScholarlyArticle",
   "name": "{$article->getLocalizedTitle()|strip_unsafe_html|escape:"htmlall"}",
   "isPartOf": "#issue",
   {foreach from=$article->getAuthorString()|explode:", " key=i item=sc_author}
      {if $i == 0}
   "author": {ldelim}
      {literal}"@type":{/literal} "Person",
      "name": "{$sc_author|escape}"
   {rdelim},
           
   {else}
   "contributor": {ldelim}
      {literal}"@type":{/literal} "Person",
      "name": "{$sc_author|escape}"
   {rdelim},
      {/if}
   {/foreach}
   "description": "{$article->getLocalizedAbstract()|strip_tags|escape:"htmlall"}",
   {if $article->getSubject(null)}
   {foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
   {foreach from=$metaValue|explode:"; " item=scSubject}
      {if $scSubject}
   "about": "{$scSubject|escape}",
      {/if}
   {/foreach}{/foreach}
   {/if}
   {rdelim}
  ]
{rdelim}
</script>
