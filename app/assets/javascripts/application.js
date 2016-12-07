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
//= require i18n
//= require i18n.js
//= require i18n/translations
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require cocoon
//= require jquery-ui/datepicker
//= require jquery-ui/datepicker-en-GB  
//= require jquery-ui/datepicker-ko
//= require jquery-ui/datepicker-zh-CN
//= require jquery-ui/datepicker-ja

//= require_tree .

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

  //ajaxでスケジュール取得
  getScheduleJson({
    data: {guide: sessionStorage.guide_id,date: date},
    callback: function (data, textStatus, jqXHR) {
      //取得出来た後、予約ごとカレンダーに反映する
      $.each(data,function(index,value){
        //予約済み日の日を計算する
        var date = (new Date(value)).getDate();
        //カレンダーからその日を検索する
        var ngTD = $(".schdule-Calendar td:contains('" + date + "'):not([data-outside]):first");
        //予約済みの日に対して属性を追加する
        ngTD.attr({"data-ngdate": "1","data-outside": "1"});
        //予約済みの日に対して赤いクロスを描画する
        var svgDiv = '<div style="position:relative;">\
                        <div style="position:absolute;width:100%;height:20px;">\
                          <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">\
                            <line x1="0" y1="0" x2="100%" y2="100%" style="stroke:red;stroke:width:2"></line>\
                            <line x1="100%" y1="0" x2="0" y2="100%" style="stroke:red;stroke:width:2"></line>\
                          </svg>\
                        </div>\
                        <div>' + ngTD.text() + '</div>\
                      </div>';
        //設定した内容を反映する
        ngTD.html(svgDiv);
      });
    }
  });
}

//該当ガイドの該当月のスケジュール情報を取得する
//function getScheduleJson(boolasync,guide,date,callback){
function getScheduleJson(options){
  //ajaxで予約情報取得
  //$.getJSON("schedule", {guide: guide,date: date},callback);
  var target = {
    url: "schedule",
    async: true,
    dataType: "json",
    callback: null
  };
  var params = $.extend(target,options);
  $.ajax({
    type: "get",
    url: params.url,
    async: params.async,
    data: params.data,
    dataType: "json",
    success: params.callback
  });
}

// 予約済み日付リスト
var bookingedDays = [];
function setSchdules(json, textStatus, jqXHR) {
  //取得出来た後、予約ごとカレンダーに反映する
  bookingedDays = $.map(json,function(value,index){
    var tempDate = new Date(value);
    
    return tempDate.getFullYear() + '-' + (tempDate.getMonth() + 1) + '-' + tempDate.getDate();
  });
  //画面上に設定済みの日付も入れる
  $('#detail-association-insertion-point > tr:visible > td:first-child > input[type=text]').each(function(){
    if(this.value){
      var tempDate = new Date(this.value);
      bookingedDays.push(tempDate.getFullYear() + '-' + (tempDate.getMonth() + 1) + '-' + tempDate.getDate());
    }
  })
}
//予約明細日程にカレンダーを表示する
function datePickerHandler(target,guide_id,booking_id){
  $.datepicker.setDefaults({
    changeYear: true,
    changeMonth: true,
    showOtherMonths: true,
    showButtonPanel: true
  });
  //jquery uiのdatepickerを設定する
  target.datepicker({
    //選択した日付戻り値のフォーマット
    dateFormat: "yy-mm-dd"
    //カレンダー表示される前
    ,beforeShow:function(input,picker){
      var currentDate = $(input).datepicker("getDate") || new Date();
      getScheduleJson({
          //相対パス
          //url: "../../guide_detail/schedule",
          //ルート相対パス
          url: "/guide_detail/schedule",
          async: false,
          data: {guide: guide_id,booking:booking_id,date: currentDate},
          callback: setSchdules
        });
    }
    //カレンダーで年月変更の際の処理
    ,onChangeMonthYear:function(year,month,picker){
      getScheduleJson({
        //相対パス
        //url: "../../guide_detail/schedule",
        //ルート相対パス
        url: "/guide_detail/schedule",
        async: false,
        //javascriptの月は[0-11]なので、実際の月から[-1]にする
        //下記どちでもいい
        //data: {guide: guide_id,date: new Date(year,month-1,1)},
        data: {guide: guide_id,booking:booking_id,date: new Date(year + '-' + month + '-' + 1)},
        callback: setSchdules
        });
    }
    //カレンダーの日ごとを描画するための処理
    ,beforeShowDay:function(date){
      var result;
      var drawDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
      if($.inArray(drawDate,bookingedDays) > -1){
        result = [false,""];
      }
      else{
        result = [true,""];
      }
      
      //戻り値[true/false(その日が操作できるかどうか),"class name","tooltip"]
      return result;
    }
  });
}

function initGuideLicense(){
  var licence = $('#guide_license');
  if(licence.children('select').val() === '1'){
    //ライセンス有の際、写真アップロードエリア表示
    licence.next('div.form-group').show().find('input[type=checkbox]').prop('checked',false);
    
  }
  else{
    //ライセンス無の際、写真アップロードエリア非表示
    licence.next('div.form-group').hide().find('input[type=checkbox]').prop('checked',true);
  }
}