class HoldingsController < ApplicationController
before_action :set_user
skip_before_action :verify_authenticity_token, only: [:create_holding, :all_holdings, :delete_holding]

#  ***** GET METHODS *****

# Get all holdings belonging to the current user
    def all_holdings
        holdings = @user.holdings.includes(:stock)
        holdings_with_stocks = holdings.map do |holding|
            {
                id: holding.id,
                quantity: holding.quantity,
                purchase_price: holding.purchase_price,
                created_at: holding.created_at,
                updated_at: holding.updated_at,
                stock: {
                        id: holding.stock.id,
                        company_name: holding.stock.company_name,
                        symbol: holding.stock.symbol,
                        exchange: holding.stock.exchange,
                        sector: holding.stock.sector,
                        market_capitalization: holding.stock.market_capitalization,
                        description: holding.stock.description,
                        Quarterly_Earnings_Growth_YOY: holding.stock.Quarterly_Earnings_Growth_YOY,
                        Quarterly_Revenue_Growth_YOY: holding.stock.Quarterly_Revenue_Growth_YOY
                       }
            }
end
        render json: holdings_with_stocks
    
end

# Get a specific holding belonging to the current user
    def specific_holding
        holding = @user.holdings.find_by(stock_id: params[:stock_id])
        if holding
        holding_with_stock = 
            {
                stock: {
                        id: holding.stock.id,
                        company_name: holding.stock.company_name,
                        symbol: holding.stock.symbol,
                        exchange: holding.stock.exchange,
                        sector: holding.stock.sector,
                        market_capitalization: holding.stock.market_capitalization,
                        description: holding.stock.description,
                        Quarterly_Earnings_Growth_YOY: holding.stock.Quarterly_Earnings_Growth_YOY,
                        Quarterly_Revenue_Growth_YOY: holding.stock.Quarterly_Revenue_Growth_YOY
                       }
            }

        render json: holding_with_stock
        else 
            render json: {error: "Holding not found"}, status: :not_found
        end
    end

# ***** POST METHODS *****

# Create a new holding and asign to user
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
        @holding = @user.holdings.find_by(stock_id: params[:stock_id])
        if @holding.present?
            @holding.destroy
            render json: {message: "Holding deleted"}, status: :ok
        else
            render json: {error: "Holding not found"}, status: :not_found
        end
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
