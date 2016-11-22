class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :name, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.text :image_url

      t.timestamps
    end
  end
end
