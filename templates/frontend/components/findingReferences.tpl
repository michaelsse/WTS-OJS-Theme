{**
 * templates/frontend/components/findingReferences.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article reading tools -- "finding references" page.
 *
 *}
<div class="panel panel-default finding-references">
<div class="panel-heading">
    <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> 
    <a onclick="$('.panel-body.finding-references').toggle();$('.finding-references .glyphicon').toggleClass('glyphicon-menu-down');$('.finding-references .glyphicon').toggleClass('glyphicon-menu-right');">{translate key="rt.findingReferences}</a>
</div>
<div class="panel-body finding-references" style="display:none;">
<script type="text/javascript">
{literal}
<!--

function invokeWorldcat() {
        var worldcatForm = document.getElementById('worldcat');

        worldcatForm.queryString.value = "ti:" +  document.getElementById('inputForm').title.value + " au:" + document.getElementById('inputForm').author.value;
        worldcatForm.submit();
}

function invokeATLAR() {
        var atlaReligionForm = document.getElementById('atlaReligion');

        atlaReligion.bquery.value = "(TI+(" +document.getElementById('inputForm').title.value + "))+AND+(AU+(" + document.getElementById('inputForm').author.value + "))";
        atlaReligionForm.submit();
}

function invokeGoogleScholar() {
        var googleScholarForm = document.getElementById('googleScholar');

        googleScholarForm.as_q.value = document.getElementById('inputForm').title.value;
        googleScholarForm.as_sauthors.value = document.getElementById('inputForm').author.value;
	googleScholarForm.submit();
}

function invokeWLA() {
        var wlaForm = document.getElementById('wla');
        wlaForm.q.value = document.getElementById('inputForm').title.value + " " + document.getElementById('inputForm').author.value;
        wlaForm.submit();
}

// -->
{/literal}
</script>

<h5>{$article->getLocalizedTitle()|strip_unsafe_html}</h5>

<!-- Include the real forms for each of the search engines -->
<form id="worldcat" method="get" action="https://westerntheolseminary.on.worldcat.org/search" target="_blank">
        <input type="hidden" name="databaseList" value="143,2013,233,283,638" />
        <input type="hidden" name="queryString" value="" />
</form>

<form id="atlaReligion" method="get" action="https://login.proxy.westernsem.edu:4443/form" target="_blank">
        <input type="hidden" name="qurl" value="http://search.ebscohost.com/login.aspx?" />
	<input type="hidden" name="direct" value="true" />
	<input type="hidden" name="db" value="rfh" />
	<input type="hidden" name="bquery" value="" />
	<input type="hidden" name="type" value="1" />
        <input type="hidden" name="custid" value="s8875688" />
        <input type="hidden" name="groupid" value="main" />
	<input type="hidden" name="profid" value="ehost" />
	<input type="hidden" name="site" value="ehost-live" />
	<input type="hidden" name="scope" value="site" />
</form>

<form id="googleScholar" method="get" action="https://scholar.google.com/scholar" target="_blank">
        <input type="hidden" name="as_q" value="" />
        <input type="hidden" name="as_sauthors" value="" />
        <input type="hidden" name="btnG" value="Search Scholar" />
        <input type="hidden" name="as_occt" value="any" />
        <input type="hidden" name="as_allsubj" value="all" />
</form>

<form id="wla" method="get" action="https://search.live.com/results.aspx" target="_blank">
        <input type="hidden" name="q" value="" />
        <input type="hidden" name="scope" value="academic" />
</form>

<!-- Display the form fields -->
<form id="inputForm">
<table width="100%" class="data">
        <tr valign="top">
                <td class="label" width="20%"><label for="author">{translate key="user.role.author"}</label></td>
                <td class="value" width="80%"><input name="author" id="author" type="text" size="20" maxlength="40" class="textField" value="{$article->getAuthorString()|escape}" /></td>
        </tr>
        <tr valign="top">
                <td class="label"><label for="title">{translate key="article.title"}</label></td>
                <td class="value"><input type="text" id="title" name="title" size="40" maxlength="40" class="textField" value="{$article->getLocalizedTitle()|escape}" /></td>
        </tr>
</table>
</form>

<!-- Display the search engine options -->
<table class="listing table table-striped" width="100%">
        <tr valign="top">
                <td><button value="{translate key="common.search"}" type="button" onclick="invokeWorldcat()" class="btn btn-primary">{translate key="common.search"}</button></td>
                <td>WorldCat</td>
        </tr>
        <tr valign="top">
                <td><button value="{translate key="common.search"}" type="button" onclick="invokeATLAR()" class="btn btn-primary">{translate key="common.search"}</button></td>
                <td>ATLA Religion <span class="text-info">({translate key="user.authorization.loginRequired"})</span></td>
        </tr>
        <tr valign="top">
                <td><button value="{translate key="common.search"}" type="button" onclick="invokeGoogleScholar()" class="btn btn-primary">{translate key="common.search"}</button></td>
                <td>{translate key="rt.findingReferences.googleScholar"}</td>
        </tr>
        <!--tr valign="top">
                <td><button value="{translate key="common.search"}" type="button" onclick="invokeWLA()" class="btn btn-primary">{translate key="common.search"}</button></td>
                <td>{translate key="rt.findingReferences.windowsLiveAcademic"}</td>
        </tr-->
</table>

</div>
</div>
