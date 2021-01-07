Rails.application.routes.draw do
  get 'submit_files/submit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'examples#index'

  resources :submit_files
  resources :user_informations, only: [:edit, :update]
  resources :score_ranking, only: [:index]
  resources :examples, only: :index do
    get :buttons, :cards, :utilities_color, :utilities_border,
        :utilities_animation, :utilities_other, :login, :register,
        :forgot_password, :page_404, :blank, :charts, :tables,
        on: :collection
  end

end
