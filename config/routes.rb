Rails.application.routes.draw do
  root to: 'indexs#index'
  # ログイン機能
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/login_confirm',   to: 'sessions#login_confirm'

  # ＜Bugs＞アカウント登録
  get '/users/account_activation/:token/edit', to: 'users#account_activation_edit', as: 'account_activation_edit'
  # パスワード変更
  get '/users/edit_pw', to: 'users#edit_pw', as: 'edit_pw'
  patch '/users/edit_pw', to: 'users#update_edit_pw'
  # パスワードリマインダー
  get '/users/reset_password', to: 'users#reset_password', as: 'reset_password'
  post '/users/reset_password', to: 'users#reset_password_sendmail'
  get '/users/reset_password/:token/edit', to: 'users#reset_password_edit', as: 'reset_password_edit'
  patch '/users/reset_password_update', to: 'users#reset_password_update', as: 'reset_password_update'
  resource :users
  # 利用規約
  get '/rule', to: 'sessions#rule'
  
  # トップページ
  get '/' => 'indexs#index'
  post '/' => 'indexs#index'
  
  # メールフォーム
  get '/form' => 'indexs#form'
  post '/form' => 'indexs#form'
  
  # メール送信完了ページ
  get '/form_end' => 'indexs#form_end'

  # バグズクエスト
  get '/game/bugsquest',   to: 'game_bugsquest#index'
  post '/game/bugsquest',   to: 'game_bugsquest#index'
  get '/game/bugsquest/episode',   to: 'game_bugsquest#episode'
  get '/game/bugsquest/episode_all',   to: 'game_bugsquest#episode_all'

  # バグズクエスト・ゲスト用エキストラモード
  get '/game/bugsquest/extra', to: 'game_bugsquest#extra_guest'
  get '/game/bugsquest/extra/:extra_id', to: 'game_bugsquest#extra_guest', as: 'extra_guest'
  
  # バグズクエスト・ニュース
  get '/game/bugsquest/news/feed', to: 'news#bugsquest_feed', format: 'rss', as: 'feed_bugsquest'
  get '/game/bugsquest/news',   to: 'news#bugsquest_news'
  get '/game/bugsquest/news/:id', to: 'news#bugsquest_news_article', as: 'bugsquest_news_article'

  # API
  patch '/api/checkAnswer',   to: 'sessions#apiCheckAnswer'
  patch '/api/checkAnswerExtra',   to: 'sessions#apiCheckAnswerExtra'
  patch '/api/apiDamege',   to: 'sessions#apiDamege'
  patch '/api/victoryBattle',   to: 'sessions#apiVictoryBattle'
  get '/api/getStage', to: 'sessions#apiGetStage'
  get '/api/getStep', to: 'sessions#apiGetStep'
  get '/api/account_id_exist/:id', to: 'api#account_id_exist', constraints: { id: /[0-9]+/ }, as: 'api_account_id_exist'
  get '/api/getExtraTitle', to: 'sessions#apiExtraTitle'

  # 隠れページ・デバッグ
  if ENV['DEBUG_PAGE_SHOW'] == '1'
    get '/back_hide_page' => 'indexs#back_hide_page'
    get '/debug/menu',   to: 'sessions#debug_menu'
    patch '/debug/postTest',   to: 'sessions#apiPostTest'
  end
end