Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "user/:id/holdings", to: "holdings#all_holdings"
  post "user/:id/holdings/:id", to: "holdings#specific_holding"



end
