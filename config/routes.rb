Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#show"
  resources :ai_tools
  resources :category_pages, only:  [:show, :index]
end
