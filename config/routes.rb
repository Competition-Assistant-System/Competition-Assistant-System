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

  root 'examples#index'


  resources :submit_files, only: [:index, :edit, :update, :destroy] do
    post 'upload', on: :collection
    get 'download', on: :member
  end
  resources :user_informations, only: [:edit, :update, :show]
  resources :final_results, only: [:index]
  resources :score_ranking, only: [:index]

  resources :examples, only: :index do
    get :buttons, :cards, :utilities_color, :utilities_border,
        :utilities_animation, :utilities_other, :login, :register,
        :forgot_password, :page_404, :blank, :charts, :tables,
        on: :collection
  end

end
