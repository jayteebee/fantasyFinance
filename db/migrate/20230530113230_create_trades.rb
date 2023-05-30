class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
      t.references :User, null: false, foreign_key: true
      t.references :Stock, null: false, foreign_key: true
      t.string :trade_type
      t.integer :trade_price
      t.integer :quantity
      t.datetime :trade_timestamp

      t.timestamps
    end
  end
end
