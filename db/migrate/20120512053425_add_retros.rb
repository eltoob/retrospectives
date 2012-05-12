class AddRetros < ActiveRecord::Migration
  def up
    create_table :retros do
    end
  end

  def down
    drop_table :retros
  end
end
