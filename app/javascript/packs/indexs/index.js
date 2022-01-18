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
      