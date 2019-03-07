class BuildingBookmark < ApplicationRecord
  # Direct associations

  belongs_to :building

  belongs_to :user

  # Indirect associations

  # Validations

end
