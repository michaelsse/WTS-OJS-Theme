{**
 * templates/frontend/components/headerHead.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header <head> tag and contents.
 *}
<head>
        <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>
                {$pageTitleTranslated|strip_tags}
                {* Add the journal name to the end of page titles *}
                {if $requestedPage|escape|default:"index" != 'index' && $currentContext && $currentContext->getLocalizedName()}
                        | {$currentContext->getLocalizedName()}
                {/if}
        </title>

        {include file="frontend/components/WTSSEO.tpl"}

        {load_header context="frontend" headers=$headers}

        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" media="screen" />
        {include file="frontend/components/WTShtmlcss.tpl"}
        {load_stylesheet context="frontend" stylesheets=$stylesheets}
</head>
