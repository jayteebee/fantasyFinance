class RenameColumnsInHoldings < ActiveRecord::Migration[7.0]
  def change
    remove_index :holdings, :User_id
    rename_column :holdings, :User_id, :user_id
    add_index :holdings, :user_id
    
    remove_index :holdings, :Stock_id
    rename_column :holdings, :Stock_id, :stock_id
    add_index :holdings, :stock_id
  end
end
