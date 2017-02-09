{**
 * templates/frontend/objects/article_details.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * @uses $article Article This article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $keywords array List of keywords assigned to this article
 * @uses $citationFactory @todo
 * @uses $pubIdPlugins @todo
 *}
<article class="article-details">
	<header>
		<h1 class="page-header">
			{$article->getLocalizedTitle()|escape}
			{if $article->getLocalizedSubtitle()}
				<small>
					{$article->getLocalizedSubtitle()|escape}
				</small>
			{/if}
		</h1>
	</header>

	<div class="row">

		<section class="article-sidebar col-md-4">

			{* Screen-reader heading for easier navigation jumps *}
			<h2 class="sr-only">{translate key="plugins.themes.westernsem.article.sidebar"}</h2>

			{* Article/Issue cover image *}
			{if $article->getLocalizedCoverImage() || $issue->getLocalizedCoverImage()}
				<div class="cover-image">
					{if $article->getLocalizedCoverImage()}
<<<<<<< HEAD
						<img class="img-responsive lazy" data-original="{$publicFilesDir}/{$article->getLocalizedCoverImage()|escape}"{if $article->getLocalizedCoverImageAltText()} alt="{$article->getLocalizedCoverImageAltText()|escape}"{/if}>
						<noscript><img class="img-responsive" src="{$publicFilesDir}/{$article->getLocalizedCoverImage()|escape}"{if $article->getLocalizedCoverImageAltText()} alt="{$article->getLocalizedCoverImageAltText()|escape}"{/if}></noscript>
					{else}
						<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
							<img class="img-responsive lazy" data-original="{$publicFilesDir}/{$issue->getLocalizedCoverImage()|escape}"{if $issue->getCoverImageAltText()} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
							<noscript><img class="img-responsive" src="{$publicFilesDir}/{$issue->getLocalizedCoverImage()|escape}"{if $issue->getCoverImageAltText()} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}></noscript>
=======
						<img class="img-responsive" src="{$publicFilesDir}/{$article->getLocalizedCoverImage()|escape}"{if $article->getLocalizedCoverImageAltText()} alt="{$article->getLocalizedCoverImageAltText()|escape}"{/if}>
					{else}
						<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
							<img class="img-responsive" src="{$publicFilesDir}/{$issue->getLocalizedCoverImage()|escape}"{if $issue->getCoverImageAltText()} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
