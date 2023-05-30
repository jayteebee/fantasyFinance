class HoldingsController < ApplicationController
before_action :set_user
# Get all holdings belonging to the current user
    def all_holdings
        # @user = User.find(params[:user_id])
        @holdings = @user.holdings
    end

# Get a specific holding belonging to the current user
    def specific_holding
        # @user = User.find(params[:user_id])
        @holding = @user.holdings.find(params[:holding_id])
    end

end

private

def set_user
    @user = User.find(params[:user_id])
rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
end
end
