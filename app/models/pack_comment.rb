class PackComment < ApplicationRecord
  # Direct associations

  belongs_to :pack,
             :class_name => "FurniturePack",
             :foreign_key => "furniture_pack_id"

  belongs_to :user

  # Indirect associations

  # Validations

end
