class AmenityPicture < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :building_amenity

  # Indirect associations

  # Validations

end
