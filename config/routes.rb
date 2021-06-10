Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    post 'authenticate', to: 'authentication#authenticate'
    get 'images/', to: 'archives#index'
    post 'images/', to: 'archives#search'
    get 'images/:token', to: 'archives#show'
    post 'upload/', to: 'archives#create'
  end
end
