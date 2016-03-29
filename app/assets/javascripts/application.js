// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require react
//= require react_ujs
//= require components
//= require turbolinks

// require jquery_ujs
//= require 'custom_jQuery_plugins/toggle_attribute.js'
//= require foundation
//= require './components/menu/main_menu.js'
//= require 'employee/availability.js'



//$(function(){ $(document).foundation(); });

$(function(){

    // Foundation
    $(document).foundation();

    // Menu
    mainMenu().init();

    // Availability
    availability().init();
});

