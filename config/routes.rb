Rails.application.routes.draw do
  get '/confirm/comments', to: 'father_comments#need_confirm'

  resources :users, only: %i[create destroy] do
    get 'comments'
    resources :father_comments, only: [:destroy]
    resources :son_comments, only: [:destroy]
  end

  resources :articles, only: [] do
    get 'comments'
    resources :father_comments, only: [:create]
    resources :son_comments, only: [:create]
  end
end
