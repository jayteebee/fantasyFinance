class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :company_name
      t.string :symbol
      t.string :exchange
      t.string :sector
      t.integer :market_capitalization
      t.string :description
      t.integer :Quarterly_Earnings_Growth_YOY
      t.integer :Quarterly_Revenue_Growth_YOY

      t.timestamps
    end
  end
end
