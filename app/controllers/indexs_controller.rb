class IndexsController < ApplicationController

  def index
    
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
      #p @forms

      
      #p @forms.valid?
      p @forms.invalid?

      if @forms.invalid?
        p 'vエラーです'
      else
        p 'vOKです'
        FormMailer.confirm(@forms).deliver_now
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
