class CreateFurnitureObjectPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :furniture_object_pictures do |t|
      t.string :picture
      t.integer :furniture_object_id

      t.timestamps
    end
  end
end
