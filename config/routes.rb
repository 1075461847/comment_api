Rails.application.routes.draw do
  get '/verify/comments', to: 'father_comments#need_verify'

  resources :users, only: %i[create destroy] do
    get 'comments', to: 'father_comments#with_user'
    resources :father_comments, only: [:destroy]
  end

  resources :articles, only: [] do
    get 'comments', to: 'father_comments#with_article'
  end
end
