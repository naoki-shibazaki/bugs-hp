$(function(){
  // 「法人名」項目の表示[リロード時]
  $(window).on('load',function () {
    if($('input[name="user[corporation]"]:checked').val() === 'true'){
      $('#corporation_name').addClass('is-active');
    }else{
      $('#corporation_name').removeClass('is-active');
    }
  });

  // 利用規約を開く
  $('#open_rule').on('click', function() {
    window.open('/rule',"WindowName","width=700,height=512,resizable=no,scrollbars=yes");
    return false;
  });

  // 「法人名」項目の表示
  $('input[name="user[corporation]"]').on('click', function() {
    if($(this).val() === 'true'){
      $('#corporation_name').addClass('is-active');
    }else{
      $('#corporation_name').removeClass('is-active');
    }
  });
});