Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # # For Users Controller

  # ## GET
  get "user/:user_id/profile", to: "users#show_profile"
  # get "user/:user_id/trading_details" to: "users#trading_details"
  # get "user/:user_id/holdings/:id/news" to: "users#news"

  # ## POST
  post "user/profile", to: "users#create_profile"

  # ## PUT
  put "user/:user_id/profile", to: "users#update_profile"
  
  # ## DELETE
  delete "user/:user_id/profile", to: "users#delete_profile"


  # For Holdings Controller

  ## GET
  get "user/:user_id/holdings", to: "holdings#all_holdings"
  get "user/:user_id/holdings/:stock_id", to: "holdings#specific_holding"

  ## POST
  post "user/:user_id/holdings", to: "holdings#create_holding"

  ## DELETE
  delete "user/:user_id/holdings/:stock_id", to: "holdings#delete_holding"

  # # For Watchlists Controller

  # ## GET
  get "user/:user_id/watchlist", to: "watchlists#all_watchlists"
  get "user/:user_id/watchlist/:watchlist_id", to: "watchlists#specific_watchlist"
  get "user/:user_id/watchlist/:watchlist_id/stocks", to: "watchlists#all_watchlist_stocks"
  get "user/:user_id/watchlist/:watchlist_id/:symbol", to: "watchlists#watchlist_stock"
  

  # ## POST
  post "user/:user_id/watchlist", to: "watchlists#create_watchlist"
  post "user/:user_id/watchlist/:watchlist_id/:symbol", to: "watchlists#populate_watchlist"

  # ## DELETE
  delete "user/:user_id/watchlist/:watchlist_id/", to: "watchlists#delete_watchlist"
  delete "user/:user_id/watchlist/:watchlist_id/:stock_id", to: "watchlists#delete_watchlist_stock"


  # # For Industries Controller

  # ## GET  
  get "industry", to: "industries#all_industries"
  get "industry/:industry_id", to: "industries#specific_industry"
  get "industry/:industry_id/:stock_id", to: "industries#specific_stock"


  # For Stocks Controller

  # ## GET
  # FUNDAMENTAL DATA
  get "user/:user_id/stocks/:ticker/news", to: "stocks#news"
  get "user/:user_id/stocks/:ticker/overview", to: "stocks#overview"
  get "user/:user_id/stocks/:ticker/income_statement", to: "stocks#income_statement"
  get "user/:user_id/stocks/:ticker/balance_sheet", to: "stocks#balance_sheet"
  get "user/:user_id/stocks/:ticker/cash_flow", to: "stocks#cash_flow"
  get "user/:user_id/stocks/:ticker/earnings", to: "stocks#earnings"

  # CORE DATA
  get "user/:user_id/stocks/:ticker/time_series_intraday", to: "stocks#time_series_intraday"
  get "user/:user_id/stocks/:keywords/ticker_search", to: "stocks#ticker_search"


end
