class FormMailer < ApplicationMailer
    #default from: "harada.itservice@gmail.com"
    def confirm
        @greeting = "Hello"
        mail(
            from: 'harada.itservice@gmail.com',
            to:   'oldtimer.masa@gmail.com',
            subject: '＜テストメール＞お問い合わせ通知'
          )
    end
end
