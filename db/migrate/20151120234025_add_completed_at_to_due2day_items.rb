class AddCompletedAtToDue2dayItems < ActiveRecord::Migration
  def change
    add_column :due2day_items, :completed_at, :datetime
  end
end
