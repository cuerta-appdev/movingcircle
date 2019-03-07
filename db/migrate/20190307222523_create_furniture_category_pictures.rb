class CreateFurnitureCategoryPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :furniture_category_pictures do |t|
      t.integer :furniture_category_id
      t.string :picture

      t.timestamps
    end
  end
end
