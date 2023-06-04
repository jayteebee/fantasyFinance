require 'httparty'
class StocksController < ApplicationController
    # before_action :authenticate_user!
    ALPHA_VANTAGE_API_KEY = "Q11V8QASSGC4XDKB"

    # FUNDAMENTAL DATA

    def news
        ticker = params[:ticker]
        url = "https://www.alphavantage.co/query?function=NEWS_SENTIMENT&tickers=#{ticker}&sort=LATEST&limit=3&apikey=#{ALPHA_VANTAGE_API_KEY}"
        response = HTTParty.get(url)
        render json: response.parsed_response
    end

    def overview
        ticker = params[:ticker]
        url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{ticker}&apikey=#{ALPHA_VANTAGE_API_KEY}"
        response = HTTParty.get(url)
        render json: response.parsed_response
    end

    def income_statement
        ticker = params[:ticker]
        url = "https://www.alphavantage.co/query?function=INCOME_STATEMENT&symbol=#{ticker}&apikey=#{ALPHA_VANTAGE_API_KEY}"
        response = HTTParty.get(url)
        render json: response.parsed_response
    end

    def balance_sheet
        ticker = params[:ticker]
        url = "https://www.alphavantage.co/query?function=BALANCE_SHEET&symbol=#{ticker}&apikey=#{ALPHA_VANTAGE_API_KEY}"
        response = HTTParty.get(url)
        render json: response.parsed_response
    end

    def cash_flow
        ticker = params[:ticker]
        url = "https://www.alphavantage.co/query?function=CASH_FLOW&symbol=#{ticker}&apikey=#{ALPHA_VANTAGE_API_KEY}"
        response = HTTParty.get(url)
        render json: response.parsed_response
    end

    def earnings
        ticker = params[:ticker]
        url = "https://www.alphavantage.co/query?function=EARNINGS&symbol=#{ticker}&apikey=#{ALPHA_VANTAGE_API_KEY}"
        response = HTTParty.get(url)
        render json: response.parsed_response
    end

# CORE DATA

def time_series_intraday
    ticker = params[:ticker]
    url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{ticker}&interval=1min&apikey=#{ALPHA_VANTAGE_API_KEY}"
    response = HTTParty.get(url)
    render json: response.parsed_response
end

def ticker_search
    keywords = params[:keywords]
    url = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=#{keywords}&apikey=#{ALPHA_VANTAGE_API_KEY}"
    response = HTTParty.get(url)
    render json: response.parsed_response
end

    end


