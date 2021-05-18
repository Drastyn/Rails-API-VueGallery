Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    post 'authenticate', to: 'authentication#authenticate'
    get 'images/', to: 'archive#index'
    get 'images/:token', to: 'archive#show'
    post 'upload/', to: 'archive#create'
  end
end
