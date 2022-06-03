require 'csv'

class GameBugsquestController < ApplicationController
  before_action :check_login

  include ApplicationHelper

  def index
    # バトルモード取得
    battleMode = CSV.read('./public/csv/bugsquest/battleMode.csv', headers: true)

    # GETとPOSTで処理分岐
    unless request.post?
      # クイズ取得[ゲスト用]
      @quizzes = get_quiz

      # 最新のクイズIDを設定
      set_quiz_id(0)

      @mode = battleMode[0]

      # バグズクエスト：ユーザーデータ取得[ゲスト/ストーリー]
      @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'story')
    else
      case params[:gamemode]
        # セレクトモード
        when battleMode[1]['mode']
          # 選択したクイズIDを設定
          set_quiz_id(params[:select_step].to_i)
          @mode = battleMode[1]

          # バグズクエスト：ユーザーデータ取得[ゲスト/ストーリー/セレクト]
          @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'select')
        
        # エキストラモード
        when battleMode[2]['mode']
          @mode = battleMode[2]

          # バグズクエスト：ユーザーデータ取得[エキストラ]
          case params[:referrer]
            when 'menu'
              extra_id = QuestExtra.where(extra_num: params[:extra_title], open_status: true).first.id
              extra_num = params[:extra_title]
            when 'battle'
              extra_id = params[:extra_id].to_i
              extra_num = QuestExtra.find(extra_id).extra_num
          end
          extra_datas = {extra_id: extra_id, extra_num: extra_num}
          @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'extra', extra_datas: extra_datas)
        end
    end

    # ユーザーアカウントデータのセット
    unless current_user.nil?
      @user = User.find(current_user.id)
    else
      @user = User.new
    end

    # クイズのカテゴリを取得[メニューのエキストラモードの項目で使用]
    @questExtra_categories = QuestExtra.select(:category, :extra_num).distinct.where(open_status: true).order(:extra_num).map(&:category).uniq
  end

  def episode
    # バグズクエスト：ユーザーデータ取得
    @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'story')
  end

  def episode_all
    # バグズクエスト：ユーザーデータ取得
    @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'story')
  end

  def news
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
