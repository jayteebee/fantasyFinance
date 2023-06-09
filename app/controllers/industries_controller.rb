class IndustriesController < ApplicationController

    # Get all industries
    def all_industries
        @industries = Industry.all
        render json: @industries
    end

# Get a specific industry by id
    def specific_industry
        @industry = Industry.find(params[:industry_id])
        render json: @industry
    end 


# Get all stocks from specific industry

def all_stocks_from_industry
    industry = Industry.find(params[:industry_id])
    stocks = industry.stocks
render json: stocks
end


    # Get a specific stock within an industry
    def specific_stock
        @industry = Industry.find(params[:industry_id])
        @stock = Stock.find(params[:stock_id])
        render json: @stock
    end
end
