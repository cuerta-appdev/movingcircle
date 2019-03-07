class FurnitureCategoryPicture < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :category,
             :class_name => "FurnitureCategory"

  # Indirect associations

  # Validations

end
