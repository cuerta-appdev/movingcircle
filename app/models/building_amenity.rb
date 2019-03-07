class BuildingAmenity < ApplicationRecord
  # Direct associations

  belongs_to :building

  belongs_to :amenity

  # Indirect associations

  # Validations

end
