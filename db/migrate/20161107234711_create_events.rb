class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :name, required: true
      t.date :start_date, required: true
      t.date :end_date
      t.text :image_url

      t.timestamps
    end
  end
end
