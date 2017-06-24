Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
  	resources :reviews
  end
  devise_scope :user do
  root to: "movies#index"
  resources :articles
  end
  scope "/admin" do
  resources :users
end


end
