class FurnitureObjectPicture < ApplicationRecord
  # Direct associations

  belongs_to :furniture_object,
             :class_name => "FurtnitureObject"

  # Indirect associations

  # Validations

end
