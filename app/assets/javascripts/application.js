// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

// JQuery
$(document).on('turbolinks:load', function() {
  //set here the speed to change the slides in the carousel
  $('#myCarousel').carousel({
          interval: 5000
  });
  
  //Loads the html to each slider. Write in the "div id="slide-content-x" what you want to show in each slide
  $('#carousel-text').html($('#slide-content-0').html());

  //Handles the carousel thumbnails
  $('[id^=carousel-selector-]').click( function(){
      var id = this.id.substr(this.id.lastIndexOf("-") + 1);
      var id = parseInt(id);
      $('#myCarousel').carousel(id);
  });


  // Smoothly scroll to an ID
  // $('a[href*="#"]').on('click', function(e) {
  //   e.preventDefault()

  //   $('html, body').animate(
  //     {
  //       scrollTop: $($(this).attr('href')).offset().top,
  //     },
  //     500,
  //     'linear'
  //   )
  // });

  $('#lightSlider').lightSlider({
    gallery: true,
    item: 1,
    loop: true,
    slideMargin: 0,
    thumbItem: 4,
    adaptiveHeight: true
  });
});



