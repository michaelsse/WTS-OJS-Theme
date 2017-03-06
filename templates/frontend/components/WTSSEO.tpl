	<meta property="fb:admins" content="100005973070067"/>
	<meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE"/>
	<meta name="format-detection" content="telephone=no"/><meta name="geo.position" content="42.7862; -86.1026"/>
	<meta name="geo.country" content="us">
	<meta name="geo.region" content="US-MI">
	<meta name="geo.placename" content="Holland">
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
	<link rel="manifest" href="/manifest.json">
	<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
	<meta property="og:url" content="{$currentUrl}">
{if $article}
	<meta property="og:title" content="{$article->getLocalizedTitle()|strip_tags|escape}"/>
{else}
	<meta property="og:title" content="{$pageTitleTranslated}"/>
{/if}
	<meta property="og:type" content="website"/>
	<meta property="og:image" content="{$baseUrl}/images/Beardslee_logo200.png"/>
	<meta property="og:image:type" content="image/png"/>
	<meta property="og:image:width" content="200"/>
	<meta property="og:image:height" content="200"/>
	<meta property="og:locale" content="en_US"/>
