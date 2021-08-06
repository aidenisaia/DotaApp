class AddHeroName < ActiveRecord::Migration[6.1]
  def change
    add_column :builds, :hero_name, :string
  end
end
