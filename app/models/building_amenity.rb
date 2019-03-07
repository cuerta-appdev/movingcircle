class BuildingAmenity < ApplicationRecord
  # Direct associations

  has_many   :amenity_pictures,
             :dependent => :destroy

  belongs_to :building

  belongs_to :amenity

  # Indirect associations

  # Validations

end
