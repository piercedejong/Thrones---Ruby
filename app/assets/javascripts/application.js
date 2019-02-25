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

function character_status(element){
  console.log("Hello")
  $.ajax({
       method: "GET",
       data:{
       	character: element.getAttribute("character"),
        cid: element.getAttribute("cid"),
        status: element.getAttribute("status")
       },
       url: window.location.origin + '/user/character_status'
	})
  .done(function(response) {
    $("#alive-"+element.getAttribute("cid")).removeClass("btn-alive")
    $("#dead-"+element.getAttribute("cid")).removeClass("btn-dead")
    $("#wight-"+element.getAttribute("cid")).removeClass("btn-wight")
    if (response["status"] == "alive"){
      $("#alive-"+element.getAttribute("cid")).addClass("btn-alive")
    }else if ((response["status"] == "dead")){
      $("#dead-"+element.getAttribute("cid")).addClass("btn-dead")
    }else{
      $("#wight-"+element.getAttribute("cid")).addClass("btn-wight")
    }
  })
}

function paid(element){
  $.ajax({
       method: "GET",
       data:{
       	id: element.getAttribute("uid")
       },
       url: window.location.origin + '/user/paid'
	})
  .done(function(response) {
    if(response["word"]=="true"){
      $("#"+element.getAttribute("uid")).removeClass("glyphicon-remove").addClass("glyphicon-ok")
    }else{
      $("#"+element.getAttribute("uid")).removeClass("glyphicon-ok").addClass("glyphicon-remove")
    }
  })
}

function status(element){
  $.ajax({
       method: "GET",
       data:{
       	did: element.getAttribute("id")
       },
       url: window.location.origin + '/death/status'
	})
  .done(function(response) {
    if(response["status"]=="alive"){
      $("#"+element.getAttribute("id")).removeClass("btn-walker").addClass("btn-alive").text("Alive")
    }else if(response["status"]=="dead"){
      $("#"+element.getAttribute("id")).removeClass("btn-alive").addClass("btn-dead").text("Dead")
    }else{
      $("#"+element.getAttribute("id")).removeClass("btn-dead").addClass("btn-walker").text("Wight")
    }
  })
}

var countDownDate = new Date("Apr 14, 2019 18:00:0").getTime();

// Update the count down every 1 second
setInterval(function() {

  // Get todays date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  if(days<10){
    days = "0" +days
  }
  if(hours<10){
    hours = "0" +hours
  }
  if(minutes<10){
    minutes = "0" +minutes
  }
  if(seconds<10){
    seconds = "0" +seconds
  }

  $("#day").text(days+" :");
  $("#hour").text(hours+" :");
  $("#minute").text(minutes+" :");
  $("#second").text(seconds);

  // If the count down is over, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);


$(document).ready(function() {
  $('.faq_question').click(function() {
    if ($(this).parent().is('.open')){
      $(this).closest('.faq').find('.faq_answer_container').animate({'height':'0'},500);
      $(this).closest('.faq').find('.faq_answer_container').css("height","0px")
      $(this).closest('.faq').removeClass('open');
    }else{
      var newHeight =$(this).closest('.faq').find('.faq_answer').height() +10+'px';
      $(this).closest('.faq').find('.faq_answer_container').animate({'height':newHeight},500);
      $(this).closest('.faq').addClass('open');
    }
  });
});
