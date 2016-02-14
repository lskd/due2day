class DropDue2dayItem < ActiveRecord::Migration
  def change
    drop_table :due2day_items
  end
end
