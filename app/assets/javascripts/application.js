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
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap

function change_dead(element){
  $.ajax({
       method: "GET",
       data:{
       	character: element.getAttribute("character")
       },
       url: window.location.origin + '/user/dead'
	})
  .done(function(response) {
    if (response["word"] == "Dead"){
      $("#"+element.getAttribute("id")).removeClass("btn-alive").addClass("btn-dead")
    }else{
      $("#"+element.getAttribute("id")).removeClass("btn-dead").addClass("btn-alive")
      $("#walker-"+element.getAttribute("cid")).removeClass("btn-walker").addClass("btn-just-dead")
    }
    $("#"+element.getAttribute("id")).text(response["word"])
    $("#walker-"+element.getAttribute("cid")).text(response["walker"])
  })
}

function change_walker(element){
  $.ajax({
       method: "GET",
       data:{
       	character: element.getAttribute("character")
       },
       url: window.location.origin + '/user/walker'
	})
  .done(function(response) {
    if (response["word"] == "Whight"){
      $("#"+element.getAttribute("id")).removeClass("btn-just-dead").addClass("btn-walker")
    }else{
      $("#"+element.getAttribute("id")).removeClass("btn-walker").addClass("btn-just-dead")
    }
    $("#"+element.getAttribute("id")).text(response["word"])
  })
}
