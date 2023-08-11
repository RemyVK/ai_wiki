Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "pages#show"
  #resources :ai_tools,only: [:index,:show,:create, :new]
  resources :ai_tools
end
