$(function(){
  // 戦闘後(クイズ)のメッセージ
  // let msg_right = 'ブラックバグズちゃん を倒した！';
  // let msg_wrong = '勇者たちは全滅した・・・';

  ///
  /// モーダルウインドウの処理
  ///
  $('.modal').delay(500).fadeIn();
    //モーダルを開く
    //$('button.open-modal').click(function() {
    //    $('.modal').fadeIn();
    //});

    //モーダルを閉じる
    //    (右上の「x」ボタン)
    //$('button.close-modal').click(function() {
    //    $('.modal').fadeOut();
    //});

    //モーダルウィンドウ内のボタンをクリックしたとき
    //    (検索ボタンなどを想定)
    $('button.action').click(function() {
        console.log('action');
  });
  /*
      モーダルのウィンドウ以外の部分をクリックしたときはモーダルを閉じる
  */
  /*
  $(document).click(function(event){
      var target = $(event.target);

      if(target.hasClass('modal')) {
          target.fadeOut();
      }
  });
  */
  /*
      これはダメ
          画面内のどこをクリックしてもイベントが発生するため
  */
  // $('.modal').click(function() {
  //     console.log('これはダメ');
  //     $(this).fadeOut();
  // });
  setTimeout(function(){
    // 正解メッセージ用を非表示
    $('.eachTextAnime#first_msg1').fadeIn();
  }, 2000);
  setTimeout(function(){
    // 正解メッセージ用を非表示
    $('.eachTextAnime#first_msg2').fadeIn();
  }, 6000);
  setTimeout(function(){
    // 正解メッセージ用を非表示
    $('.quiz_first').fadeOut();
    $('div.msgbox').fadeIn();
  }, 12000);

  ///
  /// バルーンメッセージの処理
  ///   ※参考:https://webparts.cman.jp/balloon/click/
  ///
  $('.modal_btn').on('click', function() {
    // バルーンメッセージの表示
    showBalloonMsg = (msg) => {
      wObjballoon.text(msg);
      wObjballoon.removeClass('balloon1').addClass('balloon');
      setTimeout(function(){wObjballoon.removeClass('balloon').addClass('balloon1')}, 3000);
    }

    // 画面ロック
    screenLock = () => {
      // ロック用のdivを生成
      var element = document.createElement('div'); 
      element.id = "screenLock"; 
      // ロック用のスタイル
      element.style.height = '100%'; 
      element.style.left = '0px'; 
      element.style.position = 'fixed';
      element.style.top = '0px';
      element.style.width = '100%';
      element.style.zIndex = '9999';
      element.style.opacity = '0';

      var objBody = document.getElementsByTagName("body").item(0); 
      objBody.appendChild(element);
    }

    // 送信されたクイズの答えを取得
    const answer = $('input:radio[name^="amswer"]:checked').val();
    // ユーザーへのメッセージ表示に使用
    let wObjballoon = $('#makeImg');

    if(typeof answer === 'undefined'){
      // 回答(ラジオボタン)が選択されてない場合		
      if (wObjballoon.attr("class") == "balloon1"){
        // メッセージを表示する
        showBalloonMsg('選んで救うのじゃ！');
      // 
      }else{
        //wObjballoon.removeClass('balloon').addClass('balloon1');
      }
    }else{
      // 回答(ラジオボタン)が選択されている場合
      if(answer === '1'){
        // メッセージウインドウを表示
        $('.quiz_result1').show();
        // 表示するメッセージの書き換え
        //$('.eachTextAnime').text(msg_right);
        setTimeout(function(){
          // 正解メッセージ用を非表示
          $('.quiz_result1').fadeOut();
          // トップページを表示する
          $('.modal').fadeOut();
        }, 2500);
      }else{
        // メッセージウインドウを表示
        $('.quiz_result2').show();
        // 表示するメッセージの書き換え
        //$('.eachTextAnime').text(msg_wrong);
        // 画面をロックする
        screenLock();
        // メッセージを表示する
        //showBalloonMsg('不正解です');
        // 3秒後にリロードする
        setTimeout(function(){location.reload()}, 3000);
      }
    }
  });

  ///
  /// 「メール送信」ボタン
  /// 
  $('.send-button').on('click', function() {
    // console.log(11111);
    window.open('/form',"WindowName","width=700,height=512,resizable=no,scrollbars=yes");
    return false;
  });

});
