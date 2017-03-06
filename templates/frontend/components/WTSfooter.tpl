<div id="pkp-scroll-top" title="Back to Top">
    <span class="fa-stack fa-lg">
      <i class="fa fa-square-o fa-stack-2x"></i>
      <i class="fa fa-angle-double-up fa-stack-1x" style="position:relative; bottom:2px;"></i>
    </span>
</div>

<footer role="global">
  <div class="container">
    <div class="admissions vcard">
      <h1><a href="http://www.westernsem.edu/">Western Theological Seminary</a></h1>
      <div class="adr">
        <a href="mailto:library@westernsem.edu" class="email">library@westernsem.edu</a>
        <p class="tel">Toll-free: <a href="tel:+1-800-392-8554">800.392.8554</a></p>
      </div>
    </div>

    <nav>
      <div class="discover">
        <h1>Discover</h1>
        <ul>
          <li class="find_your_degree"><a href="http://www.westernsem.edu/admissions/degrees/">Find your degree</a></li>
          <li class="meet_our_faculty"><a href="http://www.westernsem.edu/about/meet-our-faculty/">Meet our faculty</a></li>
          <li class="contact_us"><a href="http://www.westernsem.edu/contact">Contact Us</a></li>
          <li class="explore_holland"><a href="http://holland.org/">Explore Holland</a></li>
          <li class="sitemap"><a href="http://www.westernsem.edu/sitemap/">Sitemap</a></li>
        </ul>
      </div>

      <div class="engage">
        <h1>Engage</h1>
        <ul>
          <li class="give_to_western"><a href="http://www.westernsem.edu/about/worship/">What's Happening</a></li>
          <li class="give_to_western"><a href="http://www.westernsem.edu/give">Give to Western</a></li>
          <li class="volunteer_opportunities"><a href="http://www.westernsem.edu/about/employment/">Work at WTS</a></li>
          <li class="community"><a href="http://www.westernsem.edu/community">Community</a></li>
        </ul>
      </div>

      <div class="resources">
        <h1>Resources</h1>
        <ul>
          <li class="enrollment_requirements"><a href="http://www.westernsem.edu/admissions/admissions-process/">Enrollment Requirements</a></li>
          <li class="forms_and_materials"><a href="http://www.westernsem.edu/resources/forms-materials/">Forms &amp; Materials</a></li>
          <li class="course_schedule"><a href="http://www.westernsem.edu/academics/courses/">Course Schedules</a></li>
          <li class="calendar"><a href="http://www.westernsem.edu/academics/registrar/">Calendar</a></li>
          <li class="services"><a href="http://www.westernsem.edu/academics/student-services/">Student Services</a></li>
        </ul>
      </div>
    </nav>

    <div class="contact">
      <h1>Follow &amp; Connect</h1>

      <div class="social">
        <ul>
          <!--li class="vimeo"><a href="#">Vimeo</a></li-->
          <li class="facebook"><a href="https://www.facebook.com/wtsbeardslee">Facebook</a></li>
          <li class="twitter"><a href="https://twitter.com/wtsbeardslee">Twitter</a></li>
          <!--li class="rss"><a href="http://blog.westernsem.edu/rss">RSS</a></li-->
        </ul>
      </div>

      <hr>

      <div class="address">
        <div class="vcard" itemtype="https://schema.org/EducationalOrganization" itemscope="itemscope">
          <a data-reveal-id="google-map-modal" target="_blank" class="map" href="https://www.google.com/maps/place/Western+Theological+Seminary/@42.786267,-86.103265,17z/data=!4m6!1m3!3m2!1s0x8819f2a519290a71:0xb3328d95e7bfb43c!2sWestern+Theological+Seminary!3m1!1s0x8819f2a519290a71:0xb3328d95e7bfb43c">Map </a>
	  <span itemprop="department" class="fn">Bearslee Library</span>
          <a itemprop="name" class="url fn org" href="http://www.westernsem.edu">Western Theological Seminary</a>
          <div itemtype="https://schema.org/PostalAddress" itemscope="itemscope" itemprop="address" class="adr">
            <span itemprop="streetAddress" class="street-address">101 East 13th Street</span>
            <span itemprop="addressLocality" class="locality">Holland</span>,
            <span itemprop="addressRegion" class="region">MI</span>
            <span itemprop="postalCode" class="postal-code">49423</span>
          </div>
        </div>
      </div>
    </div>
    <div class="contact" style="margin:0 25px;font-size:13px;text-align:center;">
      <div>
        <p><a rel="privacy-policy" href="http://www.westernsem.edu/privacy-policy">Privacy policy</a></p>
      </div>
      <div>
        <p><a href="javascript:gaOptout()">Opt-out of statistical data-gathering</a></p>
<script>{literal}
//<![CDATA[
// Set to the same value as the web property used on the site
var gaProperty = 'UA-34604541-5';
// Disable tracking if the opt-out cookie exists.
var disableStr = 'ga-disable-' + gaProperty;
if (document.cookie.indexOf(disableStr + '=true') > -1) {
  window[disableStr] = true;
}

// Opt-out function
function gaOptout() {
  document.cookie = disableStr + '=true; expires=Thu, 31 Dec 2099 23:59:59 UTC; path=/';
  window[disableStr] = true;
}
//]]>
{/literal}
</script>
      </div>
      <div id="ipaddr"><p>Your IP address: {php}echo $_SERVER['REMOTE_ADDR'];{/php}</p></div>
    </div>
  </div>
</footer>

  <div id="google-map-modal" class="reveal-modal" data-reveal="">
    <iframe style="border:0;height:75vh;" frameborder="0" src="https://www.google.com/maps/embed/v1/search?key=AIzaSyATKAED7kmXZcAPAUyofKVB5FYU9s6EEEQ&center=42.7862,-86.1026&zoom=18&q=Beardslee%20Library"></iframe>
  </div>

{include file="frontend/components/WTSmodal-reveal.tpl"}
