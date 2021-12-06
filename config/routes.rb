Rails.application.routes.draw do
  # トップページ
  get '/' => 'indexs#index'
  post '/' => 'indexs#index'
  
  # メールフォーム
  get '/form' => 'indexs#form'
  post '/form' => 'indexs#form'
  
  # メール送信完了ページ
  get '/form_end' => 'indexs#form_end'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
