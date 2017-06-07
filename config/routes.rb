Rails.application.routes.draw do
  resources :farms do
    get :autocomplete_user_email, :on => :collection
  end
  devise_for :users, :path_prefix => 'login'
  
  get "/home", to: "farms#home", as: :user_home
  
  scope "/admin" do
    resources :users
  end
  root to: "farms#home"
  
  resources :transactions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
