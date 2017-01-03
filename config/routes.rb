Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "alive" => 'application#alive'
  
  resources :app_configs
  
end
