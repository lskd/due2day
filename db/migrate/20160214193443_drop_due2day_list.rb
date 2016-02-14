class DropDue2dayList < ActiveRecord::Migration
  def change
    drop_table :due2day_lists
  end
end
