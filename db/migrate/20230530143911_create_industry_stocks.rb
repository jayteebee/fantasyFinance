class CreateIndustryStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :industry_stocks do |t|
      t.references :industry, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
