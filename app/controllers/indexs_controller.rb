class IndexsController < ApplicationController
  include ApplicationHelper

  # トップページ
  def index
    @quizzes = get_quiz
  end

  # メールフォーム
  def form
    # 問い合わせフォームの運用確認
    if ENV['DP_MYAPP_MAIL_SEND'] == '0'
      # 運用停止のお知らせを表示
      render 'form_stop'
    else
      # 問い合わせフォームを稼働
      @forms = Form.new
      # 連続で「メール送信」リンクを叩かれた際、変数nilにならないので初期化する
      flash[:notice] = nil

      # postの処理
      if request.post?
        # ユーザー入力値を@formに格納
        params[:items].each do |key, value|
          @forms.send("#{key}=", value)
        end
        # 入力値のバリデーション結果の分岐
        if @forms.invalid?
          flash[:notice] = '★入力エラーです！'
        else
          # ユーザーに確認メールを送信する
          FormMailer.confirm_user(@forms).deliver_now
          # 管理者(Bug.s)にユーザー問い合わせをメール送信する
          FormMailer.confirm_bugs(@forms).deliver_now
          # 「メール送信完了ページ」へ
          redirect_to('/form_end')
        end
      end
    end
  end
  
  # メール送信完了ページ
  def form_end
  end

  # 隠れページ
  def back_hide_page
    @testtable = Testtable.all
  end

end
