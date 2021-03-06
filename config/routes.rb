Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  scope module: :public do
  	root 'home#top'
  	get 'about' => 'home#about'
  	get 'users/mypage' => 'users#show', as: 'mypage'
  	resources :diaries do
  		resource :favorites, only: [:create, :destroy]
  	end
  	get 'users/favorites' => 'favorites#index', as: 'favorites'
    get 'diary/hashtag/:name', to: "diaries#hashtag"
    get 'search' => 'search#search'
  end

  resources :contacts, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
