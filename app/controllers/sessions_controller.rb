class SessionsController < ApplicationController
  # 非ログイン時のみ実行可能
  before_action :logged_in_user_deny, {only: [  :new,
                                                :create]}

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    ret_login_check = login_check(user, params[:session][:password])
    
    if ret_login_check['login']
      log_in user
      redirect_to game_bugsquest_index_url
    else
      flash.now[:notice] = ret_login_check['msg']
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to game_bugsquest_index_url
  end

  def login_confirm
  end

  # API:答えを正否を判定
  def apiCheckAnswer
    # 問題の答え正解
    correct_answer = QuestQuiz.find(params[:id]).answer
    correct_answer == params[:answer] ? html = true : html = false
    render plain: html
  end

  # API:ダメージを取得
  def apiDamege
    questUser = QuestUser.find_by(users_id: params[:user_id])
    questStatus = QuestStatus.find_by(lv: questUser.lv)
    questMonster = QuestMonster.find(params[:monster_id])

    max_damege = (questMonster.power - questStatus.protect / 2) / 2
    min_damege = (questMonster.power - questStatus.protect / 2) / 4

    render plain: Random.rand(min_damege .. max_damege)
  end

  # API:バトル勝利
  def apiVictoryBattle
    questUser = QuestUser.find_by(users_id: params[:user_id])

    if questUser.authenticated?(:change_token, params[:change_token])
      questStatus = QuestStatus.find_by(lv: questUser.lv)
      questQuiz = QuestQuiz.find(questUser.recent_quiz_id)
      questQuiz_max_id = QuestQuiz.maximum(:id)

      # 獲得経験値
      get_exp = questQuiz.exp

      # ユーザー経験値 + 獲得経験値
      questUser.exp += get_exp

      # レベルアップ判定
      level_up_flag = false
      if judge_lv(questUser.exp) != questUser.lv
        questUser.lv = judge_lv(questUser.exp)
        level_up_flag = true
      end

      # 次のレベルまでの経験値
      next_exp = next_lvup_exp

      # 次のステップ(クイズ)へ
      if questUser.quiz_id < questQuiz_max_id
        questUser.quiz_id += 1
      end

      # クエストユーザーデータをアップデート
      questUser.save

      datas = {
                msg: {
                  msg1: battle_victory_msg(msg_flag: 1, get_exp: questQuiz.exp),
                  msg2: battle_victory_msg(msg_flag: 2, level_up: level_up_flag, lv: questUser.lv),
                  msg3: battle_victory_msg(msg_flag: 3, next_exp: next_exp),
                },
                aaa: "AAA"
              }
      render json: datas
    else
      render plain: ''
    end
  end

  private

  # ログインチェック
  def login_check(user, passwd_auth)
    ret = {}
    ret['login'] = false

    # ユーザーメールアドレスの有無チェック
    if !user
      ret['msg'] = 'メールアドレスもしくはパスワードが違います'
      return ret
    end
    
    # パスワードのチェック
    if !user.authenticate(passwd_auth)
      ret['msg'] = 'メールアドレスもしくはパスワードが違います'
      return ret
    end

    # アカウントの本登録チェック
    if !user.activated?
      ret['msg'] = 'アカウントが本登録されてません'
      return ret
    end

    # アカウントの凍結チェック
    if user.acount_lock?
      ret['msg'] = 'アカウントが凍結されています'
      return ret
    end

    ret['login'] = true
    return ret
  end

  # 経験値からレベル判定
  def judge_lv(exp)
    QuestStatus.where('exp <= ? ', exp).maximum(:lv)
  end

  # バトル勝利メッセージ
  def battle_victory_msg( msg_flag: 0,
                          get_exp: 0,
                          next_exp: 0,
                          lv: 0,
                          level_up: false)
    case msg_flag
      when 1
        return '経験値' + get_exp.to_s + 'ポイントを獲得！'
      when 2
        return level_up == true ? 'レベルが' + lv.to_s + 'に上がった！' : nil
      when 3
        return '次のレベルまであと' + next_exp.to_s + 'ポイントです。'
    end
  end

  def debug_menu
    #SystemMailer.testmail.deliver_now
  end

  def apiPostTest
    testtable = Testtable.find(1)
    testtable.test_str = SecureRandom.alphanumeric(20)
    testtable.save
  end
end