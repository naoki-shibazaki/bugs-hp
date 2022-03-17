Rails.application.routes.draw do
  root to: 'indexs#index'
  # ログイン機能
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # アカウント登録
  get '/users/account_activation/:token/edit', to: 'users#account_activation_edit', as: 'account_activation_edit'

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

  # 隠れページ・デバッグ
  get '/back_hide_page' => 'indexs#back_hide_page'
  get '/debug_menu',   to: 'sessions#debug_menu'
end