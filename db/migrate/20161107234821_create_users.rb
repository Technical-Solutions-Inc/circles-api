class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name, required: true
      t.text :email, required: true
      t.text :image_url

      t.timestamps
    end
  end
end
