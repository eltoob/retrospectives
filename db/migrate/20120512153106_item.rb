class Item < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :description
      t.string :category
    end
  end

  def down
    drop_table :items
  end
end
