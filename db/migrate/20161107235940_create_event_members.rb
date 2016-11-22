class CreateEventMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_members do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false

      t.timestamps
    end
  end
end
