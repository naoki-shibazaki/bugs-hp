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
      p 'AAAAAA'
      p 9
      #params.require(:Form).permit[:form_onamae]

      #index = Index.new(:form_onamae)
      #@posts = params
      
      @forms.form_onamae = params[:form_onamae]
      @forms.form_hurigana = params[:form_hurigana]
      @forms.form_email = params[:form_email]
      @forms.form_tel = params[:form_tel]
      @forms.form_message = params[:form_message]
      p @forms.valid?
      p @forms.invalid?
      #@posts.form_onamae = params[:form_onamae]


      if @forms.invalid?
        #render action: :home
      end



      #form = params[:form_onamae]
      #@form = Index.new
      #p @form

    end


  end
end
