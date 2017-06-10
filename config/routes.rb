Rails.application.routes.draw do
  resources :crops
  resources :farms do
    resources :crops do
      get 'select_box', on: :collection
    end
  end
  devise_for :users, :path_prefix => 'login'
  
  get "/home", to: "farms#home", as: :user_home
  
  root to: "farms#home"
  
  resources :transactions
  resources :expenses, controller: 'transactions', type: 'Expense'
  resources :revenues, controller: 'transactions', type: 'Revenue'
  resources :investments, controller: 'transactions', type: 'Investment'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
