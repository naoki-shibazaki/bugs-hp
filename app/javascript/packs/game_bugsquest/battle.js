$(function(){
  // 回答送信
  $('#answer3').on('click', function(){
    let msg;
    const questionId = $('#QuestionId').text();
    const answer = $('input:radio[name^="amswer"]:checked').val();

    if(answer === undefined){
      // バルーンメッセージ表示
      showBalloonMsg2();
      return false;
    }else{
      // 解答の正否チェック
      let quiz_result = checkAnswer({quest_recent_quiz_id : questionId, quest_quiz_answer : answer});
      
      if(quiz_result === 'true'){
        // ウインドウ表示切り替え(バトル終了)
        setTimeout(() => {
          msgbox_battle_end();
        }, 500);

        // 敵画像を非表示
        fadeProc('.enemy', 200, 'Out');

        const token = $('meta[name="csrf-questuser-token"]').attr('content');
        console.log(token);
      
        const jsonData = JSON.parse(get_battle_victory_info({ quest_user_id: 1 }));

        Object.keys(jsonData.msg).forEach(function (key, value) {
          console.log([key, value]);
        });

        // バトル終了メッセージを取得
        msg = ['モンスターをやっつけた！'];
        $.each(jsonData.msg, function(idx, obj) {
            if(obj != null){
              msg.push(obj);
            }
        });

        battle_msg({tid : 'span#typed',tclass : '.typed', strings : msg, startDelay : 1000});

        // 次回バトル案内
        $('.msgbox_in.question').text('次のバトルに挑戦しますか？');

      }else{
        damege_point = get_battle_damege({quest_user_id: 1, quest_monster_id : 1})

        if(!msgbox_battle_damege(damege_point)){
          // バトル終了メッセージ表示[敗北]
          setTimeout(() => {
            $('.msgbox_in.question').text('もう一度、挑戦しますか？');
            msgbox_battle_end();
            msg = ['勇者は全滅した・・・'];
            battle_msg({tid : 'span#typed',tclass : '.typed', strings : msg, startDelay : 1000});
          }, 3500);
        }
      }
    }
  });

  // 回答送信
  $('#answer2').on('click', function(){
    let msg;
    const answer = $('input:radio[name^="amswer"]:checked').val();
    if(answer === undefined){
      // バルーンメッセージ表示
      showBalloonMsg2();
      return false;

    }else if(answer === '1'){
      $('.msgbox_in.question').text('次のバトルに挑戦しますか？');
      
      // 敵画像を非表示
      fadeProc('.enemy', 200, 'Out');

      // ウインドウ表示切り替え(バトル終了)
      setTimeout(() => {
        msgbox_battle_end();
      }, 500);

      msg = ['モンスターをやっつけた！'];
      msg.push('経験値0ポイントを獲得！');
      msg.push('アカウント登録して経験値をためよう！');
      battle_msg({tid : 'span#typed',tclass : '.typed', strings : msg, startDelay : 1000});

    }else if(answer === '0'){
      $('.msgbox_in.question').text('もう一度、挑戦しますか？');
      // ウインドウ表示切り替え(バトル終了)
      setTimeout(() => {
        msgbox_battle_end();
      }, 500);

      msg = ['勇者は全滅した・・・'];
      battle_msg({tid : 'span#typed',tclass : '.typed', strings : msg, startDelay : 1000});
    }
  });
});

///
/// フェード処理
/// 
fadeProc = (selector, time, InOut) => {
  switch (InOut) {
    case 'In':
      $(selector).delay(time).fadeIn();
      break;
    case 'Out':
      $(selector).delay(time).fadeOut();
      break;
  }
}

// モンスター出現メッセージ
encount_monstar_msg = () => {
  $('span#typed').text('');
  let monsterName = $('#monster_name').text();
  let typed = new Typed('.typed', {
    strings: [
      '「' + monsterName + '」が現れた！'
    ],
    typeSpeed: 10,
    //backSpeed: 20,
    startDelay: 400,
    loop: false,
    cursorChar: '',
  });
}

