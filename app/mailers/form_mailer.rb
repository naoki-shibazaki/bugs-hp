class FormMailer < ApplicationMailer
    #default from: "harada.itservice@gmail.com"
    def confirm(forms)
        #@greeting = "Hello"
        @forms = forms

        mail(
            from: 'harada.itservice@gmail.com',
            to:   'oldtimer.masa@gmail.com',
            subject: '＜テストメール＞お問い合わせ通知:' + @forms.form_onamae
          ) do |format|
            format.text #テキストメールを指定
            #format.html #HTMLメールを指定
        end

        #mail(
        #    from: 'harada.itservice@gmail.com',
        #    to:   'oldtimer.masa@gmail.com',
        #    subject: '＜テストメール＞お問い合わせ通知'
        #  )
    end
end
