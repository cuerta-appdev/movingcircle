class FurtnitureObject < ApplicationRecord
  # Direct associations

  has_many   :furniture_pictures,
             :class_name => "FurnitureObjectPicture",
             :foreign_key => "furniture_object_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
