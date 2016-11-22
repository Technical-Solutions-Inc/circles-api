class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :email, null: false
      t.text :image_url

      t.timestamps
    end
  end
end
