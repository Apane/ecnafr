// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  $('.alert.alert-success').delay(3000).fadeOut('fast');
  $('.alert.alert-danger').delay(3000).fadeOut('fast');
  });

(function ($) {
  $(document).ready(function(){

    // hide .navbar first
    $(".navbar_fade").hide();

    // fade in .navbar
    $(function () {
        $(window).scroll(function () {

                 // set distance user needs to scroll before we start fadeIn
            if ($(this).scrollTop() > 500) {
                $('.navbar_fade').fadeIn();
            } else {
                $('.navbar_fade').fadeOut();
            }
        });
    });

});
  }(jQuery));