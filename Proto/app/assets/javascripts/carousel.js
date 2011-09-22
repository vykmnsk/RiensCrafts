(function() {
  var mycarousel_initCallback;
  mycarousel_initCallback = function(carousel) {
    carousel.buttonNext.bind('click', function() {
      return carousel.startAuto(0);
    });
    carousel.buttonPrev.bind('click', function() {
      return carousel.startAuto(0);
    });
    return carousel.clip.hover(function() {
      return carousel.stopAuto();
    }, function() {
      return carousel.startAuto();
    });
  };
  jQuery(document).ready(function($) {
    return $("#banners").jcarousel({
      wrap: 'circular',
      scroll: 2,
      auto: 3
    });
  });
}).call(this);
