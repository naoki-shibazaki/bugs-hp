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
        showBalloonMsg('攻撃を選択するのじゃ！');
      // 
      }else{
        //wObjballoon.removeClass('balloon').addClass('balloon1');
      }
    }else{
      // 回答(ラジオボタン)が選択されている場合
      if(answer === '1'){
        // メッセージウインドウを表示
        $('.quiz_result').show();
        // 表示するメッセージの書き換え
        //$('.eachTextAnime').text(msg_right);
        setTimeout(function(){
          // 正解メッセージ用を非表示
          $('.quiz_result').fadeOut();
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

//読み込みが完了したら実行
  $(window).on('load',function () {
      // ローディングが10秒以内で終わる場合、読み込み完了後ローディング非表示
      endLoading();
    });
    
    //10秒経過した段階で、上記の処理を上書き、強制終了
    setTimeout(endLoading(), 1000);
    
    //ローディング非表示処理
    function endLoading(){
      // 1秒かけてロゴを非表示にし、その後0.8秒かけて背景を非表示にする
      $('.js-loading .tetrominos').fadeOut(1000, function(){
        $('.js-loading').fadeOut(900);
      });
    }
    
    //ハンバーガーメニュー
    $('.sp-button,.c-page__eyecatch-nav-wrap a').on('click',function(){//.btn_triggerをクリックすると
      $('.c-page__eyecatch-nav-wrap').fadeToggle(500);//.nav-wrapperが0.5秒でフェードイン(メニューのフェードイン)
      $('body').toggleClass('noscroll');//bodyにnoscrollクラスを付与(スクロールを固定)
      });
    
      $(window).on('load resize', function(){
      var winW = $(window).width();
      var devW = 750;
      if (winW <= devW) {
        $('body').removeClass('noscroll');
        $('.c-page__eyecatch-nav-wrap').fadeOut();
      } else {
        //768pxより大きい時の処理
      }
    });
    
    //スムーススクロール
    $(function(){
      $('a[href^="#"]').click(function(){
        var speed = 500;
        var href= $(this).attr("href");
        var target = $(href == "#" || href == "" ? 'html' : href);
        var position = target.offset().top - 50;
        $("html, body").animate({scrollTop:position}, speed, "swing");
        return false;
      });
    });
    $(function() {
      // 変数にクラスを入れる
      var btn = $('.button');
      
      //スクロールしてページトップから100に達したらボタンを表示
      $(window).on('load scroll', function(){
        var doch = $(document).innerHeight(); //ページ全体の高さ
        var winh = $(window).innerHeight(); //ウィンドウの高さ
        var bottom = doch - winh - 550;
        if (bottom <= $(window).scrollTop()) {
          btn.addClass('active');
        }else{
          btn.removeClass('active');
        }
      });
    
      //スクロールしてトップへ戻る
      btn.on('click',function () {
        btn.addClass('active-click');
        setTimeout(function(){
            $('body,html').animate({
            scrollTop: 0
            });
            btn.removeClass('active-click');
        },1000);
    
      });
    });
      