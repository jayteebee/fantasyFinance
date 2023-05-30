class RemoveIndustryIdFromStocks < ActiveRecord::Migration[7.0]
  def change
    remove_column :stocks, :industry_id, :integer
  end
end
