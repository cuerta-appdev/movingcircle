class FurnitureObjectPicture < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :furniture_object,
             :class_name => "FurtnitureObject"

  # Indirect associations

  # Validations

end
