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
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require i18n
//= require i18n/translations
//= require_tree .

//言語切り替えがクリックされたとき、ドロップダウンメニューの選択の制御
//該当言語の方はクリックできないようにする
function language_click(){
  $('#language_change + ul li').removeClass('disabled');
  var lan_text = $('#language_change span:first-child').text();
  $("#language_change + ul li :contains('"+ lan_text.trim() +"')").parent().addClass('disabled');
}

function calendarDrawing(date,headTime){
  'use strict';

  headTime.attr("datetime",date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate());
  headTime.text(date.getFullYear() + "-" + (date.getMonth()+1));
  
  var firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
  var lastDate = new Date(date.getFullYear(), date.getMonth()+1, 0);
  var firstDayOfWeek = firstDate.getDay();
  var arrDate = Array(42);
  arrDate.fill(null);
  for(var i = 0;i < lastDate.getDate();i++){
    arrDate[i+firstDayOfWeek] = i+1;
  }
  var calendarHTML = "";
  var trHTML = "";
  
  $.each(arrDate,function(index,value){
    var temp = value;
    firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
    
    if(value === null){
      if(index!=0 && index%7==0){
        return false;
      }
      else{
        firstDate.setDate(index + 1 - firstDayOfWeek);
        temp = firstDate.getDate();
      }
      trHTML+='<td data-outside="1">'+ temp +'</td>';
    }
    else{
      trHTML+='<td>'+ value +'</td>';
    }
    
    if((index+1)%7==0){
      // 周変わり
      calendarHTML+='<tr>' + trHTML + '</tr>';
      trHTML = "";
    }
  });
  
  $(".schdule-Calendar tbody").html(calendarHTML);
}