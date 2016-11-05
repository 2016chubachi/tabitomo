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

// ガイド詳細画面のカレンダーを描画する
function calendarDrawing(date,headTime){
  'use strict';
  
  //表示している年月の初日を計算
  var firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
  //表示している年月の最終日を計算
  var lastDate = new Date(date.getFullYear(), date.getMonth()+1, 0);
  //表示している年月の初日の曜日を計算
  var firstDayOfWeek = firstDate.getDay();
  //カレンダーを計算するための配列を定義,6x7
  var arrDate = Array(42);
  //カレンダーのhtml格納用変数
  var calendarHTML = "";
  //テーブルの行のhtmlを格納用変数
  var trHTML = "";

  //今カレンダーに表示している年月の文字列を作る
  var dateString = date.getFullYear() + "-" 
      + ((date.getMonth()+1) >= 10 ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1)))
      + '-01';
  //今カレンダーに表示している年月を保持する
  headTime.attr("datetime",dateString);
  //今カレンダーに表示している年月を表示する
  headTime.text(date.getFullYear() + "-" + ((date.getMonth()+1) >= 10 ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1))));

  //該当日付取得
  var isCurrentMonth = false;
  var current = new Date();
  var currentMonthString = current.getFullYear()+'-'+(current.getMonth()+1);

  if(currentMonthString === date.getFullYear()+'-'+(date.getMonth()+1))
  {
    //描画の月が今月の場合
    isCurrentMonth = true;
  }


  //配列を「null」で初期化する
  arrDate.fill(null);
  for(var i = 0;i < lastDate.getDate();i++){
    //日付を配列に設定する
    arrDate[i+firstDayOfWeek] = i+1;
  }
  
  //配列の内容をloopで処理する
  $.each(arrDate,function(index,value){
    var temp = value;
    //表示している年月の初日を計算
    firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
    
    if(value === null){
      if(index != 0 && index % 7 == 0){
        return false;
      }
      else{
        //先月と来月の日を計算する
        firstDate.setDate(index + 1 - firstDayOfWeek);
        temp = firstDate.getDate();
      }
      //先月と来月のcell用htmlを作成
      trHTML+='<td data-outside="1">'+ temp +'</td>';
    }
    else{
      //今月のcell用htmlを作成
      if(isCurrentMonth && current.getDate() === value){
        trHTML+='<td data-current="1">'+ value +'</td>';
      }
      else{
        trHTML+='<td>'+ value +'</td>';
      }
    }
    
    if((index+1) % 7 == 0){
      // 周変わり
      calendarHTML+='<tr>' + trHTML + '</tr>';
      trHTML = "";
    }
  });
  //カレンダーの内容を画面に描画する
  $(".schdule-Calendar tbody").html(calendarHTML);
}