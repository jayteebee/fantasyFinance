Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # For Users Controller

  ## GET
  get "user/:id/personal_details" to: "users#personal_details"
  get "user/:id/card_details" to: "users#card_details"
  get "user/:id/trading_details" to: "users#trading_details"
  get "user/:id/balance" to: "users#balance"
  get "user/:id/holdings/:id/news" to: "users#profile"

  ## POST
  post "user/:id/personal_details" to: "users#personal_details"
  post "user/:id/card_details" to: "users#card_details"
  post "user/:id/trading_details" to: "users#trading_details"

  ## PUT
  put "user/:id/personal_details" to: "users#personal_details"
  put "user/:id/card_details" to: "users#card_details"
  put "user/:id/trading_details" to: "users#trading_details"

  ## DELETE
  delete "user/:id/personal_details" to: "users#personal_details"
  delete "user/:id/card_details" to: "users#card_details"
  delete "user/:id/trading_details" to: "users#trading_details"


  # For Holdings Controller

  ## GET
  get "user/:id/holdings", to: "holdings#all_holdings"

  ## POST
  post "user/:id/holdings/:id", to: "holdings#specific_holding"


  # For Watchlists Controller

  ## GET
  get "watchlist", to: "watchlists#all_watchlists"
  get "watchlist/:id", to: "watchlists#specific_watchlist"
  get "watchlist/:id/:stockID", to: "watchlists#watchlist_stock"

  ## POST
  post "watchlist/", to: "watchlists#create_watchlist"
  post "watchlist/:id/:stockID", to: "watchlists#populate_watchlist"

  ## PUT
  put "watchlist/:id/", to: "watchlists#update_watchlist"

  ## DELETE
  delete "watchlist/:id/", to: "watchlists#delete_watchlist"
  delete "watchlist/:id/:stockID", to: "watchlists#delete_watchlist_stock"


  # For Stock Controller

  ## GET  
  get "industry", to: "industries#all_industries"
  get "industry/:id", to: "industries#specific_industry"
  get "industry/:id/:stockID", to: "industries#specific_stock"




end
