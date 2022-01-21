class FormMailer < ApplicationMailer
    # http://railman.net/railsguides/4.2/action_mailer_basics.html
    #default from: "aaaaa@aaaaaaaaaa"

    # ユーザーへの確認メール
    def confirm_user(forms)
        #@greeting = "Hello"
        @forms = forms
        mail(
            from: ENV['DP_MYAPP_MAIL_BUGS'],
            to:   @forms.form_email,
           #bcc:  'aaaaa@aaaaaaaaaa',
            reply_to: ENV['DP_MYAPP_MAIL_BUGS'],
            subject: '＜Bugs.HP＞お問い合わせ内容が送信されました'
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
            to:   ENV['DP_MYAPP_MAIL_BUGS'],
            reply_to: @forms.form_email,
            subject: '＜Bugs.HP＞お問い合わせがありました'
          ) do |format|
            format.text #テキストメールを指定
            #format.html #HTMLメールを指定
        end
    end
end
