
var totalImages = 4;
var interval = 5000;
var count = 1;


(function ($) {
    $(function() {
        $('.jcarousel').jcarousel();

        $('.jcarousel').jcarouselAutoscroll({
            interval: interval,
            target: '+=1',
            autostart: true
        })

        $('.jcarousel-pagination').on('jcarouselpagination:active', 'a', function () {

            if (count < totalImages) {
                $('.jcarousel').jcarouselAutoscroll({ target: '+=1' });
                count++;
            }
            else {
                // this yields '-=3' if there are 4 images
                var scrollValue = '-=' + totalImages - 1;
                $('.jcarousel').jcarouselAutoscroll({ target: scrollValue });
                count = 1;
            }

        });

        $('.jcarousel-control-prev')
            .on('jcarouselcontrol:active', function() {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function() {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '-=1'
            });


        $('.jcarousel-control-next')
            .on('jcarouselcontrol:active', function() {
                $(this).removeClass('inactive');
            })
            .on('jcarouselcontrol:inactive', function() {
                $(this).addClass('inactive');
            })
            .jcarouselControl({
                target: '+=1'
            });

        $('.jcarousel-pagination')
            .on('jcarouselpagination:active', 'a', function() {
                $(this).addClass('active');
            })
            .on('jcarouselpagination:inactive', 'a', function() {
                $(this).removeClass('active');
            })
            .jcarouselPagination();
    });
})(jQuery);
