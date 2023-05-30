class WatchlistsController < ApplicationController
    before_action :set_user

# ***** GET METHODS *****

# Get all watchlists belonging to the current user
def all_watchlists
    # @user = User.find(params[:user_id])
    @watchlists = @user.watchlists
end

# Get a specific watchlist belonging to the current user
def specific_watchlist
    # @user = User.find(params[:user_id])
    @watchlist = @user.watchlists.find(params[:watchlist_id])
end

# Select a specific stock belonging to a specific watchlist belonging to the current user
def watchlist_stock
    # @user = User.find(params[:user_id])
    @watchlist = @user.watchlists.find(params[:watchlist_id])
    @stock = @watchlist.stocks.find(params[:stock_id])
end


# ***** DELETE METHODS *****

def delete_watchlist
    @watchlist = @user.watchlists.find(params[:watchlist_id])
end

def delete_watchlist_stock
    @watchlist = @user.watchlists.find(params[:watchlist_id])
    @stock = @watchlist.stocks.find(params[:stock_id])
end



end

private
def set_user
    @user = User.find(params[:user_id])
rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
end
end