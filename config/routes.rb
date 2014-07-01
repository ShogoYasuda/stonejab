Rails.application.routes.draw do

  root 'welcome#index'

  resources :dungeons, :except => [:edit, :update, :destroy]
  resource :monsters

end
