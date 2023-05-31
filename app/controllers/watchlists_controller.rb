class WatchlistsController < ApplicationController
    before_action :set_user
    skip_before_action :verify_authenticity_token, only: [:create_watchlist]

# ***** GET METHODS *****

# Get all watchlists belonging to the current user
def all_watchlists
    # @user = User.find(params[:user_id])
    @watchlist = @user.watchlists
    render json: @watchlist
end

# Get a specific watchlist belonging to the current user
def specific_watchlist
    # @user = User.find(params[:user_id])
    @watchlist = @user.watchlists.find(params[:watchlist_id])
    render json: @watchlist
end

# Select a specific stock belonging to a specific watchlist belonging to the current user
def watchlist_stock
    # @user = User.find(params[:user_id])
    @watchlist = @user.watchlists.find(params[:watchlist_id])
    @stock = Stock.find_by(symbol: params[:symbol])
    render json: @stock
end


# ***** POST METHODS *****

def create_watchlist
    @watchlist = @user.watchlists.build(watchlist_params)
    if @watchlist.save
        render json: @watchlist, status: :created
    else
        render json: @watchlist.errors, status: :unprocessable_entity
    end
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

def watchlist_params
    params.require(:watchlist).permit(:name, :stock_name, :stock_symbol)
end