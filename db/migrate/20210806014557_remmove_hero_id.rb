class RemmoveHeroId < ActiveRecord::Migration[6.1]
  def change
    remove_column :builds, :hero_id, :integer
  end
end
