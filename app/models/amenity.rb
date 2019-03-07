class Amenity < ApplicationRecord
  # Direct associations

  has_many   :building_amenities,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
