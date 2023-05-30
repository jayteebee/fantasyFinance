class WatchlistsController < ApplicationController

# Get all watchlists belonging to the current user
def all_watchlists
    @user = User.find(params[:user_id])
    @watchlists = @user.watchlists
end

# Get a specific watchlist belonging to the current user
def specific_watchlist
    @user = User.find(params[:user_id])
    @watchlists = @user.watchlists.find(params[:watchlist_id])
end

def watchlist_stock
    @user = User.find(params[:user_id])
    @watchlists = @user.watchlists.find(params[:watchlist_id])
    @stock = @watchlists.stocks.find(params[:stock_id])
end

end
