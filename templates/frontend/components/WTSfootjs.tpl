{* <script type="text/javascript">
{literal}
$(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 220) {
            $('#pkp-scroll-top').fadeIn(750);
        } 
        else {
            $('#pkp-scroll-top').fadeOut(750);
        }
    });
    $('#pkp-scroll-top').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, 750);
        return false;
    })
});
$(document).ready(function() {
    $('a').each(function() {
        var url = $(this).html();
        $(this).click(function(e) {
            ga('send', 'event', 'Interactions', 'Click', url);
        });
    });
});
<<<<<<< HEAD
$(document).ready(function() {
    $('img.lazy').css('display','block').show().lazyload({
        effect : 'fadeIn'
    });
});
=======
>>>>>>> origin/master
{/literal}
</script>  *}
{* <script src="/themes/node_modules/foundation/js/foundation/foundation.js"></script>
<script src="/themes/node_modules/foundation/js/foundation/foundation.reveal.js"></script> *}
<script src="//cdn.jsdelivr.net/foundation/4.2.3/js/foundation.min.js" integrity="sha384-XtGGfvvTDRszUKHLbgK4Pcbb/tW46a3yX6khMPAPuHF7F9niXLRRkwRJMvdqr8/E" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/foundation/4.2.3/js/foundation/foundation.reveal.js" integrity="sha384-SC0gbKLN26Aj4iaNKvMbqrnOoU0MMVoUXDFbRexvt1A33KVEb2ViBYymkUhrRjV/" crossorigin="anonymous"></script>
{* <script src="/themes/node_modules/masonry-layout/dist/masonry.pkgd.min.js"></script>
<script src="/themes/node_modules/jquery-lazyload/jquery.lazyload.js"></script> *}
<script src="/themes/2014_Website_Theme/js/modernizr.js"></script>
<<<<<<< HEAD
<script src="/themes/ojs.js"></script>
{* <script src="/themes/2014_Website_Theme/js/sidr-package-1.2.1/dist/jquery.sidr.js"></script> 
<script src="/themes/2014_Website_Theme/js/app.js"></script> *}
=======
<script src="/themes/2014_Website_Theme/js/sidr-package-1.2.1/dist/jquery.sidr.js"></script>
<script src="/themes/2014_Website_Theme/js/app.js"></script>
>>>>>>> origin/master
