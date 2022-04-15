$(window).on('load',function(){
  $("#splash-logo").delay(100).fadeOut('slow');//ロゴを0.1秒でフェードアウトする記述
  //=====ここからローディングエリア（splashエリア）を0.2秒でフェードアウトした後に動かしたいJSをまとめる
  $("#splash").delay(200).fadeOut('slow',function(){//ローディングエリア（splashエリア）を0.2秒でフェードアウトする記述
      $('body').addClass('appear');//フェードアウト後bodyにappearクラス付与
      // ウインドウ表示切り替え(バトル開始1)
      msgbox_battle_start1();
  });
  //=====ここまでローディングエリア（splashエリア）を0.2秒でフェードアウトした後に動かしたいJSをまとめる
  
 //=====ここから背景が伸びた後に動かしたいJSをまとめたい場合は
  $('.splashbg').on('animationend', function() {    
      //この中に動かしたいJSを記載
    // モンスター出現メッセージ
    encount_monstar_msg();
    // ウインドウ表示切り替え2(バトル開始2)
    msgbox_battle_start2();

    // Tips表示
    setTimeout(() => {
      msg = [$('span#typedMsg2Text').text()];
      battle_msg({tid : 'span#typedMsg2',tclass : '.typedMsg2', strings : msg, startDelay : 100, loop : true, typeSpeed : 50});
    }, 4500);

    // 
    setTimeout(() => {
      msg = [$('span#typedQuestionText').text()];
      battle_msg({tid : 'span#typedQuestion',tclass : '.typedQuestion', strings : msg, startDelay : 0, loop : false, typeSpeed : 35});
    }, 2500);
  });
  //=====ここまで背景が伸びた後に動かしたいJSをまとめる   
});