class GameBugsquestController < ApplicationController
  before_action :check_login

  include ApplicationHelper

  def index
    # クイズ取得[ゲスト用]
    @quizzes = get_quiz

    # バグズクエスト：ユーザーデータ取得
    @get_bugsquest_game_data = get_bugsquest_game_data

    # 最新の挑戦するクイズIDを設定
    set_quiz_id
  end

  private
  
  # ログインの有無をチェック
  def check_login
    unless logged_in? || params[:mode] == 'guest'
      redirect_to login_confirm_url
    end
  end

  # 最新の挑戦するクイズIDを設定
  def set_quiz_id
    if logged_in?
      questUser = QuestUser.find_by(users_id: current_user.id)
      questUser.recent_quiz_id = questUser.quiz_id
      questUser.save
    end
  end

end
