class CreateHoldings < ActiveRecord::Migration[7.0]
  def change
    create_table :holdings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.integer :quantity
      t.integer :purchase_price

      t.timestamps
    end
  end
end
