{**
 * templates/frontend/objects/piwik.tpl
 *
 * Copyright (c) 2017 Western Theological Seminary
 * Copyright (c) 2017 Stephen E. Michaels
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header <head> tag and contents.
 *}

<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  // tracker methods like "setCustomDimension" should be called before "trackPageView"
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {ldelim}
    var u="//repository.westernsem.edu/piwik/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', '1']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  {rdelim})();
  document.addEventListener('DOMContentLoaded', function(event) {ldelim}
    $('a.galley-link').each(function() {ldelim}
      var url = $(this).attr('href');
      $(this).click(function(e) {ldelim}
          _paq.push(['trackEvent','bitstream','download',url]);
          {rdelim});
      {rdelim});
    {rdelim});
</script>
<noscript><p><img src="//repository.westernsem.edu/piwik/piwik.php?idsite=1&rec=1" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->
