class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :trading_style
      t.string :experience_level
      t.integer :balance

      t.timestamps
    end
  end
end
