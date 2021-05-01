Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api do
    get 'archives/', to: 'archive#index'
    get 'archives/:token', to: 'archive#show'
    post 'upload/', to: 'archive#create'
  end
end
