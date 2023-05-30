Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # # For Users Controller

  # ## GET
  get "user/:user_id/profile", to: "users#profile"
  # get "user/:user_id/personal_details" to: "users#personal_details"
  # get "user/:user_id/card_details" to: "users#card_details"
  # get "user/:user_id/trading_details" to: "users#trading_details"
  # get "user/:user_id/balance" to: "users#balance"
  # get "user/:user_id/holdings/:id/news" to: "users#news"
  

  # ## POST
  # post "user/:user_id/personal_details", to: "users#personal_details"
  # post "user/:user_id/card_details", to: "users#card_details"
  # post "user/:user_id/trading_details", to: "users#trading_details"

  # ## PUT
  # put "user/:user_id/personal_details", to: "users#personal_details"
  # put "user/:user_id/card_details", to: "users#card_details"
  # put "user/:user_id/trading_details", to: "users#trading_details"

  # ## DELETE
  delete "user/:user_id/profile", to: "users#profile"
  # delete "user/:user_id/personal_details", to: "users#personal_details"
  # delete "user/:user_id/card_details", to: "users#card_details"
  # delete "user/:user_id/trading_details", to: "users#trading_details"


  # For Holdings Controller

  ## GET
  get "user/:user_id/holdings", to: "holdings#all_holdings"

  ## POST
  post "user/:user_id/holdings/:holding_id", to: "holdings#specific_holding"


  # # For Watchlists Controller

  # ## GET
  get "user/:user_id/watchlist", to: "watchlists#all_watchlists"
  get "user/:user_id/watchlist/:watchlist_id", to: "watchlists#specific_watchlist"
  get "user/:user_id/watchlist/:watchlist_id/:stock_id", to: "watchlists#watchlist_stock"

  # ## POST
  # post "watchlist/", to: "watchlists#create_watchlist"
  # post "watchlist/:watchlist_id/:stock_id", to: "watchlists#populate_watchlist"

  # ## PUT
  # put "watchlist/:watchlist_id/", to: "watchlists#update_watchlist"

  # ## DELETE
  delete "user/:user_id/watchlist/:watchlist_id/", to: "watchlists#delete_watchlist"
  delete "user/:user_id/watchlist/:watchlist_id/:stock_id", to: "watchlists#delete_watchlist_stock"


  # # For Industries Controller

  # ## GET  
  get "industry", to: "industries#all_industries"
  get "industry/:industry_id", to: "industries#specific_industry"
  get "industry/:industry_id/:stock_id", to: "industries#specific_stock"


end
