class SystemMailer < ApplicationMailer
    # アカウントの本登録案内
    def account_activation_mail(user)
        @user = user
        mail(
            from: ENV['MYAPP_MAIL_AUTH_USER'],
            to:   @user.email,
            subject: '＜Bugs＞アカウント登録案内'
        ) do |format|
            format.text #テキストメールを指定
            #format.html #HTMLメールを指定
        end
    end

    # パスワードリマインダー案内
    def reset_password_mail(user)
        @user = user
        mail(
            from: ENV['MYAPP_MAIL_AUTH_USER'],
            to:   @user.email,
            subject: '＜Bugs＞パスワード再発行'
        ) do |format|
            format.text #テキストメールを指定
            #format.html #HTMLメールを指定
        end
    end

    # Bug.sアカウント登録通知
    def account_regist_mail(user)
        @user = user
        mail(
            from: ENV['MYAPP_MAIL_AUTH_USER'],
            to:   ENV['MYAPP_MAIL_ADDR_TOIAWASE'],
            subject: '＜Bugs管理者通知＞新規アカウント登録情報'
        ) do |format|
            format.text #テキストメールを指定
            #format.html #HTMLメールを指定
        end
    end

    # メールテスト用
    def testmail
        @greeting = "Hello"
        mail(
            from: ENV['MYAPP_MAIL_AUTH_USER'],
            to:   'oldtimer.masa@gmail.com',
            subject: '＜テストメール＞aaaaaaa'
        ) do |format|
            format.text #テキストメールを指定
            #format.html #HTMLメールを指定
        end
    end
end
