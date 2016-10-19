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