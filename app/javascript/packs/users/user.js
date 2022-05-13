$(function(){
  // リロード時のラジオボタン・チェックボックス処理
  $(window).on('load',function () {
    // 「法人名」項目の表示
    if($('input[name="user[corporation]"]:checked').val() === '2'||$('input[name="user[corporation]"]:checked').val() === '3'){
      $('#corporation_name').addClass('is-active');
    }else{
      $('#corporation_name').removeClass('is-active');
    }
    // 「SNS URL」項目の表示
    if($('input[name="check_url"]').prop('checked')){
      $('#url_enter_box').addClass('is-active');
      $('div#login_forms').css({'min-height':'130vh'});
    }else{
      $('#url_enter_box').removeClass('is-active');
      $('div#login_forms').css({'min-height':'100vh'});
    }
  });

  // 利用規約を開く
  $('#open_rule').on('click', function() {
    window.open('/rule',"WindowName","width=700,height=512,resizable=no,scrollbars=yes");
    return false;
  });

  // 「法人名」項目の表示
  $('input[name="user[corporation]"]').on('click', function() {
    if($(this).val() === '2'||$(this).val() === '3'){
      $('#corporation_name').addClass('is-active');
    }else{
      $('#corporation_name').removeClass('is-active');
    }
  });

  // 「SNS URL」項目の表示
  $('input[name="check_url"]').on('click', function() {
    if($(this).prop('checked')){
      $('#url_enter_box').addClass('is-active');
      $('div#login_forms').css({'min-height':'130vh'});
    }else{
      $('#url_enter_box').removeClass('is-active');
      $('div#login_forms').css({'min-height':'100vh'});
    }
  });
});