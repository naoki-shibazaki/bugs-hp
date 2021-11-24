Rails.application.routes.draw do
  get '/' => 'indexs#index'
  get '/home' => 'indexs#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
