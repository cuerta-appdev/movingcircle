class FurnitureCategoryPicture < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :category,
             :class_name => "FurnitureCategory",
             :foreign_key => "furniture_category_id"

  # Indirect associations

  # Validations

end
