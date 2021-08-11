class ChangeItemnameString < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :item_name, :string
  end
end
