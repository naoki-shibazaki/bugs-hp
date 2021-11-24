$(function(){

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