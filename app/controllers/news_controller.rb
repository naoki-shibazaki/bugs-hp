class NewsController < ApplicationController
  include SessionsHelper

  def bugsquest_news
    if logged_in?
      # ニュースチェックフラグをオフにする
      #   ※ UPDATE "public"."users" SET "check_latest_news" = 't' WHERE 1=1;
      user = User.find(current_user.id)
      user.update(check_latest_news: false)
    end
  end

  def bugsquest_news_article
    @news = News.find(params[:id])
  end
end