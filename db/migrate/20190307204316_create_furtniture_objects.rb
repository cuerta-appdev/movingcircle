class CreateFurtnitureObjects < ActiveRecord::Migration[5.1]
  def change
    create_table :furtniture_objects do |t|
      t.integer :price
      t.string :description
      t.integer :furniture_pack_id
      t.integer :category_id
      t.string :name

      t.timestamps
    end
  end
end
