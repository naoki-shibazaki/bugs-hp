class IndexsController < ApplicationController

  # トップページ
  def index
    quin_num_all = 5
    quin_num_false = 4
    quin_num_true = quin_num_all - quin_num_false

    get_quiz_true = Quiz.where(answer2: 1).order('RANDOM()').limit(1)
    get_quizzes_false = Quiz.where(answer2: 0).order('RANDOM()').limit(quin_num_false)

    #quiz = []
    quiz = {}
    for num in 1..quin_num_false do
      #quiz[num] = get_quizzes_false[num].quiz
      quiz[get_quizzes_false[num-1].quiz] = 0

    end
    #quiz[3] = get_quiz_true[0].quiz
    quiz[get_quiz_true[0].quiz] = 1

    #@quizzes = quiz.sort_by! {rand}
    @quizzes = quiz.sort.to_h
  end

  # メールフォーム
  def form
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
  
  # メール送信完了ページ
  def form_end
  end

  # 隠れページ
  def back_hide_page
    @testtable = Testtable.all
  end

end
