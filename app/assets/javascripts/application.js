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
    $("#alive-"+element.getAttribute("cid")).removeClass("alive")
    $("#dead-"+element.getAttribute("cid")).removeClass("dead")
    $("#wight-"+element.getAttribute("cid")).removeClass("wight")
    if (response["status"] == "alive"){
      $("#alive-"+element.getAttribute("cid")).addClass("alive")
    }else if ((response["status"] == "dead")){
      $("#dead-"+element.getAttribute("cid")).addClass("dead")
    }else{
      $("#wight-"+element.getAttribute("cid")).addClass("wight")
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

function death_status(element){
  $.ajax({
       method: "GET",
       data:{
       	did: element.getAttribute("did"),
        status: element.getAttribute("status")
       },
       url: window.location.origin + '/death/status'
	})
  .done(function(response) {
    $("#alive-"+element.getAttribute("did")).removeClass("alive")
    $("#dead-"+element.getAttribute("did")).removeClass("dead")
    $("#wight-"+element.getAttribute("did")).removeClass("wight")
    $("#none-"+element.getAttribute("did")).removeClass("none")
    if (response["status"] == "alive"){
      $("#alive-"+element.getAttribute("did")).addClass("alive")
    }else if ((response["status"] == "dead")){
      $("#dead-"+element.getAttribute("did")).addClass("dead")
    }else if ((response["status"] == "none")){
      $("#none-"+element.getAttribute("did")).addClass("none")
    }else{
      $("#wight-"+element.getAttribute("did")).addClass("wight")
    }
  })
}

// var countDownDate = new Date("Apr 14, 2019 18:00:0").getTime();
// setInterval(function() {
//   var now = new Date().getTime();
//   var distance = countDownDate - now;
//   var days = Math.floor(distance / (1000 * 60 * 60 * 24));
//   var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
//   var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
//   var seconds = Math.floor((distance % (1000 * 60)) / 1000);
//   if(days<10){
//     days = "0" +days
//   }
//   if(hours<10){
//     hours = "0" +hours
//   }
//   if(minutes<10){
//     minutes = "0" +minutes
//   }
//   if(seconds<10){
//     seconds = "0" +seconds
//   }
//   $("#day").text(days+" :");
//   $("#hour").text(hours+" :");
//   $("#minute").text(minutes+" :");
//   $("#second").text(seconds);
//   if (distance < 0) {
//     clearInterval(x);
//     document.getElementById("demo").innerHTML = "EXPIRED";
//   }
// }, 1000);


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

function back_button_margin(){
	$(".row-main").css("margin-top", -$(".row-back").height());
}

function video_resize(){
  width = $("#player").width();
  height = 1080/1920 * width
  $("#player").height(height);
}
