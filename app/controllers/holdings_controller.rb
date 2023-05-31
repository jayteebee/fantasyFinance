class HoldingsController < ApplicationController
before_action :set_user
skip_before_action :verify_authenticity_token, only: [:create_holding]

#  ***** GET METHODS *****

# Get all holdings belonging to the current user
    def all_holdings
        @holdings = @user.holdings
        render json: @holdings
    end

# Get a specific holding belonging to the current user
    def specific_holding
        @holding = @user.holdings.find_by(params[:stock_id])
    end

# ***** POST METHODS *****

# Create a new holding
    def create_holding
        @holding = @user.holdings.build(holding_params)
        if @holding.save
            render json: @holding, status: :created 
        else
            render json: @holding.errors, status: :unprocessable_entity
        end
    end

# ***** DELETE METHODS *****

# Delete a specific holding belonging to the current user
    def delete_holding

    end


end

private

def set_user
    @user = User.find(params[:user_id])
rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
end

def holding_params
    params.require(:holding).permit(:quantity, :purchase_price, :stock_id)
end
