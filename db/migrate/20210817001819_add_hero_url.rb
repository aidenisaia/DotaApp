class AddHeroUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :builds, :hero_url, :string
  end
end
