class FurniturePack < ApplicationRecord
  # Direct associations

  has_many   :furniture_categories,
             :dependent => :destroy

  has_many   :pack_bookmarks,
             :foreign_key => "pack_id",
             :dependent => :destroy

  has_many   :furtniture_objects,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
