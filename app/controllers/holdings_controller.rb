class HoldingsController < ApplicationController
    def all_holdings
        @user = User.find(params[:user_id])
        @holdings = @user.holdings
    end

    def specific_holding
        @user = User.find(params[:user_id])
        @holdings = @user.holdings.find(params[:holding_id])
    end

end