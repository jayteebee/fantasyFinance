class CreateWatchlists < ActiveRecord::Migration[7.0]
  def change
    create_table :watchlists do |t|
      t.string :name
      t.string :stock_name
      t.string :stock_symbol

      t.timestamps
    end
  end
end
