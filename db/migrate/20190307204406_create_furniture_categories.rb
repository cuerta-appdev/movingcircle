class CreateFurnitureCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :furniture_categories do |t|
      t.text :items
      t.string :name
      t.integer :furniture_pack_id
      t.string :number_of_items
      t.integer :price

      t.timestamps
    end
  end
end
