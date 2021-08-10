class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :api_id
      t.integer :build_id

      t.timestamps
    end
  end
end
