# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

# seed_data = JSON.parse(File.read('db/seed_data.json'))
seed_data_url = "https://api.npoint.io/ab7a1f3f7198be8ea153"
seed_data = JSON.parse(open(seed_data_url).read)

seed_data.each do |industry_data|
    

industry_name = industry_data['industry']
industry = Industry.find_or_create_by!(name: industry_name)
puts "Created industry: #{industry.name}"
stocks = industry_data['stocks']

stocks.each do |stock_data|
    stock_name = stock_data['companyName']
    ticker_symbol = stock_data['tickerSymbol']


    stock = Stock.find_or_create_by!(
        company_name: stock_name,
        symbol: ticker_symbol,
    )

    IndustryStock.find_or_create_by!(
        industry: industry,
        stock: stock
    )

    end
end