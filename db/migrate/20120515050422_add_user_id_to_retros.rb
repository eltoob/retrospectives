class AddUserIdToRetros < ActiveRecord::Migration
  def change
    add_column :retros, :user_id, :integer
    add_index :retros, :user_id
  end
end
