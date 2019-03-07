class FurnitureCategory < ApplicationRecord
  # Direct associations

  has_many   :furtniture_objects,
             :foreign_key => "category_id",
             :dependent => :destroy

  has_many   :furniture_category_pictures,
             :foreign_key => "category_id",
             :dependent => :destroy

  belongs_to :furniture_pack

  # Indirect associations

  # Validations

end
