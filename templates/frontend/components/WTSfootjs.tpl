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
{/literal}
</script> 
<script src="/themes/2014_Website_Theme/bower_components/foundation/js/foundation.min.js"></script>
<script src="/themes/2014_Website_Theme/bower_components/masonry/dist/masonry.pkgd.min.js"></script>
<script src="/themes/2014_Website_Theme/js/modernizr.js"></script>
<script src="/themes/2014_Website_Theme/js/sidr-package-1.2.1/jquery.sidr.min.js"></script>
<script src="/themes/2014_Website_Theme/js/app.js"></script>
