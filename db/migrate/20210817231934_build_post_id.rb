class BuildPostId < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :build_id, :integer
  end
end
