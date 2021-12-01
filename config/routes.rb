Rails.application.routes.draw do
  get '/' => 'indexs#index'
  post '/' => 'indexs#index'

  get '/form' => 'indexs#form'
  post '/form' => 'indexs#form'
  
  get '/form_end' => 'indexs#form_end'

  get '/home' => 'indexs#home'
  post '/home' => 'indexs#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
