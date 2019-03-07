class CreatePackComments < ActiveRecord::Migration[5.1]
  def change
    create_table :pack_comments do |t|
      t.integer :furniture_pack_id
      t.integer :user_id

      t.timestamps
    end
  end
end
