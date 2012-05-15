class AddTimestamps < ActiveRecord::Migration
  def up
    add_column :retros, :created_at, :datetime
    add_column :retros, :updated_at, :datetime
  end

  def down
    remove_column :retros, :created_at
    remove_column :retros, :updated_at
  end
end
