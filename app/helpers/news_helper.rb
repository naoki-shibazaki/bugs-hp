module NewsHelper
    # 新着のお知らせ(ニュース)チェック
    def check_latest_news
        User.find(current_user.id).check_latest_news
    end

    # お知らせ(ニュース)の一覧取得
    def news_list
        News.all.order(id: 'DESC').page(params[:page]).per(5)
    end
end