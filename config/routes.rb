Rails.application.routes.draw do
  get '/', to: 'posts#top'
  resources :posts do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
end
