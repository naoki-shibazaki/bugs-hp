class GameBugsquestController < ApplicationController
  before_action :check_login

  include ApplicationHelper

  def index
    # GETとPOSTで処理分岐
    unless request.post?
      # クイズ取得[ゲスト用]
      @quizzes = get_quiz

      # 最新のクイズIDを設定
      set_quiz_id(0)

      @mode = 'story'
    else
      # 選択したクイズIDを設定
      set_quiz_id(params[:select_step].to_i)

      @mode = 'select'
    end

    # バグズクエスト：ユーザーデータ取得
    @get_bugsquest_game_data = get_bugsquest_game_data

    # ユーザーアカウントデータのセット
    unless current_user.nil?
      @user = User.find(current_user.id)
    else
      @user = User.new
    end
  end

  def episode
    # バグズクエスト：ユーザーデータ取得
    @get_bugsquest_game_data = get_bugsquest_game_data
  end

  def episode_all
    # バグズクエスト：ユーザーデータ取得
    @get_bugsquest_game_data = get_bugsquest_game_data
  end

  private
  
  # ログインの有無をチェック
  def check_login
    unless logged_in? || params[:mode] == 'guest'
      redirect_to login_confirm_url
    end
  end

  # 最新の挑戦するクイズIDを設定
  def set_quiz_id(quiz_id)
    if logged_in?
      # ユーザーのクイズ状況取得
      questUser = QuestUser.find_by(users_id: current_user.id)

      # 選択したクイズIDが現在のクイズIDより大きいか判定
      if quiz_id >= questUser.quiz_id
        quiz_id = 0
      end

      # クイズIDが0の場合は最新のクイズを指定、クイズIDが選択されていたらそのクイズを指定
      if quiz_id === 0
        questUser.recent_quiz_id = questUser.quiz_id
      else
        questUser.recent_quiz_id = quiz_id
      end

      questUser.save
    end
  end

end
