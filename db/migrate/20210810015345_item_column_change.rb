class ItemColumnChange < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :api_id, :item_name
  end
end
