class FurniturePack < ApplicationRecord
  # Direct associations

  has_many   :furtniture_objects,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
