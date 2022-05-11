class UsersController < ApplicationController
  # ログイン時のみ実行可能
  #before_action :logged_in_user, {only: [ :edit, 
  #                                        :update,
  #                                        :destroy]}
  # 非ログイン時のみ実行可能
  before_action :logged_in_user_deny, {only: [  :new,
                                                :create]}
  before_action :get_user,   only: [:reset_password_edit, :reset_password_update]
  before_action :valid_user, only: [:reset_password_edit, :reset_password_update]
  before_action :check_expiration, only: [:reset_password_edit, :reset_password_update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save(context: :create_acount)
      flash[:success] = '仮登録が完了しました。送られたメールにて本登録ください'
      # 本登録アクティベーション案内
      activation = User.find_by(email: @user.email)
      activation.create_activation_digest
      redirect_to login_url
    else
      #flash.now[:danger] = 'えらー'
      render :new
    end
  end

  # アカウント有効化
  def account_activation_edit
    #@user = User.new
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:token])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      # 新規アカウントの登録通知
      SystemMailer.account_regist_mail(user).deliver_now
      # バグズクエストのアカウント作成
      create_bugsquest_account(user.id)
      #log_in user
      flash[:success] = "アカウントが有効になりました"
      #redirect_to user
    else
      flash[:danger] = "リンクが無効です"
      #redirect_to root_url
      redirect_to login_confirm_url
    end
  end

  # ユーザーアカウント情報更新
  def update
    @user = User.find_by(id: current_user.id)
    # 更新対象
    @user.id = current_user.id
    @user.name = user_params[:name]
    
    if @user.save(context: :change_userinfo)
      flash[:success] = '登録変更が完了しました'
      redirect_to game_bugsquest_path
    else
      #flash.now[:danger] = 'えらー'
      redirect_to game_bugsquest_path
    end
  end

  # パスワード変更
  def update_edit_pw
    @user = User.find(current_user.id)
    # 更新対象
    @user.id = current_user.id
    @user.password = user_params[:password]

    if @user.save(context: :change_password)
      flash[:success] = '変更完了しました'
      redirect_to game_bugsquest_path
    else
      #flash.now[:danger] = 'えらー'
      render game_bugsquest_path
    end
  end

  # パスワードリセット
  def reset_password
    @user = User.new
  end

  # アカウント削除
  def destroy
    #@user = User.find(current_user.id)
    @user = User.find_by(id: current_user.id)
    log_out
    @user.destroy
    redirect_to game_bugsquest_path
  end

  def reset_password_sendmail
    @user = User.new(user_params)
    if @user.valid?(:reset_password)
      reset_password = User.find_by(email: params[:user][:email])
      reset_password.create_reset_digest
      reset_password.reset_token
      reset_password.send_password_reset_email
    else
      render reset_password_path
    end
  end

  # パスワードリセット
  def reset_password_edit
  end

  # パスワードリセットによる更新
  def reset_password_update
    # 更新対象
    @user.password = user_params[:password]

    if @user.save(context: :change_password)
      flash[:success] = '変更完了しました'
    else
      flash[:danger] = 'パスワードを入力して下さい'
      #render reset_password_edit_path(params[:token], email: @user.email)
      redirect_to reset_password_edit_url(params[:token], email: @user.email)
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :corporation, :corporation_name)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # 正しいユーザーかどうか確認する
  def valid_user
    @user.authenticated?(:reset, params[:token])
    unless (@user && @user.authenticated?(:reset, params[:token]))
      #redirect_to root_url
      redirect_to login_confirm_url
    end
  end

  # トークンが期限切れかどうか確認する
  def check_expiration
    @user.password_reset_expired?
    if @user.password_reset_expired?
      flash[:danger] = "パスワードのリセットの有効期限が切れました。"
      redirect_to reset_password_url
    end
  end
end
