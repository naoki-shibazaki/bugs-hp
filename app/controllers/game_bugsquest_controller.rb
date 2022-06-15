require 'csv'

class GameBugsquestController < ApplicationController
  before_action :check_login, except: :extra_guest
  # 非ログイン時のみ実行可能
  before_action :logged_in_user_deny, {only: :extra_guest}

  include ApplicationHelper

  def index
    # 各モード共通の処理

    # バトルモード取得
    battleMode = CSV.read('./public/csv/bugsquest/battleMode.csv', headers: true)

    # クイズのカテゴリを取得[メニューのエキストラモードの項目で使用]
    @questExtra_categories = QuestExtra.select(:category, :extra_num).distinct.where(open_status: true).order(:extra_num).map(&:category).uniq

    # ゲームモードを確認する
    unless logged_in?
      # ゲストモード
      @mode = battleMode[0] #ゲストモード
    else
      if request.get?
        # ストーリーモード
        @mode = battleMode[1] #ストーリーモード
      elsif request.post?
        case params[:gamemode]
          when battleMode[2]['mode'] #セレクトモード
            # セレクトモード
            @mode = battleMode[2]
          when battleMode[3]['mode'] #エキストラモード
            # エキストラモード
            @mode = battleMode[3]
        end
      end
    end

    # モード毎の処理
    case @mode
      # 【ゲストモード】の処理
      when battleMode[0] #ゲストモード
        # クイズ取得[ゲスト用]
        @quizzes = get_quiz
        # バグズクエスト：ユーザーデータ取得[ゲスト]
        @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'guest')
        
        # ゲストなので、空のユーザーインスタンス生成
        @user = User.new

        render 'index_guest'

      # 【ストーリーモード】の処理
      when battleMode[1] #ストーリーモード
        # 最新のクイズIDを設定
        set_quiz_id(0)
        # バグズクエスト：ユーザーデータ取得[ストーリー]
        @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'story')

        # ユーザーデータ取得
        @user = User.find(current_user.id)

        render 'index_login'

      # 【セレクトモード】の処理
      when battleMode[2] #セレクトモード
        # 選択したクイズIDを設定
        set_quiz_id(params[:select_step].to_i)
        # バグズクエスト：ユーザーデータ取得[セレクト]
        @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'select')

        # ユーザーデータ取得
        @user = User.find(current_user.id)

        render 'index_login'

      # 【エキストラモード】の処理
      when battleMode[3] #エキストラモード
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

        # ユーザーデータ取得
        @user = User.find(current_user.id)

        render 'index_login'
    end
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

  def extra_guest
    # バトルモード取得
    battleMode = CSV.read('./public/csv/bugsquest/battleMode.csv', headers: true)

    # クイズのカテゴリを取得[メニューのエキストラモードの項目で使用]
    @questExtra_categories = QuestExtra.select(:category, :extra_num).distinct.where(open_status: true).order(:extra_num).map(&:category).uniq   

    # エキストラgモード
    @mode = battleMode[4] #エキストラgモード

    # ゲストなので、空のユーザーインスタンス生成
    @user = User.new

    extra_id = params[:extra_id]
    chkQuestExtra = QuestExtra.exists?(id: extra_id)

    # パラメータのクイズIDがない場合、ランダムでクイズIDを取得してリダイレクトする
    unless chkQuestExtra
      extra_id = QuestExtra.all.where(open_status: true).sample.id
      return redirect_to extra_guest_path(extra_id: extra_id)
    end

    # バグズクエスト：ユーザーデータ取得[エキストラg]
    extra_datas = {extra_id: extra_id}
    @get_bugsquest_game_data = get_bugsquest_game_data(mode: 'extra_g', extra_datas: extra_datas)

    render 'index_guest'
  end

  private
  
  # ログインの有無をチェック
  def check_login
    unless logged_in? || params[:mode] == 'guest'
      redirect_to game_gamelist_url
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
