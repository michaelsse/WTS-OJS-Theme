<script src="//cdn.jsdelivr.net/modernizr/2.7.2/modernizr.min.js" integrity="sha384-D0jzabEAsNXxjlAQm06FTcSbcnYMdUX8Gy7mt6x7SZhVqJtSu194MuOMknuAsOKk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/foundation/5.5.3/js/foundation.min.js" integrity="sha384-Vr0O1PXVIpiNhvf0rQWG80bvS0sVxKmbg641JhaRKHBilEfCfh2FaB+bQl4lwcW1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/foundation/5.5.3/js/foundation/foundation.reveal.js" integrity="sha384-Cx1H87gudQ0ZNvS1hGfeMzJRvrGnpWyYzxdX5YsSIYbhnIwYNDN0Q+XJm+ab78GG" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/foundation/5.5.3/js/foundation/foundation.dropdown.js" integrity="sha384-FN439jGz6JeL3uLDimq19QiCE0ncK/67m315JPZ34LRI6URLR0kDxZH9dUwjq7C3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/masonry/4.1.1/masonry.pkgd.min.js" integrity="sha384-OmgZyOluvq2PG/P5ZUbhdV6cFdrgbayjpFDpZbZUTP5OMdK+HPYDS/MX5lffz2Rv" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/jquery.lazyload/1.9.3/jquery.lazyload.min.js" integrity="sha384-63ZAEeAoTgGnNelLgKqfxvJHMH2oUFeheBUKL0q4j2yliHpmdSHbQ1YmiYgUcF49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/jquery.sidr/1.2.1/jquery.sidr.js" integrity="sha384-TYonOjsmmL2Nnkci4cYBNhPzT3OfoCu2fhxPXTjmFZQdr0s424vRR4S5suVkKC0/" crossorigin="anonymous"></script>
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

  $('a.galley-link').each(function() {
    var url = $(this).attr('href');
    $(this).click(function(e) {
        ga('send',{
            hitType: 'event',
            eventCategory: 'bitstream',
            eventAction: 'download',
            eventLabel: url
        });
    });
  });
});


$(document).ready(function() {
    $('img.lazy').css('display','block').show().lazyload({
        effect : 'fadeIn'
    });
});

$(document).ready(function() {
  $(document).foundation();
});

$(document).ready(function() {
  $('#mobile-menu').sidr();
});
$('a.map').click(function(){
  $('iframe').remove('#google-map-modal iframe');
  $('#google-map-modal').append($('<iframe>').attr('src','https://www.google.com/maps/embed/v1/search?key=AIzaSyATKAED7kmXZcAPAUyofKVB5FYU9s6EEEQ&center=42.7862,-86.1026&zoom=18&q=Beardslee%20Library').css('border','0').css('height','75vh'));
});
{/literal}
</script> 

