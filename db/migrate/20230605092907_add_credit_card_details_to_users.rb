class AddCreditCardDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :card_type, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :cc, :string
    add_column :users, :valid_date, :string
    add_column :users, :cvc, :string
  end
end