// ウインドウ表示切り替え1(バトル開始1)
msgbox_battle_start1 = () => {
  fadeProc('.menu_bar', 0, 'Out');
  fadeProc('.msgbox_out' + '.status1', 0, 'Out');
  fadeProc('.msgbox_out' + '.status2', 0, 'Out');
  fadeProc('.msgbox_out' + '.monster', 0, 'Out');
  fadeProc('.msgbox_out' + '.quiz', 0, 'Out');
  fadeProc('.msgbox_out' + '.question', 0, 'Out');
  fadeProc('.msgbox_out' + '.yesno', 0, 'Out');
  fadeProc('.msgbox2', 0, 'Out');
}

// ウインドウ表示切り替え2(バトル開始2)
msgbox_battle_start2 = () => {
  fadeProc('.menu_bar', 2000, 'In');
  fadeProc('.msgbox_out' + '.main', 2000, 'Out');
  fadeProc('.msgbox_out' + '.status1', 2100, 'In');
  fadeProc('.msgbox_out' + '.status2', 2100, 'In');
  fadeProc('.msgbox_out' + '.monster', 2100, 'In');
  fadeProc('.msgbox_out' + '.quiz', 2100, 'In');
  fadeProc('.msgbox2', 2100, 'In');
}

// バトルメッセージ
battle_msg = ({ tclass = [''],
                tid = [''],
                strings = [''],
                typeSpeed = 20,
                startDelay = 400,
                backSpeed = 0,
                backDelay = 1200,
                loop = false,
                cursorChar = '',
                contentType = ''}) => {
  $(tid).text('');
  let typed = new Typed(tclass, {
    strings: strings,
    typeSpeed: typeSpeed,
    startDelay: startDelay,
    backSpeed: backSpeed,
    backDelay: backDelay,
    loop: loop,
    cursorChar: cursorChar,
    //contentType: 'html',
  });
}

// バルーンメッセージの表示
showBalloonMsg2 = (msg) => {
  let wObjballoon = $('#makeImg');
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

// ウインドウ表示切り替え(不正解：ダメージ)
msgbox_battle_damege = (damege_point) => {
  fadeProc('.msgbox_out' + '.quiz', 0, 'Out');
  fadeProc('.msgbox_out' + '.monster', 0, 'Out');
  fadeProc('.msgbox2', 0, 'Out');
  fadeProc('.msgbox_out' + '.main', 300, 'In');

  //　ユーザーHP取得
  userHp = $('span#user_hp').text();

  // メッセージ表示
  msg = ['勇者は' + damege_point + 'ポイントのダメージを受けた'];
  battle_msg({tid : 'span#typed',tclass : '.typed', strings : msg, startDelay : 1000});
  
  // 現在のHP
  recent_hp = Math.max(0, userHp - damege_point);
  setTimeout(() => {
    $('span#user_hp').text(recent_hp);
  }, 2500);
  
  if(recent_hp === 0){
    return false;
  }else{
    setTimeout(() => {
      fadeProc('.msgbox_out' + '.quiz', 500, 'In');
      fadeProc('.msgbox_out' + '.monster', 500, 'In');
      fadeProc('.msgbox2', 500, 'In');
      fadeProc('.msgbox_out' + '.main', 800, 'Out');
    }, 2500);
    return true;
  }
}

// ウインドウ表示切り替え(バトル終了)
msgbox_battle_end = () => {
  fadeProc('.msgbox_out' + '.main', 300, 'In');
  //fadeProc('.msgbox_out' + '.status', 0, 'Out');
  fadeProc('.msgbox_out' + '.monster', 0, 'Out');
  fadeProc('.msgbox_out' + '.quiz', 0, 'Out');
  fadeProc('.msgbox2', 0, 'Out');
  fadeProc('.menu_bar', 0, 'Out');
  fadeProc('.msgbox_out' + '.question', 3500, 'In');
  fadeProc('.msgbox_out' + '.yesno', 4000, 'In');
}