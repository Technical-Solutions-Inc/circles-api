class CreateEventMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_members do |t|
      t.integer :user_id, required: true
      t.integer :event_id, required: true

      t.timestamps
    end
  end
end
