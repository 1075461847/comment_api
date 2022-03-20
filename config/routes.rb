Rails.application.routes.draw do
  resources :users, only: %i[create,show,destroy] do
    resources :father_comments, only: [:destroy]
    resources :son_comments, only: [:destroy]
  end

  resources :articles, only: %i[create show destroy] do
    resources :father_comments, only: [:create]
  end

  resources :father_comments, only: [] do
    resources :user_likes, only: [:create] do
      get 'status', to: 'user_likes#status'
    end
    resources :son_comments, only: %i[index create]
  end
end
