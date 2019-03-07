class CreatePackBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :pack_bookmarks do |t|
      t.integer :user_id
      t.integer :pack_id
      t.string :name

      t.timestamps
    end
  end
end
