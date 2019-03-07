class CreateFurniturePacks < ActiveRecord::Migration[5.1]
  def change
    create_table :furniture_packs do |t|
      t.string :description
      t.integer :user_id
      t.integer :price
      t.integer :number_of_items
      t.string :storage_conditions
      t.integer :apartment_sq_footage
      t.string :apartment_number_of_bedrooms
      t.string :apartment_number_of_bathrooms
      t.string :apartment_building_name

      t.timestamps
    end
  end
end
