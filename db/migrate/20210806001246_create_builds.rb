class CreateBuilds < ActiveRecord::Migration[6.1]
  def change
    create_table :builds do |t|
      t.integer :user_id
      t.integer :hero_id
      t.string :timing

      t.timestamps
    end
  end
end
