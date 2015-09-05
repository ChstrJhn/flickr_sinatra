function albumSlideshow(){
  //configuration
  var width = 720;
  var animationSpeed = 1000;
  var pause = 2000;
  var currentSlide = 1;

  //cache DOM
  var $slideShow = $("#slideshow");
  var $slideContainer = $slideShow.find(".slides");
  var $slides = $slideContainer.find(".slide");

  var interval;

  function startSlider(){
  interval = setInterval(function(){
    $slideContainer.animate({'margin-left': '-=' +width}, animationSpeed, function(){
      currentSlide++;
      if (currentSlide === $slides.length) {
        currentSlide = 1;
     	$slideContainer.css('margin-left', 0);
     }

  });
}, pause);

}

function stopSlider() {
	clearInterval(interval);
}

$slideShow.on('mouseenter', stopSlider).on('mouseleave', startSlider);

startSlider();

}

$(document).ready(function() {

if($("body").hasClass("album_slideshow")){
	albumSlideshow();
}

});