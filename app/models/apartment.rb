class Apartment < ApplicationRecord
  # Direct associations

  has_many   :apartment_photos,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
