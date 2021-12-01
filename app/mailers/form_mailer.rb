class FormMailer < ApplicationMailer
    # http://railman.net/railsguides/4.2/action_mailer_basics.html
    #default from: "harada.itservice@gmail.com"

    # ユーザーへの確認メール
    def confirm_user(forms)
        #@greeting = "Hello"
        @forms = forms
        mail(
            from: 'harada.itservice@gmail.com',
            to:   @forms.form_email,
           #bcc:  'oldtimer.masa+aaa@gmail.com',
            subject: '＜テストメール＞お問い合わせ内容が送信されました'
          ) do |format|
            format.text #テキストメールを指定
            #format.html #HTMLメールを指定
        end
    end

    # Bugsへの送信メール
    def confirm_bugs(forms)
        @forms = forms
        mail(
            from: @forms.form_email,
            to:   'harada.itservice@gmail.com',
            subject: '＜テストメール＞お問い合わせがありました'
          ) do |format|
            format.text #テキストメールを指定
            #format.html #HTMLメールを指定
        end
    end
end