>>>>>>> origin/master
						</a>
					{/if}
				</div>
			{/if}

			{* Article Galleys *}
			{if $article->getGalleys()}
				<div class="download">
					{foreach from=$article->getGalleys() item=galley}
						{include file="frontend/objects/galley_link.tpl" parent=$article}
					{/foreach}
				</div>
			{/if}

			<div class="list-group">

				{* Published date *}
				{if $article->getDatePublished()}
					<div class="list-group-item date-published">
						<strong>{translate key="submissions.published"}</strong>
						{$article->getDatePublished()|date_format}
					</div>
				{/if}

				{* DOI (requires plugin) *}
				{foreach from=$pubIdPlugins item=pubIdPlugin}
					{if $pubIdPlugin->getPubIdType() != 'doi'}
						{php}continue;{/php}
					{/if}
					{if $issue->getPublished()}
						{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
					{else}
						{assign var=pubId value=$pubIdPlugin->getPubId($article)}{* Preview pubId *}
					{/if}
					{if $pubId}
						{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
						<div class="list-group-item doi">
							<strong>{translate key="plugins.pubIds.doi.readerDisplayName"}</strong>
							<a href="{$doiUrl}">
								{$doiUrl}
							</a>
						</div>
					{/if}
				{/foreach}
			</div>

		</section><!-- .article-sidebar -->

		<div class="col-md-8">
			<section class="article-main">

				{* Screen-reader heading for easier navigation jumps *}
				<h2 class="sr-only">{translate key="plugins.themes.westernsem.article.main"}</h2>

				{if $article->getAuthors()}
					<div class="authors">
						{foreach from=$article->getAuthors() item=author}
                                                    {if $article->getAuthorString() && $article->getAuthorString() != $currentJournal->getLocalizedName()}
							<strong>{$author->getFullName()|escape}</strong>
							{if $author->getLocalizedAffiliation()}
								<div class="article-author-affilitation">
									{$author->getLocalizedAffiliation()|escape}
								</div>
							{/if}
							{if $author->getOrcid()}
								<span class="orcid">
									<a href="{$author->getOrcid()|escape}" target="_blank">
										<img src="//orcid.org/sites/default/files/images/orcid_16x16.png">
										{$author->getOrcid()|escape}
									</a>
								</span>
							{/if}
                                                    {/if}
						{/foreach}
					</div>
				{/if}

				{* Article abstract *}
				{if $article->getLocalizedAbstract()}
					<div class="article-summary" id="summary">
						<h2>{translate key="article.abstract"}</h2>
						<div class="article-abstract">
							{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}
						</div>
					</div>
				{/if}

				{* Keywords *}
				{* @todo keywords not yet implemented *}

				{call_hook name="Templates::Article::Main"}

			</section><!-- .article-main -->

			<section class="article-more-details">

 				{* Altmetrics  *}
					<div data-badge-details="right" data-badge-type="medium-donut" data-uri="{url page="article" op="view" path=$article->getBestArticleId()}" data-hide-no-mentions="true" class="altmetric-embed">
					</div>

				{* Screen-reader heading for easier navigation jumps *}
				<h2 class="sr-only">{translate key="plugins.themes.westernsem.article.details"}</h2>

				{* Citation formats *}
				{if $citationPlugins|@count}
					<div class="panel panel-default citation_formats">
						<div class="panel-heading">
							{translate key="submission.howToCite"}
						</div>
						<div class="panel-body">

							{* Output the first citation format *}
							{foreach from=$citationPlugins name="citationPlugins" item="citationPlugin"}
								<div id="citationOutput" class="citation_output">
									{$citationPlugin->fetchCitation($article, $issue, $currentContext)}
								</div>
								{php}break;{/php}
							{/foreach}

							{* Output list of all citation formats *}
							<div class="list-group citation_format_options">
								{foreach from=$citationPlugins name="citationPlugins" item="citationPlugin"}
									{capture assign="citationUrl"}{url page="article" op="cite" path=$article->getBestArticleId()}/{$citationPlugin->getName()|escape}{/capture}
									<a class="list-group-item {$citationPlugin->getName()|escape}" href="{$citationUrl}"{if !$citationPlugin->isDownloadable()} data-load-citation="true"{/if} target="_blank">{$citationPlugin->getCitationFormatName()|escape}</a>
								{/foreach}
							</div>
						</div>
					</div>
				{/if}

				{* PubIds (requires plugins) *}
				{foreach from=$pubIdPlugins item=pubIdPlugin}
					{if $pubIdPlugin->getPubIdType() == 'doi'}
						{php}continue;{/php}
					{/if}
					{if $issue->getPublished()}
						{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
					{else}
						{assign var=pubId value=$pubIdPlugin->getPubId($article)}{* Preview pubId *}
					{/if}
					{if $pubId}
						<div class="panel panel-default pub_ids">
							<div class="panel-heading">
								{$pubIdPlugin->getPubIdDisplayType()|escape}
							</div>
							<div class="panel-body">
								{if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
									<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">
										{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
									</a>
								{else}
									{$pubId|escape}
								{/if}
							</div>
						</div>
					{/if}
				{/foreach}

                                {* Article Authors *}
                                {if $article->getAuthorString() && $article->getAuthorString() != $currentJournal->getLocalizedName()}
                                <div class="panel panel-default author">
                                        <div class="panel-heading">
                                                {translate key="article.authors"}
                                        </div>
                                        <div class="panel-body">
                                                {foreach from=$article->getAuthors() key=i item=link_author}
                                                        {if $link_author != $currentJournal->getLocalizedName()}
                                                                <p><a href="{url page="search" op="search"}?authors={$link_author->getFirstName()|escape|urlencode}{if $link_author->getMiddleName()}+{$link_author->getMiddleName()|escape|urlencode}{/if}+{$link_author->getLastName()|escape|urlencode}">{$link_author->getFirstName()|escape|urlencode}{if $link_author->getMiddleName()} {$link_author->getMiddleName()|escape|urlencode}{/if} {$link_author->getLastName()|escape}</a></p>
                                                        {/if}
                                                {/foreach}

                                        </div>
                                </div>
                                {/if}

				{* Article Subject *}
				{if $article->getLocalizedSubject()}
					<div class="panel panel-default subject">
						<div class="panel-heading">
							{translate key="article.subject"}
						</div>
						<div class="panel-body">
							{* $article->getLocalizedSubject()|escape *}
                                                        {if $article->getSubject(null)}{foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
        {foreach from=$metaValue|explode:"; " item=scSubject}
                {if $scSubject}
                        <p><a href="{url page="search" op="search"}?subject={$scSubject|escape|urlencode}">{$scSubject}</a></p>
                {/if}
        {/foreach}
{/foreach}{/if}
							
						</div>
					</div>
				{/if}

				{* Issue article appears in *}
				<div class="panel panel-default issue">
					<div class="panel-heading">
						{translate key="issue.issue"}
					</div>
					<div class="panel-body">
						<a class="title" href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">
							{$issue->getIssueIdentification()}
						</a>

					</div>
				</div>

				{if $section}
					<div class="panel panel-default section">
						<div class="panel-heading">
							{translate key="section.section"}
						</div>
						<div class="panel-body">
							{$section->getLocalizedTitle()|escape}
						</div>
					</div>
				{/if}

				{include file="frontend/components/findingReferences.tpl"}

                                {include file="frontend/components/metadata.tpl"}

				{* Licensing info *}
				{if $copyright || $licenseUrl}
					<div class="panel panel-default copyright">
						<div class="panel-body">
							{if $licenseUrl}
								{if $ccLicenseBadge}
									{$ccLicenseBadge}
								{else}
									<a href="{$licenseUrl|escape}" class="copyright">
										{if $copyrightHolder}
											{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder copyrightYear=$copyrightYear}
										{else}
											{translate key="submission.license"}
										{/if}
									</a>
								{/if}
							{/if}
							{$copyright}
						</div>
					</div>
				{/if}

				{call_hook name="Templates::Article::Details"}

			</section><!-- .article-details -->
		</div><!-- .col-md-8 -->
	</div><!-- .row -->

</article>
