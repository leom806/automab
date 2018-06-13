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
//= require jquery3
//= require bootstrap
//= require jquery_ujs
//= require sweetalert
//= require turbolinks
//= require_tree .
//= require_self

$(document).ready(() => {
  // Os link_to geram um form, isso faz com que eles não sejam enviados e que o formulário principal 
  // seja o alvo nos métodos create() e update()
  $('form').click(()=>{
    $(this).preventDefault();
  });

  $('.sidenav a').click(() => {    
    $('.active').each((e) => {
      $(e).removeClass('active');
    });
    $(this).addClass('active');    
  });

});


