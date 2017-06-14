Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'home' => 'pages#home', as: 'home'

  get ':id/questions/' => 'questions#quizzes', as: 'questions'

  match ':id/questions', to: 'questions#try_again', via: :delete, as:'try_again'


  resources :quizzes do
    resources :answers
  end

  resources :relationships

  

  

  
  #post 'questions/:id' => 'questions#quizzes', as: 'answers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
