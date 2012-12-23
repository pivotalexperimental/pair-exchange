PairExchange::Application.routes.draw do
  resources :projects do
    resources :interests, :only => [:create]
  end

  post '/auth/:provider/callback', :to => 'sessions#create'

  get 'test_login', :to => 'testing_login#login', :as => :test_login if Rails.env.test?

  match '/oauth2callback', :to => 'sessions#update'

  root to: 'projects#index'
end
