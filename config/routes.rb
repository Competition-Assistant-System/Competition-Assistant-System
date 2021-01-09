Rails.application.routes.draw do
  
  namespace :admin do
    resources :base_score
  end
  namespace :admin do
    resources :file_manager, only: [:index, :destroy] do
      get 'download', on: :member
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'score_ranking#index'

  resources :submit_files, only: [:index, :edit, :update, :destroy] do
    post 'upload', on: :collection
    get 'download', on: :member
  end

  resources :score_ranking, only: [:index]
  
  resources :users
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  # resources :examples, only: :index do
  #   get :buttons, :cards, :utilities_color, :utilities_border,
  #       :utilities_animation, :utilities_other, :login, :register,
  #       :forgot_password, :page_404, :blank, :charts, :tables,
  #       on: :collection
  # end

end
