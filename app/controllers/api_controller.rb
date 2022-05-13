class ApiController < ApplicationController
  # アカウントIDが存在しているかチェック
  def account_id_exist
    check_id = params[:id]
    render plain: User.find_by_id(check_id).nil? ? '×　id'+ check_id +'は存在しません' : '◎　id'+ check_id +'は存在しています'
  end
end