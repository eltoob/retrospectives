class AddRetroIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :retro_id, :integer
  end
end
