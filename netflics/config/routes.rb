Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => { registrations: 'registrations' }

  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :reviews
    get "hello", to: "movie"
  end
  devise_scope :user do
  root to: "movies#index"
  get "stats", to: "registrations#stats"
  get "viewserie",to: "registrations#viewserie"
  end
  scope "/admin" do
  resources :users
  end

  resources :movies do
    resources :reviews
  end

end