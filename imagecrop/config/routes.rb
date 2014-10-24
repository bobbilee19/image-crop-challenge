Rails.application.routes.draw do

  resources :images, only: [:new, :create]

end
