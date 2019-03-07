class FurtnitureObject < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :class_name => "FurnitureCategory",
             :foreign_key => "furniture_category_id"

  belongs_to :furniture_pack

  has_many   :furniture_pictures,
             :class_name => "FurnitureObjectPicture",
             :foreign_key => "furniture_object_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
