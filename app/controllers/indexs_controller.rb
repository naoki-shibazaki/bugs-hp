class IndexsController < ApplicationController

  def index
    @forms = Form.new
  end

  def form
    @forms = Form.new
    # 連続で「メール送信」リンクを叩かれた際に値が残るので初期化する
    flash[:notice] = nil
    if request.post?
      # 値を保持
      params[:items].each do |key, value|
        @forms.send("#{key}=", value)
      end
      if @forms.invalid?
        flash[:notice] = '★入力エラーです！'
      else
        FormMailer.confirm_user(@forms).deliver_now
        FormMailer.confirm_bugs(@forms).deliver_now
        redirect_to('/form_end')
      end
    end
  end
  
  def form_end
  end




  def home
    #FormMailer.confirm.deliver_now
    #@posts.form_onamae = ''
    @forms = Form.new

    #@forms.form_onamae = 'aaa'

    if request.post?
      #flash[:notice] = "投稿を作成しました"
      #@form = Form.new
      #p @form
      
      #@zzz = params[:form_onamae]
      #@zzz = params.permit[:form_onamae]

      #params.require(:Form).permit[:form_onamae]

      #index = Index.new(:form_onamae)
      #@posts = params

=begin      
      @forms.form_onamae = params[:form_onamae]
      @forms.form_hurigana = params[:form_hurigana]
      @forms.form_email = params[:form_email]
      @forms.form_tel = params[:form_tel]
      @forms.form_message = params[:form_message]
=end
      #@forms.form_onamae = params[:items][:form_onamae]
      
      # 値を保持
      params[:items].each do |key, value|
        @forms.send("#{key}=", value)
      end

      #aaa = 'form_onamae'
      #@forms.send(aaa) = params[:items][:form_onamae]
      #@forms.send("form_onamae=", 9)
      p @forms

      
      #p @forms.valid?
      p @forms.invalid?

      if @forms.invalid?
        p 'vエラーです'
        flash[:notice] = "★入力エラーです！"
      else
        p 'vOKです'
        FormMailer.confirm_user(@forms).deliver_now
        FormMailer.confirm_bugs(@forms).deliver_now
      end

      #@posts.form_onamae = params[:form_onamae]

      #p params[:items][:form_onamae]


      
=begin
      if @forms.invalid?
        #render action: :home
      end
=end 


      #form = params[:form_onamae]
      #@form = Index.new
      #p @form

    end


  end
end
