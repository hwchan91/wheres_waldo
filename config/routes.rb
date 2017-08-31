Rails.application.routes.draw do
  root to: 'boards#index'
  resources :boards, only: [:index, :show] do
    member do
      get 'scores'
    end
  end
  get '/check_char', to: 'boards#check_char'
  get '/popup_score', to: 'scores#popup'
  post '/save_score', to: 'scores#create'
  resources :scores, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
