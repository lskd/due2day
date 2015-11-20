class CreateDue2dayItems < ActiveRecord::Migration
  def change
    create_table :due2day_items do |t|
      t.string :content
      t.references :due2day_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
