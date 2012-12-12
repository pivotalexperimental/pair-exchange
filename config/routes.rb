PairExchange::Application.routes.draw do
  resources :projects do
    resources :interests, :only => [:create]
  end

  post '/auth/:provider/callback', :to => 'sessions#create'


  root to: 'projects#index'
end
