class AddIndustryRefToStocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :stocks, :industry, null: false, foreign_key: true
  end
end
