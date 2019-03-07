class PackBookmark < ApplicationRecord
  # Direct associations

  belongs_to :pack,
             :class_name => "FurniturePack"

  belongs_to :user

  # Indirect associations

  # Validations

end
