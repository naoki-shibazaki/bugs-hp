class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save(context: :create_acount)
    #if @user.save
      pp 1111111111
      flash[:success] = '仮登録が完了しました。送られたメールにて本登録ください'
      # 本登録アクティベーション案内
      activation = User.find_by(email: @user.email)
      activation.create_activation_digest
      #redirect_to root_url
    else
      pp 9999999999
      #flash.now[:danger] = 'えらー'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  # 正しいユーザーかどうか確認する
  def valid_user
    @user.authenticated?(:reset, params[:token])
    unless (@user && @user.authenticated?(:reset, params[:token]))
      redirect_to root_url
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
