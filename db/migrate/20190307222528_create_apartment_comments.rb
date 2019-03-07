class CreateApartmentComments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartment_comments do |t|
      t.integer :user_id
      t.integer :apartment_id
      t.text :text

      t.timestamps
    end
  end
end
