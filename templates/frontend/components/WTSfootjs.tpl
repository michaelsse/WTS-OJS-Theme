<script type="text/javascript">
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
{/literal}
</script> 
<script src="/themes/node_modules/foundation/js/foundation/foundation.js"></script>
<script src="/themes/node_modules/masonry-layout/dist/masonry.pkgd.min.js"></script>
<script src="/themes/2014_Website_Theme/js/modernizr.js"></script>
<script src="/themes/2014_Website_Theme/js/sidr-package-1.2.1/dist/jquery.sidr.js"></script>
<script src="/themes/2014_Website_Theme/js/app.js"></script>
