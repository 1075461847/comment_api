Rails.application.routes.draw do
  get '/confirm/comments', to: 'father_comments#need_confirm'

  resources :users, only: %i[create destroy] do
    get 'comments'
    delete 'father_comments/:father_comment_id', to: 'users#destroy_father_comment'
    delete 'son_comments/:son_comment_id', to: 'users#destroy_son_comment'
  end

  resources :articles, only: [] do
    get 'father_comments'
    post 'father_comments', to: 'articles#create_father_comment'
    resources :father_comments, only: [] do
      post 'son_comments', to: 'articles#create_son_comment'
      get 'son_comments', to: 'articles#son_comments'
      get 'all_son_comments', to: 'articles#all_son_comments'
    end
  end
end
