Rails.application.routes.draw do
  # ログイン機能
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resource :users

  # トップページ
  get '/' => 'indexs#index'
  post '/' => 'indexs#index'
  
  # メールフォーム
  get '/form' => 'indexs#form'
  post '/form' => 'indexs#form'
  
  # メール送信完了ページ
  get '/form_end' => 'indexs#form_end'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 隠れページ
  get '/back_hide_page' => 'indexs#back_hide_page'
end