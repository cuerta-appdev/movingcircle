class FurnitureCategory < ApplicationRecord
  # Direct associations

  has_many   :furtniture_objects,
             :dependent => :destroy

  has_many   :furniture_category_pictures,
             :dependent => :destroy

  belongs_to :furniture_pack

  # Indirect associations

  # Validations

end
