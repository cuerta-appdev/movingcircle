class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.integer :apartment_id
      t.string :address
      t.string :neighborhood
      t.string :contact_info

      t.timestamps
    end
  end
end
