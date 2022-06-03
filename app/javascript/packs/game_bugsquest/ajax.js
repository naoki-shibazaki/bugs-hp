//  データ送信
//    https://poppotennis.com/posts/laravel-419-error
//    https://itsakura.com/php-laravel-json
//    https://sashimistudio.site/rails-ajax-jquery/

// クイズの答えチェック
checkAnswer = ({  check_quiz_id = 1,
                  quest_quiz_answer = '',
                  gamemode = 'story'}) => {
  //  ajax通信条件にCSRFトークンを入れる
  set_csrftoken();
  let paramURL;

  //console.log(check_quiz_id);
  //console.log(gamemode);
  //console.log(quest_quiz_answer);
  switch (gamemode) {
    case 'story':
    case 'select':
      paramURL = '/api/checkAnswer?id='+check_quiz_id+'&answer='+quest_quiz_answer
      break;
    case 'extra':
      paramURL = '/api/checkAnswerExtra?id='+check_quiz_id+'&answer='+quest_quiz_answer
      break;
  }

  ret = $.ajax({
    //headers: { 'X-CSRF-TOKEN': 'TOKEN' },
    type: 'PATCH', // HTTPリクエストメソッドの指定
    //url: '/api/checkAnswer?id='+quest_recent_quiz_id+'&answer='+quest_quiz_answer, // 送信先URLの指定
    url: paramURL, // 送信先URLの指定
    async: false, // 非同期通信フラグの指定
    //dataType: 'json', // 受信するデータタイプの指定
    dataType: 'text', // 受信するデータタイプの指定
    timeout: 10000, // タイムアウト時間の指定
    data: {
      text: 'text',
    }
    //data: {json: 'json'},
  })
  .done(function(data) {
    return data;
  });
  return ret['responseText'];                 
}

// ダメージ取得
get_battle_damege = ({  quest_user_id = 0,
  quest_monster_id = 0}) => {
  //  ajax通信条件にCSRFトークンを入れる
  set_csrftoken();

  ret = $.ajax({
    //headers: { 'X-CSRF-TOKEN': 'TOKEN' },
    type: 'PATCH', // HTTPリクエストメソッドの指定
    url: '/api/apiDamege?user_id='+quest_user_id+'&monster_id='+quest_monster_id, // 送信先URLの指定
    async: false, // 非同期通信フラグの指定
    //dataType: 'json', // 受信するデータタイプの指定
    dataType: 'text', // 受信するデータタイプの指定
    timeout: 10000, // タイムアウト時間の指定
    data: {
      text: 'text',
    }
    //data: {json: 'json'},
  })
  .done(function(data) {
    return data;
  });
  return ret['responseText'];   
}

// バトル勝利
get_battle_victory_info = ({  quest_user_id = 0,
                              gamemode = 'story',
                              quest_extra_id = '' }) => {
  //  ajax通信条件にCSRFトークンを入れる
  set_csrftoken();

  ret = $.ajax({
    //headers: { 'X-CSRF-TOKEN': 'TOKEN' },
    type: 'PATCH', // HTTPリクエストメソッドの指定
    //url: '/debug/apiVictoryBattle?user_id='+quest_user_id, // 送信先URLの指定
    url: '/api/victoryBattle?user_id='+quest_user_id+'&change_token='+get_csrftoken_questuser()+'&mode='+gamemode+'&quest_extra_id='+quest_extra_id, // 送信先URLの指定
    async: false, // 非同期通信フラグの指定
    //dataType: 'json', // 受信するデータタイプの指定
    dataType: 'text', // 受信するデータタイプの指定
    timeout: 10000, // タイムアウト時間の指定
    data: {
      text: 'json',
    }
    //data: {json: 'json'},
  })
  .done(function(data) {
    return data;
  });
  //console.log('/debug/apiVictoryBattle?user_id='+quest_user_id+'&change_token='+get_csrftoken_questuser());
  return ret['responseText'];   
}

/**
 * CSRFトークンを取得・セット
 */
set_csrftoken = () => {
  $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
    if (!options.crossDomain) {
        const token = $('meta[name="csrf-token"]').attr('content');
        if (token) {
            return jqXHR.setRequestHeader('X-CSRF-Token', token);
        }
    }
  });
}

get_csrftoken_questuser = () => {
  //console.log('get_csrftoken_questuser:' + $('meta[name="csrf-questuser-token"]').attr('content'));
  return $('meta[name="csrf-questuser-token"]').attr('content');
}

function postTest(text){
  //  ajax通信条件にCSRFトークンを入れる
  set_csrftoken();

  $.ajax({
	//headers: { 'X-CSRF-TOKEN': 'TOKEN' },
	type: 'PATCH', // HTTPリクエストメソッドの指定
	url: '/debug/postTest', // 送信先URLの指定
	async: true, // 非同期通信フラグの指定
	//dataType: 'json', // 受信するデータタイプの指定
	dataType: 'text', // 受信するデータタイプの指定
	timeout: 10000, // タイムアウト時間の指定
	data: {
		text: text,
	}
	//data: {json: 'json'},
  })
  .done(function(data) {
    // 通信が成功したときの処理
	console.log('成功');
  })
  .fail(function() {
    // 通信が失敗したときの処理
	console.log('失敗');
  })
  .always(function() {
    // 通信が完了したときの処理
	console.log('完了');
  });
}