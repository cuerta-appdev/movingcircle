class FurnitureCategoryPicture < ApplicationRecord
  # Direct associations

  belongs_to :category,
             :class_name => "FurnitureCategory"

  # Indirect associations

  # Validations

end
