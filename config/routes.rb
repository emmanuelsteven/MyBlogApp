Rails.application.routes.draw do
  get 'hello_world/index'
  root 'users#index'
  
  resources :users,  only:[:index, :show] do 
    resources :posts, only:[:index, :show, :new, :create] do
      resources :likes, only:[:create]
      resources :comments, only:[:new, :create]
    end
  end
end
